# 异常



## 1. 引入try-catch

【1】完成求商功能：

```java
public class Test {
    public static void main(String[] args) {
        //功能：键盘录入两个数，求商。
        //拿来一个扫描器：
        Scanner sc=new Scanner(System.in);
        System.out.print("请从键盘录入第一个数：");
        int num1=sc.nextInt();
        System.out.print("请从键盘录入第二个数：");
        int num2=sc.nextInt();
        //求商：
        System.out.println("商为："+num1/num2);
    }
}
```


【2】测试：

```
请从键盘录入第一个数：a
Exception in thread "main" java.util.InputMismatchException // 程序出现的异常类型：输出不匹配异常
	at java.base/java.util.Scanner.throwFor(Scanner.java:939)
	at java.base/java.util.Scanner.next(Scanner.java:1594)
	at java.base/java.util.Scanner.nextInt(Scanner.java:2258)
	at java.base/java.util.Scanner.nextInt(Scanner.java:2212)
	at com.sxt.test01.Test.main(Test.java:11) // 出错的位置和行数

Process finished with exit code 1
```



```
请从键盘录入第一个数：12
请从键盘录入第二个数：0
Exception in thread "main" java.lang.ArithmeticException: / by zero
	at com.sxt.test01.Test.main(Test.java:16)

Process finished with exit code 1
```

​		在测试过程中，发现程序很可能出现问题。 

​		在正常的程序中出现不正常的现象---》异常。 

【3】将程序的漏洞都堵上：处理异常：if_else形式

```java
public class Test {
    public static void main(String[] args) {
        //功能：键盘录入两个数，求商。
        //拿来一个扫描器：
        Scanner sc=new Scanner(System.in);
        System.out.print("请从键盘录入第一个数：");
        if(sc.hasNextInt()){//判断第一个数是否是int类型数据
            int num1=sc.nextInt();
            System.out.print("请从键盘录入第二个数：");
            if(sc.hasNextInt()){//判断第二个数是否是int类型数据
                int num2=sc.nextInt();
                if(num2==0){//如果第二个数为0，那么进行提示：
                    System.out.println("除数不能为0！");
                }else{
                    //求商：
                    System.out.println("商为："+num1/num2);
                }
            }else{
                System.out.println("请录入一个整数！");
            }
        }else{
            System.out.println("请录入一个整数！");
        }
    }
}
```

​		上面用if-else堵漏洞，有什么缺点吗？ 

​	（1）代码臃肿。 

​	（2）即使我加了很多if-else进去，很可能出现一种情况就是有的漏洞没堵上。 

【4】基于上面的缺点，java给我们提供了一种处理异常的机制： 

​		"异常三连"try-catch-finally 

【5】try-catch： 

​			在上面的异常中，控制台上的异常怎么看： 

​		（1）看第一行：异常的类型。 

​		（2）看最后一行：异常出现的位置  

上面的代码出现了几种异常： 

（1）[Exception in thread "main" java.lang.ArithmeticException: / by zero](Exception in thread 'main' java.lang.ArithmeticException: / by zero)  除数不能

（2）[Exception in thread "main" java.util.InputMismatchException](Exception in thread 'main' java.util.InputMismatchException) 


捕获：处理：try-catch： 

```java
public class Test2 {
    public static void main(String[] args) {
        System.out.println("------开始使用计算器：-------");
        try{
            //功能：键盘录入两个数，求商。
            //拿来一个扫描器：
            Scanner sc=new Scanner(System.in);
            System.out.print("请从键盘录入第一个数：");
            int num1=sc.nextInt();
            System.out.print("请从键盘录入第二个数：");
            int num2=sc.nextInt();
            //求商：
            System.out.println("商为："+num1/num2);
        }catch(Exception ex){ // Exception ex = 异常的对象 --》多态，父类接子类；try中代码的异常用Exception接
            System.out.println("你的程序有错啊！");
        }
        System.out.println("---谢谢你使用计算器---");
    }
}
```

可能出现情况： 

​	（1）我的代码没有异常：那么只走try中代码，然后不走catch，程序继续往下走。 

​	（2）我的代码有异常： 

​				a.假如你的异常对象 catch后面()中的类型可以匹配，异常进行捕获，执行catch后面{}中的代码 

​				b.假如你的异常对象 catch后面()中的类型不匹配，异常不可以进行捕获，直接抛出异常，程序中断，之后的代码也不会再执行了 



## 2. catch中如何处理异常

