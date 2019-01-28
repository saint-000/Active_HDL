
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;

entity music is
	port(
		clr : in STD_LOGIC;
		clk : in STD_LOGIC;
		sel : in std_logic ;
		tone_index : out INTEGER range 0 to 21;
		led : out std_logic_vector (7 downto 0)
		);
end music;

--}} End of automatically maintained section

architecture yuequ of music is	
signal song_bie:integer range 0 to 102;
signal see_you_again : integer range 0 to 144;
signal box,box2 : INTEGER range 0 to 21;
signal led_temp1,led_temp2:std_logic_vector (7 downto 0);
begin 
	process(clk,clr)
	begin	
		if clr='0' then
			song_bie<=0;
			see_you_again<=0;
		elsif clk'event and clk='1' then
			if song_bie=102 then
				song_bie<=0;
			else
				song_bie<=song_bie+1;
			end if;
			if see_you_again=144 then 
				see_you_again<=0;
			else 
				see_you_again<=see_you_again+1;
			end if ;
			
		end if;
	end process;
	
	process(song_bie)				   --¸èÇú¡¶ËÍ±ð¡·
	begin			
		case song_bie is
			when 0=>box<=11;led_temp1<="00011111";  --ÖÐÒô5
			when 1=>box<=11;led_temp1<="00011111"; 
			when 2=>box<=11;led_temp1<="00011111"; 
			when 3=>box<=11;led_temp1<="00011111"; 
			when 4=>box<=9;led_temp1<="00000111";   --ÖÐÒô3
			when 5=>box<=9;led_temp1<="00000111"; 
			when 6=>box<=11;led_temp1<="00011111";   --ÖÐÒô5
			when 7=>box<=11;led_temp1<="00011111"; 
			when 8=>box<=14;led_temp1<="11111111";   --¸ßÒô1
			when 9=>box<=14;led_temp1<="11111111"; 
			when 10=>box<=14;led_temp1<="11111111";  
			when 11=>box<=14;led_temp1<="11111111"; 
			when 12=>box<=14;led_temp1<="11111111"; 
			when 13=>box<=21;led_temp1<="00000000";  --ÐÝÖ¹·û
			
			when 14=>box<=12;led_temp1<="00111111";  --ÖÐÒô6 
			when 15=>box<=12;led_temp1<="00111111"; 
			when 16=>box<=12;led_temp1<="00111111";  	
			when 17=>box<=12;led_temp1<="00111111";
			when 18=>box<=14;led_temp1<="11111111";   --¸ßÒô1
			when 19=>box<=14;led_temp1<="11111111"; 
			when 20=>box<=12;led_temp1<="00111111";  --ÖÐÒô6
			when 21=>box<=12;led_temp1<="00111111"; 
			when 22=>box<=11;led_temp1<="00011111";   --ÖÐÒô5
			when 23=>box<=11;led_temp1<="00011111"; 
			when 24=>box<=11;led_temp1<="00011111"; 	
			when 25=>box<=11;led_temp1<="00011111"; 
			when 26=>box<=11;led_temp1<="00011111"; 
			when 27=>box<=21;led_temp1<="00000000";  --ÐÝÖ¹·û
			
			when 28=>box<=11;led_temp1<="00011111";  --ÖÐÒô5
			when 29=>box<=11;led_temp1<="00011111";  
			when 30=>box<=11;led_temp1<="00011111"; 	 
			when 31=>box<=11;led_temp1<="00011111";  
			when 32=>box<=7;led_temp1<="00000001"; --ÖÐÒô1
			when 33=>box<=7;led_temp1<="00000001"; 
			when 34=>box<=8;led_temp1<="00000011"; --ÖÐÒô2
			when 35=>box<=8;led_temp1<="00000011"; 
			when 36=>box<=9;led_temp1<="00000111"; --ÖÐÒô3
			when 37=>box<=9;led_temp1<="00000111"; 
			when 38=>box<=9;led_temp1<="00000111"; 
			when 39=>box<=9;led_temp1<="00000111"; 
			when 40=>box<=8;led_temp1<="00000011"; --ÖÐÒô2
			when 41=>box<=8;led_temp1<="00000011"; 
			when 42=>box<=7;led_temp1<="00000001"; --ÖÐÒô1
			when 43=>box<=7;led_temp1<="00000001"; 
			when 44=>box<=8;led_temp1<="00000011"; --ÖÐÒô2
			when 45=>box<=8;led_temp1<="00000011"; 
			when 46=>box<=8;led_temp1<="00000011"; 
			when 47=>box<=8;led_temp1<="00000011"; 
			when 48=>box<=8;led_temp1<="00000011"; 
			when 49=>box<=8;led_temp1<="00000011"; 
			when 50=>box<=21;led_temp1<="00000000";--ÐÝÖ¹·û
			
			when 51=>box<=11;led_temp1<="00011111";--ÖÐÒô5 
			when 52=>box<=11;led_temp1<="00011111"; 
			when 53=>box<=11;led_temp1<="00011111"; 
			when 54=>box<=11;led_temp1<="00011111"; 
			when 55=>box<=9;led_temp1<="00000111";  --ÖÐÒô3
			when 56=>box<=9;led_temp1<="00000111"; 
			when 57=>box<=11;led_temp1<="00011111"; --ÖÐÒô5
			when 58=>box<=11;led_temp1<="00011111"; 
			when 59=>box<=14;led_temp1<="11111111"; --¸ßÒô1
			when 60=>box<=14;led_temp1<="11111111";
			when 61=>box<=14;led_temp1<="11111111"; 
			when 62=>box<=14;led_temp1<="11111111"; 
			when 63=>box<=14;led_temp1<="11111111"; 
			when 64=>box<=14;led_temp1<="11111111"; 
			when 65=>box<=13;led_temp1<="01111111"; --ÖÐÒô7
			when 66=>box<=13;led_temp1<="01111111"; 
			when 67=>box<=12;led_temp1<="00111111"; --ÖÐÒô6
			when 68=>box<=12;led_temp1<="00111111"; 
			when 69=>box<=12;led_temp1<="00111111"; 
			when 70=>box<=12;led_temp1<="00111111"; 
			when 71=>box<=14;led_temp1<="11111111"; --¸ßÒô1
			when 72=>box<=14;led_temp1<="11111111"; 
			when 73=>box<=14;led_temp1<="11111111"; 
			when 74=>box<=14;led_temp1<="11111111"; 
			when 75=>box<=11;led_temp1<="00011111"; --ÖÐÒô5
			when 76=>box<=11;led_temp1<="00011111"; 
			when 77=>box<=11;led_temp1<="00011111"; 
			when 78=>box<=11;led_temp1<="00011111"; 
			when 79=>box<=11;led_temp1<="00011111"; 
			when 80=>box<=21;led_temp1<="00000000";--ÐÝÖ¹·û
			
			when 81=>box<=11;led_temp1<="00011111"; --ÖÐÒô5
			when 82=>box<=11;led_temp1<="00011111"; 
			when 83=>box<=11;led_temp1<="00011111"; 
			when 84=>box<=11;led_temp1<="00011111"; 
			when 85=>box<=8;led_temp1<="00000011";  --ÖÐÒô2
			when 86=>box<=8;led_temp1<="00000011"; 
			when 87=>box<=9;led_temp1<="00000111";  --ÖÐÒô3
			when 88=>box<=9;led_temp1<="00000111"; 
			when 89=>box<=10;led_temp1<="00001111"; --ÖÐÒô4
			when 90=>box<=10;led_temp1<="00001111"; 
			when 91=>box<=10;led_temp1<="00001111";
			when 92=>box<=10;led_temp1<="00001111"; 
			when 93=>box<=10;led_temp1<="00001111"; 
			when 94=>box<=10;led_temp1<="00001111"; 
			when 95=>box<=6;led_temp1<="00000001";  --µÍÒô7
			when 96=>box<=6;led_temp1<="00000001";
			when 97=>box<=7;led_temp1<="00000001";	 --ÖÐÒô1
			when 98=>box<=7;led_temp1<="00000001";
			when 99=>box<=7;led_temp1<="00000001";
			when 100=>box<=7;led_temp1<="00000001";
			when 101=>box<=7;led_temp1<="00000001"; 
			when 102=>box<=7;led_temp1<="00000001";
			when others=>null;
		end case;
	end process;
	process (see_you_again)
	begin
		case see_you_again is
			when 0=>box2<=7;led_temp2<="00000001"	; --ÖÐÒô1
			when 1=>box2<=7;led_temp2<="00000001";
			when 2=>box2<=9;led_temp2<="00000111";--3
			when 3=>box2<=9;led_temp2<="00000111";
			when 4=>box2<=11;led_temp2<="00011111";--5
			when 5=>box2<=11;led_temp2<="00011111";
			when 6=>box2<=12;led_temp2<="00111111";--6
			when 7=>box2<=12;led_temp2<="00111111";
			when 8=>box2<=12;led_temp2<="00111111";
			when 9=>box2<=12;led_temp2<="00111111";
			when 10=>box2<=12;led_temp2<="00111111";
			when 11=>box2<=12;led_temp2<="00111111";
			when 12=>box2<=11;led_temp2<="00011111";--5
			when 13=>box2<=11;led_temp2<="00011111";
			when 14=>box2<=11;led_temp2<="00011111";
			when 15=>box2<=11;led_temp2<="00011111";
			when 16=>box2<=11;led_temp2<="00011111";
			when 17=>box2<=11;led_temp2<="00011111";
			when 18=>box2<=21;led_temp2<="00000000"; --ÐÝÖ¹·û
			when 19=>box2<=21;led_temp2<="00000000";
			when 20=>box2<=21;led_temp2<="00000000";
			
			when 21=>box2<=7;led_temp2<="00000001";  --1
			when 22=>box2<=8;led_temp2<="00000011";  --2
			when 23=>box2<=8;led_temp2<="00000011";
			when 24=>box2<=8;led_temp2<="00000011";  --2
			when 25=>box2<=8;led_temp2<="00000011";
			when 26=>box2<=7;led_temp2<="00000001";  --1
			when 27=>box2<=7;led_temp2<="00000001";
			when 28=>box2<=8;led_temp2<="00000011";  --2
			when 29=>box2<=8;led_temp2<="00000011";
			when 30=>box2<=21;led_temp2<="00000000"; --ÐÝÖ¹·û
			when 31=>box2<=21;led_temp2<="00000000";
			when 32=>box2<=21;led_temp2<="00000000";
			when 33=>box2<=21;led_temp2<="00000000";
			when 34=>box2<=21;led_temp2<="00000000";	
			
			when 35=>box2<=9;led_temp2<="00000111";--3
			when 36=>box2<=11;led_temp2<="00011111";--5
			when 37=>box2<=12;led_temp2<="00111111";--6
			when 38=>box2<=12;led_temp2<="00111111";
			when 39=>box2<=12;led_temp2<="00111111";
			when 40=>box2<=13;led_temp2<="01111111";--7
			when 41=>box2<=12;led_temp2<="00111111";--6
			when 42=>box2<=12;led_temp2<="00111111";
			when 43=>box2<=11;led_temp2<="00011111"; --5
			when 44=>box2<=11;led_temp2<="00011111";
			when 45=>box2<=9;led_temp2<="00000111";--3
			when 46=>box2<=9;led_temp2<="00000111";
			when 47=>box2<=8;led_temp2<="00000011";--2
			when 48=>box2<=8;led_temp2<="00000011";
			when 49=>box2<=8;led_temp2<="00000011";--2
			when 50=>box2<=8;led_temp2<="00000011";
			when 51=>box2<=7;led_temp2<="00000001";--1
			when 52=>box2<=7;led_temp2<="00000001";
			when 53=>box2<=8;led_temp2<="00000011"; --2
			when 54=>box2<=8;led_temp2<="00000011";
			when 55=>box2<=8;led_temp2<="00000011";
			when 56=>box2<=8;led_temp2<="00000011";
			when 57=>box2<=8;led_temp2<="00000011";
			when 58=>box2<=8;led_temp2<="00000011";
			when 59=>box2<=7;led_temp2<="00000001"; --1
			when 60=>box2<=7;led_temp2<="00000001";
			when 61=>box2<=21;led_temp2<="00000000"; --ÐÝÖ¹·û
			when 62=>box2<=21;led_temp2<="00000000";
			when 63=>box2<=21;led_temp2<="00000000";
			when 64=>box2<=21;led_temp2<="00000000";
			when 65=>box2<=21;led_temp2<="00000000";
			
			when 66=>box2<=7;led_temp2<="00000001";--1
			when 67=>box2<=9;led_temp2<="00000111";--3
			when 68=>box2<=11;led_temp2<="00011111";--5
			when 69=>box2<=12;led_temp2<="00111111";--6
			when 70=>box2<=12;led_temp2<="00111111";
			when 71=>box2<=12;led_temp2<="00111111";
			when 72=>box2<=12;led_temp2<="00111111";
			when 73=>box2<=12;led_temp2<="00111111";
			when 74=>box2<=12;led_temp2<="00111111";
			when 75=>box2<=11;led_temp2<="00011111";--5
			when 76=>box2<=11;led_temp2<="00011111";
			when 77=>box2<=11;led_temp2<="00011111";
			when 78=>box2<=11;led_temp2<="00011111";
			when 79=>box2<=11;led_temp2<="00011111";
			when 80=>box2<=11;led_temp2<="00011111";
			when 81=>box2<=21;led_temp2<="00000000";--ÐÝÖ¹·û
			when 82=>box2<=21;led_temp2<="00000000";
			when 83=>box2<=21;led_temp2<="00000000";
			
			when 84=>box2<=7;led_temp2<="00000001";--1
			when 85=>box2<=8;led_temp2<="00000011";--2
			when 86=>box2<=8;led_temp2<="00000011";
			when 87=>box2<=8;led_temp2<="00000011";
			when 88=>box2<=8;led_temp2<="00000011";
			when 89=>box2<=7;led_temp2<="00000001";--1
			when 90=>box2<=7;led_temp2<="00000001";
			when 91=>box2<=8;led_temp2<="00000011";--2
			when 92=>box2<=8;led_temp2<="00000011";
			when 93=>box2<=21;led_temp2<="00000000";--ÐÝÖ¹·û
			when 94=>box2<=21;led_temp2<="00000000";
			when 95=>box2<=21;led_temp2<="00000000";
			when 96=>box2<=21;led_temp2<="00000000";
			when 97=>box2<=21;led_temp2<="00000000";
			when 98=>box2<=21;led_temp2<="00000000";
			
			when 99=>box2<=9;led_temp2<="00000111";--3
			when 100=>box2<=11;led_temp2<="00011111";--5
			when 101=>box2<=12;led_temp2<="00111111";--6
			when 102=>box2<=12;led_temp2<="00111111";
			when 103=>box2<=14;led_temp2<="11111111";--¸ßÒô1
			when 104=>box2<=14;led_temp2<="11111111";
			when 105=>box2<=15;led_temp2<="11111111";--¸ßÒô2
			when 106=>box2<=15;led_temp2<="11111111";
			when 107=>box2<=15;led_temp2<="11111111";
			when 108=>box2<=16;led_temp2<="11111111";--¸ßÒô3
			when 109=>box2<=15;led_temp2<="11111111";--¸ßÒô2
			when 110=>box2<=15;led_temp2<="11111111";
			when 111=>box2<=14;led_temp2<="11111111";--¸ßÒô1
			when 112=>box2<=14;led_temp2<="11111111";
			when 113=>box2<=12;led_temp2<="00111111";--6
			when 114=>box2<=12;led_temp2<="00111111";
			when 115=>box2<=14;led_temp2<="11111111";--¸ßÒô1
			when 116=>box2<=14;led_temp2<="11111111";
			when 117=>box2<=15;led_temp2<="11111111";--¸ßÒô2
			when 118=>box2<=15;led_temp2<="11111111";
			when 119=>box2<=15;led_temp2<="11111111";--¸ßÒô2
			when 120=>box2<=15;led_temp2<="11111111";
			when 121=>box2<=14;led_temp2<="11111111";--¸ßÒô1
			when 122=>box2<=14;led_temp2<="11111111";
			when 123=>box2<=14;led_temp2<="11111111";--¸ßÒô1
			when 124=>box2<=14;led_temp2<="11111111";
			when 125=>box2<=12;led_temp2<="00111111";--6
			when 126=>box2<=12;led_temp2<="00111111";
			when 127=>box2<=14;led_temp2<="11111111";--¸ßÒô1
			when 128=>box2<=14;led_temp2<="11111111";
			when 129=>box2<=15;led_temp2<="11111111";--¸ßÒô2
			when 130=>box2<=15;led_temp2<="11111111";
			when 131=>box2<=16;led_temp2<="11111111";--¸ßÒô2
			when 132=>box2<=16;led_temp2<="11111111";
			when 133=>box2<=15;led_temp2<="11111111";--¸ßÒô1
			when 134=>box2<=15;led_temp2<="11111111";
			when 135=>box2<=15;led_temp2<="11111111";--¸ßÒô1
			when 136=>box2<=15;led_temp2<="11111111";
			when 137=>box2<=21;led_temp2<="00000000";--ÐÝÖ¹·û
			when 138=>box2<=21;led_temp2<="00000000";
			when 139=>box2<=21;led_temp2<="00000000";
			when 140=>box2<=21;led_temp2<="00000000";
			when 141=>box2<=21;led_temp2<="00000000";
			when 142=>box2<=21;led_temp2<="00000000";
			when 143=>box2<=21;led_temp2<="00000000";
			when 144=>box2<=21;led_temp2<="00000000";
			when others=>null;
		end case ;
	end process ;
	process(sel)
	begin
	if sel='0' then
		tone_index<=box;
		led<=led_temp1;
	else 
		tone_index<=box2;
		led<=led_temp2;
	end if ; 
	end process;
	
			
			
			
	
	
	
	
	-- enter your statements here --
	
end yuequ;