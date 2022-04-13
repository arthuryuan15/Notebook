# java初步

Java编程思想

JAVA 2核心技术卷I：基础知识

JAVA 2核心技术卷II：高级特性

Effective Java中文版





## 1. 计算机语言的发展历史



## 2. java简史



## 3. java体系结构



## 4. java特点



## 5. java核心机制

### 5.1 跨平台原理（虚拟机）

【1】跨平台原理理解：

![image-20210326234923937](https://tva1.sinaimg.cn/large/008eGmZEly1goxqqrhacwj31q00t4h1o.jpg)

注意：==上面的字要烂熟于心==

1. Javac.exe 和 java.exe 在jdk中放着，jvm是在jre中放着
2. 需要安装 JDK：Java Development Kit 和 JRE： Java Runtime Environment 

【2】总结： 

 	1.Java运行过程 	 	

​		Java程序的运行分为两步：先编译再解释执行 	 	

​		通过“编译器”将Java源程序编译成Java 字节码文件（.class）(字节码文件采用结构中立的中间文件格式) 	 	

​		通过不同的“虚拟机”将Java字节码文件解释为对应机器语言并执行  	

![image_24316](https://tva1.sinaimg.cn/large/0081Kckwly1gmc435k3gaj30g205zq4b.jpg)



总结2：Java跨平台和C跨平台的区别 

​		Java：一次编译，到处运行     

​		C：多次编译，到处运行 

​		在互联网情况下 **平台各异，Java的跨平台(Cross-platform)更具有优势**

​		Java可以跨所有平台吗：要看有没有提供并安装相应的虚拟机 

​		Java的运行速度没有C语言快：Java需要将class文件解释成机器码再执行；C直接执行机器码  


 总结3：字节码文件 bytecode 

​		.class文件  二进制文件 

​		格式中立、平台无关的二进制文件 

​		是编译的产物，是解释的原料 


 总结4：Java虚拟机 JVM 	

​		JVM是Java Virtual Machine（Java虚拟机）的缩写 	

​		JVM是一种用于计算设备的规范，它是一个虚构出来的计算机，是通过在实际的计算机上仿真模拟各种计算机功能来实现的。 	

​		JVM就是一个虚拟的用于执行bytecodes字节码的计算机 	

​		Java虚拟机是Java最核心技术，也是跨平台的基础。 	

​		Java语言使用Java虚拟机屏蔽了与具体平台相关的信息，使得Java语言编译程序只需生成在Java虚拟机上运行的目标代码（字节码），就可以在多种平台上不加修改地运行。 	

​		Java虚拟机在执行字节码时，把字节码解释成具体平台上的机器指令执行。这就是Java的能够“一次编译，到处运行”的原因 	



##### 5.1.1 扩展：跨平台原理

**http://www.cnblogs.com/gw811/archive/2012/09/09/2677386.html** 

此篇博文主要源自网络博客：http://xiaozhen1900.blog.163.com/blog/static/1741732572011325111945246/** 

　　

### 5.2 垃圾回收机制

​       垃圾收集的目的在除不再使用的对象，当对象建立的时候垃圾收集期，就开始监控对象的动态情况，垃圾收集主要是对内存的释放。创建对象的时候申请一个空间 

1. 不再使用的内存空间应回收---》垃圾收集； 	
2. Java消除了程序员回收无用内存空间的职责；提供一种系统级线程跟踪存储空间的分配情况。在JVM的空闲时，检查并释放可被释放的存储器空间；相比c++,开发人员负责要自己收回无用内存。 	
3. 垃圾收集在Java程序运行过程中自动进行，程序员无法精确控制和干预； 	
4. GC（garbage collection）的自动回收，提高了内存空间的利用效率，也提高了编程人员的效率，很大程度上减少了因为没有释放空间而导致的内存泄露。  	 



![image-20220401074124258](https://tva1.sinaimg.cn/large/e6c9d24egy1h0ujy2atywj20iu0tzwhb.jpg)



GC原理：

![image-20210327003819829](https://tva1.sinaimg.cn/large/008eGmZEly1goxs5jgsjwj30cz1797vs.jpg)

## 6. 常见dos命令



## 7. java环境准备--JDK



## 8. 第一个HelloWord

