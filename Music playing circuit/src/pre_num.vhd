library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity cis
	port(
		clr : in STD_LOGIC;
		index : in INTEGER range 0 to 21;
		tone : out INTEGER range 0 to 16#FFF#		--������ֵ
		);
end pre_num;

--}} End of automatically maintained section

architecture skfp of pre_num is
begin
	process(index,clr)
	begin
		if clr<='0' then
			tone<=273;
		else 
			
			case index is
				when 0=>tone<= 273;  	--����1
				when 1=>tone<= 690;	   	--����2
				when 2=>tone<= 1061;	--����3
				when 3=>tone<= 1232;	--����4
				when 4=>tone<= 1544;	--����5
				when 5=>tone<= 1822;	--����6
				when 6=>tone<= 2070;	--����7
				when 7=>tone<= 2184;	--����1
				when 8=>tone<= 2392;	--����2
				when 9=>tone<= 2587;	 --����3
				when 10=>tone<= 2663;	--����4
				when 11=>tone<= 2819;	 --����5
				when 12=>tone<= 2959; 	 --����6
				when 13=>tone<= 3083;    --����7
				when 14=>tone<= 3139;	 --����1
				when 15=>tone<= 3244;	 --����2
				when 16=>tone<= 3337;	 --����3
				when 17=>tone<= 3379;	 --����4
				when 18=>tone<= 3457;     --����5
				when 19=>tone<= 3527;	  --����6
				when 20=>tone<= 3589;     --����7
				when 21=>tone<=4095;	  --��ֹ��
				when others =>null;
			end case;
		end if;
	end process;
	
	
end skfp;
