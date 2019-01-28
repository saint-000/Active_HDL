library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity cis
	port(
		clr : in STD_LOGIC;
		index : in INTEGER range 0 to 21;
		tone : out INTEGER range 0 to 16#FFF#		--¼ÆÊý³õÖµ
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
				when 0=>tone<= 273;  	--µÍÒô1
				when 1=>tone<= 690;	   	--µÍÒô2
				when 2=>tone<= 1061;	--µÍÒô3
				when 3=>tone<= 1232;	--µÍÒô4
				when 4=>tone<= 1544;	--µÍÒô5
				when 5=>tone<= 1822;	--µÍÒô6
				when 6=>tone<= 2070;	--µÍÒô7
				when 7=>tone<= 2184;	--ÖÐÒô1
				when 8=>tone<= 2392;	--ÖÐÒô2
				when 9=>tone<= 2587;	 --ÖÐÒô3
				when 10=>tone<= 2663;	--ÖÐÒô4
				when 11=>tone<= 2819;	 --ÖÐÒô5
				when 12=>tone<= 2959; 	 --ÖÐÒô6
				when 13=>tone<= 3083;    --ÖÐÒô7
				when 14=>tone<= 3139;	 --¸ßÒô1
				when 15=>tone<= 3244;	 --¸ßÒô2
				when 16=>tone<= 3337;	 --¸ßÒô3
				when 17=>tone<= 3379;	 --¸ßÒô4
				when 18=>tone<= 3457;     --¸ßÒô5
				when 19=>tone<= 3527;	  --¸ßÒô6
				when 20=>tone<= 3589;     --¸ßÒô7
				when 21=>tone<=4095;	  --ÐÝÖ¹·û
				when others =>null;
			end case;
		end if;
	end process;
	
	
end skfp;
