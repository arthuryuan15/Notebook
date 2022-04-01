# 反射

day25

## 1. 引入

美团外卖	----》	在线支付功能	----》	可以选择支付宝，也可以选择微信， 

```java
 public static void pay(MeiTuanWaiMai m){  // 多态：接口做形参，实现类叫做实参 MeiTuanWaiMai m = new Alipay()
        m.payOnline();
 }
```

多态确实提高了扩展性，但是，扩展性没有达到最好： 

最好	----》反射 



### 1 利用多态

```java
package com.sxt.test01;

public interface MeiTuanWaiMai { // 美团外卖
    // 方法：在线支付
    void payOnline();
}
```

```java
package com.sxt.test01;

public class Alipay implements MeiTuanWaiMai{

    public Alipay(){
        System.out.println("创建了阿里的对象");
    }
    @Override
    public void payOnline() {
        System.out.println("我正在定外卖，在使用支付宝支付！");
    }
}

```

```java
package com.sxt.test01;

public class WeChat implements MeiTuanWaiMai{

    public WeChat(){
        System.out.println("创建了微信的对象");
    }

    @Override
    public void payOnline() {
        System.out.println("我在定外卖，在用微信进行支付！");
    }
}
```

```java
package com.sxt.test01;

public class Test {

    public static void main(String[] args) {

        // 判断用户到底选了那种支付方式
        String str = "支付宝";

        if("微信".equals(str)){ // str.equals("微信") 有可能报空指针异常
            // 利用微信支付：
            // WeChat wc = new WeChat();
            pay(new WeChat());
        }

        if("招商银行".equals(str)){

        }

        if("建设银行".equals(str)){

        }

        if("支付宝".equals(str)){
            // 利用支付宝支付
            // Alipay a = new Alipay();
            // a.payOnline();
            pay(new Alipay());
        }

    }

    // 提取出pay方法
    /*public static void pay(WeChat w){
        w.payOnline();
    }

    // 和上面pay方法 构造方法的重载
    public static void pay(Alipay a){
        a.payOnline();
    }*/

    public static void pay(MeiTuanWaiMai m){  // 多态：接口做形参，实现类叫做实参 MeiTuanWaiMai m = new Alipay()
        m.payOnline();
    }
}
```



### 2 反射

```java
package com.sxt.test01;

public class Demo {

    public static void main(String[] args) throws ClassNotFoundException, IllegalAccessException, InstantiationException {

        // 字符串从前台接收：当程序运行起来之后，下面的字符串会动态的去找个类
        String str = "com.sxt.test01.Alipay";

        // 反射： 通过字符串反射出一个具体的对象
        //这种动态获取信息以及动态调用对象方法的功能称为java语言的反射机制。
        Class.forName(str).newInstance(); // newInstance创建实例
      
      

    }
}
```

总结：

		1. 运行状态下，动态的去获取类（Class）中的信息（属性，方法，构造器）的过程
		2. 即，当程序运行起来的时候，这种动态获取信息及动态调用对象的方法称为java语言的反射机制。



##2. Class类 

class类：不同字节码信息向上抽取的类。

通过class类，就可以得到具体class类的对象，有了对象就可以获取里面的东西。





![image_8402](/Users/yuanjinshuai/Documents/learn/notebook_cn/java/pic/image_8402.png)

```java
package com.sxt.test02;

import java.lang.reflect.Modifier;

public class Test {

    public static void main(String[] args) throws ClassNotFoundException {

        // 获取Student的字节码信息：（Class类的具体的对象）
        // 方式1：
        Student s = new Student();
        Class c1 = s.getClass();
        Class c2 = s.getClass();

        System.out.println(c1==c2);

        // 方式2：
        Class c3 = Student.class;
        Class c4 = Student.class;
        System.out.println(c3==c4);
        System.out.println(c3==c2);


        // 上面的方式1和方式2不常用

        // 方式3;
        Class c5 = Class.forName("com.sxt.test02.Student");
        System.out.println(c5==c3);

        // 上面已经可以获取到Student的信息了，练习一下常用方法
        System.out.println("类的全称: " + c5.getName());
        System.out.println("类的简称: " + c5.getSimpleName());
        System.out.println(c5.getModifiers());
        System.out.println("将修饰符的数字进行转换:"+Modifier.toString(c5.getModifiers()));

        System.out.println(c5.getSuperclass()); // 得到父类的字节码信息:Person
        System.out.println(c5.getSuperclass().getName());
        
    }
}
```



## 3. 获取构造器+创建对象

