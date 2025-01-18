-- Copyright (C) 2023  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 23.1std.0 Build 991 11/28/2023 SC Lite Edition"

-- DATE "01/18/2025 10:38:56"

-- 
-- Device: Altera 5CSEMA4U23C6 Package UFBGA672
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ControlUnit IS
    PORT (
	alu_ops : OUT STD.STANDARD.bit_vector(4 DOWNTO 0);
	alu_flags : IN STD.STANDARD.bit_vector(2 DOWNTO 0);
	rf_read_a : OUT STD.STANDARD.bit_vector(2 DOWNTO 0);
	rf_read_b : OUT STD.STANDARD.bit_vector(2 DOWNTO 0);
	rf_write : OUT STD.STANDARD.bit_vector(2 DOWNTO 0);
	cache_r : OUT STD.STANDARD.bit;
	mem_r : OUT STD.STANDARD.bit;
	pers_r : OUT STD.STANDARD.bit;
	cache_w : OUT STD.STANDARD.bit;
	mem_w : OUT STD.STANDARD.bit;
	pers_w : OUT STD.STANDARD.bit;
	cache_addr : OUT STD.STANDARD.bit_vector(6 DOWNTO 0);
	mem_addr : OUT STD.STANDARD.bit_vector(15 DOWNTO 0);
	pers_addr : OUT STD.STANDARD.bit_vector(2 DOWNTO 0);
	ir_out : IN STD.STANDARD.bit_vector(15 DOWNTO 0);
	pc_out : IN STD.STANDARD.bit_vector(15 DOWNTO 0);
	main_bus : IN STD.STANDARD.bit_vector(15 DOWNTO 0);
	pc_a : OUT STD.STANDARD.bit_vector(15 DOWNTO 0);
	pc_b : OUT STD.STANDARD.bit_vector(15 DOWNTO 0);
	exec_en : OUT STD.STANDARD.bit;
	fetch_en : OUT STD.STANDARD.bit;
	next_s : OUT STD.STANDARD.bit;
	next_e : OUT STD.STANDARD.bit;
	s : IN std_logic;
	e : IN std_logic
	);
END ControlUnit;

