-------------------------------------------------------------------------------
--
-- Title       : Clock
-- Design      : display_led
-- Author      : Joshua
-- Company     : UESTC
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Administrator\Desktop\act\zmd2\display_led\compile\Clock.vhd
-- Generated   : Sun Dec  9 14:53:57 2018
-- From        : C:\Users\Administrator\Desktop\act\zmd2\display_led\src\Clock.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;


entity Clock is
  port(
       CLK : in STD_LOGIC;
       RESET : in STD_LOGIC;
       START : in STD_LOGIC;
       COM : out STD_LOGIC_VECTOR(5 downto 0);
       SG : out STD_LOGIC_VECTOR(7 downto 0)
  );
end Clock;

architecture rtl of Clock is

---- Component declarations -----

component cnt10
  port (
       clk : in STD_LOGIC;
       en : in STD_LOGIC;
       reset : in STD_LOGIC;
       carry : out STD_LOGIC;
       q : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component cnt_6
  port (
       clk : in STD_LOGIC;
       en : in STD_LOGIC;
       reset : in STD_LOGIC;
       carry : out STD_LOGIC;
       q : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component decorder4_8
  port (
       A : in STD_LOGIC_VECTOR(3 downto 0);
       Y : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component div_freq
  port (
       clk : in STD_LOGIC;
       clr : in STD_LOGIC;
       bclk1 : out STD_LOGIC;
       bclk2 : out STD_LOGIC
  );
end component;
component \select\
  port (
       hour1 : in STD_LOGIC_VECTOR(3 downto 0);
       hour2 : in STD_LOGIC_VECTOR(3 downto 0);
       min1 : in STD_LOGIC_VECTOR(3 downto 0);
       min2 : in STD_LOGIC_VECTOR(3 downto 0);
       sec1 : in STD_LOGIC_VECTOR(3 downto 0);
       sec2 : in STD_LOGIC_VECTOR(3 downto 0);
       sel : in STD_LOGIC_VECTOR(3 downto 0);
       com : out STD_LOGIC_VECTOR(5 downto 0);
       cout : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal NET1003 : STD_LOGIC;
signal NET1016 : STD_LOGIC;
signal NET1029 : STD_LOGIC;
signal NET1042 : STD_LOGIC;
signal NET1665 : STD_LOGIC;
signal NET1676 : STD_LOGIC;
signal NET990 : STD_LOGIC;
signal BUS1051 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS1058 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS1067 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS1076 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS1085 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS1094 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS1103 : STD_LOGIC_VECTOR (3 downto 0);
signal BUS133 : STD_LOGIC_VECTOR (3 downto 0);

begin

----  Component instantiations  ----

U1 : div_freq
  port map(
       bclk1 => NET1665,
       bclk2 => NET1676,
       clk => CLK,
       clr => RESET
  );

U10 : cnt_6
  port map(
       clk => NET1676,
       en => START,
       q => BUS1058,
       reset => RESET
  );

U2 : \select\
  port map(
       com => COM,
       cout => BUS133,
       hour1 => BUS1067,
       hour2 => BUS1051,
       min1 => BUS1085,
       min2 => BUS1076,
       sec1 => BUS1103,
       sec2 => BUS1094,
       sel => BUS1058
  );

U3 : decorder4_8
  port map(
       A => BUS133,
       Y => SG
  );

U4 : cnt10
  port map(
       carry => NET990,
       clk => NET1665,
       en => START,
       q => BUS1103,
       reset => RESET
  );

U5 : cnt_6
  port map(
       carry => NET1003,
       clk => NET1665,
       en => NET990,
       q => BUS1094,
       reset => RESET
  );

U6 : cnt10
  port map(
       carry => NET1016,
       clk => NET1665,
       en => NET1003,
       q => BUS1085,
       reset => RESET
  );

U7 : cnt_6
  port map(
       carry => NET1029,
       clk => NET1665,
       en => NET1016,
       q => BUS1076,
       reset => RESET
  );

U8 : cnt10
  port map(
       carry => NET1042,
       clk => NET1665,
       en => NET1029,
       q => BUS1067,
       reset => RESET
  );

U9 : cnt_6
  port map(
       clk => NET1665,
       en => NET1042,
       q => BUS1051,
       reset => RESET
  );


end rtl;