```java
public class Test2 {
    public static void main(String[] args) {
        System.out.println("------开始使用计算器：-------");
        try{
            Scanner sc=new Scanner(System.in);
            System.out.print("请从键盘录入第一个数：");
            int num1=sc.nextInt();
            System.out.print("请从键盘录入第二个数：");
            int num2=sc.nextInt();
            //求商：
            System.out.println("商为："+num1/num2);
        }catch(Exception ex){
          
            //第一种：什么都不写。
          
            //第二种：自定义异常信息：
            //System.out.println("你的代码有问题！");
          
            //第三种：打印
            //System.out.println(ex);//java.util.InputMismatchException 证明Exception中重写了toString方法。 如果打印出来，没有显示@的符号，说明已经重写toString
            //System.out.println(ex.toString());
            //System.out.println(ex.getMessage());打印":"后面的异常信息
            //ex.printStackTrace();//异常的堆栈信息全部进行打印，底层多线程
          
            //第四种：
            //throw ex;将信息抛给调用者，在当前这个题里，调用者为虚拟机，那么就将处理异常的方式抛给
            //虚拟机了，虚拟机做了：（1）将异常堆栈信息进行打印 （2）中断程序
          
        }
        System.out.println("---谢谢你使用计算器---");
    }
}
```



## 3. try-catch-finally

```java

/*
	1.System.out.println("---谢谢你使用计算器---");在什么情况下不执行：
		(1)throw ex;
		(2)catch没有进行正常的异常捕获
		(3)遇到return
	2.怎么才能让System.out.println("---谢谢你使用计算器---");无论如何都执行：
		finally
	3.一般什么代码放入finally中：
		关闭数据库资源，关闭IO流资源，关闭socket资源。
	4.只有一种情况会让finally中的代码不执行：
		System.exit(1);// 终止当前正在运行的 Java 虚拟机。
	5.return和finally是否冲突？不冲突：
		执行顺序先finally再走return
 */

public class Test3 {
    public static void main(String[] args) {
        System.out.println("------开始使用计算器：-------");
        try{
            Scanner sc=new Scanner(System.in);
            System.out.print("请从键盘录入第一个数：");
            int num1=sc.nextInt();
            System.out.print("请从键盘录入第二个数：");
            int num2=sc.nextInt();
            //求商：
            System.out.println("商为："+num1/num2);
            //加上return
            return;
            //System.exit(0);// 终止当前正在运行的 Java 虚拟机。
        }catch(ArithmeticException ex){
            System.out.println("你的代码有问题！");
        }finally {
            System.out.println("---谢谢你使用计算器---");
        }
    }
}
```

​		

finally一定会在return之前执行，而且如果finally使用了return或者throw语句，将会使trycatch中的return或者throw失效。



## 4. 多重catch

```java
/*
多重catch：多个catch依次匹配执行，Exception接收放在最后，一般都是先子类，再父类。
 */
public class Test3 {
    public static void main(String[] args) {
        System.out.println("------开始使用计算器：-------");
        try{
            Scanner sc=new Scanner(System.in);
            System.out.print("请从键盘录入第一个数：");
            int num1=sc.nextInt();
            System.out.print("请从键盘录入第二个数：");
            int num2=sc.nextInt();
            //求商：
            System.out.println("商为："+num1/num2);
        
        /*在这里开始修改*/
          
        }catch(ArithmeticException ex){
            System.out.println("除数不能为0！");
        }catch(InputMismatchException ex){
            System.out.println("输入的类型不是整数类型！");
        }catch(Exception ex){
            System.out.println("代码出现问题！");
          
        /*在这里结束修改*/
          
        }finally {
            System.out.println("---谢谢你使用计算器---");
        }
    }
}
```

​		一个 try 块可能有多个 catch 块。若如此，则执行第一个匹配块。即Java虚拟机会把实际抛出的异常对象依次和各个catch代码块声明的异常类型匹配，如果异常对象为某个异常类型或 其子类的实例，就执行这个catch代码块，不会再执行其他的 catch代码块。

## 5. 异常的分类

![Screen Shot 2019-10-01 at 11.56.34 AM](/Users/yuanjinshuai/Library/Mobile Documents/com~apple~CloudDocs/java/pic/Screen Shot 2019-10-01 at 11.56.34 AM.png)

