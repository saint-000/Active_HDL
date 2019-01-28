 
 数字钟是典型的电子电路的应用,而基于FPGA的数字钟电路具有更大的灵活性和通用性。本文介绍了基于FPGA开发板的数字钟设计的基本构想，所提供的功能，基本的模块和控制逻辑。本时钟系统主芯片采用xc3s200 PQ208-4c，具有显示时间及计数功能。
 
 时间采用24小时循环计数，通过按键控制数字钟的开启和关闭。

关键词：FPGA;模块；循环计数。

1引言 

VHDL结合FPGA可以方便地，可重复利用地实现各种设计，本文主要基于之前的设计原理，设计数字钟功能所需要的模块和功能逻辑，并在FPGA（开发板；Spartan-3系列xc3s200 ）中实现。

2 设计概述
设计一个数字时钟，具有时分、秒计数显示。鉴于所提供的功能，电路应当包括以下三大模块：控制模块，分频模块，计时模块和显示模块。

3 设计原理

3.1各模块介绍
控制模块包括了开和关两个按键，start端定义管脚约束为P113-S18；

reset端定义管脚约束为P111-S17
![image](https://github.com/saint-000/Active_HDL/blob/master/digital%20clock%20display/image/a.PNG)


分频模块主要是给需要的模块提供特定频率的时钟信号；

在实验中将时钟分为两个频率	

bclk1<=count(24);--用于计时

bclk2<=count(14);--用于扫描数码管

![image](https://github.com/saint-000/Active_HDL/blob/master/digital%20clock%20display/image/b.PNG)


模块代码如下：
<pre>
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;
entity div_freq is
	port(
		clk,clr : in STD_LOGIC;
		bclk1,bclk2 : out STD_LOGIC
		);
end div_freq;

--}} End of automatically maintained section
architecture behav of div_freq is
	signal count:std_logic_vector(24 downto 0):="0000000000000000000000000";
	signal q : std_logic:='0';
