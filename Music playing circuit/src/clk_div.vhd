library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_unsigned.all; 

entity clk_div is					--预置分频器
	port(
		clk : in STD_LOGIC;
		clr : in STD_LOGIC;
		clk_four : out STD_LOGIC;
		clk_2m : out STD_LOGIC
		);
end clk_div;

--}} End of automatically maintained section

architecture rtl of clk_div is	
	signal clk_div:std_logic_vector(23 downto 0);
begin 
	process(clk,clr)
	begin			
		if clr='0' then
			clk_div<="000000000000000000000000";
		elsif clk'event and clk='1' then
			if clk_div="111111111111111111111111" then
				clk_div<="000000000000000000000000";	
			else
				clk_div<=clk_div+1;
			end if;
		end if;
	end process;
	
	with clk_div(22 downto 0) select	 --将开发板上时钟信号分成4Hz的信号
	clk_four<='1'  when "10000000000000000000000",
	'0' when others;
	with clk_div(3 downto 0) select		 --将开发板上时钟信号分成2MHz的信号
	clk_2m<='1' when "1000",
	'0' when others;
	
	
	-- enter your statements here --
	
end rtl;