```java
public class Test {
    public static void main(String[] args) throws ClassNotFoundException, IllegalAccessException, InstantiationException {
            
       	//运行时异常：
        
      	//int[] arr={1,2,3};
        //System.out.println(arr[3]);//运行时异常：ArrayIndexOutOfBoundsException

      	//int num=10/0; //运行时异常: 除数异常
      
        //String s=null;/运行时异常:空指针异常
        //String newStr=s.toUpperCase();
        //System.out.println(newStr);
      
        //检查时异常：防患于未然，在我编写代码的时候直接就让我处理异常。
      
        //第一种处理方式：利用try-catch进行捕获。
        /*try {
            Class.forName("com.bjsxt.test01.Test").newInstance();
            
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        }*/
      
        //第二种处理方式：在方法的声明处将异常类型添加上 public static void main(String[] args) throws ClassNotFoundException, 意味着别人在调用这个方法的时候：
        //告诉别人这个方法中可能会出现哪种错误。
        Class.forName("com.bjsxt.test01.Test").newInstance();
        //快捷键：alt+enter
    }
}
```





## 6. thow和throws区别

```java
import java.util.Scanner;

/*
throw跟throws区别：
（1）位置不同：
		throw：方法内部
		throws:方法的声明之后
（2）内容不同：
		throw+异常对象 throw new RuntimeException("除数不能为0");
		throws+异常的类型 public static void devide() throws Exception 		{}
（3）作用不同
		throw：异常出现的源头
		throws:在方法的声明处，告诉方法的调用者 这个方法中可能出现某种异常，那么谁调用谁处理。
 */

public class Test2 {
  
    //功能：两个数相除，当除数为0的时候 让程序出现异常。
    public static void main(String[] args)  {
        try {
            a();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void a() throws Exception {
            devide();
    }
    public static void devide() throws Exception {
        Scanner sc=new Scanner(System.in);
        System.out.print("请从键盘录入第一个数：");
        int num1=sc.nextInt();
        System.out.print("请从键盘录入第二个数：");
        int num2=sc.nextInt();
        if(num2==0){//除数为0
          
            //制造异常：
          
            //制造运行时异常：
            //throw new RuntimeException("除数不能为0");
          
            //制造检查时异常：
            throw new Exception("除数不能为0");
          
        }else{//不等于0 就输出商：
            System.out.println("商为："+num1/num2);
        }
    }
}
```





## 7. 重载和重写的异常处理

【1】重载跟异常无关：

```java
//重载:跟异常无关
public class Test {
    public void a(int age) throws Exception{
    }
    public void a(String name) throws Exception{
    }
}
```

【2】重写跟异常：

```java
//重写：子类异常类型<=父类异常类型
public class Person {
    public void eat() throws Exception{
        System.out.println("----1");
    }
}
class Student extends  Person{
    public void eat() throws RuntimeException{
        System.out.println("------2");
    }
}
```



## 8. 自定义异常

 【1】自定义异常继承自Exception：

```java
public class MyException extends Exception {
    public MyException() {
    }
    public MyException(String message) {
        super(message);
    }
}
```

```java
public class Student {
    private String name;
    private int age;
    private String sex;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getAge() {
        return age;
    }
    public void setAge(int age) {
        this.age = age;
    }
    public String getSex() {
        return sex;
    }
    public void setSex(String sex) throws MyException {
        if("男".equals(sex)||"女".equals(sex)){
            this.sex = sex;
        }else{
            throw new MyException("性别错误！！！");
        }
    }
    public Student() {
    }
    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", sex='" + sex + '\'' +
                '}';
    }
    public static void main(String[] args) {
        Student s=new Student();
        s.setAge(19);
        s.setName("lili");
        try {
            s.setSex("lkjhlkjhlkj");
        } catch (MyException e) {
            e.printStackTrace();
        }
    }
}
```

【2】自定义异常继承RunTimeException:

```java
public class MyException extends RuntimeException{
    public MyException() {
    }
    public MyException(String message) {
        super(message);
        System.out.println("出现异常");
    }
}
```

```java
public class Student {
    private String name;
    private int age;
    private String sex;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getAge() {
        return age;
    }
    public void setAge(int age) {
        this.age = age;
    }
    public String getSex() {
        return sex;
    }
    public void setSex(String sex){
        if("男".equals(sex)||"女".equals(sex)){
            this.sex = sex;
        }else{
            throw new MyException("性别错误！！！");
        }
    }
    public Student() {
    }
    @Override
    public String toString() {
        return "Student{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", sex='" + sex + '\'' +
                '}';
    }
    public static void main(String[] args) {
        Student s=new Student();
        s.setAge(19);
        s.setName("lili");
       s.setSex("lkjhlkjhlkj");
    }
}
```

