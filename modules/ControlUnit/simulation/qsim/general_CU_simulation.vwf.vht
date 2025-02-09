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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "01/18/2025 10:38:55"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ControlUnit
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ControlUnit_vhd_vec_tst IS
END ControlUnit_vhd_vec_tst;
ARCHITECTURE ControlUnit_arch OF ControlUnit_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL alu_flags : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL alu_ops : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL cache_addr : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL cache_r : STD_LOGIC;
SIGNAL cache_w : STD_LOGIC;
SIGNAL e : STD_LOGIC;
SIGNAL exec_en : STD_LOGIC;
SIGNAL fetch_en : STD_LOGIC;
SIGNAL ir_out : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL main_bus : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL mem_addr : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL mem_r : STD_LOGIC;
SIGNAL mem_w : STD_LOGIC;
SIGNAL next_e : STD_LOGIC;
SIGNAL next_s : STD_LOGIC;
SIGNAL pc_a : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL pc_b : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL pc_out : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL pers_addr : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL pers_r : STD_LOGIC;
SIGNAL pers_w : STD_LOGIC;
SIGNAL rf_read_a : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL rf_read_b : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL rf_write : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL s : STD_LOGIC;
COMPONENT ControlUnit
	PORT (
	alu_flags : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	alu_ops : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	cache_addr : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	cache_r : OUT STD_LOGIC;
	cache_w : OUT STD_LOGIC;
	e : IN STD_LOGIC;
	exec_en : OUT STD_LOGIC;
	fetch_en : OUT STD_LOGIC;
	ir_out : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	main_bus : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	mem_addr : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	mem_r : OUT STD_LOGIC;
	mem_w : OUT STD_LOGIC;
	next_e : OUT STD_LOGIC;
	next_s : OUT STD_LOGIC;
	pc_a : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	pc_b : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	pc_out : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	pers_addr : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	pers_r : OUT STD_LOGIC;
	pers_w : OUT STD_LOGIC;
	rf_read_a : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	rf_read_b : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	rf_write : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	s : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : ControlUnit
	PORT MAP (
-- list connections between master ports and signals
	alu_flags => alu_flags,
	alu_ops => alu_ops,
	cache_addr => cache_addr,
	cache_r => cache_r,
	cache_w => cache_w,
	e => e,
	exec_en => exec_en,
	fetch_en => fetch_en,
	ir_out => ir_out,
	main_bus => main_bus,
	mem_addr => mem_addr,
	mem_r => mem_r,
	mem_w => mem_w,
	next_e => next_e,
	next_s => next_s,
	pc_a => pc_a,
	pc_b => pc_b,
	pc_out => pc_out,
	pers_addr => pers_addr,
	pers_r => pers_r,
	pers_w => pers_w,
	rf_read_a => rf_read_a,
	rf_read_b => rf_read_b,
	rf_write => rf_write,
	s => s
	);
-- ir_out[15]
t_prcs_ir_out_15: PROCESS
BEGIN
	ir_out(15) <= '0';
	WAIT FOR 120000 ps;
	ir_out(15) <= '1';
	WAIT FOR 10000 ps;
	ir_out(15) <= '0';
	WAIT FOR 290000 ps;
	ir_out(15) <= '1';
	WAIT FOR 100000 ps;
	ir_out(15) <= '0';
WAIT;
END PROCESS t_prcs_ir_out_15;
-- ir_out[14]
t_prcs_ir_out_14: PROCESS
BEGIN
	ir_out(14) <= '0';
	WAIT FOR 120000 ps;
	ir_out(14) <= '1';
	WAIT FOR 10000 ps;
	ir_out(14) <= '0';
	WAIT FOR 140000 ps;
	ir_out(14) <= '1';
	WAIT FOR 150000 ps;
	ir_out(14) <= '0';
WAIT;
END PROCESS t_prcs_ir_out_14;
-- ir_out[13]
t_prcs_ir_out_13: PROCESS
BEGIN
	ir_out(13) <= '0';
	WAIT FOR 120000 ps;
	ir_out(13) <= '1';
	WAIT FOR 10000 ps;
	ir_out(13) <= '0';
	WAIT FOR 80000 ps;
	ir_out(13) <= '1';
	WAIT FOR 40000 ps;
	ir_out(13) <= '0';
WAIT;
END PROCESS t_prcs_ir_out_13;
-- ir_out[12]
t_prcs_ir_out_12: PROCESS
BEGIN
	ir_out(12) <= '0';
	WAIT FOR 120000 ps;
	ir_out(12) <= '1';
	WAIT FOR 70000 ps;
	ir_out(12) <= '0';
	WAIT FOR 20000 ps;
	ir_out(12) <= '1';
	WAIT FOR 40000 ps;
	ir_out(12) <= '0';
	WAIT FOR 60000 ps;
	ir_out(12) <= '1';
	WAIT FOR 110000 ps;
	ir_out(12) <= '0';
WAIT;
END PROCESS t_prcs_ir_out_12;
-- ir_out[11]
t_prcs_ir_out_11: PROCESS
BEGIN
	ir_out(11) <= '0';
	WAIT FOR 120000 ps;
	ir_out(11) <= '1';
	WAIT FOR 10000 ps;
	ir_out(11) <= '0';
WAIT;
END PROCESS t_prcs_ir_out_11;
-- ir_out[10]
t_prcs_ir_out_10: PROCESS
BEGIN
	ir_out(10) <= '0';
	WAIT FOR 80000 ps;
	ir_out(10) <= '1';
	WAIT FOR 110000 ps;
	ir_out(10) <= '0';
	WAIT FOR 80000 ps;
	ir_out(10) <= '1';
	WAIT FOR 90000 ps;
	ir_out(10) <= '0';
	WAIT FOR 100000 ps;
	ir_out(10) <= '1';
	WAIT FOR 60000 ps;
	ir_out(10) <= '0';
WAIT;
END PROCESS t_prcs_ir_out_10;
-- ir_out[9]
t_prcs_ir_out_9: PROCESS
BEGIN
	ir_out(9) <= '0';
	WAIT FOR 120000 ps;
	ir_out(9) <= '1';
	WAIT FOR 10000 ps;
	ir_out(9) <= '0';
	WAIT FOR 230000 ps;
	ir_out(9) <= '1';
	WAIT FOR 160000 ps;
	ir_out(9) <= '0';
WAIT;
END PROCESS t_prcs_ir_out_9;
-- ir_out[8]
t_prcs_ir_out_8: PROCESS
BEGIN
	ir_out(8) <= '0';
	WAIT FOR 120000 ps;
	ir_out(8) <= '1';
	WAIT FOR 70000 ps;
	ir_out(8) <= '0';
	WAIT FOR 80000 ps;
	ir_out(8) <= '1';
	WAIT FOR 90000 ps;
	ir_out(8) <= '0';
	WAIT FOR 60000 ps;
	ir_out(8) <= '1';
	WAIT FOR 100000 ps;
	ir_out(8) <= '0';
WAIT;
END PROCESS t_prcs_ir_out_8;
-- ir_out[7]
t_prcs_ir_out_7: PROCESS
BEGIN
	ir_out(7) <= '0';
	WAIT FOR 120000 ps;
	ir_out(7) <= '1';
	WAIT FOR 10000 ps;
	ir_out(7) <= '0';
WAIT;
END PROCESS t_prcs_ir_out_7;
-- ir_out[6]
t_prcs_ir_out_6: PROCESS
BEGIN
	ir_out(6) <= '0';
	WAIT FOR 120000 ps;
	ir_out(6) <= '1';
	WAIT FOR 10000 ps;
	ir_out(6) <= '0';
	WAIT FOR 140000 ps;
	ir_out(6) <= '1';
	WAIT FOR 150000 ps;
	ir_out(6) <= '0';
WAIT;
END PROCESS t_prcs_ir_out_6;
-- ir_out[5]
t_prcs_ir_out_5: PROCESS
BEGIN
	ir_out(5) <= '0';
	WAIT FOR 120000 ps;
	ir_out(5) <= '1';
	WAIT FOR 10000 ps;
	ir_out(5) <= '0';
	WAIT FOR 230000 ps;
	ir_out(5) <= '1';
	WAIT FOR 160000 ps;
	ir_out(5) <= '0';
WAIT;
END PROCESS t_prcs_ir_out_5;
-- ir_out[4]
t_prcs_ir_out_4: PROCESS
BEGIN
	ir_out(4) <= '0';
	WAIT FOR 120000 ps;
	ir_out(4) <= '1';
	WAIT FOR 10000 ps;
	ir_out(4) <= '0';
WAIT;
END PROCESS t_prcs_ir_out_4;
-- ir_out[3]
t_prcs_ir_out_3: PROCESS
BEGIN
	ir_out(3) <= '0';
	WAIT FOR 120000 ps;
	ir_out(3) <= '1';
	WAIT FOR 10000 ps;
	ir_out(3) <= '0';
	WAIT FOR 330000 ps;
	ir_out(3) <= '1';
	WAIT FOR 60000 ps;
	ir_out(3) <= '0';
WAIT;
END PROCESS t_prcs_ir_out_3;
-- ir_out[2]
t_prcs_ir_out_2: PROCESS
BEGIN
	ir_out(2) <= '0';
	WAIT FOR 80000 ps;
	ir_out(2) <= '1';
	WAIT FOR 50000 ps;
	ir_out(2) <= '0';
	WAIT FOR 330000 ps;
	ir_out(2) <= '1';
	WAIT FOR 60000 ps;
	ir_out(2) <= '0';
WAIT;
END PROCESS t_prcs_ir_out_2;
-- ir_out[1]
t_prcs_ir_out_1: PROCESS
BEGIN
	ir_out(1) <= '0';
	WAIT FOR 120000 ps;
	ir_out(1) <= '1';
	WAIT FOR 70000 ps;
	ir_out(1) <= '0';
	WAIT FOR 270000 ps;
	ir_out(1) <= '1';
	WAIT FOR 60000 ps;
	ir_out(1) <= '0';
WAIT;
END PROCESS t_prcs_ir_out_1;
-- ir_out[0]
t_prcs_ir_out_0: PROCESS
BEGIN
	ir_out(0) <= '0';
	WAIT FOR 120000 ps;
	ir_out(0) <= '1';
	WAIT FOR 70000 ps;
	ir_out(0) <= '0';
WAIT;
END PROCESS t_prcs_ir_out_0;
-- pc_out[15]
t_prcs_pc_out_15: PROCESS
BEGIN
	pc_out(15) <= '0';
WAIT;
END PROCESS t_prcs_pc_out_15;
-- pc_out[14]
t_prcs_pc_out_14: PROCESS
BEGIN
	pc_out(14) <= '0';
WAIT;
END PROCESS t_prcs_pc_out_14;
-- pc_out[13]
t_prcs_pc_out_13: PROCESS
BEGIN
	pc_out(13) <= '0';
WAIT;
END PROCESS t_prcs_pc_out_13;
-- pc_out[12]
t_prcs_pc_out_12: PROCESS
BEGIN
	pc_out(12) <= '0';
WAIT;
END PROCESS t_prcs_pc_out_12;
-- pc_out[11]
t_prcs_pc_out_11: PROCESS
BEGIN
	pc_out(11) <= '0';
WAIT;
END PROCESS t_prcs_pc_out_11;
-- pc_out[10]
t_prcs_pc_out_10: PROCESS
BEGIN
	pc_out(10) <= '0';
WAIT;
END PROCESS t_prcs_pc_out_10;
-- pc_out[9]
t_prcs_pc_out_9: PROCESS
BEGIN
	pc_out(9) <= '0';
WAIT;
END PROCESS t_prcs_pc_out_9;
-- pc_out[8]
t_prcs_pc_out_8: PROCESS
BEGIN
	pc_out(8) <= '0';
WAIT;
END PROCESS t_prcs_pc_out_8;
-- pc_out[7]
t_prcs_pc_out_7: PROCESS
BEGIN
	pc_out(7) <= '1';
WAIT;
END PROCESS t_prcs_pc_out_7;
-- pc_out[6]
t_prcs_pc_out_6: PROCESS
BEGIN
	pc_out(6) <= '0';
WAIT;
END PROCESS t_prcs_pc_out_6;
-- pc_out[5]
t_prcs_pc_out_5: PROCESS
BEGIN
	pc_out(5) <= '0';
WAIT;
END PROCESS t_prcs_pc_out_5;
-- pc_out[4]
t_prcs_pc_out_4: PROCESS
BEGIN
	pc_out(4) <= '0';
WAIT;
END PROCESS t_prcs_pc_out_4;
-- pc_out[3]
t_prcs_pc_out_3: PROCESS
BEGIN
	pc_out(3) <= '0';
WAIT;
END PROCESS t_prcs_pc_out_3;
-- pc_out[2]
t_prcs_pc_out_2: PROCESS
BEGIN
	pc_out(2) <= '1';
WAIT;
END PROCESS t_prcs_pc_out_2;
-- pc_out[1]
t_prcs_pc_out_1: PROCESS
BEGIN
	pc_out(1) <= '0';
WAIT;
END PROCESS t_prcs_pc_out_1;
-- pc_out[0]
t_prcs_pc_out_0: PROCESS
BEGIN
	pc_out(0) <= '0';
WAIT;
END PROCESS t_prcs_pc_out_0;

-- s
t_prcs_s: PROCESS
BEGIN
	s <= '0';
	WAIT FOR 40000 ps;
	s <= '1';
WAIT;
END PROCESS t_prcs_s;

-- e
t_prcs_e: PROCESS
BEGIN
	e <= 'X';
WAIT;
END PROCESS t_prcs_e;
-- alu_flags[2]
t_prcs_alu_flags_2: PROCESS
BEGIN
	alu_flags(2) <= '0';
WAIT;
END PROCESS t_prcs_alu_flags_2;
-- alu_flags[1]
t_prcs_alu_flags_1: PROCESS
BEGIN
	alu_flags(1) <= '0';
	WAIT FOR 160000 ps;
	alu_flags(1) <= '1';
	WAIT FOR 30000 ps;
	alu_flags(1) <= '0';
WAIT;
END PROCESS t_prcs_alu_flags_1;
-- alu_flags[0]
t_prcs_alu_flags_0: PROCESS
BEGIN
	alu_flags(0) <= '0';
WAIT;
END PROCESS t_prcs_alu_flags_0;
-- main_bus[15]
t_prcs_main_bus_15: PROCESS
BEGIN
	main_bus(15) <= 'X';
WAIT;
END PROCESS t_prcs_main_bus_15;
-- main_bus[14]
t_prcs_main_bus_14: PROCESS
BEGIN
	main_bus(14) <= 'X';
WAIT;
END PROCESS t_prcs_main_bus_14;
-- main_bus[13]
t_prcs_main_bus_13: PROCESS
BEGIN
	main_bus(13) <= 'X';
WAIT;
END PROCESS t_prcs_main_bus_13;
-- main_bus[12]
t_prcs_main_bus_12: PROCESS
BEGIN
	main_bus(12) <= 'X';
WAIT;
END PROCESS t_prcs_main_bus_12;
-- main_bus[11]
t_prcs_main_bus_11: PROCESS
BEGIN
	main_bus(11) <= 'X';
WAIT;
END PROCESS t_prcs_main_bus_11;
-- main_bus[10]
t_prcs_main_bus_10: PROCESS
BEGIN
	main_bus(10) <= 'X';
WAIT;
END PROCESS t_prcs_main_bus_10;
-- main_bus[9]
t_prcs_main_bus_9: PROCESS
BEGIN
	main_bus(9) <= 'X';
WAIT;
END PROCESS t_prcs_main_bus_9;
-- main_bus[8]
t_prcs_main_bus_8: PROCESS
BEGIN
	main_bus(8) <= 'X';
WAIT;
END PROCESS t_prcs_main_bus_8;
-- main_bus[7]
t_prcs_main_bus_7: PROCESS
BEGIN
	main_bus(7) <= 'X';
WAIT;
END PROCESS t_prcs_main_bus_7;
-- main_bus[6]
t_prcs_main_bus_6: PROCESS
BEGIN
	main_bus(6) <= 'X';
WAIT;
END PROCESS t_prcs_main_bus_6;
-- main_bus[5]
t_prcs_main_bus_5: PROCESS
BEGIN
	main_bus(5) <= 'X';
WAIT;
END PROCESS t_prcs_main_bus_5;
-- main_bus[4]
t_prcs_main_bus_4: PROCESS
BEGIN
	main_bus(4) <= 'X';
WAIT;
END PROCESS t_prcs_main_bus_4;
-- main_bus[3]
t_prcs_main_bus_3: PROCESS
BEGIN
	main_bus(3) <= 'X';
WAIT;
END PROCESS t_prcs_main_bus_3;
-- main_bus[2]
t_prcs_main_bus_2: PROCESS
BEGIN
	main_bus(2) <= 'X';
WAIT;
END PROCESS t_prcs_main_bus_2;
-- main_bus[1]
t_prcs_main_bus_1: PROCESS
BEGIN
	main_bus(1) <= 'X';
WAIT;
END PROCESS t_prcs_main_bus_1;
-- main_bus[0]
t_prcs_main_bus_0: PROCESS
BEGIN
	main_bus(0) <= 'X';
WAIT;
END PROCESS t_prcs_main_bus_0;
END ControlUnit_arch;
