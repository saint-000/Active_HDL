Active-HDL是围绕共同核心的HDL模拟器所构建的FPGA开发环境。支持基于文本和图形设计输入和调试工具，允许混合语言仿真（VHDL/ Verilog/ EDIF/ SystemC/ SystemVerilog），并提供统一的接口以及各种合成和实施工具。

我们通过对选择器，加法器，三八译码器，优先编码器，计数器，分频器上述六种设计录入和调试得到输出波形图。

通过在Active-HDL上编写代码，熟悉Active-HDL的代码录入方式，温习并掌握VHDL源程序的语法结构，在通过对不同功能模块的设计过程中，了解每种设计它所需要的输入激励，输入波形需要加的恰当适宜，这样可以方便我们在示波器上观察输出波形是否正确。

状态机由状态寄存器和组合逻辑电路构成，能够根据控制信号按照预先设定的状态进行状态转移，是协调相关信号动作、完成特定操作的控制中心。状态机分为三大类型：

1. Moore状态机：次态=f(现状)，输出=f(现状)，即输出信号是直接由状态寄存器译码得到 

2．Mealy状态机：次态=f(现状，输入)，输出=f(现状，输入)，即以现时的输入信号结合即将变成次态的现状编码成信号输出。 

3．混合型状态机 

在实验中经常会涉及到状态的改变，有时候任何状态之间都可以互相切换，如果直接用常规的编写方式对于一些没有规律的或则极其复杂的设计而言效率是非常低的。我们通过三段式的状态机代码的编写，体会该框架的综合性，熟悉了相应的编码方式后可以将其用来带入其他模块代码的编写。

ISE的全称为Integrated Software Environment，即“集成软件环境”，是Xilinx公司的硬件设计工具。 ISE将先进的技术与灵活性、易使用性的图形界面结合在一起，方便用户更加快捷的硬件设计。

在本次实验中，对之前在ACTIVE-VHDL中编译好的选择器，加法器，三八译码器，优先编码器，计数器，分频器等导入到ISE中，进行模块综合，定义用户约束，然后完成设计实现，最后连接到FPGA下载配置比特流文件。

部分过程截图：

组合逻辑器件设计部分过程截图：

![image](https://github.com/saint-000/Active_HDL/blob/master/The%20Design%20of%20the%20VHDL%20Basic%20Device/image/10.png)

![image](https://github.com/saint-000/Active_HDL/blob/master/The%20Design%20of%20the%20VHDL%20Basic%20Device/image/11.png)

![image](https://github.com/saint-000/Active_HDL/blob/master/The%20Design%20of%20the%20VHDL%20Basic%20Device/image/12.png)

![image](https://github.com/saint-000/Active_HDL/blob/master/The%20Design%20of%20the%20VHDL%20Basic%20Device/image/13.png)

![image](https://github.com/saint-000/Active_HDL/blob/master/The%20Design%20of%20the%20VHDL%20Basic%20Device/image/14.png)

![image](https://github.com/saint-000/Active_HDL/blob/master/The%20Design%20of%20the%20VHDL%20Basic%20Device/image/15.png)

![image](https://github.com/saint-000/Active_HDL/blob/master/The%20Design%20of%20the%20VHDL%20Basic%20Device/image/16.png)

![image](https://github.com/saint-000/Active_HDL/blob/master/The%20Design%20of%20the%20VHDL%20Basic%20Device/image/17.png)

状态机设计部分过程截图：

![image](https://github.com/saint-000/Active_HDL/blob/master/The%20Design%20of%20the%20VHDL%20Basic%20Device/image/18.png)

![image](https://github.com/saint-000/Active_HDL/blob/master/The%20Design%20of%20the%20VHDL%20Basic%20Device/image/19.png)

FPGA集成开发软件工具ISE的应用过程部分截图：

![image](https://github.com/saint-000/Active_HDL/blob/master/The%20Design%20of%20the%20VHDL%20Basic%20Device/image/20.png)

![image](https://github.com/saint-000/Active_HDL/blob/master/The%20Design%20of%20the%20VHDL%20Basic%20Device/image/21.png)

![image](https://github.com/saint-000/Active_HDL/blob/master/The%20Design%20of%20the%20VHDL%20Basic%20Device/image/22.png)

![image](https://github.com/saint-000/Active_HDL/blob/master/The%20Design%20of%20the%20VHDL%20Basic%20Device/image/23.png)

![image](https://github.com/saint-000/Active_HDL/blob/master/The%20Design%20of%20the%20VHDL%20Basic%20Device/image/24.png)

![image](https://github.com/saint-000/Active_HDL/blob/master/The%20Design%20of%20the%20VHDL%20Basic%20Device/image/25.png)

![image](https://github.com/saint-000/Active_HDL/blob/master/The%20Design%20of%20the%20VHDL%20Basic%20Device/image/26.png)


