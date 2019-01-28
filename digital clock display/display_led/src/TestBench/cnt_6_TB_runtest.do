SetActiveLib -work
comp -include "$dsn\src\cnt_6.vhd" 
comp -include "$dsn\src\TestBench\cnt_6_TB.vhd" 
asim +access +r TESTBENCH_FOR_cnt_6 
wave 
wave -noreg clk
wave -noreg en
wave -noreg reset
wave -noreg carry
wave -noreg q
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\cnt_6_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_cnt_6 
