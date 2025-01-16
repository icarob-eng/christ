import sys
import re
from typing import List, Dict
import json

## TODO 
# create classes OK
# modularize OK
# create relative jump method OK
# ADD COMMENTS

class Label:
    def __init__(self, name, addr=None):
        self.name = name
        self.addr = addr

    def __str__(self):
        return self.addr

class CHRISTAssembler:
    def __init__(self, asm_file: str):
        self.asm_file: str = asm_file # asm filename
        

    def restart_attributes(self):
        """
        Restart attributes to default value before assembling.
        """

        self.instructions_map: List[str] = None # instruction set
        self.reserved_kw: Dict = None # reserved keywords and their values (flags, pins, etc)

        self.asm_file_lines: List[str] = [] # list of lines from asm file

        self.labels: Dict[str, Label] = dict() # dict of labels with their addresses
        self.commands: Dict = dict() # dict of commands with address (key) and instruction (value)

        self.instruction_count = 0 # instruction counter
    
    def load_instructions_and_reserved_kw(self) -> None:
        """
        Loads the instructions and the reserved keywords maps from json files.
        """

        with open("instructions.json", "r") as file:
            self.instructions_map = json.load(file)

        reserved_kw: dict = None
        with open("reserved_kw.json", "r") as file:
            self.reserved_kw = json.load(file)
    
    def load_script(self):
        """
        Get a list of lines from the target script.
        """
        with open(self.asm_file, "r") as script:
            self.asm_file_lines.extend(script.readlines())
    
    def extrat_labels_from_code(self):
        for line in self.asm_file_lines:

            # checking if it's an empty line
            if not line or not line.strip() or line.startswith(";"):
                continue
                
            # checking if line declares a label. if yes, the label is extracted
            label_colon = line.find(":")
            if label_colon != -1:
                label_name = line.split(":")[0]
                self.labels[label_name] = Label(name=label_name)

    def get_instructions_binaries(self):
        """
        For each line of the .asm file, extracts the instruction and address binaries and maps them on 'commands' attribute.
        """

        for line in self.asm_file_lines:
            instruction_bin: List[str] =[]

            # checking if it's an empty line
            if not line or not line.strip() or line.startswith(";"):
                continue
            
            # spliting instruction from comment
            instruction = re.split(r";", line, maxsplit=1)
            line = instruction[0] if instruction else line
            instruction_addr = bin(self.instruction_count)[2:].zfill(16)

            # checking if line declares a label. if yes, the label is extracted
            label_colon = line.find(":")
            if label_colon != -1:
                
                label_name = line.split(":")[0]
                self.labels[label_name].addr = instruction_addr

                continue
            
            # extrating instruction operation
            instruction_list = line.strip().split(" ") # [op, *args]
            op: str = instruction_list[0]

            instruction =  self.instructions_map[op.lower()]
            instruction_bin.append(instruction["bin"]) # insert the opcode on the instruction binary str

            # extracting how many operands does the instruction requires
            operands = instruction["operands"]
            required_arguments_count = len(operands)

            # if instruction does not required operands, fill with zeros and continue
            if required_arguments_count == 0:
                # instruction_bin = instruction_bin.ljust(16, '0')
                self.commands[instruction_addr] = instruction_bin
                self.instruction_count+=1
                continue
            
            # extracting args
            passed_args = instruction_list[1].split(",") # splitting args in a list

            for i, arg in enumerate(passed_args):

                # checking if arg is reserved kw (flags, pins, etc)
                if arg.lower() in self.reserved_kw.keys():
                    reserved_bin_arg = self.reserved_kw[arg.lower()] # get the binay value for the keyword

                    # check if keyword binary size matches the required size from the operand.
                    if len(reserved_bin_arg) != operands[i]:
                        raise Exception(f"{arg} does not match required operand size.")
                    
                    instruction_bin.append(reserved_bin_arg) # apped the kw bin value to the intruction binary
                    continue
                
                # checking if arg is a label
                if arg in self.labels.keys():
                    # APPLY RELATIVE VALUE HERE
                    # instruction_bin.append(bin(int(self.labels[arg]))[2:].zfill(operands[i]))
                    instruction_bin.append(self.labels[arg])
                    continue
                
                # if none from above, parse arg to binary and append it to the instruction
                arg = bin(int(arg))[2:].zfill(operands[i])
                instruction_bin.append(arg)

            # fill instruction with '0's to complete 2 bytes of length
            # instruction_bin = instruction_bin.ljust(16, '0')

            # maps addr and intrucition binaries in the dictionary
            self.commands[instruction_addr]=instruction_bin
            self.instruction_count+=1
    
    def instructions_to_str(self):
        """
        Concatenate all binary elements of a command list and parse Label objects to relative address if necessary.
        """
        for addr, instruction in self.commands.items():
            try:
                self.commands[addr] = "".join(instruction).ljust(16, '0')
            except TypeError:
                for i,binary in enumerate(self.commands[addr]):
                    if isinstance(binary, Label):
                        self.commands[addr][i] = str(binary)
                instruction_left = "".join(instruction[:-1])
                instruction_right = self.get_relative_addr(current_addr=addr, target_addr=self.commands[addr][-1])
                full_instruction = instruction_left + instruction_right[len(instruction_left):]

                self.commands[addr] = full_instruction

    def assemble(self):
        """
        Assembling pipeline
        """
        self.restart_attributes()
        self.load_instructions_and_reserved_kw()
        self.load_script()
        self.extrat_labels_from_code()
        self.get_instructions_binaries()
        self.instructions_to_str()
    
    def get_relative_addr(self, current_addr: str, target_addr: str) -> str:
        relative = bin(int(target_addr, 2) - int(current_addr, 2))

        if relative[0] == '-':
            relative = ''.join("1" if bit == "0" else "0" for bit in relative[3:].zfill(16))
            relative = bin(int(relative, 2)+1)[2:].zfill(16)
        else:
            relative = relative[2:].zfill(16)
        
        return relative

if __name__=="__main__":
    assembler = CHRISTAssembler(asm_file=sys.argv[1])
    assembler.assemble()

    for k, v in assembler.commands.items():
        print(f"addr: {k}, instruction: {v}")