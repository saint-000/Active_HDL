library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity div_freq_tb is
end div_freq_tb;

architecture TB_ARCHITECTURE of div_freq_tb is
	-- Component declaration of the tested unit
	component div_freq
	port(
		clk : in STD_LOGIC;
		clr : in STD_LOGIC;
		bclk1 : out STD_LOGIC;
		bclk2 : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal clr : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal bclk1 : STD_LOGIC;
	signal bclk2 : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : div_freq
		port map (
			clk => clk,
			clr => clr,
			bclk1 => bclk1,
			bclk2 => bclk2
		);

	-- Add your stimulus here ...	
	process
	begin
		clk<='0';
		wait for 50ns;
		clk<='1';
		wait for 50ns;
		clk<='0';
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_div_freq of div_freq_tb is
	for TB_ARCHITECTURE
		for UUT : div_freq
			use entity work.div_freq(behav);
		end for;
	end for;
end TESTBENCH_FOR_div_freq;

