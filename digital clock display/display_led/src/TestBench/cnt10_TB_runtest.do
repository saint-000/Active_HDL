SetActiveLib -work
comp -include "$dsn\src\cnt10.vhd" 
comp -include "$dsn\src\TestBench\cnt10_TB.vhd" 
asim +access +r TESTBENCH_FOR_cnt10 
wave 
wave -noreg reset
wave -noreg en
wave -noreg clk
wave -noreg carry
wave -noreg q
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\cnt10_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_cnt10 