-- Design Ports Information
-- alu_ops[0]	=>  Location: PIN_AE22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- alu_ops[1]	=>  Location: PIN_AH19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- alu_ops[2]	=>  Location: PIN_AD17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- alu_ops[3]	=>  Location: PIN_AF20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- alu_ops[4]	=>  Location: PIN_AE20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- alu_flags[0]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- alu_flags[1]	=>  Location: PIN_AE9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- alu_flags[2]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rf_read_a[0]	=>  Location: PIN_AG19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rf_read_a[1]	=>  Location: PIN_AG20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rf_read_a[2]	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rf_read_b[0]	=>  Location: PIN_AD19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rf_read_b[1]	=>  Location: PIN_AH21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rf_read_b[2]	=>  Location: PIN_AF23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rf_write[0]	=>  Location: PIN_AG18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rf_write[1]	=>  Location: PIN_AG14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rf_write[2]	=>  Location: PIN_Y15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cache_r	=>  Location: PIN_AF22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_r	=>  Location: PIN_AH3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pers_r	=>  Location: PIN_AA18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cache_w	=>  Location: PIN_AG21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_w	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pers_w	=>  Location: PIN_AF17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cache_addr[0]	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cache_addr[1]	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cache_addr[2]	=>  Location: PIN_AG16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cache_addr[3]	=>  Location: PIN_AH22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cache_addr[4]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cache_addr[5]	=>  Location: PIN_Y18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cache_addr[6]	=>  Location: PIN_AF25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_addr[0]	=>  Location: PIN_AE6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_addr[1]	=>  Location: PIN_AG24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_addr[2]	=>  Location: PIN_AF28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_addr[3]	=>  Location: PIN_AH5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_addr[4]	=>  Location: PIN_AB4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_addr[5]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_addr[6]	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_addr[7]	=>  Location: PIN_AF15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_addr[8]	=>  Location: PIN_AF11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_addr[9]	=>  Location: PIN_AC22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_addr[10]	=>  Location: PIN_AH11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_addr[11]	=>  Location: PIN_Y5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_addr[12]	=>  Location: PIN_V11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_addr[13]	=>  Location: PIN_AH8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_addr[14]	=>  Location: PIN_AE4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_addr[15]	=>  Location: PIN_AG8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pers_addr[0]	=>  Location: PIN_AG10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pers_addr[1]	=>  Location: PIN_AE25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pers_addr[2]	=>  Location: PIN_AE23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- main_bus[0]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- main_bus[1]	=>  Location: PIN_AF27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- main_bus[2]	=>  Location: PIN_AE7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- main_bus[3]	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- main_bus[4]	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- main_bus[5]	=>  Location: PIN_H4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- main_bus[6]	=>  Location: PIN_AA4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- main_bus[7]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- main_bus[8]	=>  Location: PIN_AD4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- main_bus[9]	=>  Location: PIN_W11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- main_bus[10]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- main_bus[11]	=>  Location: PIN_Y8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- main_bus[12]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- main_bus[13]	=>  Location: PIN_Y11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- main_bus[14]	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- main_bus[15]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_a[0]	=>  Location: PIN_AA11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_a[1]	=>  Location: PIN_AG26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_a[2]	=>  Location: PIN_AG28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_a[3]	=>  Location: PIN_W12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_a[4]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_a[5]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_a[6]	=>  Location: PIN_AC4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_a[7]	=>  Location: PIN_AH9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_a[8]	=>  Location: PIN_AG6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_a[9]	=>  Location: PIN_AC23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_a[10]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_a[11]	=>  Location: PIN_Y4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_a[12]	=>  Location: PIN_AF5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_a[13]	=>  Location: PIN_U14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_a[14]	=>  Location: PIN_AF4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_a[15]	=>  Location: PIN_AH7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_b[0]	=>  Location: PIN_AE17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_b[1]	=>  Location: PIN_AG9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_b[2]	=>  Location: PIN_AG15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_b[3]	=>  Location: PIN_AG23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_b[4]	=>  Location: PIN_AH24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_b[5]	=>  Location: PIN_AF21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_b[6]	=>  Location: PIN_AD23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_b[7]	=>  Location: PIN_AF26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_b[8]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_b[9]	=>  Location: PIN_W14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_b[10]	=>  Location: PIN_AE8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_b[11]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_b[12]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_b[13]	=>  Location: PIN_U11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_b[14]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_b[15]	=>  Location: PIN_AG13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- exec_en	=>  Location: PIN_AG5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- fetch_en	=>  Location: PIN_AH4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- next_s	=>  Location: PIN_AF7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- next_e	=>  Location: PIN_AF8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir_out[15]	=>  Location: PIN_AH16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s	=>  Location: PIN_AG11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir_out[10]	=>  Location: PIN_AD20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir_out[11]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir_out[12]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir_out[13]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir_out[14]	=>  Location: PIN_AF18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir_out[7]	=>  Location: PIN_AH14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir_out[8]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir_out[9]	=>  Location: PIN_AE26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir_out[4]	=>  Location: PIN_V12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir_out[5]	=>  Location: PIN_Y17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir_out[6]	=>  Location: PIN_AH27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir_out[1]	=>  Location: PIN_L10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir_out[2]	=>  Location: PIN_AH12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir_out[3]	=>  Location: PIN_AH23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir_out[0]	=>  Location: PIN_AH13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_out[0]	=>  Location: PIN_AD5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_out[1]	=>  Location: PIN_AE24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_out[2]	=>  Location: PIN_AG25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_out[3]	=>  Location: PIN_AH6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_out[4]	=>  Location: PIN_U9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_out[5]	=>  Location: PIN_AH2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_out[6]	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_out[7]	=>  Location: PIN_AE15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_out[8]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_out[9]	=>  Location: PIN_AH26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_out[10]	=>  Location: PIN_Y13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_out[11]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_out[12]	=>  Location: PIN_AF6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_out[13]	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_out[14]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_out[15]	=>  Location: PIN_AF13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- e	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ControlUnit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_alu_ops : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_alu_flags : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_rf_read_a : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_rf_read_b : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_rf_write : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_cache_r : std_logic;
SIGNAL ww_mem_r : std_logic;
SIGNAL ww_pers_r : std_logic;
SIGNAL ww_cache_w : std_logic;
SIGNAL ww_mem_w : std_logic;
SIGNAL ww_pers_w : std_logic;
SIGNAL ww_cache_addr : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_mem_addr : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_pers_addr : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_ir_out : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_pc_out : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_main_bus : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_pc_a : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_pc_b : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_exec_en : std_logic;
SIGNAL ww_fetch_en : std_logic;
SIGNAL ww_next_s : std_logic;
SIGNAL ww_next_e : std_logic;
SIGNAL ww_s : std_logic;
SIGNAL ww_e : std_logic;
SIGNAL \alu_flags[0]~input_o\ : std_logic;
SIGNAL \alu_flags[1]~input_o\ : std_logic;
SIGNAL \alu_flags[2]~input_o\ : std_logic;
SIGNAL \main_bus[0]~input_o\ : std_logic;
SIGNAL \main_bus[1]~input_o\ : std_logic;
SIGNAL \main_bus[2]~input_o\ : std_logic;
SIGNAL \main_bus[3]~input_o\ : std_logic;
SIGNAL \main_bus[4]~input_o\ : std_logic;
SIGNAL \main_bus[5]~input_o\ : std_logic;
SIGNAL \main_bus[6]~input_o\ : std_logic;
SIGNAL \main_bus[7]~input_o\ : std_logic;
SIGNAL \main_bus[8]~input_o\ : std_logic;
SIGNAL \main_bus[9]~input_o\ : std_logic;
SIGNAL \main_bus[10]~input_o\ : std_logic;
SIGNAL \main_bus[11]~input_o\ : std_logic;
SIGNAL \main_bus[12]~input_o\ : std_logic;
SIGNAL \main_bus[13]~input_o\ : std_logic;
SIGNAL \main_bus[14]~input_o\ : std_logic;
SIGNAL \main_bus[15]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \s~input_o\ : std_logic;
SIGNAL \ir_out[15]~input_o\ : std_logic;
SIGNAL \ir_out[10]~input_o\ : std_logic;
SIGNAL \ALU_ops_MUX|o~0_combout\ : std_logic;
SIGNAL \ir_out[11]~input_o\ : std_logic;
SIGNAL \ALU_ops_MUX|o~1_combout\ : std_logic;
SIGNAL \ir_out[12]~input_o\ : std_logic;
SIGNAL \ALU_ops_MUX|o~2_combout\ : std_logic;
SIGNAL \ir_out[13]~input_o\ : std_logic;
SIGNAL \ALU_ops_MUX|o~3_combout\ : std_logic;
SIGNAL \ir_out[14]~input_o\ : std_logic;
SIGNAL \ALU_ops_MUX|o~4_combout\ : std_logic;
SIGNAL \ir_out[7]~input_o\ : std_logic;
SIGNAL \rf_a_MUX|o~0_combout\ : std_logic;
SIGNAL \ir_out[8]~input_o\ : std_logic;
SIGNAL \rf_a_MUX|o~1_combout\ : std_logic;
SIGNAL \ir_out[9]~input_o\ : std_logic;
SIGNAL \rf_a_MUX|o~2_combout\ : std_logic;
SIGNAL \ir_out[4]~input_o\ : std_logic;
SIGNAL \rf_b_MUX|o~0_combout\ : std_logic;
SIGNAL \ir_out[5]~input_o\ : std_logic;
SIGNAL \rf_b_MUX|o~1_combout\ : std_logic;
SIGNAL \ir_out[6]~input_o\ : std_logic;
SIGNAL \rf_b_MUX|o~2_combout\ : std_logic;
SIGNAL \comb~1_combout\ : std_logic;
SIGNAL \I_ALU~combout\ : std_logic;
SIGNAL \comb~0_combout\ : std_logic;
SIGNAL \comb~2_combout\ : std_logic;
SIGNAL \ir_out[1]~input_o\ : std_logic;
SIGNAL \rf_w_MUX|o[0]~0_combout\ : std_logic;
SIGNAL \rf_w_MUX|o[0]~1_combout\ : std_logic;
SIGNAL \ir_out[2]~input_o\ : std_logic;
SIGNAL \rf_w_MUX|o[1]~2_combout\ : std_logic;
SIGNAL \rf_w_MUX|o[1]~3_combout\ : std_logic;
SIGNAL \ir_out[3]~input_o\ : std_logic;
SIGNAL \rf_w_MUX|o[2]~4_combout\ : std_logic;
SIGNAL \rf_w_MUX|o[2]~5_combout\ : std_logic;
SIGNAL \pers_w~0_combout\ : std_logic;
SIGNAL \cache_r~0_combout\ : std_logic;
SIGNAL \pers_r~0_combout\ : std_logic;
SIGNAL \cache_w~0_combout\ : std_logic;
SIGNAL \pers_w~1_combout\ : std_logic;
SIGNAL \ir_out[0]~input_o\ : std_logic;
SIGNAL \pc_out[0]~input_o\ : std_logic;
SIGNAL \pc_out[1]~input_o\ : std_logic;
SIGNAL \pc_out[2]~input_o\ : std_logic;
SIGNAL \pc_out[3]~input_o\ : std_logic;
SIGNAL \pc_out[4]~input_o\ : std_logic;
SIGNAL \pc_out[5]~input_o\ : std_logic;
SIGNAL \pc_out[6]~input_o\ : std_logic;
SIGNAL \pc_out[7]~input_o\ : std_logic;
SIGNAL \pc_out[8]~input_o\ : std_logic;
SIGNAL \pc_out[9]~input_o\ : std_logic;
SIGNAL \pc_out[10]~input_o\ : std_logic;
SIGNAL \pc_out[11]~input_o\ : std_logic;
SIGNAL \pc_out[12]~input_o\ : std_logic;
SIGNAL \pc_out[13]~input_o\ : std_logic;
SIGNAL \pc_out[14]~input_o\ : std_logic;
SIGNAL \pc_out[15]~input_o\ : std_logic;
SIGNAL \pc_b_MUX|o[0]~0_combout\ : std_logic;
SIGNAL \pc_b_MUX|o[0]~1_combout\ : std_logic;
SIGNAL \pc_b_MUX|o[1]~2_combout\ : std_logic;
SIGNAL \pc_b_MUX|o[2]~3_combout\ : std_logic;
SIGNAL \pc_b_MUX|o[3]~4_combout\ : std_logic;
SIGNAL \pc_b_MUX|o[4]~5_combout\ : std_logic;
SIGNAL \pc_b_MUX|o[5]~6_combout\ : std_logic;
SIGNAL \pc_b_MUX|o[6]~7_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \pc_b_MUX|o~8_combout\ : std_logic;
SIGNAL \pc_b_MUX|o~9_combout\ : std_logic;
SIGNAL \pc_b_MUX|o~10_combout\ : std_logic;
SIGNAL \e~input_o\ : std_logic;
SIGNAL \next_s~0_combout\ : std_logic;
SIGNAL \ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \pc_b_MUX|ALT_INV_o[0]~0_combout\ : std_logic;
SIGNAL \ALT_INV_pers_w~0_combout\ : std_logic;
SIGNAL \rf_w_MUX|ALT_INV_o[2]~4_combout\ : std_logic;
SIGNAL \rf_w_MUX|ALT_INV_o[1]~2_combout\ : std_logic;
SIGNAL \rf_w_MUX|ALT_INV_o[0]~0_combout\ : std_logic;
SIGNAL \ALT_INV_comb~2_combout\ : std_logic;
SIGNAL \ALT_INV_comb~1_combout\ : std_logic;
SIGNAL \ALT_INV_comb~0_combout\ : std_logic;
SIGNAL \ALT_INV_I_ALU~combout\ : std_logic;
SIGNAL \ALT_INV_e~input_o\ : std_logic;
SIGNAL \ALT_INV_ir_out[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir_out[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir_out[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir_out[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir_out[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir_out[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir_out[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir_out[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir_out[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir_out[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir_out[14]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir_out[13]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir_out[12]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir_out[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir_out[10]~input_o\ : std_logic;
SIGNAL \ALT_INV_s~input_o\ : std_logic;
SIGNAL \ALT_INV_ir_out[15]~input_o\ : std_logic;

BEGIN

alu_ops <= IEEE.STD_LOGIC_1164.TO_BITVECTOR(ww_alu_ops);
ww_alu_flags <= IEEE.STD_LOGIC_1164.TO_STDLOGICVECTOR(alu_flags);
rf_read_a <= IEEE.STD_LOGIC_1164.TO_BITVECTOR(ww_rf_read_a);
rf_read_b <= IEEE.STD_LOGIC_1164.TO_BITVECTOR(ww_rf_read_b);
rf_write <= IEEE.STD_LOGIC_1164.TO_BITVECTOR(ww_rf_write);
cache_r <= IEEE.STD_LOGIC_1164.TO_BIT(ww_cache_r);
mem_r <= IEEE.STD_LOGIC_1164.TO_BIT(ww_mem_r);
pers_r <= IEEE.STD_LOGIC_1164.TO_BIT(ww_pers_r);
cache_w <= IEEE.STD_LOGIC_1164.TO_BIT(ww_cache_w);
mem_w <= IEEE.STD_LOGIC_1164.TO_BIT(ww_mem_w);
pers_w <= IEEE.STD_LOGIC_1164.TO_BIT(ww_pers_w);
cache_addr <= IEEE.STD_LOGIC_1164.TO_BITVECTOR(ww_cache_addr);
mem_addr <= IEEE.STD_LOGIC_1164.TO_BITVECTOR(ww_mem_addr);
pers_addr <= IEEE.STD_LOGIC_1164.TO_BITVECTOR(ww_pers_addr);
ww_ir_out <= IEEE.STD_LOGIC_1164.TO_STDLOGICVECTOR(ir_out);
ww_pc_out <= IEEE.STD_LOGIC_1164.TO_STDLOGICVECTOR(pc_out);
ww_main_bus <= IEEE.STD_LOGIC_1164.TO_STDLOGICVECTOR(main_bus);
pc_a <= IEEE.STD_LOGIC_1164.TO_BITVECTOR(ww_pc_a);
pc_b <= IEEE.STD_LOGIC_1164.TO_BITVECTOR(ww_pc_b);
exec_en <= IEEE.STD_LOGIC_1164.TO_BIT(ww_exec_en);
fetch_en <= IEEE.STD_LOGIC_1164.TO_BIT(ww_fetch_en);
next_s <= IEEE.STD_LOGIC_1164.TO_BIT(ww_next_s);
next_e <= IEEE.STD_LOGIC_1164.TO_BIT(ww_next_e);
ww_s <= s;
ww_e <= e;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Equal1~0_combout\ <= NOT \Equal1~0_combout\;
\pc_b_MUX|ALT_INV_o[0]~0_combout\ <= NOT \pc_b_MUX|o[0]~0_combout\;
\ALT_INV_pers_w~0_combout\ <= NOT \pers_w~0_combout\;
\rf_w_MUX|ALT_INV_o[2]~4_combout\ <= NOT \rf_w_MUX|o[2]~4_combout\;
\rf_w_MUX|ALT_INV_o[1]~2_combout\ <= NOT \rf_w_MUX|o[1]~2_combout\;
\rf_w_MUX|ALT_INV_o[0]~0_combout\ <= NOT \rf_w_MUX|o[0]~0_combout\;
\ALT_INV_comb~2_combout\ <= NOT \comb~2_combout\;
\ALT_INV_comb~1_combout\ <= NOT \comb~1_combout\;
\ALT_INV_comb~0_combout\ <= NOT \comb~0_combout\;
\ALT_INV_I_ALU~combout\ <= NOT \I_ALU~combout\;
\ALT_INV_e~input_o\ <= NOT \e~input_o\;
\ALT_INV_ir_out[0]~input_o\ <= NOT \ir_out[0]~input_o\;
\ALT_INV_ir_out[3]~input_o\ <= NOT \ir_out[3]~input_o\;
\ALT_INV_ir_out[2]~input_o\ <= NOT \ir_out[2]~input_o\;
\ALT_INV_ir_out[1]~input_o\ <= NOT \ir_out[1]~input_o\;
\ALT_INV_ir_out[6]~input_o\ <= NOT \ir_out[6]~input_o\;
\ALT_INV_ir_out[5]~input_o\ <= NOT \ir_out[5]~input_o\;
\ALT_INV_ir_out[4]~input_o\ <= NOT \ir_out[4]~input_o\;
\ALT_INV_ir_out[9]~input_o\ <= NOT \ir_out[9]~input_o\;
\ALT_INV_ir_out[8]~input_o\ <= NOT \ir_out[8]~input_o\;
\ALT_INV_ir_out[7]~input_o\ <= NOT \ir_out[7]~input_o\;
\ALT_INV_ir_out[14]~input_o\ <= NOT \ir_out[14]~input_o\;
\ALT_INV_ir_out[13]~input_o\ <= NOT \ir_out[13]~input_o\;
\ALT_INV_ir_out[12]~input_o\ <= NOT \ir_out[12]~input_o\;
\ALT_INV_ir_out[11]~input_o\ <= NOT \ir_out[11]~input_o\;
\ALT_INV_ir_out[10]~input_o\ <= NOT \ir_out[10]~input_o\;
\ALT_INV_s~input_o\ <= NOT \s~input_o\;
\ALT_INV_ir_out[15]~input_o\ <= NOT \ir_out[15]~input_o\;

-- Location: IOOBUF_X57_Y0_N19
\alu_ops[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_ops_MUX|o~0_combout\,
	devoe => ww_devoe,
	o => ww_alu_ops(0));

-- Location: IOOBUF_X51_Y0_N53
\alu_ops[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_ops_MUX|o~1_combout\,
	devoe => ww_devoe,
	o => ww_alu_ops(1));

-- Location: IOOBUF_X44_Y0_N2
\alu_ops[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_ops_MUX|o~2_combout\,
	devoe => ww_devoe,
	o => ww_alu_ops(2));

-- Location: IOOBUF_X53_Y0_N36
\alu_ops[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_ops_MUX|o~3_combout\,
	devoe => ww_devoe,
	o => ww_alu_ops(3));

-- Location: IOOBUF_X51_Y0_N2
\alu_ops[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_ops_MUX|o~4_combout\,
	devoe => ww_devoe,
	o => ww_alu_ops(4));

-- Location: IOOBUF_X51_Y0_N36
\rf_read_a[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rf_a_MUX|o~0_combout\,
	devoe => ww_devoe,
	o => ww_rf_read_a(0));

-- Location: IOOBUF_X53_Y0_N53
\rf_read_a[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rf_a_MUX|o~1_combout\,
	devoe => ww_devoe,
	o => ww_rf_read_a(1));

-- Location: IOOBUF_X46_Y0_N36
\rf_read_a[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rf_a_MUX|o~2_combout\,
	devoe => ww_devoe,
	o => ww_rf_read_a(2));

-- Location: IOOBUF_X48_Y0_N59
\rf_read_b[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rf_b_MUX|o~0_combout\,
	devoe => ww_devoe,
	o => ww_rf_read_b(0));

-- Location: IOOBUF_X57_Y0_N53
\rf_read_b[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rf_b_MUX|o~1_combout\,
	devoe => ww_devoe,
	o => ww_rf_read_b(1));

-- Location: IOOBUF_X59_Y0_N19
\rf_read_b[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rf_b_MUX|o~2_combout\,
	devoe => ww_devoe,
	o => ww_rf_read_b(2));

-- Location: IOOBUF_X50_Y0_N36
\rf_write[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rf_w_MUX|o[0]~1_combout\,
	devoe => ww_devoe,
	o => ww_rf_write(0));

-- Location: IOOBUF_X42_Y0_N36
\rf_write[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rf_w_MUX|o[1]~3_combout\,
	devoe => ww_devoe,
	o => ww_rf_write(1));

-- Location: IOOBUF_X46_Y0_N2
\rf_write[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rf_w_MUX|o[2]~5_combout\,
	devoe => ww_devoe,
	o => ww_rf_write(2));

-- Location: IOOBUF_X55_Y0_N42
\cache_r~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \cache_r~0_combout\,
	devoe => ww_devoe,
	o => ww_cache_r);

-- Location: IOOBUF_X18_Y0_N36
\mem_r~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_s~input_o\,
	devoe => ww_devoe,
	o => ww_mem_r);

-- Location: IOOBUF_X50_Y0_N19
\pers_r~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pers_r~0_combout\,
	devoe => ww_devoe,
	o => ww_pers_r);

-- Location: IOOBUF_X55_Y0_N76
\cache_w~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \cache_w~0_combout\,
	devoe => ww_devoe,
	o => ww_cache_w);

-- Location: IOOBUF_X68_Y10_N45
\mem_w~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mem_w);

-- Location: IOOBUF_X40_Y0_N42
\pers_w~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pers_w~1_combout\,
	devoe => ww_devoe,
	o => ww_pers_w);

-- Location: IOOBUF_X42_Y0_N19
\cache_addr[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ir_out[0]~input_o\,
	devoe => ww_devoe,
	o => ww_cache_addr(0));

-- Location: IOOBUF_X4_Y61_N36
\cache_addr[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ir_out[1]~input_o\,
	devoe => ww_devoe,
	o => ww_cache_addr(1));

-- Location: IOOBUF_X40_Y0_N59
\cache_addr[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ir_out[2]~input_o\,
	devoe => ww_devoe,
	o => ww_cache_addr(2));

-- Location: IOOBUF_X59_Y0_N53
\cache_addr[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ir_out[3]~input_o\,
	devoe => ww_devoe,
	o => ww_cache_addr(3));

-- Location: IOOBUF_X19_Y0_N19
\cache_addr[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ir_out[4]~input_o\,
	devoe => ww_devoe,
	o => ww_cache_addr(4));

-- Location: IOOBUF_X68_Y11_N22
\cache_addr[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ir_out[5]~input_o\,
	devoe => ww_devoe,
	o => ww_cache_addr(5));

-- Location: IOOBUF_X65_Y0_N2
\cache_addr[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ir_out[6]~input_o\,
	devoe => ww_devoe,
	o => ww_cache_addr(6));

-- Location: IOOBUF_X7_Y0_N53
\mem_addr[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[0]~input_o\,
	devoe => ww_devoe,
	o => ww_mem_addr(0));

-- Location: IOOBUF_X61_Y0_N36
\mem_addr[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[1]~input_o\,
	devoe => ww_devoe,
	o => ww_mem_addr(1));

-- Location: IOOBUF_X66_Y0_N53
\mem_addr[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[2]~input_o\,
	devoe => ww_devoe,
	o => ww_mem_addr(2));

-- Location: IOOBUF_X21_Y0_N53
\mem_addr[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[3]~input_o\,
	devoe => ww_devoe,
	o => ww_mem_addr(3));

-- Location: IOOBUF_X4_Y0_N53
\mem_addr[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[4]~input_o\,
	devoe => ww_devoe,
	o => ww_mem_addr(4));

-- Location: IOOBUF_X18_Y0_N2
\mem_addr[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[5]~input_o\,
	devoe => ww_devoe,
	o => ww_mem_addr(5));

-- Location: IOOBUF_X6_Y0_N19
\mem_addr[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[6]~input_o\,
	devoe => ww_devoe,
	o => ww_mem_addr(6));

-- Location: IOOBUF_X36_Y0_N2
\mem_addr[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[7]~input_o\,
	devoe => ww_devoe,
	o => ww_mem_addr(7));

-- Location: IOOBUF_X17_Y0_N42
\mem_addr[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[8]~input_o\,
	devoe => ww_devoe,
	o => ww_mem_addr(8));

-- Location: IOOBUF_X64_Y0_N2
\mem_addr[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[9]~input_o\,
	devoe => ww_devoe,
	o => ww_mem_addr(9));

-- Location: IOOBUF_X38_Y0_N53
\mem_addr[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[10]~input_o\,
	devoe => ww_devoe,
	o => ww_mem_addr(10));

-- Location: IOOBUF_X2_Y0_N76
\mem_addr[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[11]~input_o\,
	devoe => ww_devoe,
	o => ww_mem_addr(11));

-- Location: IOOBUF_X15_Y0_N2
\mem_addr[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[12]~input_o\,
	devoe => ww_devoe,
	o => ww_mem_addr(12));

-- Location: IOOBUF_X34_Y0_N53
\mem_addr[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[13]~input_o\,
	devoe => ww_devoe,
	o => ww_mem_addr(13));

-- Location: IOOBUF_X10_Y0_N76
\mem_addr[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[14]~input_o\,
	devoe => ww_devoe,
	o => ww_mem_addr(14));

-- Location: IOOBUF_X32_Y0_N76
\mem_addr[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[15]~input_o\,
	devoe => ww_devoe,
	o => ww_mem_addr(15));

-- Location: IOOBUF_X36_Y0_N36
\pers_addr[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ir_out[4]~input_o\,
	devoe => ww_devoe,
	o => ww_pers_addr(0));

-- Location: IOOBUF_X68_Y11_N39
\pers_addr[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ir_out[5]~input_o\,
	devoe => ww_devoe,
	o => ww_pers_addr(1));

-- Location: IOOBUF_X62_Y0_N59
\pers_addr[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ir_out[6]~input_o\,
	devoe => ww_devoe,
	o => ww_pers_addr(2));

-- Location: IOOBUF_X7_Y0_N19
\pc_a[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[0]~input_o\,
	devoe => ww_devoe,
	o => ww_pc_a(0));

-- Location: IOOBUF_X62_Y0_N76
\pc_a[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[1]~input_o\,
	devoe => ww_devoe,
	o => ww_pc_a(1));

-- Location: IOOBUF_X65_Y0_N36
\pc_a[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[2]~input_o\,
	devoe => ww_devoe,
	o => ww_pc_a(2));

-- Location: IOOBUF_X21_Y0_N19
\pc_a[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[3]~input_o\,
	devoe => ww_devoe,
	o => ww_pc_a(3));

-- Location: IOOBUF_X4_Y0_N19
\pc_a[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[4]~input_o\,
	devoe => ww_devoe,
	o => ww_pc_a(4));

-- Location: IOOBUF_X18_Y0_N19
\pc_a[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[5]~input_o\,
	devoe => ww_devoe,
	o => ww_pc_a(5));

-- Location: IOOBUF_X6_Y0_N36
\pc_a[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[6]~input_o\,
	devoe => ww_devoe,
	o => ww_pc_a(6));

-- Location: IOOBUF_X36_Y0_N53
\pc_a[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[7]~input_o\,
	devoe => ww_devoe,
	o => ww_pc_a(7));

-- Location: IOOBUF_X17_Y0_N93
\pc_a[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[8]~input_o\,
	devoe => ww_devoe,
	o => ww_pc_a(8));

-- Location: IOOBUF_X64_Y0_N19
\pc_a[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[9]~input_o\,
	devoe => ww_devoe,
	o => ww_pc_a(9));

-- Location: IOOBUF_X38_Y0_N19
\pc_a[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[10]~input_o\,
	devoe => ww_devoe,
	o => ww_pc_a(10));

-- Location: IOOBUF_X2_Y0_N93
\pc_a[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[11]~input_o\,
	devoe => ww_devoe,
	o => ww_pc_a(11));

-- Location: IOOBUF_X15_Y0_N36
\pc_a[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[12]~input_o\,
	devoe => ww_devoe,
	o => ww_pc_a(12));

-- Location: IOOBUF_X34_Y0_N2
\pc_a[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[13]~input_o\,
	devoe => ww_devoe,
	o => ww_pc_a(13));

-- Location: IOOBUF_X10_Y0_N93
\pc_a[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[14]~input_o\,
	devoe => ww_devoe,
	o => ww_pc_a(14));

-- Location: IOOBUF_X32_Y0_N93
\pc_a[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_out[15]~input_o\,
	devoe => ww_devoe,
	o => ww_pc_a(15));

-- Location: IOOBUF_X44_Y0_N19
\pc_b[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_b_MUX|o[0]~1_combout\,
	devoe => ww_devoe,
	o => ww_pc_b(0));

-- Location: IOOBUF_X34_Y0_N36
\pc_b[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_b_MUX|o[1]~2_combout\,
	devoe => ww_devoe,
	o => ww_pc_b(1));

-- Location: IOOBUF_X44_Y0_N36
\pc_b[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_b_MUX|o[2]~3_combout\,
	devoe => ww_devoe,
	o => ww_pc_b(2));

-- Location: IOOBUF_X59_Y0_N2
\pc_b[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_b_MUX|o[3]~4_combout\,
	devoe => ww_devoe,
	o => ww_pc_b(3));

-- Location: IOOBUF_X61_Y0_N53
\pc_b[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_b_MUX|o[4]~5_combout\,
	devoe => ww_devoe,
	o => ww_pc_b(4));

-- Location: IOOBUF_X55_Y0_N59
\pc_b[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_b_MUX|o[5]~6_combout\,
	devoe => ww_devoe,
	o => ww_pc_b(5));

-- Location: IOOBUF_X57_Y0_N2
\pc_b[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_b_MUX|o[6]~7_combout\,
	devoe => ww_devoe,
	o => ww_pc_b(6));

-- Location: IOOBUF_X68_Y10_N79
\pc_b[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_b_MUX|o~8_combout\,
	devoe => ww_devoe,
	o => ww_pc_b(7));

-- Location: IOOBUF_X46_Y0_N19
\pc_b[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_b_MUX|o~9_combout\,
	devoe => ww_devoe,
	o => ww_pc_b(8));

-- Location: IOOBUF_X42_Y0_N2
\pc_b[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_b_MUX|o~10_combout\,
	devoe => ww_devoe,
	o => ww_pc_b(9));

-- Location: IOOBUF_X14_Y0_N36
\pc_b[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_pc_b(10));

-- Location: IOOBUF_X2_Y61_N59
\pc_b[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_pc_b(11));

-- Location: IOOBUF_X15_Y61_N2
\pc_b[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_pc_b(12));

-- Location: IOOBUF_X12_Y0_N19
\pc_b[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_pc_b(13));

-- Location: IOOBUF_X68_Y12_N22
\pc_b[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_pc_b(14));

-- Location: IOOBUF_X32_Y0_N42
\pc_b[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_pc_b(15));

-- Location: IOOBUF_X19_Y0_N36
\exec_en~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \s~input_o\,
	devoe => ww_devoe,
	o => ww_exec_en);

-- Location: IOOBUF_X19_Y0_N53
\fetch_en~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_s~input_o\,
	devoe => ww_devoe,
	o => ww_fetch_en);

-- Location: IOOBUF_X17_Y0_N76
\next_s~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \next_s~0_combout\,
	devoe => ww_devoe,
	o => ww_next_s);

-- Location: IOOBUF_X12_Y0_N53
\next_e~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_next_e);

-- Location: IOIBUF_X38_Y0_N35
\s~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s,
	o => \s~input_o\);

