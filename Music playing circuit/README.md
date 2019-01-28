1.乐曲机理：

送别：简谱

![image](https://github.com/saint-000/Active_HDL/blob/master/Music%20playing%20circuit/image/1.png)


See you again：乐谱

![image](https://github.com/saint-000/Active_HDL/blob/master/Music%20playing%20circuit/image/2.png)


![image](https://github.com/saint-000/Active_HDL/blob/master/Music%20playing%20circuit/image/3.png)


基频：f0=2MHZ 分频系数：N=f0/f  计数器初值=4095-N



2.系统框图：


![image](https://github.com/saint-000/Active_HDL/blob/master/Music%20playing%20circuit/image/4.png)


目的：

1.学习VHDL基本单元电路的设计应用，进一步掌握EDA的多层次设计方法。

2.学习利用分频器设计硬件乐曲演奏电路。

3.利用可编程逻辑器件FPGA，设计乐曲硬件电路，可自动演奏乐曲。

4.理解其工作原理、设计思路及实现方法。

内容：


1.学习设计实际功能对应的模块电路，并仿真调试。


2.完成硬件乐曲演奏电路的框架设计及各模块之间时钟信号的规划，实现一套完整的具有播放乐曲功能的电路系统。


3.熟悉调试方法和对应FPGA上调试相应功能的技巧。

步骤：

1、组成乐曲的每个音符的发音频率值及其持续的时间是乐曲能演奏所需的两个基本要素：

（1）音符的频率可以由预置分频器获得，分频器的输出频率将决定每一个音符的音调。

（2）音符的持续时间需根据乐曲的速度和每个音符的节拍数来确定，模块num_control （可预置数数控分频器）的功能首先为clk_div（预分频器）提供决定所发音符的分频预置数，而此数在num_control 输入口停留时间即为此音符的节拍值，每一音符的停留时间由音乐节拍和乐曲发生器模块的clk的输入频率决定。

2、管脚约束：

![image](https://github.com/saint-000/Active_HDL/blob/master/Music%20playing%20circuit/image/5.png)

实验数据及结果分析：

特别模块仿真分析

pre_num模块波形仿真结果如下： 

![image](https://github.com/saint-000/Active_HDL/blob/master/Music%20playing%20circuit/image/6.png)


实验截图：

![image](https://github.com/saint-000/Active_HDL/blob/master/Music%20playing%20circuit/image/7.png)

![image](https://github.com/saint-000/Active_HDL/blob/master/Music%20playing%20circuit/image/8.png)

![image](https://github.com/saint-000/Active_HDL/blob/master/Music%20playing%20circuit/image/9.png)






