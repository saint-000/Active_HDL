library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity decorder4_8_tb is
end decorder4_8_tb;

architecture TB_ARCHITECTURE of decorder4_8_tb is
	-- Component declaration of the tested unit
	component decorder4_8
	port(
		A : in STD_LOGIC_VECTOR(3 downto 0);
		Y : out STD_LOGIC_VECTOR(7 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC_VECTOR(3 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Y : STD_LOGIC_VECTOR(7 downto 0);
		-- Add your code here ...
	constant clk_cycle:TIME:=100ns;
begin

	-- Unit Under Test port map
	UUT : decorder4_8
		port map (
			A => A,
			Y => Y
		
		);

	-- Add your stimulus here ...
	
process
begin
	A(3)<='0';
	wait for 25ns;
	A(3)<='1';
	wait for 25ns;
	A(3)<='0';
end process ;
process
begin
	A(2)<='0';
	wait for 40ns;
	A(2)<='1';
	wait for 40ns;
	A(2)<='0';
end process; 
process
begin
	A(1)<='0';
	wait for 60ns;
	A(1)<='1';
	wait for 60ns;
	A(1)<='0';
end process;
process
begin
	A(0)<='0';
	wait for 85ns;
	A(0)<='1';
	wait for 85ns;
	A(0)<='0';
end process;


end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_decorder4_8 of decorder4_8_tb is
	for TB_ARCHITECTURE
		for UUT : decorder4_8
			use entity work.decorder4_8(rtl);
		end for;
	end for;
end TESTBENCH_FOR_decorder4_8;