```java
package com.sxt.test02;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;

public class Demo01 {

    public static void main(String[] args) throws ClassNotFoundException, NoSuchMethodException, IllegalAccessException, InvocationTargetException, InstantiationException {
        // 先获取Student的字节码信息：（Class类的一个对象）
        Class c = Class.forName("com.sxt.test02.Student");
        // c --> Class类的一个对象 --> Student的字节码信息


        // 获取内部构造器：(获取所有的构造器，但是不含private修饰的构造器)
        Constructor[] cons = c.getConstructors();
        for(Constructor con:cons){
            System.out.println(con);
        }
        System.out.println("------------------------");

        // 获取全部的构造器（包含private修饰的构造器）
        Constructor[] cons1 = c.getDeclaredConstructors();
        for(Constructor con:cons1){
            System.out.println(con);
        }
        System.out.println("------------------------");

        // 获取制定的构造器：
        // 获取空构造器
        Constructor con1 = c.getConstructor();
        System.out.println(con1);
        // 获取六个参数的有参构造器
        // int age, String name, String sex, double height, double weight, int sid
        Constructor con2 = c.getConstructor(int.class,String.class,String.class,double.class,double.class,int.class);
        System.out.println(con2);

        // 获取四个参数的有参构造器，构造器被private修饰
        // int age, String name, String sex, double height
        Constructor con3 = c.getDeclaredConstructor(int.class,String.class,String.class,double.class);
        System.out.println(con3);

        // 有了构造器，就可以创建对象了
        Object o1 = con1.newInstance();
        System.out.println(o1);

        Object o2 = con2.newInstance(18, "lili","男",98.3,120.7,1001);
        System.out.println(o2);

        con3.setAccessible(true);// 开关：设置为true就可以利用private修饰的构造器创建对象了。
        Object o3 = con3.newInstance(18, "lili","男",98.3);

        Class.forName("com.sxt.test02.Student").newInstance();// 直接调用空构造器，而且直接创建实例
        
    }
}
```



## 4. 获取属性

```java
package com.sxt.test02;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;

public class Demo2 {
    public static void main(String[] args) throws ClassNotFoundException, NoSuchFieldException, NoSuchMethodException, IllegalAccessException, InvocationTargetException, InstantiationException {
        // 获取Student字节码信息
        Class c = Class.forName("com.sxt.test02.Student");

        // 获取属性:获取到子类和父类中被public修饰的属性
        Field[] fs =c.getFields();
        for(Field f:fs){
            System.out.println(f);
        }

        System.out.println("-----------------");

        // 获取Student类的全部的属性
        Field[] fs2 = c.getDeclaredFields();
        for(Field f:fs2){
            System.out.println(f);
        }

        Field[] fs3 = c.getSuperclass().getDeclaredFields();
        for(Field f:fs3){
            System.out.println(f);
        }

        System.out.println("------------------");
        // 获取制定属性
        Field sid = c.getField("sid");
        System.out.println(sid);
        Field sex = c.getDeclaredField("sex");
        System.out.println(sex);

        // 给属性sid赋值：
        Object o1 = c.getConstructor().newInstance();
        sid.set(o1,1001); // 给o1这个对象的sid属性赋值为1001
        System.out.println(o1);

        System.out.println("-------------------");

        // 给属性sex赋值：
        sex.setAccessible(true); // 取消访问权限设置
        sex.set(o1, "男");
        System.out.println(o1);
    }
}
```



## 5. 获取方法

```java
package com.sxt.test02;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Arrays;

public class Demo03 {

    public static void main(String[] args) throws ClassNotFoundException, NoSuchMethodException, IllegalAccessException, InstantiationException, InvocationTargetException {
        // 获取Student字节码信息
        Class c = Class.forName("com.sxt.test02.Student");

        // 获取方法:获取子类及所有所有父类里面public修饰的方法
        Method[] ms = c.getMethods();
        for(Method m:ms){
            System.out.println(m);
        }

        System.out.println("方法数:"+ms.length);

        // 获取方法：获取子类所有的方法（包含private修饰的）
        Method[] ms2 = c.getDeclaredMethods();
        for(Method m:ms2){
            System.out.println(m);
        }
        // 获取制定的方法：
        Method m1 = c.getMethod("toString"); // 获取toString方法，后面没有参数
        System.out.println(m1);

        Method m2 = c.getMethod("setSex", String.class);
        System.out.println(m2);

        System.out.println("-----------------------------");
        Method m3 = c.getMethod("b", int.class, double.class, String.class);
        System.out.println(m3);
        System.out.println("方法的名字：" + m3.getName());
        System.out.println("方法的修饰符" + Modifier.toString(m3.getModifiers()));
        System.out.println("方法的返回值" + m3.getReturnType());
        System.out.println("参数列表:" + Arrays.toString(m3.getParameterTypes()));

        // 调用方法:
        // invoke 有两个参数，第一个参数：指定对象 第二个参数为可变参数：就是调用方法传入的具体的数据
        Object o = c.newInstance();
        m3.invoke(o,18, 18.9, "aaa");

    }
}
```



## 6. 完善引入

```java
package com.sxt.test01;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class Demo {

    public static void main(String[] args) throws ClassNotFoundException, IllegalAccessException, InstantiationException, NoSuchMethodException, InvocationTargetException {

        // 字符串从前台接收：当程序运行起来之后，下面的字符串会动态的去找个类
        String str = "com.sxt.test01.Alipay";


        // 反射： 通过字符串反射出一个具体的对象
        //这种动态获取信息以及动态调用对象方法的功能称为java语言的反射机制。
        Class c = Class.forName(str); // 得到字节码信息

        // 创建对象
        Object o = c.newInstance();
        Method m = c.getMethod("payOnline");
        // 执行这个方法
        m.invoke(o); // 给哪个对象执行m，所以要先创建一个对象

    }
}
```