begin
	process(clk,clr)
	begin
		if (clr='0') then 
			count<="0000000000000000000000000";
		elsif(clk'event and clk='1') then	  --上升沿来临时
			if (count="1111111111111111111111111")then 
				count<="0000000000000000000000000";
			else 
				count<=count+1;
			end if;
		end if;
	end process;
	bclk1<=count(24);--用于计时
	bclk2<=count(14);--用于扫描数码管
	
	
	-- enter your statements here --	
end behav;
</pre>

计时模块包括了秒、分、时计数模块，通过不同数位的计数器实现，并提供给显示模块显示输出；
![image](https://github.com/saint-000/Active_HDL/blob/master/digital%20clock%20display/image/c.PNG)
代码如下：

U4:秒的个位
<pre>
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;
entity cnt10 is
	 port(
		 reset : in STD_LOGIC;
		 en : in STD_LOGIC;
		 clk : in STD_LOGIC;
		 carry : out STD_LOGIC;
		 q : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end cnt10;
--}} End of automatically maintained section
architecture rtl of cnt10 is
signal qs:std_logic_vector(3 downto 0):="0000";
signal ca:std_logic:='0';
begin
	process (clk)
	begin 
		if (rising_edge(clk)) then 
			if (reset='1')then 
				qs<="0000";
			elsif (en='1') then 
				if (qs="1001")then 		   --计数到9，共有10个时钟上升沿
					qs<="0000";
					ca<='0';
			
				else 
					qs<=qs+1;
					ca<='0';
				end if ;
			end if ;
		end if ;
	q<=qs;
	end process;
	process (ca)
	begin 	
		carry<=ca and en ;
	end process ;
	 -- enter your statements here --
end rtl;
</pre>

U5：秒的十位
实体大致一样的，此处不再列举
<pre>
	process (clk)
	begin 
		if (rising_edge(clk)) then 
			if (reset='1')then 
				qs<="0000";
			elsif (en='1') then 
				if (qs="0110")then 		--计数到6，清零，不产生进位
					qs<="0000";
					ca<='0';
				
				else 
					qs<=qs+1;
					ca<='0';
				end if ;
			end if ;
		end if ;
	q<=qs;
	end process;
	process(ca,en)
	begin 
		carry<= ca and en ;
	end process;
end rtl;
</pre>
U6，U8都为十位计数器，U7,U9都为6位计数器；此处不再一一列举

扫描按键显示：
代码如下：
<pre>
library IEEE;  
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_ARITH.ALL;  
use IEEE.STD_LOGIC_UNSIGNED.ALL; 
ENTITY KEYSCAN IS 
	PORT (  
		clk : IN std_logic; 
		rst : IN std_logic;
		en : out std_logic;
		row : OUT std_logic_vector(3 DOWNTO 0); -- 行线 
		column  : IN std_logic_vector(3 DOWNTO 0);  -- 列线
		dataout : OUT std_logic_vector(7 DOWNTO 0)--数码管显示数据 
		);	
END KEYSCAN;  
ARCHITECTURE arch OF KEYSCAN IS 
	SIGNAL div_cnt : std_logic_vector(24 downto 0):="0000000000000000000000000";  
	SIGNAL scan_key : std_logic_vector(3 DOWNTO 0):="0000"; --扫描码寄存器
	SIGNAL key_code : std_logic_vector(3 DOWNTO 0):="0000"; 
	SIGNAL dataout_tmp  : std_logic_vector(7 DOWNTO 0):="00000000";
BEGIN  
	PROCESS(clk,rst) 
	BEGIN  
		IF (NOT rst = '1') THEN  
			div_cnt <= "0000000000000000000000000"; 
		ELSIF(clk'EVENT AND clk = '1')THEN 
			div_cnt <= div_cnt + 1; 
		END IF; 
	END PROCESS;  
	PROCESS(div_cnt(20 downto 19)) 
	BEGIN  
		CASE div_cnt(20 downto 19) IS 
			WHEN "00"=> scan_key<="1110"; 
			WHEN "01"=> scan_key<="1101"; 
			WHEN "10"=> scan_key<="1011";
			WHEN "11"=> scan_key<="0111";
			WHEN OTHERS=>NULL;
		END CASE; 
	END PROCESS;
	PROCESS(clk,rst)
	BEGIN
		IF (NOT rst = '1') THEN
			key_code <= "0000";
		elsif(rising_edge(clk))then
			CASE scan_key IS  --检测何处有键按下
				when"1110"=>
					case column is
						when "1110"=> key_code <="0000";
						when "1101"=> key_code <="0001";
						when "1011"=> key_code <="0010";
						when "0111"=> key_code <="0011";
						when others=>null;
				end case;
				when "1101"=>
					case column is
						when "1110"=> key_code <="0100"; 
						when "1101"=> key_code <="0101";
						when "1011"=> key_code <="0110";
						when "0111"=> key_code <="0111";
						when others=>null; 
				end case;
				when "1011"=>
					case column is
						when "1110"=> key_code <="1000"; 
						when "1101"=> key_code <="1001";
						when "1011"=> key_code <="1010";
						when "0111"=> key_code <="1011";
						when others=>null; 
				end case;
				when "0111"=>
					case column is
						when "1110"=> key_code <="1100"; 
						when "1101"=> key_code <="1101";
						when "1011"=> key_code <="1110";
						when "0111"=> key_code <="1111";
						when others=>null; 
				end case;
				when others => key_code <="1111";
			end case;
		end if;	
	end process;
	process(key_code)--显示键值
	begin 
		case key_code is 
			when "0000"=> dataout_tmp <="11000000";
			when "0001"=> dataout_tmp <="11111001";
			when "0010"=> dataout_tmp <="10100100";
			when "0011"=> dataout_tmp <="10110000";
			when "0100"=> dataout_tmp <="10011001";
			when "0101"=> dataout_tmp <="10010010";
			when "0110"=> dataout_tmp <="10000010";
			when "0111"=> dataout_tmp <="11111000";
			when "1000"=> dataout_tmp <="10000000";
			when "1001"=> dataout_tmp <="10010000";
			when "1010"=> dataout_tmp <="10001000";
			when "1011"=> dataout_tmp <="10000011";
			when "1100"=> dataout_tmp <="11000110";
			when "1101"=> dataout_tmp <="10100001";
			when "1110"=> dataout_tmp <="10000110";
			when "1111"=> dataout_tmp <="10001110";
			when others=> null;
		end case;
	end process;
	row <= scan_key;  
	dataout <= dataout_tmp;
	en <='1';
end arch; 
 </pre>


![image](https://github.com/saint-000/Active_HDL/blob/master/digital%20clock%20display/image/d.PNG)






显示模块包括数码管的位选和段选，通过数据选择器实现位选。
位选代码如下：
<pre>

library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_unsigned.all;
use IEEE.STD_LOGIC_arith.all;

entity \select\ is
	 port(
		 sec1 :  in STD_LOGIC_VECTOR(3 downto 0);
		 sec2 :  in STD_LOGIC_VECTOR(3 downto 0);
		 min1 :  in STD_LOGIC_VECTOR(3 downto 0);
		 min2 :  in STD_LOGIC_VECTOR(3 downto 0);
		 hour1 : in STD_LOGIC_VECTOR(3 downto 0);
		 hour2 : in STD_LOGIC_VECTOR(3 downto 0);
		 sel  :  in STD_LOGIC_VECTOR(3 downto 0);
		 cout : out STD_LOGIC_VECTOR(3 downto 0);
		 com  : out STD_LOGIC_VECTOR(5 downto 0)
	     );
end \select\;
--}} End of automatically maintained section
architecture rtl of \select\ is
begin
	process(sel)
	begin
		case sel is 
			when "0000"=>cout<=sec1;com<="000001";--选中最低位的数码管有效
			when "0001"=>cout<=sec2;com<="000010";
			when "0010"=>cout<=min1;com<="000100";
			when "0011"=>cout<=min2;com<="001000";
			when "0100"=>cout<=hour1;com<="010000";
			when "0101"=>cout<=hour2;com<="100000";
			when others=>null;
		end case ;
	end process;
	 -- enter your statements here --

end rtl;
</pre>
![image](https://github.com/saint-000/Active_HDL/blob/master/digital%20clock%20display/image/e.PNG)
段选代码如下：
<pre>
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;
entity decorder4_8 is
	port(
		A : in STD_LOGIC_VECTOR(3 downto 0);
		
		Y : out STD_LOGIC_VECTOR(7 downto 0)
		);
end decorder4_8;

--}} End of automatically maintained section
architecture rtl of decorder4_8 is
begin
	process(A)
	begin
		case(A) is						   --hp,g,f,e,d,c,b,a，“1”有效
			when "0000"=>Y<="00111111";	   --显示数字0
			when "0001"=>Y<="00000110";	   --显示数字1
			when "0010"=>Y<="01011011";	   --显示数字2
			when "0011"=>Y<="01001111";	   --显示数字3
			when "0100"=>Y<="01100110";	   --显示数字4
			when "0101"=>Y<="01101101";	   --显示数字5
			when "0110"=>Y<="01111101";	   --显示数字6
			when "0111"=>Y<="00000111";	   --显示数字7
			when "1000"=>Y<="01111111";	   --显示数字8
			when "1001"=>Y<="01101111";	   --显示数字9
			when others=>Y<="10000000";
		end case;
	end process;	
	-- enter your statements here --	
