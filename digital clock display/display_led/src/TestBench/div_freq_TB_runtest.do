SetActiveLib -work
comp -include "$dsn\src\div_freq.vhd" 
comp -include "$dsn\src\TestBench\div_freq_TB.vhd" 
asim +access +r TESTBENCH_FOR_div_freq 
wave 
wave -noreg clk
wave -noreg clr
wave -noreg bclk1
wave -noreg bclk2
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\div_freq_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_div_freq 
