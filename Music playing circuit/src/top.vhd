library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity music_total is
	 port(
		 clk : in STD_LOGIC;
		 clr : in STD_LOGIC;
		 SEL : in std_logic;
		 spkout : out BIT;
		 LED : out std_logic_vector (7 downto 0)
	     );
end music_total;

--}} End of automatically maintained section

architecture total of music_total is
component clk_div--Ô¤·ÖÆµÆ÷
	    port(
		 clk : in STD_LOGIC;
		 clr:  in STD_LOGIC;
		 clk_four:out STD_LOGIC;
		 clk_2m:out STD_LOGIC
	     );
end component; 
 ---------------------------------------------------
component music
	    port(
		 clr:in STD_LOGIC;
		 clk : in STD_LOGIC;
		 sel : in std_logic;
		tone_index : out integer range 0 to 21;
		led : out std_logic_vector(7 downto 0)
	     );
end component;
--------------------------------------------------
component pre_num
	     port(
		  clr: in STD_LOGIC;
		 index : in integer range 0 to 21;
		 tone : out integer range 0 to 16#FFF#
	     );
end component;
-----------------------------------------
component num_control 
	     port(
		  clr:in STD_LOGIC;
		 clk : in STD_LOGIC;
		 tone : in integer range 0 to 16#FFF#;
		 spk : out bit
	     );
end component;
--------------------------------------------- 
signal clk_four1:STD_LOGIC;
signal clk_2m1:STD_LOGIC;
signal   tone_index1: integer range 0 to 21; 
signal tone1:integer range 0 to 16#FFF#;
begin
 com1:clk_div
 port map(clk,clr,clk_four1,clk_2m1);
 com2: music
 port map(clr,clk_four1,SEL,tone_index1,LED);
 com3:pre_num
 port map(clr,tone_index1,tone1); 
 com4: num_control
 port map(clr,clk_2m1,tone1,spkout);


	 -- enter your statements here --

end total;