end rtl;
</pre>

3.2系统方案
![image](https://github.com/saint-000/Active_HDL/blob/master/digital%20clock%20display/image/f.PNG)
采用同步电路，总线结构，主要功能集中在模块内部，模块较为独立，模块间连接简单，易于扩展，本次设计采用此方案

3.3时钟系统整体介绍

由分频器从33.8688MHZ晶振中得到1HZ信号给计数器提供标准时钟，用于计时，针对时，分，秒分别设计一组6位和十位计数器对应具体的十位和个位，记满进位。在通过数据选择器对扫描数码管位选，此处用的是bclk2，即分频器分出的另一时钟信号，用来扫描数码管，显示是要考虑段选显示，用四八译码器实现。最后输出至SG段选和COM位选。

![image](https://github.com/saint-000/Active_HDL/blob/master/digital%20clock%20display/image/g.PNG)
3.4顶层代码：
<pre>
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;
entity add_all is
	port(
		CLK : in STD_LOGIC;
		RESET : in STD_LOGIC;
		START : in STD_LOGIC;
		SG : out STD_LOGIC_VECTOR(7 downto 0):="00000000";
		COM : out STD_LOGIC_VECTOR(5 downto 0):="000000" 		
		);
end add_all;
--}} End of automatically maintained section
architecture rtl of add_all is
	component div_freq
		port (clk:in std_logic;
			bclk: out std_logic );
	end component ;
	component cnt10
		port (
			reset : in STD_LOGIC;
			en : in STD_LOGIC;
			clk : in STD_LOGIC;
			carry : out STD_LOGIC;
			q : out STD_LOGIC_VECTOR(3 downto 0)
			);
	end component ;
	component cnt_6
		port (
			clk : in STD_LOGIC;
			en : in STD_LOGIC;
			reset : in STD_LOGIC;
			carry : out STD_LOGIC;
			q : out STD_LOGIC_VECTOR(3 downto 0)
			);
	end component ;
	component decorder4_8
		port (
			A : in STD_LOGIC_VECTOR(3 downto 0);
			Y : out STD_LOGIC_VECTOR(7 downto 0)
			);
	end component ;	
	signal clk_temp:std_logic ;
	signal en1,en2,en3,en4,en5,en6:std_logic ;
	signal q1,q2,q3,q4,q5,q6:std_logic_vector(3 downto 0) ;
	signal qs:std_logic_vector(3 downto 0):="0000";