-- Location: IOIBUF_X46_Y0_N52
\ir_out[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir_out(15),
	o => \ir_out[15]~input_o\);

-- Location: IOIBUF_X51_Y0_N18
\ir_out[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir_out(10),
	o => \ir_out[10]~input_o\);

-- Location: MLABCELL_X50_Y1_N30
\ALU_ops_MUX|o~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_ops_MUX|o~0_combout\ = (\s~input_o\ & (\ir_out[15]~input_o\ & !\ir_out[10]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000010000000100000001000000010000000100000001000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s~input_o\,
	datab => \ALT_INV_ir_out[15]~input_o\,
	datac => \ALT_INV_ir_out[10]~input_o\,
	combout => \ALU_ops_MUX|o~0_combout\);

-- Location: IOIBUF_X48_Y0_N41
\ir_out[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir_out(11),
	o => \ir_out[11]~input_o\);

-- Location: MLABCELL_X50_Y1_N6
\ALU_ops_MUX|o~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_ops_MUX|o~1_combout\ = (!\ir_out[11]~input_o\ & (\s~input_o\ & \ir_out[15]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001100000000000000110000000000000011000000000000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_ir_out[11]~input_o\,
	datac => \ALT_INV_s~input_o\,
	datad => \ALT_INV_ir_out[15]~input_o\,
	combout => \ALU_ops_MUX|o~1_combout\);

-- Location: IOIBUF_X50_Y0_N52
\ir_out[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir_out(12),
	o => \ir_out[12]~input_o\);

-- Location: MLABCELL_X50_Y1_N33
\ALU_ops_MUX|o~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_ops_MUX|o~2_combout\ = ( !\ir_out[12]~input_o\ & ( (\s~input_o\ & \ir_out[15]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s~input_o\,
	datab => \ALT_INV_ir_out[15]~input_o\,
	dataf => \ALT_INV_ir_out[12]~input_o\,
	combout => \ALU_ops_MUX|o~2_combout\);

-- Location: IOIBUF_X50_Y0_N1
\ir_out[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir_out(13),
	o => \ir_out[13]~input_o\);

-- Location: MLABCELL_X50_Y1_N42
\ALU_ops_MUX|o~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_ops_MUX|o~3_combout\ = ( !\ir_out[13]~input_o\ & ( (\s~input_o\ & \ir_out[15]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s~input_o\,
	datab => \ALT_INV_ir_out[15]~input_o\,
	dataf => \ALT_INV_ir_out[13]~input_o\,
	combout => \ALU_ops_MUX|o~3_combout\);

-- Location: IOIBUF_X48_Y0_N75
\ir_out[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir_out(14),
	o => \ir_out[14]~input_o\);

-- Location: LABCELL_X49_Y1_N0
\ALU_ops_MUX|o~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_ops_MUX|o~4_combout\ = (\ir_out[15]~input_o\ & (\s~input_o\ & !\ir_out[14]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000000000001010000000000000101000000000000010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ir_out[15]~input_o\,
	datac => \ALT_INV_s~input_o\,
	datad => \ALT_INV_ir_out[14]~input_o\,
	combout => \ALU_ops_MUX|o~4_combout\);

-- Location: IOIBUF_X44_Y0_N52
\ir_out[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir_out(7),
	o => \ir_out[7]~input_o\);

-- Location: LABCELL_X49_Y1_N36
\rf_a_MUX|o~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \rf_a_MUX|o~0_combout\ = ( \ir_out[12]~input_o\ & ( (\ir_out[15]~input_o\ & (\s~input_o\ & !\ir_out[7]~input_o\)) ) ) # ( !\ir_out[12]~input_o\ & ( (\s~input_o\ & (!\ir_out[7]~input_o\ & ((\ir_out[14]~input_o\) # (\ir_out[15]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011100000000000001110000000000000101000000000000010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ir_out[15]~input_o\,
	datab => \ALT_INV_ir_out[14]~input_o\,
	datac => \ALT_INV_s~input_o\,
	datad => \ALT_INV_ir_out[7]~input_o\,
	dataf => \ALT_INV_ir_out[12]~input_o\,
	combout => \rf_a_MUX|o~0_combout\);

-- Location: IOIBUF_X21_Y61_N1
\ir_out[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir_out(8),
	o => \ir_out[8]~input_o\);

-- Location: LABCELL_X49_Y1_N45
\rf_a_MUX|o~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \rf_a_MUX|o~1_combout\ = ( \ir_out[15]~input_o\ & ( (\s~input_o\ & !\ir_out[8]~input_o\) ) ) # ( !\ir_out[15]~input_o\ & ( (\s~input_o\ & (!\ir_out[12]~input_o\ & (!\ir_out[8]~input_o\ & \ir_out[14]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001000000000000000100000001010000010100000101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s~input_o\,
	datab => \ALT_INV_ir_out[12]~input_o\,
	datac => \ALT_INV_ir_out[8]~input_o\,
	datad => \ALT_INV_ir_out[14]~input_o\,
	dataf => \ALT_INV_ir_out[15]~input_o\,
	combout => \rf_a_MUX|o~1_combout\);

-- Location: IOIBUF_X68_Y10_N95
\ir_out[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir_out(9),
	o => \ir_out[9]~input_o\);

-- Location: LABCELL_X49_Y1_N39
\rf_a_MUX|o~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \rf_a_MUX|o~2_combout\ = ( \s~input_o\ & ( (!\ir_out[9]~input_o\ & (((\ir_out[14]~input_o\ & !\ir_out[12]~input_o\)) # (\ir_out[15]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001110101000000000111010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ir_out[15]~input_o\,
	datab => \ALT_INV_ir_out[14]~input_o\,
	datac => \ALT_INV_ir_out[12]~input_o\,
	datad => \ALT_INV_ir_out[9]~input_o\,
	dataf => \ALT_INV_s~input_o\,
	combout => \rf_a_MUX|o~2_combout\);

-- Location: IOIBUF_X21_Y0_N1
\ir_out[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir_out(4),
	o => \ir_out[4]~input_o\);

-- Location: MLABCELL_X50_Y1_N45
\rf_b_MUX|o~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \rf_b_MUX|o~0_combout\ = (\s~input_o\ & (\ir_out[15]~input_o\ & !\ir_out[4]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000010000000100000001000000010000000100000001000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s~input_o\,
	datab => \ALT_INV_ir_out[15]~input_o\,
	datac => \ALT_INV_ir_out[4]~input_o\,
	combout => \rf_b_MUX|o~0_combout\);

-- Location: IOIBUF_X68_Y11_N4
\ir_out[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir_out(5),
	o => \ir_out[5]~input_o\);

-- Location: MLABCELL_X50_Y1_N18
\rf_b_MUX|o~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \rf_b_MUX|o~1_combout\ = ( !\ir_out[5]~input_o\ & ( (\s~input_o\ & \ir_out[15]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s~input_o\,
	datab => \ALT_INV_ir_out[15]~input_o\,
	dataf => \ALT_INV_ir_out[5]~input_o\,
	combout => \rf_b_MUX|o~1_combout\);

-- Location: IOIBUF_X65_Y0_N52
\ir_out[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir_out(6),
	o => \ir_out[6]~input_o\);

-- Location: MLABCELL_X50_Y1_N21
\rf_b_MUX|o~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \rf_b_MUX|o~2_combout\ = ( !\ir_out[6]~input_o\ & ( (\s~input_o\ & \ir_out[15]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s~input_o\,
	datab => \ALT_INV_ir_out[15]~input_o\,
	dataf => \ALT_INV_ir_out[6]~input_o\,
	combout => \rf_b_MUX|o~2_combout\);

-- Location: LABCELL_X49_Y1_N27
\comb~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb~1_combout\ = (!\s~input_o\ & \ir_out[14]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s~input_o\,
	datab => \ALT_INV_ir_out[14]~input_o\,
	combout => \comb~1_combout\);

-- Location: LABCELL_X49_Y1_N48
I_ALU : cyclonev_lcell_comb
-- Equation(s):
-- \I_ALU~combout\ = (\ir_out[15]~input_o\ & \s~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010100000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ir_out[15]~input_o\,
	datac => \ALT_INV_s~input_o\,
	combout => \I_ALU~combout\);

-- Location: LABCELL_X49_Y1_N24
\comb~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb~0_combout\ = (\s~input_o\ & (((\ir_out[14]~input_o\ & !\ir_out[12]~input_o\)) # (\ir_out[15]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010100000101000101010000010100010101000001010001010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_s~input_o\,
	datab => \ALT_INV_ir_out[14]~input_o\,
	datac => \ALT_INV_ir_out[15]~input_o\,
	datad => \ALT_INV_ir_out[12]~input_o\,
	combout => \comb~0_combout\);

-- Location: MLABCELL_X50_Y1_N27
\comb~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \comb~2_combout\ = ( !\ir_out[13]~input_o\ & ( (!\ir_out[10]~input_o\ & (!\ir_out[11]~input_o\ & (\ir_out[12]~input_o\ & !\ir_out[15]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000000010000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ir_out[10]~input_o\,
	datab => \ALT_INV_ir_out[11]~input_o\,
	datac => \ALT_INV_ir_out[12]~input_o\,
	datad => \ALT_INV_ir_out[15]~input_o\,
	dataf => \ALT_INV_ir_out[13]~input_o\,
	combout => \comb~2_combout\);

-- Location: IOIBUF_X4_Y61_N1
\ir_out[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir_out(1),
	o => \ir_out[1]~input_o\);

-- Location: LABCELL_X49_Y1_N30
\rf_w_MUX|o[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \rf_w_MUX|o[0]~0_combout\ = ( \ir_out[4]~input_o\ & ( \ir_out[1]~input_o\ ) ) # ( !\ir_out[4]~input_o\ & ( \ir_out[1]~input_o\ & ( (\s~input_o\ & (((!\ir_out[12]~input_o\ & \ir_out[14]~input_o\)) # (\ir_out[15]~input_o\))) ) ) ) # ( \ir_out[4]~input_o\ & 
-- ( !\ir_out[1]~input_o\ & ( (!\s~input_o\) # ((!\ir_out[15]~input_o\ & ((!\ir_out[14]~input_o\) # (\ir_out[12]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110101111001000000101000011011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ir_out[15]~input_o\,
	datab => \ALT_INV_ir_out[12]~input_o\,
	datac => \ALT_INV_s~input_o\,
	datad => \ALT_INV_ir_out[14]~input_o\,
	datae => \ALT_INV_ir_out[4]~input_o\,
	dataf => \ALT_INV_ir_out[1]~input_o\,
	combout => \rf_w_MUX|o[0]~0_combout\);

-- Location: LABCELL_X49_Y1_N6
\rf_w_MUX|o[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \rf_w_MUX|o[0]~1_combout\ = ( \ir_out[7]~input_o\ & ( \rf_w_MUX|o[0]~0_combout\ & ( (((\comb~1_combout\ & \comb~2_combout\)) # (\comb~0_combout\)) # (\I_ALU~combout\) ) ) ) # ( !\ir_out[7]~input_o\ & ( \rf_w_MUX|o[0]~0_combout\ & ( ((\comb~1_combout\ & 
-- \comb~2_combout\)) # (\I_ALU~combout\) ) ) ) # ( \ir_out[7]~input_o\ & ( !\rf_w_MUX|o[0]~0_combout\ & ( (!\I_ALU~combout\ & (\comb~0_combout\ & ((!\comb~1_combout\) # (!\comb~2_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011000000100000110011011101110011111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_comb~1_combout\,
	datab => \ALT_INV_I_ALU~combout\,
	datac => \ALT_INV_comb~0_combout\,
	datad => \ALT_INV_comb~2_combout\,
	datae => \ALT_INV_ir_out[7]~input_o\,
	dataf => \rf_w_MUX|ALT_INV_o[0]~0_combout\,
	combout => \rf_w_MUX|o[0]~1_combout\);

-- Location: IOIBUF_X40_Y0_N75
\ir_out[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir_out(2),
	o => \ir_out[2]~input_o\);

-- Location: LABCELL_X49_Y1_N33
\rf_w_MUX|o[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \rf_w_MUX|o[1]~2_combout\ = ( \ir_out[5]~input_o\ & ( \ir_out[2]~input_o\ ) ) # ( !\ir_out[5]~input_o\ & ( \ir_out[2]~input_o\ & ( (\s~input_o\ & (((!\ir_out[12]~input_o\ & \ir_out[14]~input_o\)) # (\ir_out[15]~input_o\))) ) ) ) # ( \ir_out[5]~input_o\ & 
-- ( !\ir_out[2]~input_o\ & ( (!\s~input_o\) # ((!\ir_out[15]~input_o\ & ((!\ir_out[14]~input_o\) # (\ir_out[12]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111010001000000000010111011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ir_out[15]~input_o\,
	datab => \ALT_INV_ir_out[12]~input_o\,
	datac => \ALT_INV_ir_out[14]~input_o\,
	datad => \ALT_INV_s~input_o\,
	datae => \ALT_INV_ir_out[5]~input_o\,
	dataf => \ALT_INV_ir_out[2]~input_o\,
	combout => \rf_w_MUX|o[1]~2_combout\);

-- Location: LABCELL_X49_Y1_N12
\rf_w_MUX|o[1]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \rf_w_MUX|o[1]~3_combout\ = ( \comb~1_combout\ & ( \comb~0_combout\ & ( (!\I_ALU~combout\ & ((!\comb~2_combout\ & (\ir_out[8]~input_o\)) # (\comb~2_combout\ & ((\rf_w_MUX|o[1]~2_combout\))))) # (\I_ALU~combout\ & (((\rf_w_MUX|o[1]~2_combout\)))) ) ) ) # ( 
-- !\comb~1_combout\ & ( \comb~0_combout\ & ( (!\I_ALU~combout\ & (\ir_out[8]~input_o\)) # (\I_ALU~combout\ & ((\rf_w_MUX|o[1]~2_combout\))) ) ) ) # ( \comb~1_combout\ & ( !\comb~0_combout\ & ( (\rf_w_MUX|o[1]~2_combout\ & ((\comb~2_combout\) # 
-- (\I_ALU~combout\))) ) ) ) # ( !\comb~1_combout\ & ( !\comb~0_combout\ & ( (\I_ALU~combout\ & \rf_w_MUX|o[1]~2_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000111100100111001001110010011100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_I_ALU~combout\,
	datab => \ALT_INV_ir_out[8]~input_o\,
	datac => \rf_w_MUX|ALT_INV_o[1]~2_combout\,
	datad => \ALT_INV_comb~2_combout\,
	datae => \ALT_INV_comb~1_combout\,
	dataf => \ALT_INV_comb~0_combout\,
	combout => \rf_w_MUX|o[1]~3_combout\);

-- Location: IOIBUF_X59_Y0_N35
\ir_out[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir_out(3),
	o => \ir_out[3]~input_o\);

-- Location: LABCELL_X49_Y1_N18
\rf_w_MUX|o[2]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \rf_w_MUX|o[2]~4_combout\ = ( \ir_out[14]~input_o\ & ( \ir_out[6]~input_o\ & ( (!\s~input_o\) # (((!\ir_out[15]~input_o\ & \ir_out[12]~input_o\)) # (\ir_out[3]~input_o\)) ) ) ) # ( !\ir_out[14]~input_o\ & ( \ir_out[6]~input_o\ & ( (!\ir_out[15]~input_o\) 
-- # ((!\s~input_o\) # (\ir_out[3]~input_o\)) ) ) ) # ( \ir_out[14]~input_o\ & ( !\ir_out[6]~input_o\ & ( (\s~input_o\ & (\ir_out[3]~input_o\ & ((!\ir_out[12]~input_o\) # (\ir_out[15]~input_o\)))) ) ) ) # ( !\ir_out[14]~input_o\ & ( !\ir_out[6]~input_o\ & ( 
-- (\ir_out[15]~input_o\ & (\s~input_o\ & \ir_out[3]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000101000000000000110111111010111111111111001011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ir_out[15]~input_o\,
	datab => \ALT_INV_ir_out[12]~input_o\,
	datac => \ALT_INV_s~input_o\,
	datad => \ALT_INV_ir_out[3]~input_o\,
	datae => \ALT_INV_ir_out[14]~input_o\,
	dataf => \ALT_INV_ir_out[6]~input_o\,
	combout => \rf_w_MUX|o[2]~4_combout\);

-- Location: LABCELL_X49_Y1_N9
\rf_w_MUX|o[2]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \rf_w_MUX|o[2]~5_combout\ = ( \ir_out[9]~input_o\ & ( \rf_w_MUX|o[2]~4_combout\ & ( (((\comb~1_combout\ & \comb~2_combout\)) # (\comb~0_combout\)) # (\I_ALU~combout\) ) ) ) # ( !\ir_out[9]~input_o\ & ( \rf_w_MUX|o[2]~4_combout\ & ( ((\comb~1_combout\ & 
-- \comb~2_combout\)) # (\I_ALU~combout\) ) ) ) # ( \ir_out[9]~input_o\ & ( !\rf_w_MUX|o[2]~4_combout\ & ( (!\I_ALU~combout\ & (\comb~0_combout\ & ((!\comb~1_combout\) # (!\comb~2_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001100100000110111001101110011011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_comb~1_combout\,
	datab => \ALT_INV_I_ALU~combout\,
	datac => \ALT_INV_comb~2_combout\,
	datad => \ALT_INV_comb~0_combout\,
	datae => \ALT_INV_ir_out[9]~input_o\,
	dataf => \rf_w_MUX|ALT_INV_o[2]~4_combout\,
	combout => \rf_w_MUX|o[2]~5_combout\);

-- Location: MLABCELL_X50_Y1_N0
\pers_w~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \pers_w~0_combout\ = ( !\s~input_o\ & ( (\ir_out[14]~input_o\ & (!\ir_out[15]~input_o\ & (\ir_out[10]~input_o\ & !\ir_out[13]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000000000001000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ir_out[14]~input_o\,
	datab => \ALT_INV_ir_out[15]~input_o\,
	datac => \ALT_INV_ir_out[10]~input_o\,
	datad => \ALT_INV_ir_out[13]~input_o\,
	dataf => \ALT_INV_s~input_o\,
	combout => \pers_w~0_combout\);

-- Location: MLABCELL_X50_Y1_N9
\cache_r~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \cache_r~0_combout\ = (\ir_out[11]~input_o\ & (!\ir_out[12]~input_o\ & \pers_w~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110000000000000011000000000000001100000000000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_ir_out[11]~input_o\,
	datac => \ALT_INV_ir_out[12]~input_o\,
	datad => \ALT_INV_pers_w~0_combout\,
	combout => \cache_r~0_combout\);

-- Location: MLABCELL_X50_Y1_N36
\pers_r~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \pers_r~0_combout\ = (\pers_w~0_combout\ & (!\ir_out[12]~input_o\ & !\ir_out[11]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010000000000010001000000000001000100000000000100010000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_pers_w~0_combout\,
	datab => \ALT_INV_ir_out[12]~input_o\,
	datad => \ALT_INV_ir_out[11]~input_o\,
	combout => \pers_r~0_combout\);

-- Location: MLABCELL_X50_Y1_N3
\cache_w~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \cache_w~0_combout\ = ( \ir_out[12]~input_o\ & ( (\ir_out[11]~input_o\ & \pers_w~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_ir_out[11]~input_o\,
	datad => \ALT_INV_pers_w~0_combout\,
	dataf => \ALT_INV_ir_out[12]~input_o\,
	combout => \cache_w~0_combout\);

-- Location: MLABCELL_X50_Y1_N39
\pers_w~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \pers_w~1_combout\ = (\pers_w~0_combout\ & (\ir_out[12]~input_o\ & !\ir_out[11]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000010000000100000001000000010000000100000001000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_pers_w~0_combout\,
	datab => \ALT_INV_ir_out[12]~input_o\,
	datac => \ALT_INV_ir_out[11]~input_o\,
	combout => \pers_w~1_combout\);

-- Location: IOIBUF_X42_Y0_N52
\ir_out[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir_out(0),
	o => \ir_out[0]~input_o\);

-- Location: IOIBUF_X7_Y0_N35
\pc_out[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_out(0),
	o => \pc_out[0]~input_o\);

-- Location: IOIBUF_X62_Y0_N41
\pc_out[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_out(1),
	o => \pc_out[1]~input_o\);

-- Location: IOIBUF_X65_Y0_N18
\pc_out[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_out(2),
	o => \pc_out[2]~input_o\);

-- Location: IOIBUF_X21_Y0_N35
\pc_out[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_out(3),
	o => \pc_out[3]~input_o\);

-- Location: IOIBUF_X4_Y0_N1
\pc_out[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_out(4),
	o => \pc_out[4]~input_o\);

-- Location: IOIBUF_X18_Y0_N52
\pc_out[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_out(5),
	o => \pc_out[5]~input_o\);

-- Location: IOIBUF_X6_Y0_N1
\pc_out[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_out(6),
	o => \pc_out[6]~input_o\);

-- Location: IOIBUF_X36_Y0_N18
\pc_out[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_out(7),
	o => \pc_out[7]~input_o\);

-- Location: IOIBUF_X17_Y0_N58
\pc_out[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_out(8),
	o => \pc_out[8]~input_o\);

-- Location: IOIBUF_X64_Y0_N52
\pc_out[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_out(9),
	o => \pc_out[9]~input_o\);

-- Location: IOIBUF_X38_Y0_N1
\pc_out[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_out(10),
	o => \pc_out[10]~input_o\);

-- Location: IOIBUF_X2_Y0_N41
\pc_out[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_out(11),
	o => \pc_out[11]~input_o\);

-- Location: IOIBUF_X15_Y0_N52
\pc_out[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_out(12),
	o => \pc_out[12]~input_o\);

-- Location: IOIBUF_X34_Y0_N18
\pc_out[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_out(13),
	o => \pc_out[13]~input_o\);

-- Location: IOIBUF_X10_Y0_N41
\pc_out[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_out(14),
	o => \pc_out[14]~input_o\);

-- Location: IOIBUF_X32_Y0_N58
\pc_out[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_out(15),
	o => \pc_out[15]~input_o\);

-- Location: LABCELL_X49_Y1_N51
\pc_b_MUX|o[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \pc_b_MUX|o[0]~0_combout\ = ( !\ir_out[13]~input_o\ & ( (!\ir_out[15]~input_o\ & (!\ir_out[11]~input_o\ & !\ir_out[14]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000101000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ir_out[15]~input_o\,
	datac => \ALT_INV_ir_out[11]~input_o\,
	datad => \ALT_INV_ir_out[14]~input_o\,
	dataf => \ALT_INV_ir_out[13]~input_o\,
	combout => \pc_b_MUX|o[0]~0_combout\);

-- Location: LABCELL_X49_Y1_N42
\pc_b_MUX|o[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \pc_b_MUX|o[0]~1_combout\ = ( \ir_out[10]~input_o\ & ( (!\pc_b_MUX|o[0]~0_combout\) # (\ir_out[0]~input_o\) ) ) # ( !\ir_out[10]~input_o\ & ( (!\pc_b_MUX|o[0]~0_combout\) # (\ir_out[12]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111001111110011111100111111001111110000111111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_ir_out[12]~input_o\,
	datac => \pc_b_MUX|ALT_INV_o[0]~0_combout\,
	datad => \ALT_INV_ir_out[0]~input_o\,
	dataf => \ALT_INV_ir_out[10]~input_o\,
	combout => \pc_b_MUX|o[0]~1_combout\);

-- Location: MLABCELL_X50_Y1_N12
\pc_b_MUX|o[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \pc_b_MUX|o[1]~2_combout\ = ( \ir_out[10]~input_o\ & ( \ir_out[1]~input_o\ & ( (!\ir_out[14]~input_o\ & (!\ir_out[15]~input_o\ & (!\ir_out[13]~input_o\ & !\ir_out[11]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ir_out[14]~input_o\,
	datab => \ALT_INV_ir_out[15]~input_o\,
	datac => \ALT_INV_ir_out[13]~input_o\,
	datad => \ALT_INV_ir_out[11]~input_o\,
	datae => \ALT_INV_ir_out[10]~input_o\,
	dataf => \ALT_INV_ir_out[1]~input_o\,
	combout => \pc_b_MUX|o[1]~2_combout\);

-- Location: MLABCELL_X50_Y1_N15
\pc_b_MUX|o[2]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \pc_b_MUX|o[2]~3_combout\ = ( \ir_out[10]~input_o\ & ( \ir_out[2]~input_o\ & ( (!\ir_out[14]~input_o\ & (!\ir_out[15]~input_o\ & (!\ir_out[11]~input_o\ & !\ir_out[13]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ir_out[14]~input_o\,
	datab => \ALT_INV_ir_out[15]~input_o\,
	datac => \ALT_INV_ir_out[11]~input_o\,
	datad => \ALT_INV_ir_out[13]~input_o\,
	datae => \ALT_INV_ir_out[10]~input_o\,
	dataf => \ALT_INV_ir_out[2]~input_o\,
	combout => \pc_b_MUX|o[2]~3_combout\);

-- Location: MLABCELL_X50_Y1_N48
\pc_b_MUX|o[3]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \pc_b_MUX|o[3]~4_combout\ = ( \ir_out[10]~input_o\ & ( \ir_out[3]~input_o\ & ( (!\ir_out[14]~input_o\ & (!\ir_out[15]~input_o\ & (!\ir_out[13]~input_o\ & !\ir_out[11]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ir_out[14]~input_o\,
	datab => \ALT_INV_ir_out[15]~input_o\,
	datac => \ALT_INV_ir_out[13]~input_o\,
	datad => \ALT_INV_ir_out[11]~input_o\,
	datae => \ALT_INV_ir_out[10]~input_o\,
	dataf => \ALT_INV_ir_out[3]~input_o\,
	combout => \pc_b_MUX|o[3]~4_combout\);

-- Location: MLABCELL_X50_Y1_N51
\pc_b_MUX|o[4]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \pc_b_MUX|o[4]~5_combout\ = ( \ir_out[10]~input_o\ & ( \ir_out[4]~input_o\ & ( (!\ir_out[14]~input_o\ & (!\ir_out[15]~input_o\ & (!\ir_out[11]~input_o\ & !\ir_out[13]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ir_out[14]~input_o\,
	datab => \ALT_INV_ir_out[15]~input_o\,
	datac => \ALT_INV_ir_out[11]~input_o\,
	datad => \ALT_INV_ir_out[13]~input_o\,
	datae => \ALT_INV_ir_out[10]~input_o\,
	dataf => \ALT_INV_ir_out[4]~input_o\,
	combout => \pc_b_MUX|o[4]~5_combout\);

-- Location: MLABCELL_X50_Y1_N54
\pc_b_MUX|o[5]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \pc_b_MUX|o[5]~6_combout\ = ( \ir_out[10]~input_o\ & ( \ir_out[5]~input_o\ & ( (!\ir_out[14]~input_o\ & (!\ir_out[15]~input_o\ & (!\ir_out[13]~input_o\ & !\ir_out[11]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ir_out[14]~input_o\,
	datab => \ALT_INV_ir_out[15]~input_o\,
	datac => \ALT_INV_ir_out[13]~input_o\,
	datad => \ALT_INV_ir_out[11]~input_o\,
	datae => \ALT_INV_ir_out[10]~input_o\,
	dataf => \ALT_INV_ir_out[5]~input_o\,
	combout => \pc_b_MUX|o[5]~6_combout\);

-- Location: MLABCELL_X50_Y1_N57
\pc_b_MUX|o[6]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \pc_b_MUX|o[6]~7_combout\ = ( \ir_out[10]~input_o\ & ( \ir_out[6]~input_o\ & ( (!\ir_out[14]~input_o\ & (!\ir_out[15]~input_o\ & (!\ir_out[11]~input_o\ & !\ir_out[13]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ir_out[14]~input_o\,
	datab => \ALT_INV_ir_out[15]~input_o\,
	datac => \ALT_INV_ir_out[11]~input_o\,
	datad => \ALT_INV_ir_out[13]~input_o\,
	datae => \ALT_INV_ir_out[10]~input_o\,
	dataf => \ALT_INV_ir_out[6]~input_o\,
	combout => \pc_b_MUX|o[6]~7_combout\);

-- Location: MLABCELL_X50_Y1_N24
\Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = ( !\ir_out[13]~input_o\ & ( (\ir_out[10]~input_o\ & (!\ir_out[11]~input_o\ & (!\ir_out[14]~input_o\ & !\ir_out[15]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000000000000010000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ir_out[10]~input_o\,
	datab => \ALT_INV_ir_out[11]~input_o\,
	datac => \ALT_INV_ir_out[14]~input_o\,
	datad => \ALT_INV_ir_out[15]~input_o\,
	dataf => \ALT_INV_ir_out[13]~input_o\,
	combout => \Equal1~0_combout\);

-- Location: LABCELL_X49_Y1_N3
\pc_b_MUX|o~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \pc_b_MUX|o~8_combout\ = ( \Equal1~0_combout\ & ( (\ir_out[7]~input_o\ & !\ir_out[12]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110011000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_ir_out[7]~input_o\,
	datad => \ALT_INV_ir_out[12]~input_o\,
	dataf => \ALT_INV_Equal1~0_combout\,
	combout => \pc_b_MUX|o~8_combout\);

-- Location: LABCELL_X49_Y1_N57
\pc_b_MUX|o~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \pc_b_MUX|o~9_combout\ = ( !\ir_out[12]~input_o\ & ( (\Equal1~0_combout\ & \ir_out[8]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal1~0_combout\,
	datac => \ALT_INV_ir_out[8]~input_o\,
	dataf => \ALT_INV_ir_out[12]~input_o\,
	combout => \pc_b_MUX|o~9_combout\);

-- Location: LABCELL_X49_Y1_N54
\pc_b_MUX|o~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \pc_b_MUX|o~10_combout\ = ( \ir_out[9]~input_o\ & ( (\Equal1~0_combout\ & !\ir_out[12]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101000000000101010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal1~0_combout\,
	datad => \ALT_INV_ir_out[12]~input_o\,
	dataf => \ALT_INV_ir_out[9]~input_o\,
	combout => \pc_b_MUX|o~10_combout\);

-- Location: IOIBUF_X19_Y0_N1
\e~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_e,
	o => \e~input_o\);

-- Location: LABCELL_X17_Y1_N0
\next_s~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_s~0_combout\ = ( \s~input_o\ & ( \e~input_o\ ) ) # ( !\s~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111001100110011001111111111111111110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_e~input_o\,
	datae => \ALT_INV_s~input_o\,
	combout => \next_s~0_combout\);

-- Location: IOIBUF_X21_Y61_N18
\alu_flags[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_alu_flags(0),
	o => \alu_flags[0]~input_o\);

-- Location: IOIBUF_X10_Y0_N58
\alu_flags[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_alu_flags(1),
	o => \alu_flags[1]~input_o\);

-- Location: IOIBUF_X14_Y0_N52
\alu_flags[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_alu_flags(2),
	o => \alu_flags[2]~input_o\);

-- Location: IOIBUF_X68_Y10_N61
\main_bus[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_main_bus(0),
	o => \main_bus[0]~input_o\);

-- Location: IOIBUF_X66_Y0_N35
\main_bus[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_main_bus(1),
	o => \main_bus[1]~input_o\);

-- Location: IOIBUF_X12_Y0_N35
\main_bus[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_main_bus(2),
	o => \main_bus[2]~input_o\);

-- Location: IOIBUF_X14_Y0_N1
\main_bus[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_main_bus(3),
	o => \main_bus[3]~input_o\);

-- Location: IOIBUF_X4_Y61_N18
\main_bus[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_main_bus(4),
	o => \main_bus[4]~input_o\);

-- Location: IOIBUF_X2_Y61_N92
\main_bus[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_main_bus(5),
	o => \main_bus[5]~input_o\);

-- Location: IOIBUF_X4_Y0_N35
\main_bus[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_main_bus(6),
	o => \main_bus[6]~input_o\);

-- Location: IOIBUF_X68_Y12_N55
\main_bus[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_main_bus(7),
	o => \main_bus[7]~input_o\);

-- Location: IOIBUF_X6_Y0_N52
\main_bus[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_main_bus(8),
	o => \main_bus[8]~input_o\);

-- Location: IOIBUF_X15_Y0_N18
\main_bus[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_main_bus(9),
	o => \main_bus[9]~input_o\);

-- Location: IOIBUF_X14_Y0_N18
\main_bus[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_main_bus(10),
	o => \main_bus[10]~input_o\);

-- Location: IOIBUF_X2_Y0_N58
\main_bus[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_main_bus(11),
	o => \main_bus[11]~input_o\);

-- Location: IOIBUF_X68_Y13_N38
\main_bus[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_main_bus(12),
	o => \main_bus[12]~input_o\);

-- Location: IOIBUF_X7_Y0_N1
\main_bus[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_main_bus(13),
	o => \main_bus[13]~input_o\);

-- Location: IOIBUF_X2_Y61_N41
\main_bus[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_main_bus(14),
	o => \main_bus[14]~input_o\);

-- Location: IOIBUF_X12_Y0_N1
\main_bus[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_main_bus(15),
	o => \main_bus[15]~input_o\);

-- Location: LABCELL_X58_Y12_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


