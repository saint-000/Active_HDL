SetActiveLib -work
comp -include "$dsn\src\decorder4_8.vhd" 
comp -include "$dsn\src\cnt_6.vhd" 
comp -include "$dsn\src\cnt10.vhd" 
comp -include "$dsn\src\div_2k.vhd" 
comp -include "$dsn\src\add_all.vhd" 
comp -include "$dsn\src\TestBench\add_all_TB.vhd" 
asim +access +r TESTBENCH_FOR_add_all 
wave 
wave -noreg CLK
wave -noreg RESET
wave -noreg START
wave -noreg SG
wave -noreg COM
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\add_all_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_add_all 
