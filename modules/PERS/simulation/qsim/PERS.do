onerror {quit -f}
vlib work
vlog -work work PERS.vo
vlog -work work PERS.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.PERS_vlg_vec_tst
vcd file -direction PERS.msim.vcd
vcd add -internal PERS_vlg_vec_tst/*
vcd add -internal PERS_vlg_vec_tst/i1/*
add wave /*
run -all
