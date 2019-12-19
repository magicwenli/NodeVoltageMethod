## 线性电路频率响应特性的研究

###  实验内容

#### 内容

研究并设计编写适应**任意结构**的正弦稳态电路频率响应分析程序

- 计算各结点电压；

- 谐振电路:

  - 绘制以角频率ω为变量，绘制电路阻抗随频率变化的频响曲线。

    $Z_{eq}=-\frac{\dot{U}_s}{\dot{i}_m}=|Z_{eq}|\ang\phi$

  - 绘制电感电压为输出变量时，网络函数随频率变化的频响波特图。

    $\dot{H}_L=\frac{\dot{U}_L}{\dot{U}_S}=|H_{L}|\ang\phi$

  - 计算谐振点频率
  -  计算品质因数
  - 计算通带和阻带
  - 分析对比电路元件参数变化时，上述各项电路状态的变化 (分别增加电阻值、电感值、电容值)

- 滤波电路

  -  绘制电阻电压为输出变量时的网络函数频响波特图 
  - 判断滤波器类型(低通、高通、带通、带阻)
  - 分析对比电路元件参数变化时，上述各项电路状态的变化 (分别增加电阻值、电感值、电容值)

- 设计人机交互界面

### 实验方法

#### 设计思路

- 通过分析不同元件对结点电压的“贡献”及其在结点中的位置建立结点电压方程，并求解各结点电压；

- 利用公式确定变量，计算求解并画图

  $Z_{eq}=-\frac{\dot{U}_s}{\dot{i}_m}=|Z_{eq}|\ang\phi$

  $\dot{H}_L=\frac{\dot{U}_L}{\dot{U}_S}=|H_{L}|\ang\phi$

  $\omega_0=\frac{1}{\sqrt{LC}}$

  $Q \overset{def}{=} \frac{\omega_0L}{R}=\frac{1}{\omega_0CR}=\frac{1}{R}\sqrt{\frac{L}{C}}$

  $BW=\omega_{j2}-\omega_{j1}=\frac{\omega_0}{Q}$



#### 开发环境

- Matlab 2019a

  

### 实验结果及分析

- 在输入电路信息后，实现结点电压的求解

  

<img src="https://i.loli.net/2019/12/19/YQFaJrlMSDiLuEg.png" alt="截屏2019-12-1920.24.20.png" style="zoom: 50%;" />



- 在输入电路信息后，实现对幅频曲线、相频曲线、幅频波特图、相频波特图的绘制

- 计算谐振点频率、品质因数和通带。

  

<img src="https://i.loli.net/2019/12/19/ztoi2VW8DAmL1E5.png" alt="截屏2019-12-1920.24.35.png" style="zoom:50%;" />



<img src="https://i.loli.net/2019/12/19/RrLi7SnZsQCkuPo.png" alt="截屏2019-12-1920.24.35.png" style="zoom:50%;" />



<img src="https://i.loli.net/2019/12/19/mRgGyzZtvMXnCkO.png" alt="截屏2019-12-1920.24.35.png" style="zoom:50%;" />



<img src="https://i.loli.net/2019/12/19/bUn5wa6ouFYtHQS.png" alt="截屏2019-12-1920.24.35.png" style="zoom:50%;" />





#### 参考资料

- 邱关源,罗先觉.电路（第五版）.高等教育出版社:北京,2015


