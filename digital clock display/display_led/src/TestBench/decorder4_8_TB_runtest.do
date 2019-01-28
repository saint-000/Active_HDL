SetActiveLib -work
comp -include "$dsn\src\decorder4_8.vhd" 
comp -include "$dsn\src\TestBench\decorder4_8_TB.vhd" 
asim +access +r TESTBENCH_FOR_decorder4_8 
wave 
wave -noreg A
wave -noreg Y
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\decorder4_8_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_decorder4_8 