begin				   	
	u1:div_freq 
	port map (clk=>CLK,bclk=>clk_temp);
	process(clk_temp,qs) 
	begin 
		if (rising_edge(clk_temp)) then	
			if qs="0101" then 	 --计数到5，有6个时钟上升沿。对div_2k再进行6分频
				qs<="0000";
			else
				qs<=qs+1;
			end if ;
		end if ;
		case qs is 
			when "0000"=>COM<="000001";	--com端最低位为高电平，选通此位数码管
			when "0001"=>COM<="000010";
			when "0010"=>COM<="000100";
			when "0011"=>COM<="001000";
			when "0100"=>COM<="010000";
			when "0101"=>COM<="100000";
			when others => null ;
		end case ;	
	end process ;
	c1:cnt10
	port map (reset=>RESET,en=>START,clk=>clk_temp,	 --最低位
		carry=>en1,q=>q1); 
	c2:cnt10
	port map (reset=>RESET,en=>en1,clk=>clk_temp,	 --秒
		carry=>en2,q=>q2);
	c3:cnt10
	port map (reset=>RESET,en=>en2,clk=>clk_temp,	 --分，个位
		carry=>en3,q=>q3);
	c4:cnt_6
	port map (reset=>RESET,en=>en3,clk=>clk_temp,	 --分，十位
		carry=>en4,q=>q4);
	c5:cnt10
	port map (reset=>RESET,en=>en4,clk=>clk_temp,	 --时，个位
		carry=>en5,q=>q5);
	c6:cnt_6
	port map (reset=>RESET,en=>en5,clk=>clk_temp,	 --时，十位
		carry=>en6,q=>q6);
	d1:decorder4_8
	port map (A=>q1,Y=>SG);							 --将计数器产生的四位二进制数传到译码器译码输出
	d2:decorder4_8
	port map (A=>q2,Y=>SG);
	d3:decorder4_8
	port map (A=>q3,Y=>SG);
	d4:decorder4_8
	port map (A=>q4,Y=>SG);
	d5:decorder4_8
	port map (A=>q5,Y=>SG);
	d6:decorder4_8
	port map (A=>q6,Y=>SG);
	
end rtl;
</pre>
3.5	管脚约束
![image](https://github.com/saint-000/Active_HDL/blob/master/digital%20clock%20display/image/h.PNG)

3.6代表性波形仿真

正常计数时，当秒计数器计数到59时，再来一个时钟脉冲，则秒计数器清零，而进位则作为分计数器的计数脉冲，使时计数器加一。（00:00:59=>00:01:00）
 ![image](https://github.com/saint-000/Active_HDL/blob/master/digital%20clock%20display/image/i.PNG) 

当分计数器计数到59时，再来一个时钟脉冲，则分计数器清零，而进位则作为时计数器的计数脉冲，使时计数器加一。（00:59:59=>01:00:00）
![image](https://github.com/saint-000/Active_HDL/blob/master/digital%20clock%20display/image/j.PNG)

3.7实验截图：
![image](https://github.com/saint-000/Active_HDL/blob/master/digital%20clock%20display/image/k.PNG)

4 总结

4.1实验改进：
在实验中，发现忽略了时计数模块是二十四进制的，所以对实验的改进如下：

时钟时计数子模块：

时计数子模块是由一个24进制计数器组成，正常计数时，当时计数器计数到23时，再来一个脉冲，则时计数器清零，重新开始新一轮的计数。

时的计时电路可以用如下方式实现：

代码如下：
<pre>
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;
entity clock24 is
	 port(
		 clk : in STD_LOGIC;  --时钟
		 en : in STD_LOGIC;	  --使能端
		 reset : in STD_LOGIC; --复位
		 load : in STD_LOGIC;  --置数
		 d : in STD_LOGIC;	--输入端
		 carry : out STD_LOGIC;	--进位
		QH: BUFFER STD LOGIC VECTOR(3 DOWNTO 0);
 		QL: BUFFER STD LOGIC VECTOR(3 DOWNTO 0)
	     );
end  clock24;
--}} End of automatically maintained section
architecture rtl of clock24 is
	process (clk，reset)
	begin  
		if（reset='0'）then
			QH<="0000";
			QL<="0000";		   --异步复位
		elsif (rising_edge(clk)) then 
			if (load='1')then 
			QH<=D(7DOWNTO 4);
			QL<=D(3DOWNTO 0);	
		elsif（en='1'）then
		if(QL=9 or (QH=2 and QL=3))then
			QL<=0000;
			if(QH=2)then
			   QH<="0000";
			else
				QH<=QH+1;
			end if
			else
				QL<=QL+1;
		end if;
		end if;
			
	end process;	
end rtl;
</pre>
