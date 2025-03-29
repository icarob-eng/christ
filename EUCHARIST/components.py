import abc
import time
from typing import Any

from bitstring import Bits

import json
import numpy as np

DTYPE = np.int16


def split_repr(word: str | DTYPE) -> tuple[str, str, str, str, str]:
    """Returns word in format (OPCODE, A, B, C, D)"""
    word = word if isinstance(word, str) else Bits(int=word, length=16).bin
    return word[:6], word[6:9], word[9:12], word[12:15], word[15]


with open('instructions.json') as f:
    _instructions = json.load(f)

def opcode2mnemonic(opcode: str) -> str:
    """Converts opcode to mnemonic"""
    if len(opcode) > 6: raise ValueError('Invalid opcode')
    for mnemonic, data in _instructions.items():
        if opcode == data['bin']:
            return mnemonic.upper()
    else:
        raise ValueError('Unknown opcode')


class RTLComponent(abc.ABC):
    @abc.abstractmethod
    def on_clock(self, cycle: int) -> None:
        """General method of emulating RTL clock rising edge"""


class AbsRegister(RTLComponent, abc.ABC):
    @abc.abstractmethod
    def write(self, data) -> None:
        """External method to write data to component."""

    @abc.abstractmethod
    def read(self):
        """External method to read data to component."""


def Register(default_value: Any):
    """Generates a register for the type of the default value, extending AbsRegister."""
    dtype = type(default_value)
    class _Register(AbsRegister):
        def __init__(self):
            self._value: dtype = default_value
            self._buffer: dtype = default_value

        def write(self, value: dtype) -> None:
            self._buffer = value

        def read(self) -> dtype:
            return self._value

        def on_clock(self, _: int) -> None:
            self._value = self._buffer

    return _Register()


class DataComponent(RTLComponent):
    def __init__(self, size: int, initials: np.ndarray[DTYPE] | None = None):
        # noinspection PyTypeChecker
        self._data: np.ndarray[DTYPE] = np.zeros(size, dtype=DTYPE)
        self._buffer_value = DTYPE(0)
        self._buffer_key = 0

        if initials is not None and 0 < len(initials) < size:
            n_ini = len(initials)
            self._data[0:n_ini] = initials
            self._buffer_value = initials[self._buffer_key]

    def __setitem__(self, key: int, value: DTYPE) -> None:
        assert isinstance(value, DTYPE)
        if key < 0 or key >= len(self._data):
            raise IndexError('Index out of range')

        self._buffer_value = value

    def __getitem__(self, key: int) -> DTYPE: return self._data[key]

    def on_clock(self, _: int) -> None:
        self._data[self._buffer_key] = self._buffer_value


class RegisterFile(DataComponent):
    def __init__(self, size: int):
        super().__init__(size, None)  # prevents initialization of RF

    def __setitem__(self, key: int, value: DTYPE) -> None:
        if key == 0:  # prevents overwrite of RF[0]
            return
        else:
            super().__setitem__(key, value)


class Peripherals(RegisterFile):
    """
    Implemented peripherals [Readable/Writable]:
    - LED: 001 W
    - SEGA: 010 W
    - SEGB: 011 W
    - SW: 100 R
    - BTN: 101 R
    """

    def __setitem__(self, key: int, value: DTYPE) -> None:
        if key in [4, 5]:  # prevents writing in read-only regs
            return
        else:
            super().__setitem__(key, value)

    def on_clock(self, cycle: int) -> None:
        super().on_clock(cycle)
        # TODO: some input
        # TODO: proper output
        print('cycle:', cycle)
        print(f'LEDS: [{bin(int(self._data[1]))[2:]}]')
        print(f'SEG_A: [{int(self._data[1]):04X}]')
        print(f'SEG_B: [{int(self._data[2]):04X}]')

