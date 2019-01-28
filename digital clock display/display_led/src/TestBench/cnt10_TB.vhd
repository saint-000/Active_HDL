library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity cnt10_tb is
end cnt10_tb;

architecture TB_ARCHITECTURE of cnt10_tb is
	-- Component declaration of the tested unit
	component cnt10
	port(
		reset : in STD_LOGIC;
		en : in STD_LOGIC;
		clk : in STD_LOGIC;
		carry : out STD_LOGIC;
		q : out STD_LOGIC_VECTOR(3 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal reset : STD_LOGIC;
	signal en : STD_LOGIC;
	signal clk : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal carry : STD_LOGIC;
	signal q : STD_LOGIC_VECTOR(3 downto 0);

	-- Add your code here ...
	constant clk_cycle:TIME:=20ns;
begin

	-- Unit Under Test port map
	UUT : cnt10
		port map (
			reset => reset,
			en => en,
			clk => clk,
			carry => carry,
			q => q
		);

	-- Add your stimulus here ...
	process 
	begin 
		clk<='1';
		wait for clk_cycle/2;
		clk<='0';
		wait for clk_cycle/2;
	end process ;
	process 
	begin 
		reset<='1';
		wait for clk_cycle*1.2;
		reset<='0';
		en<='1';
		wait for clk_cycle*10;
		en<='0';
		wait for clk_cycle*1.2;
	end process ;

		
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_cnt10 of cnt10_tb is
	for TB_ARCHITECTURE
		for UUT : cnt10
			use entity work.cnt10(rtl);
		end for;
	end for;
end TESTBENCH_FOR_cnt10;

