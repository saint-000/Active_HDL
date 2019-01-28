library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity add_all_tb is
end add_all_tb;

architecture TB_ARCHITECTURE of add_all_tb is
	-- Component declaration of the tested unit
	component add_all
	port(
		CLK : in STD_LOGIC;
		RESET : in STD_LOGIC;
		START : in STD_LOGIC;
		SG : out STD_LOGIC_VECTOR(7 downto 0);
		COM : out STD_LOGIC_VECTOR(5 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal CLK : STD_LOGIC;
	signal RESET : STD_LOGIC;
	signal START : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal SG : STD_LOGIC_VECTOR(7 downto 0);
	signal COM : STD_LOGIC_VECTOR(5 downto 0);
	constant clk_cycle:TIME:=50ns;
	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : add_all
		port map (
			CLK => CLK,
			RESET => RESET,
			START => START,
			SG => SG,
			COM => COM
		);

	-- Add your stimulus here ...
	process
	begin
		CLK<='0';
		wait for clk_cycle/2;
		CLK<='1';
		wait for clk_cycle/2;
	end process ;
	process 
	begin 
		RESET<='1';
		wait for clk_cycle*1.2;
		RESET<='0';
		START<='1';
		wait for clk_cycle*10;
		START<='0';
		wait for clk_cycle*1.2;
	end process ;
			
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_add_all of add_all_tb is
	for TB_ARCHITECTURE
		for UUT : add_all
			use entity work.add_all(rtl);
		end for;
	end for;
end TESTBENCH_FOR_add_all;

