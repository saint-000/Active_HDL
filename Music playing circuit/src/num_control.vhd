
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity num_control is
	port(
		clr : in STD_LOGIC;
		clk : in STD_LOGIC;
		tone : in INTEGER range 0 to 16#fff#;
		spk : out BIT
		);
end num_control;

--}} End of automatically maintained section

architecture yang of num_control is
	signal spk_temp:bit;
begin
	process(clk,clr)
		variable  count: integer range 0 to 16#FFF#;
	begin	
		if clr='0' then 
			count:=0;
			spk_temp<='0'; 
		elsif clk'event and clk='1' then
			if count=16#FFF# then	 --如果加到最大预置数
				count:= tone;	
				spk_temp<='1';		 --就返回到预置数重新计数
			else 
				count:=count+1;		--否则一直加1（从预置数开始）
				spk_temp<='0';
			end if;
		end if;
	end process; 
	
	process(spk_temp,clr) 				--抑制偶次谐波分量，使输出为占空比百分之五十的方波
		variable count2:bit;
	begin
		if clr='0' then
			count2:='0';
			spk<='0';	  
		elsif spk_temp'event and  spk_temp='1' then
			count2:= not count2;
			if count2='1' then
				spk<='1';
			else 		  
				spk<='0';
			end if;
		end if;
	end process;
	
	
	-- enter your statements here --
	
end yang;