class CHRIST:
    def __init__(self, source: np.ndarray[DTYPE] | list[DTYPE], frequency: float):
        self.mem = DataComponent(2**16, initials=source)
        self.cache = DataComponent(2**7)
        self.rf = RegisterFile(2**3)
        self.pers = Peripherals(2**3)

        self.pc = Register(DTYPE(0))
        self.ir = Register(DTYPE(0))
        self.flagr = Register((False, False, False))
        self.s = Register(False)
        # self.e = Register(False)

        self.clock_cycle = 0
        self._on_clock = [
            self.mem,
            self.cache,
            self.rf,
            self.pers,
            self.pc,
            self.ir,
            self.flagr,
            self.s
        ]  # RTL components
        self.delay = 1/frequency  # delay in secs

    @property
    def fetch_en(self): return not self.s
    @property
    def execute_en(self): return self.s

    def start(self) -> None:
        while True:
            if self.fetch_en:
                self.ir.write(self.mem[self.pc.read()])
            if self.execute_en:
                self.execute_instruction(*split_repr(Bits(int=self.ir.read(), length=16).bin))

            for comp in self._on_clock:
                comp.on_clock(self.clock_cycle)
            self.clock_cycle += 1
            time.sleep(self.delay)

    def execute_instruction(self, opcode: str, a: str, b: str, c: str, d: str) -> None:
        mnemonic = opcode2mnemonic(opcode)

        ctrl = self.ctrl(mnemonic, opcode, a, b, c, d)
        _ = self.data(mnemonic, opcode, a, b, c, d)
        _ = self.alu(mnemonic, opcode, a, b, c, d)

        if not ctrl or mnemonic == 'NOPE':  # if not control or NOPE
            self.pc.write(self.pc.read() + 1)  # pc increment FIXME: PC overflow


    def ctrl(self, mnemonic: str, _: str, a: str, b: str, c: str, d: str) -> bool:
        # FIXME: PC overflow
        match mnemonic:
            case 'HALT': pass  # doesn't increment PC
            case 'JMPRD': self.pc.write(self.pc.read() + Bits(bin=a+b+c+d).int)
            case 'JMPRDC':
                if self.flagr.read() == Bits(bin=a):
                    self.pc.write(self.pc.read() + Bits(bin=b+c+d).int)
                else:
                    self.pc.write(self.pc.read() + 1)
            case 'NOPE': pass  # pc increment already implemented
            case _: return False
        return True

    def data(self, mnemonic: str, opcode: str, a: str, b: str, c: str, d: str) -> bool:
        match mnemonic:
            case 'P2R': self.rf[Bits(bin=a).int] = self.pers[Bits(bin=b).int]
            case 'M2R': raise NotImplementedError('Memory not implemented (M2R)')
            case 'C2R': self.rf[Bits(bin=a).int] = self.cache[Bits(bin=b+c+d).int]
            case 'R2R': self.rf[Bits(bin=b).int] = self.rf[Bits(bin=a).int]
            case 'R2P': self.pers[Bits(bin=b).int] = self.rf[Bits(bin=a).int]
            case 'R2M': raise NotImplementedError('Memory not implemented (M2R)')
            case 'R2C': self.cache[Bits(bin=b+c+d).int] = self.rf[Bits(bin=a).int]
            case  _: return False
        return True

    def alu(self, mnemonic: str, _: str, a: str, b: str, c: str, __: str) -> bool:
        """
        alu operation

        :return bool: whether the mnemonic is known
        """
        # bin to int
        a = Bits(bin=a).int
        b = Bits(bin=b).int
        c = Bits(bin=c).int
        match mnemonic:
            case 'TEST': r = self.rf[a]
            case 'ADD': r = self.rf[b] + self.rf[c]
            case 'SUB': r = self.rf[b] - self.rf[c]
            case 'INC': r = self.rf[b] + 1
            case 'DEC': r = self.rf[b] - 1
            case 'AND': r = self.rf[b] & self.rf[c]
            case 'OR':  r = self.rf[b] | self.rf[c]
            case 'XOR': r = self.rf[b] ^ self.rf[c]
            case 'NOT': r = ~self.rf[a]
            case _: return False
        self.flagr.write(
            DTYPE(Bits(
                self.compute_flags(int(r))
            ).int)
        )
        self.rf[a] = DTYPE(r)
        return True

    @staticmethod
    def compute_flags(number: int) -> tuple[bool, bool, bool]:
        neg = number < 0
        zero = number == 0
        overflow = number > Bits(bin='0111111111111111').int or number < Bits(bin='1000000000000000').int
        result = (neg, zero, overflow)
        return result
