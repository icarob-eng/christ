import sys
import re
from typing import List
import json

## TODO 
# create classes
# modularize
# create relative jump method
# create flags method
# ADD COMMENTS

# loading instructions
instructions = None
with open("instructions.json", "r") as file:
    instructions = json.load(file)

# loading reserved_kw
reserved_kw: dict = None
with open("reserved_kw.json", "r") as file:
    reserved_kw = json.load(file)

file_name = sys.argv[1]

script_lines = []

labels = dict()
commands = dict()

with open(file_name, "r") as script:
    script_lines.extend(script.readlines())

def assemble(script_lines: List[str]):
    instructions_count = 0
    for line in script_lines:
        # empty line or comment line
        if not line or not line.strip() or line.startswith(";"):
            continue
        
        # spliting command from comment
        command = re.split(r";", line, maxsplit=1)
        line = command[0] if command else line
        print(instructions_count)
        instruction_number = bin(instructions_count)[2:].zfill(16)

        # extracting label
        label_colon = line.find(":")
        if label_colon != -1:
            label_name = line.split(":")[0]
            labels[label_name] = instruction_number
            continue
        
        command_str: str = ""

        # extracting command
        line_list = line.strip().split(" ")
        op:str = line_list[0]

        instruction =  instructions[op.lower()]
        command_str += instruction["bin"]

        operands = instruction["operands"]
        required_arguments_count = len(operands)

        if required_arguments_count == 0:
            command_str = command_str.ljust(16, '0')
            commands[instruction_number] = command_str
            instructions_count+=1
            continue
        
        # extracting args

        passed_args = line_list[1].split(",")

        for i, arg in enumerate(passed_args):
            if arg.lower() in reserved_kw.keys():
                reserved_bin_arg = reserved_kw[arg.lower()]

                if len(reserved_bin_arg) != operands[i]:
                    raise Exception(f"{arg} does not match required operand size.")
                
                command_str+=reserved_bin_arg
                continue

            if arg in labels.keys():
                command_str+= bin(int(labels[arg]))[2:].zfill(operands[i])
                continue
    
            arg = bin(int(arg))[2:].zfill(operands[i])
            command_str+=arg

        command_str = command_str.ljust(16, '0')
        commands[instruction_number]=command_str
        instructions_count+=1

assemble(script_lines)
print(labels) 
for k, v in commands.items():
    print(f"addr: {k}, instuction: {v}")