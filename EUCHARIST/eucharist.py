import argparse

from components import *

__version__ = '0.0.1'

parser = argparse.ArgumentParser(
    prog=f'EUCHARIST v{__version__}.',
    description="""
Emulation
Using
CHrist
Architecture and
Resources of
Integrated python
Syntax
Technology: EUCHARIST, the CHRIST emulator
"""
)
parser.add_argument(
    'source',
    type=str,
    help='source code binary file.',
)

# TODO: add update_frequency

parser.add_argument(
    '-s', '--string',
    action='store_true',
    help='open source in text mode (not binary mode).',
)


def parse_args() -> list[DTYPE]:
    args = parser.parse_args()

    try:
        if args.string:
            with open(args.source) as f:
                lines = f.read().splitlines()

                invalid_lines = []
                for i, line in enumerate(lines):
                    if len(line) != 16:
                        invalid_lines.append(i)

                if len(invalid_lines) > 0:
                    raise ValueError(f'Invalid lines in {args.source}: {invalid_lines}')

                return [np.int16(Bits(bin=line).int) for line in lines]
        else:
            # TODO: test this (SHOULD work)
            return list(np.fromfile(args.source, dtype=DTYPE))
    except FileNotFoundError:
        raise FileNotFoundError(f'Source file {args.source} not found.')


def print_formatted_code(lines: list[DTYPE] | np.ndarray[DTYPE], as_mnemonics=False) -> None:
    i_size = len(str(len(lines)))
    print(f'{"i":<{i_size}}:', 'opcode', 'A  ', 'B  ', 'C  ', 'D')
    if as_mnemonics:
        for i, line in enumerate(lines):
            srepr = split_repr(line)
            print(f'{i}:', f'{opcode2mnemonic(srepr[0]):<6}', *srepr[1:])
    else:
        for i, line in enumerate(lines):
            print(f'{i}:', *split_repr(line))


if __name__ == '__main__':
    code = parse_args()
    print('Code:')
    print_formatted_code(code, True)
    print(20*'-' + '\nStarting PC:\n\n\n')
    computer = CHRIST(code, 2, print_ir=True, print_rf=True)
    computer.start()
