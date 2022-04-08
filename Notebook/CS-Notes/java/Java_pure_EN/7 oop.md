#                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             面向对象

Day7-day11



## 1. 面向对象与面向过程语言的区别

​		面向过程就是分析出**解决问题**所需要的步骤，然后用函数把这些步骤一步一步实现，使用的时候一个一个依次调用就可以了；

 		面向对象是把构成问题事务分解成各个对象，建立对象的目的不是为了完成一个步骤，而是为了描叙某个事物在整个解决问题的步骤中的行为。

​         

## 2. 类和对象

```java
public class Person {
  
    //名词--属性---成员变量---filed
    String name;	//姓名
    int age;	//年龄
    double height;	//身高
    char sex;	//性别
  
    //建议：我们只写跟业务逻辑相关的属性和方法
    //动词--方法---成员方法----method
    //吃饭
    public void eat(){
        System.out.println("我可以吃饭");
    }
  
    //睡觉
    public void sleep(String address){
        System.out.println("我在"+address+"睡觉");
    }
  
    //自我介绍
    public String introduce(){
        return "我的名字是："+name+",我的年龄是："+age+"，我的身高是："+height+"，我的性别是："+sex;
    }
}
```

```java
public class Test {
    public static void main(String[] args) {
      
        //创建对象：
        Person p1 = new Person();
      
        //对p1这个对象的属性进行赋值：
        p1.name = "露露";
        p1.age = 19;
        p1.height = 169.4;
        p1.sex = '女';
      
        //对对象的属性进行读取（使用）
        System.out.println(p1.age);
        System.out.println(p1.height);
        
      	//对方法进行调用：
        p1.eat();
        p1.sleep("寝室");
        String str = p1.introduce();
        System.out.println(str);
        
      	//再创建一个对象：
        Person p2 = new Person();
        p2.name = "刚刚";
        p2.age = 20;
        p2.height = 180.5;
        p2.sex = '男';
        String str02 = p2.introduce();
        System.out.println(str02);
    }
}
```

说明：

1. new Person()的含义

  ```java
    new Person();
  ```


​		利用new关键字在创建对象，（并调用相应的构造器）在堆中开辟空间，一旦开辟空间就有地址，已经产生了地址了，但是没有变量来接收这个地址。 也就说对象无法直接访问，只能通过对象引用来间接访问对象。

```java
		int p1 = new Person(); // error
		Person p1 = new Person(); // 用引用数据类型来接收
```
​		用单一的数据类型接收是不可以的，所以这个Person我们要用一种复杂的数据类型接收（里面有int 有String有double等），复杂的数据类型我们又叫引用数据类型 ->自定义的类：Person 。

​		p1这一个对象变量并没有实际包含一个对象，而仅仅引用一个对象。

 (2) Person p=new Person(); 怎么执行的？

​		第一次，先对类再内存中进行加载（loadClass方法中），然后再找构造器。 

但是在第二次创建对象的时候，就不会再加载类了，因为已经加载过了。 

(3) Test测试类和Person类什么关系

​        在Test类执行的时候，发现要创建Person类的对象，然后再去对Person类进行加载。 

 (4) 对象属性的性质

​		各个对象的属性，都是独立的，每个对象都具备自己的属性的值。 

​		但是方法是共享的，我们利用对象去调用这些方法。 



 ## 3. 构造器

首先，构造函数是没有返回值的。

​		`Construtor c = new Constructor( );`说明

​		1. 调用new constructor( );时，new首先会创建对象的引用

​		2. 然后通过“=”复制给声明的对象引用如Construtor c = new Constructor( );，new Constructor( )然后调用构造函数将初始化对象的实例变量存储在堆上。硬要说有返回值的话，也就对象的引用，但那是通过赋值语句，并不是构造函数的返回值。不能直接调用constructor，编译器会提示没有定义该函数，

虽然构造器没有显式的被static修饰，但构造器是静态方法，

```java
public class Student {
  
    //属性
    int age;
    String name;
    double height;
  
    //方法
    public String introduce(){
        return "这个学生的名字是："+name+",年龄是："+age+"，身高："+height;
    }
    public void eat(){
        System.out.println("我可以吃饭。。");
    }

    //构造器的重载
    public Student(String name,int age,double height){
        //当形参和属性名字相同时，会发生就近原则
        this.name=name; // name = name;
        this.age=age;	// age = age;
        this.height=height;	// height = height;
    }
}
```



(1)对象创建的过程      

 		顺序：类加载（第一次被加载），创建对象，在堆中开辟空间。然后利用new关键字调用一个方法，这个方法比较特殊，专门用来给对象进行初始化的。---》这个方法叫构造方法。 

​		这个方法之前我们一直没有写，但是系统会默认帮我们提供出来。 



 (2) 构造器(又叫构造方法)

1. 格式：没有返回值类型  ，构造器的名字必须跟类名一模一样 

2. 构造器的作用：不是为了创建对象，就是为了给已经创建好的对象进行初始化的。 

   但是我们一般在空构造器中不会进行初始化。**但是也建议时刻保持空构造器的存在. **

3. 我们可以进行构造器的重载（overload），目的：还是为了给对象进行初始化，并且更加方便。 
4. 当形参跟属性名字相同的时候，会出现就近原则，那么我们就要**表示类的属性**的那个参数怎么办呢？在前面**加上this**. 
5. 假如我们没写空构造器，那么系统会进行默认分配，但是假如我显示编写了有参构造器，那么系统就不会再给我分配空构造器了。
6. 空构造器被private修饰也不能创建对象 

注意：由于构造器的名称与类名必须完全相同，所以每个方法的首字母小写的编程风格不适用了构造器



 (3) 重载

​	为了让方法名相同的而形式参数不同的构造器同时存在，必须用到方法重载。尽管方法重载是构造器所必须的，但是亦可应用到其他方法。



## 4. 局部变量和成员变量

```java
public class demo {
  
    int age;//成员变量--->属性
    int a=99;
  
    public void eat(){
      
        int num1=10;//局部变量---> 必须要进行初始化
      
        System.out.println(num1);
        int a=100;	// 虽然是上面也有a，但是作用范围不同
        System.out.println(a);//就近原则，指的是局部变量a
        System.out.println(this.a);	//表示属性在前面加上this
    }
}
```

(1) 区别

		区别1：代码中位置不同 

​         成员变量：类中定义的变量 

​         局部变量：方法中定义的变量  代码块中定义的变量 

		区别2：内存中位置不同 

​         成员变量：堆内存 

​         局部变量：栈内存         

		区别3：是否有默认值 

​         成员变量：有 

​         局部变量：没有 

		区别4：代码的作用范围（空间） 

​         成员变量：当前类的很多方法 

​         局部变量：当前一个方法（当前代码块） 

		区别5：作用时间不同 

​         成员变量：当前对象从创建到销毁 

​         局部变量：当前方法从开始执行到执行完毕 



## 5. 内存分析

![Screen Shot 2019-09-27 at 5.04.59 PM](https://tva1.sinaimg.cn/large/0081Kckwly1gmc5lg7e7cj319m0q2q8t.jpg)

说明：

1. **栈**：存储局部变量和基本数据类型、对象指针。
2. **堆**：所有的**对象实例**以及**数组**都要在堆上分配。
3. **方法区**：存放所有的**class**和**static**变量

### 5.1 第一段

```java
 public class Person {
        int  id;	// 成员变量 属性 
        int  age; 

        public static void main(String args[]){
                Person p1= new Person();
        }
}
```

 ![Screen Shot 2019-09-27 at 4.48.36 PM](https://tva1.sinaimg.cn/large/0081Kckwly1gmc5lj0zjsj31ns0sqgq8.jpg)

说明：

1. 【方法区】在第一次加载Person类的时候，将Person.class这个字节码信息（通过编译后的Person.java）加载入方法区
2. 【堆】参照加载到方法的字节码信息在堆中创建对象，创建对象的地址是0x99
3. 【堆】在这个对象里面有id和age两个属性，里面的值是初始值

4. 【栈】main方法开辟栈帧，把对象的地址（0x99）给左边的p1
5. 【栈->堆】栈通过地址指向堆
6. 【堆->方法区】堆通过字节码信息指向方法区



### 5.2 第二段

```java
public class Person {
  
    int id;
    int age;
    String school;
  	
  	// 建立一个有参构造器
    public Person (int a,int b,String c){
        id = a;
        age = b;
        school = c;
    }
    public static void main(String args[]){
        Person p = new Person(1,20, "海淀"); // 有参构造器
    }
}
```

![Screen Shot 2019-09-27 at 5.13.33 PM](https://tva1.sinaimg.cn/large/0081Kckwly1gmc5lnkpe9j31ie0sete1.jpg)

说明：

1. 先将Person类的字节码信息加载进方法区
2. 在字节码的基础上创建对象，对象的地址是0x67，这个对象里面有id age school 三个属性
3. main方法开辟栈帧，初始直接走到构造器（默认是也是先走构造器，因为构造器没有，才走其他的），在栈中创建一块有参构造器栈帧
4. 然后在栈中把1，20，传给a，b，而字符串需要放到方法区的字符串常量中，海淀的地址是0x38，然后把0x38给c
5. 然后才把a，b，c的值依次赋给id，age，school，注意school转的是地址
6. 然后有参构造器运行完毕，整个有参构造器栈帧在栈中消失
7. 此时堆中的对象（```new Person```） 构造完毕，然后把对象的地址给main方法栈帧中的p

总结：

栈：形参，局部变量——>	放入栈中不同栈帧中去

堆：new 出来的对象

方法区：加载的字节码信息，字符串常量池

### 5.3 第三段

```java
class Person{ // class 的public 写不写都行
    int id;
    int age;
    String school;
  
    public Person (int a,int b,String c){ // Person的有参构造器
        id = a;
        age = b;
        school = c;
    }

    public void setAge(int a){
        age = a;
    }
}
```



```java
public class Test {
  
    public static void main(String[] args) {
      
        Test t = new Test();
        int age = 40;
        Person tom = new Person(1,20,"海淀");
        Person jack = new Person(2,30,"朝阳");
      
      	t.change1(age);
        t.change2(tom);
        t.change3(jack);
      
        System.out.println(age);
        System.out.println("id:"+jack.id+",age:"+jack.age+",school:"+jack.school);
    }
  
    public void change1(int i){
        i = 3366;
    }

    public void change2(Person p){
        p = new Person(3,22,"西城");
    }

    public void change3(Person p){
        p.setAge(66);
    }

}
```



![Screen Shot 2019-09-27 at 9.00.52 PM](https://tva1.sinaimg.cn/large/0081Kckwly1gmc5lm5c0lj31ku0t87aq.jpg)

说明：

1. 先给Test类的main方法开个栈帧
2. ```Test t = new Test();``` 第一次调用这个类，在方法区中创建Test的字节码信息
3. 根据字节码信息，给这个类创建对象，在堆里面开辟空间（0x99），这个Test类里面没有什么属性，所以不用写，开辟空间的右下角有一块区间指向Test字节码信息，然后产生地址0x99，给main方法栈帧中t
4. ```int age = 40;```然后在0x99上面放了一个局部变量，名字叫age，里面存的值是40
5. ```Person tom = new Person(1,20,"海淀");```首先把Person的字节码信息加载到方法区，然后参考这个模板，在内存中开辟空间，这个空间的地址是0x82，然后这个类里面有三个属性，id，age和school
6. 然后走到Person类的有参构造器，然后在方法区开辟有参构造器的栈帧，里面有a，b，c，然后分别将1和20传进栈帧，“海淀”放入字符串常量池，地址是0x28，地址放到c
7. 然后```id = a; age = b; school = c;``` 给id，age，school分别赋值，此时有参构造器的调用结束，整个有参构造器栈帧消失
8. 然后整个对象```new Person(1,20,"海淀")``` 地址给tom
9. 同5-8可得``` Person jack = new Person(2,30,"朝阳");``` 对象的地址是0x11
10. ```t.change1(age);``` 为change1开辟栈帧，然后把age 40的值传给i，然后```i = 3366;``` 把i的值替换为3366，然后整个方法结束，为``public void change1(int i)`` 开辟的栈帧都没了，然而对age没有任何影响
11. `t.change2(tom);` 然后把tom的地址传给p，然后change2里面又创建了一个Person对象，此时Person对象的地址给了p，（注意，此时p的地址改变了），然后整个方法结束， 整个栈帧也消失了，此时堆中的p地址对应的对象也消失了
12. `t.change3(jack);` 同样为change3开辟栈帧，把jack的地址给了新开辟栈帧中的p，然后调`p.setAge(66);`为setAge开辟栈帧，形参a放入开辟的栈帧，数值是66，age=a 谁在调setAge方法谁的age=a，发现是p在调setAge，所以是p指向是0x11中的age，此时age变成了66 ，然后为setAge方法和change3方法结束了，相应的栈帧消失了，**注意：此时ox11里面的age更改成66了**

13. ``` System.out.println("id:"+jack.id+",age:"+jack.age+",school:"+jack.school)``` 输出的结果是2，66，朝阳
14. 最后main方法执行结束，为main方法在栈中开辟的栈帧也消失了



## 6. this

​		this关键字只能在方法内部使用，表示对“调用方法的那个对象”的引用。

```java
Student s = new Student("露露", 18);
```

![Screen Shot 2019-09-27 at 9.55.52 PM](https://tva1.sinaimg.cn/large/0081Kckwly1gmc5lortcpj31ju0mqn0r.jpg)

说明：

（1）this指向自身对象 

（2）利用debug测试一下this的存在，this就是指向：当前对象： 

​			在调用构造器的时候：this指向：正在创建的那个对象 ，也就是this调用本类的构造方法

​			在调用普通方法的时候，this指向：正在调用方法的那个对象 

​			总结：==this就是指向对象自身==

 （3）代码： 

​		  this修饰属性 

​		  this修饰方法  this. 

​		  this修饰构造器 this(传入实参)---》this修饰构造器必须放在第一行。

​		

## 7. static

```java
public class Test {
    //属性：
    int id;
    static int sid;
    public static void main(String[] args) {
        /*
        //创建对象：
        Test t1 = new Test();
        t1.id = 10;
        t1.sid = 10;
        Test t2 = new Test();
        t2.id = 20;
        t2.sid = 20;
        Test t3 = new Test();
        t3.id = 30;
        t3.sid = 30;
        //对属性进行读取：
        System.out.println(t1.id);//10
        System.out.println(t2.id);//20
        System.out.println(t3.id);//30
        System.out.println(t1.sid);//30
        System.out.println(t2.sid);//30
        System.out.println(t3.sid);//30
*/
        Test.sid=10;
        System.out.println(Test.sid);
    }
}
```



![Screen Shot 2019-09-27 at 10.19.56 PM](https://tva1.sinaimg.cn/large/0081Kckwly1gmc5lpwuh6j31no0tadkr.jpg)

说明：

1. `Test t1 = new Test();`首先在方法区加载Test.class字节码信息，`static int sid;`在类第一次被加载的时候，也将静态变量sid加载入方法区中的静态区域中，被该类的所有对象共享

2. 然后根据字节码信息，给这个类创建对象，在堆中开辟空间（0x99），`int id;`放入属性id，由于sid已经加载到静态区域所以只有一个属性-id在创建的对象中，**注意：此时static是先于对象加载到内存中**
3. `public static void main(String[] args) {}`然后在栈区开辟main方法的栈帧，保存0x99，命名为t1，此时栈帧中的0x99指向堆中的0x99开辟的对象空间
4. `t1.id = 10; t1.sid = 10;`给对象中的id赋值10，给方法区的sid赋10
5. 此时对象中都有一块区域指向Test.class字节码信息
6. 同样`Test t2 = new Test();`也在堆中开辟对象空间，对象的地址保存在栈中的t2（值：0x83）
7. `t2.id = 20; t2.sid = 20;` 给对象t2赋值20，将方法区中的静态变量的值替换成20
8. 同理的`Test t3 = new Test();t3.id = 30;`t3.sid=30;

总结：

​		在类第一次被加载的时候，就将static修饰的内容加载入方法区中，**它是先于对象存在的，不依托于一个对象的**。也就是不用再main方法中创建对象，直接在main方法中`Test.sid=10;`也不用创建一个对象，直接在test类中，创建`Test.sid=10;`

​		**我们对static修饰的变量最好的访问方式为：类名.属性名  （Test.sid）**

​		注意：并不是所有的属性都要加上static修饰，要看自己题的需求。 假如你要是所有属性都用static修饰了，那么它是比较消耗内存的。 

```java
public class Test {
    //属性：
    int id;
    static int sid;

    // 方法：
    public void a(){
        System.out.println(id);// this.id也可以，因为这里已经创建了对象了
    }

    public static void b(){ // 此时static先于对象加载到内存中
        System.out.println(id); // error
    }
  	public static void main(String[] args){
      a(); // error 而a还没有创建，不能调用
      b();// b已经加载到内存中，可以直接调用
    }
}
```

说明：

**static修饰方法，也是在类被加载的时候加载入方法区的，它也是先于对象存在的，所以此时还没有对象呢。最好的调用方式：类名.方法名 **

所以我们不可以:	不可以在static中用this、  

​                            	不可以在static修饰的方法中去访问非静态的变量 

​                            	不可以在static修饰的方法中去访问非静态方法 

对于普通的方法，我们必须创建对象，用对象去调用。 

对于静态的方法，我们可以：

​	（1）类名.方法名  

​	（2）创建对象，对象名.方法名 

总结：static必须找static 

注意：static不能对构造器就行修饰，因为构建器的作用是在创建对象的，而static的作用在创建对象之前，矛盾了



#### 补充：代码块



代码块(普通块，构造块，静态块，同步块)



普通块：在方法中写了一对{}是普通代码块

构造块：在类中写了一对{}是构造代码块

静态块： 加了static的是静态代码块

同步块：常用在多线程中， synchronized关键字，synchronized(同步对象){}



```java
public class Test {
  
    ///类的组成：属性，方法，构造器，代码块(普通块，构造块，静态块，同步块)
    
  	//属性
    int age;
    static int sage;
    
  	//方法
    public void eat(){
        {
            System.out.println("这是一个普通块。");
            int a=10;
        }
        //System.out.println(a);
        if(1<8){
            int a=20;
        }
        for(int i=0;i<=10;i++){
            int a=30;
        }
    }
    
  	//构造器
    public Test(){
        System.out.println("这是Test类的空构造器");
    }
    
  	//构造块
    {
        System.out.println("这是一个构造块");
    }
    static{
        System.out.println(sage);
        System.out.println("这是一个静态块");
    }
  
    public static void main(String[] args) {
        Test t1=new Test();
        Test t2=new Test();
        Test t3=new Test();
    }
}
```

说明：

![Screen Shot 2019-09-28 at 9.15.40 AM](https://tva1.sinaimg.cn/large/0081Kckwly1gmc5lr3rjoj30wk0dyq5t.jpg)

结论： 

​	静态块在类被加载的时候进行加载，并且只加载一次。 

​	之后执行的是构造块--》构造块的执行顺序要高于构造器。 构造块解决了在方法外写代码的问题

​	static的代码块只能访问静态变量，静态方法。 

## 8.包

【1】生活案例： 

​		比如邮快递： 

​		地址：北京.京南.尚学堂.五楼.504.第几排.第几个王波 

​		------目的：为了解决“王波”名字的重名问题 



【2】包：目的：为了解决类的重名的问题，引入了包。同一个包中，不能 起重复的名字。 

包：是个啥？就是盘符上面的文件夹 



【3】包如何起名规则： 

​		com.bjsxt.test01 

​	（1）名字全部小写，中间用.隔开 

​	（2）								公司域名倒着写 + 模块名 

​	         www.bjsxt.com -----> com.bjsxt.     +  dao 

​	         www.baidu.com ——> cn.baidu.    + controller 

​	（3）不能用**系统**中的关键字：con,nul,com1---com9 等等。。 

​	（4）我们定义每个类：非注释性代码的第一行都会对包进行声明：  

​	（5）不同包的类，要是使用，必须用import进行导包。 

​	（6）java.lang包下的类可以直接使用，无需导包。 

​	（7）导包快捷键：alt+enter 

​	（8）在同一个类中，假如用到了重名的类： 

​				在导包的时候只能导入其中的一个，那么另一个在使用的时候就要手动加上包名，比如： 

​	（9）在java中没有子包和父包的概念： 

​	（10）静态导入： 

​			`import static java.lang.Math.*;//静态导入 `

​				导入的是java.lang这个包下的Math类中所有静态的东西 



## 9.面向对象三大特征

​	封装：提高了代码的**安全性** 

​	继承：提高了代码的**复用性** 

​	多态：提高了代码的**扩展性**  

### 9.1 封装

定义：把数据和方法包装进类中，以及具体实现的隐藏叫做封装。在java中通过关键词private、protected和public实现封装。

【1】生活案例：ATM，电线等 

【2】什么叫做封装： 

​		将某些东西进行隐藏，然后提供相应的方式进行获取。 

【3】封装的好处： 

​		提高代码的安全性 

【4】怎么进行封装： 

​		以属性为例： 

​		（1）将属性私有化（private int age） --->将属性利用权限修饰符进行修饰：private 

​        利用修饰符来控制权限  ，一旦控制了以后其他人就不可以随意的获取。			

​		（2）提供**公有的方法**让别人来访问 

​		（3）即使是访问也不是随便的访问，因为我在方法中进行了限制。 

【5】引入代码： 

​		建一个女孩类（包括私有属性年龄），再建一个测试类，读取年龄

```java
public class Gril {//女孩
  
    //属性：
    private int age;
  
  	//方法：设置年龄：
    public void Setage(int age){
        if(age>=30){
            this.age=18;
        }else{
            this.age=age;
        }
    }
    //方法：读取年龄：
    public int getage(){
        return age;
    }
}

public class Test {
    public static void main(String[] args) {
      
        Gril g=new Gril();
        g.Setage(32);
        System.out.println(g.getage());
        //g.age=19; // 这里直接读取不到
        //System.out.println(g.age);
      
    }
}
```

加深理解：

1. 创建一个Student类（包含name，age, sex 私有属性）
2. 条件（0<age<120, sex = 男或女）
3. Student类中main方法直接调用（有参构造器+set/get方法）
4. 在有参构造器中加条件

```java
package com.sxt.test04;

public class Student {

    private String name;
    private String sex;
    private int age;

    // 构造器是没有返回值的
    public Student(){

    }

    public Student(String name, int age , String sex){
        this.name = name;
//        this.age = age;
//        this.sex = sex;
        this.setSex(sex);
        this.setAge(age);
    }

    public String getName() {
        return name;
    }

    public String getSex() {
        return sex;
    }

    public int getAge() {
        return age;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSex(String sex) {
        if(sex.equals("男")|| sex.equals("女")){
            this.sex = sex;
        }else {
            this.sex = "男";
        }

    }

    public void setAge(int age) {
        if(age >= 0 && age <=120){
            this.age = age;
        }else {
            this.age = 40;
        }

    }

    public String introduce(){
        return "我的名字：" + this.name + "我的年龄:" + this.age + "我的性别是:" + this.sex;
    }

    public static void main(String[] args) {

        Student s = new Student();
        s.setName("lili");
        s.setAge(30);
        s.setSex("男");
        System.out.println(s.introduce());

        Student s1 = new Student();
        s1.setName("nana");
        s1.setAge(150);
        s1.setSex("人妖");
        System.out.println(s1.introduce());

        Student s2 = new Student("haha",  150,  "人妖");
        System.out.println(s2.introduce());
    }
}
```



### 9.2 继承

#### 9.2.1 继承定义

【1】类是对对象的抽象 

​	举例：你的粉色杯子，他的红色杯子，我的紫色杯子，小鼠标，键盘----》具体的对象 

​	---》进行类的抽取：找共同的东西： 

​	 你的粉色杯子，他的红色杯子，我的紫色杯子---》杯子的类 

【2】继承是对类的抽象 

​	举例： 

​	学生类：Student： 

  属性：年龄，姓名，学生编号 

​        方法：吃饭，喝酒，学习，自我介绍 

​	教师类：Teacher: 

​        属性：年龄，姓名，教师编号 

​        方法：吃饭，喝酒，教学，自我介绍 

​	员工类：Employee: 

​        属性：年龄，姓名，员工编号 

​        方法：吃饭，喝酒，工作，自我介绍 

​	共同的东西： 

​	人类： 

   属性：年龄，姓名 

​       	方法：吃饭，喝酒，自我介绍     

​	学生类/教师类/员工类  继承自  人类：

​		学生是一个人 

​		教师是一个人 

​		员工是一个人 

​	狗类： 

​       属性：年龄，姓名，身高 

​       方法：吃饭，喝酒，汪汪叫    

狗是一个人 ?	继承  必须在合理的范围中进行的向上抽取 

【3】写代码：学生类 继承自  人类  为案例： 

​		学生类---》子类 

​		人类----》父类 

​		---》先写父类，再写子类  （子类对父类进行扩展 ）

```java
public class Person {
    //属性：
    private int age;
    private String name;
    //方法：
    //吃饭
    public void eat(){
        System.out.println("我可以吃饭");
    }
    //喝酒
    public void drink(){
        System.out.println("我可以喝酒");
    }
    //加入setter，getter方法：
    public int getAge() {
        return age;
    }
    public String getName() {
        return name;
    }
    public void setAge(int age) {
        this.age = age;
    }
    public void setName(String name) {
        this.name = name;
    }
    //自我介绍
    public String introduce(){
        return "我可以自我介绍";
    }
  
  	//构造器：需要一个空构造器，因为Student类继承Person类的时候，Student里面的空构造器会调用Person里的空构造器。而Person里面没有空构造器，只有一个有参构造器。
    public Person(){
    }
  
    public Person(int age,String name){
        this.age=age;
        this.name=name;
    }
}

public class Student extends Person {
    //属性：
    private int sno;//学号
    //方法：
    public void study(){
        System.out.println("我可以学习");
    }
    public int getSno() {
        return sno;
    }
    public void setSno(int sno) {
        this.sno = sno;
    }
    //构造器：
    public Student(String name,int age,int sno){
        super.setAge(age);//调用父类的方法
        super.setName(name);//调用父类的方法
        this.sno=sno;
    }
}

public class Test {
    public static void main(String[] args) {
        Student s=new Student("nana",18,1001);
        System.out.println("我的姓名是："+s.getName()+",我的年龄是："+s.getAge()+",我的学号是："+s.getSno());
        s.eat();
        s.drink();
        s.study();
    }
}
```

好处：提高代码的复用性。 	



【java继承具备传递性】

我们的代码：Student继承了Person类，Person类又继承了Object类。 

​		Object是所有类的根基父类，一个类一定是直接或者间接的继承自Object类 

​		Student--->Person---->Object 



【 java 只有单继承】：一个类只能继承一个类 

```java
public class Student extends Person, Animals{} // Error
```



####  9.2.2 继承内存分析

![Screen Shot 2019-09-28 at 10.07.54 AM](https://tva1.sinaimg.cn/large/0081Kckwly1gmc5libymjj321e0rgqa2.jpg)

说明：

1. 在创建Student类之间要加载Person的字节码信息和Student字节码信息
2. 先创建父类Person类的父类object，在object的基础上有了Person，Person的属性有age和name，再有一个Student，Student有的属性有sno
3. 最外层的Student最终有个地址（0x99），给了main方法开辟栈帧里面s，里面存在的0x99
   1. ` Student s=new Student("nana",18,1001)`然后赋值age、sno和name，注意name是字符串，放到字符串常量池中，用地址进行引用



#### 9.2.3 权限访问

​		public 接口访问权限: piblic之后紧跟着的成员声明自己对每个人都是可用的，尤其是是使用类库的客户程序员更是如此。

​		private 你无权访问: 除了包含该类成员的类之外，其他任何类都无法访问这个成员。

​		protected 继承访问权限：如果创建了一个新包，并且来自另外一个包中的继承类，那么唯一可以访问的成员就是源包的public成员。有时，基类的创建者会希望某个特定成员，把对它的访问权限赋予派生类而不是所有类。

![Screen Shot 2019-09-28 at 10.21.19 AM](https://tva1.sinaimg.cn/large/0081Kckwly1gmc5ls4sayj31680a040m.jpg)

说明：

​	属性（成员变量），方法（成员方法） 修饰符：四种：		

  	private,default,protected,public  

​	但是我们一般： 属性用private修饰（我们想把属性保护起来），方法用public修饰（哪里都能访问到） 

​	类前面：只有两种：default，public （同一类中只能有一个类带public，且与文件名相同）



#### 9.2.4 重写 override



【1】重写：当子类对父类的方法不满意的时候，要对父类的方法进行重写。 

即，重写是子类对父类的方法实现过程进行重写编写，返回值和形参都不能改变，即**外壳不变，核心重写**。（更好理解一些）

```java
package com.sxt.test01;
// 父类
public class Person {

    // 自我介绍
    public String introduce(){
        return "我可以自我介绍";
    }
}
```



```java
package com.sxt.test01;
// 子类
public class Student extends Person{

    // 自我介绍
    public String introduce(){
        return "我的名字是：" + getName() + "我的年龄是：" + getAge() + "我的学号是：" + son;
    }
}
```



**重载和重写区别：**

![image_57055](https://tva1.sinaimg.cn/large/0081Kckwly1gmc5lgud73j30g204mdgh.jpg)

​	重载 Overload

​	（1）同一个类中。 

​	（2）修饰符：无关 

​	（3）==方法名字==必须相同 

​	（4）==形参列表==必须不同（个数，顺序，类型） 

​	（5）返回值类型：无关

```java	
public class Test01 {
    private int eat(){
        return 1;
    }
    public double eat(int age){
        return 9.8;
    }
}
```

重写： 

​	（1）必须在子类和父类之间 

​	（2）==方法名==必须相同 

​	（3）==形参列==表必须相同 

​	（4）修饰符：父类权限修饰符 < 子类权限修饰符 

​	                         父类权限修饰符 = 子类权限修饰符 

​	（5）返回值类型：类型 父类 > 子类   

#### 9.2.5 this和super内存		

```java
public class Person /*extends Object*/{
    //属性
    int age;
    public void eat(){
        System.out.println("我可以吃饭");
    }
}
```

```java
public class Student extends Person{
    String name;
    public void study(){
        System.out.println("我可以学习");
    }
    public Student(int age,String name){
        this.age=age;//super.age=age;
        this.name=name;
    }
}
```

```java
public class Test {
    public static void main(String[] args) {
        Student s=new Student(19,"lili");
    }
}
```

![Screen Shot 2019-09-28 at 10.33.46 AM](https://tva1.sinaimg.cn/large/0081Kckwly1gmc5ll19l5j321u0te0yw.jpg)

说明：

1. this指向Student自身这个对象
2. super指向Person父类这个对象
3. 注意：父类里面也super指向object类



#### 9.2.6 object类

Class `Object` is the root of the class hierarchy. Every class has `Object` as a superclass. All objects, including arrays, implement the methods of this class.

*object类java*.lang.objectobject类是所有类直接或间接的父类，也就是说*Object类*是*JAVA*语言一切类的开始,所有的类都直接或间接的继承自它



【1】toString

```java
public class Student /*extends Object*/{
    int age;
    String name;
    public Student(int age, String name) {
        this.age = age;
        this.name = name;
    }
    public String toString(){
        return "这是一个学生对象：name="+name+",age="+age;
    }
    public static void main(String[] args) {
        int a=10;
        System.out.println(a);//输出基本数据类型的数值
        Student s=new Student(19,"lili");//引用数据类型
      
        System.out.println(s);//com.bjsxt.test01.Student@4554617c
        System.out.println(s.toString());//com.bjsxt.test01.Student@4554617c
        //toString()是谁定义的呀？object类
      
    }
}
```

​	说明：

1. toString() 将对象转换为字符串格式 	

2. toString：对当前那个对象进行 “介绍展示的”
3. 直接输出对象默认调用toString()

​	

【2】equals: 

1. 将对象进行比较的（比较的具体的属性的值，而不是比较地址） 
2. 一般来说，Obejct提供的equals我们不满意（`return this == object`），因为还是比较的地址，我们就要重写。 

```java
public class Cat {//猫
    double weight;//体重
    String type;//品种
    int age;//年龄
  
  	public Cat(double weight, String type, int age) {
        this.weight = weight;
        this.type = type;
        this.age = age;
    }
  
  	// 对父类Object中的equals()方法进行重写
    public boolean equals(Object obj) {//c1.equals(c2)
        //A instanceof B :判断A这个对象是否是B这个类的实例
        if(obj instanceof Cat){//传进来的是一只猫
            Cat other=(Cat)obj;//暂时这一步未知
            //c1的体重=c2的体重 并且 c1的类型=c2的类型  并且  c1的年龄 =c2的年龄 ---》认为两只猫一样
            if(this.weight==other.weight&&this.type==other.type&&this.age==other.age){
                return true;
            }
        }
        return false;
    }
  
    public static void main(String[] args) {
      
      	Cat c1=new Cat(10.4,"蓝猫",1);
        Cat c2=new Cat(10.4,"蓝猫",2);
      
        System.out.println(c1==c2);//一定是一个false
        //比较的是内容：
        System.out.println(c1.equals(c2));
        Dog d=new Dog();
        System.out.println(c1.equals(d));
    }
  
}
```



【3】wait()

​		wait()方法会导致线程放弃对象锁，进入等待此对象的等待锁定池，只有针对此对象调用notify()方法后本线程才进入对象锁定池**准备获取对象锁进入运行**（或者“就绪”）状态。



#### 9.2.7 扩展

面试题： 	

​	【1】请写出Object类常用的6个方法及其作用 	

​			toString();  将对象转换为字符串格式 	

​			equals(null); 判断两个对象的内容是否相同 	

​			hashCode();  哈希码  （集合）哈希表 	

​			getClass();  得到一个对象或者类的结构信息（反射） 	

​			wait();  等待(多线程) 	

​			notify();  唤醒任何一个(多线程) 	

​			notifyAll(); 唤醒所有(多线程) 	

 	

【2】以上方法是Object类的所有方法吗？ 	

​     	 是所有的public方法 	

​      	除了public方法外，还有其他： 	

​          protected void finalize() throws Throwable { } 垃圾回收器相关方法 	

​			protected native Object clone() throws CloneNotSupportedException; 克隆  快速复制  原型设计模式

 	

private static native void registerNatives(); 	

native  本地的 	

所有native修饰的方法都没有方法体；native本地的 	

Java不是完美的，Java的不足除了体现在运行速度上要比传统的C++慢许多之外，Java无法直接访问到操作系统底层（如系统硬件等)， 	

为此Java使用native方法来扩展Java程序的功能。 	

 	

 	

native扩展： 	

 一. 什么是Native Method 		 		  

​		简单地讲，一个Native Method就是一个java调用非java代码的接口。一个Native Method是这样一个java的方法：该方法的实现由非java语言实现，比如C。这个特征并非java所特有，很多其它的编程语言都有这一机制，比如在C＋＋中，你可以用extern "C"告知C＋＋编译器去调用一个C的函数。 		 		
 		 		
 二.为什么要使用Native Method 		 		 

​		 java使用起来非常方便，然而有些层次的任务用java实现起来不容易，或者我们对程序的效率很在意时，问题就来了。 		 		
 		与java环境外交互： 		 		  

​		有时java应用需要与java外面的环境交互。这是本地方法存在的主要原因，你可以想想java需要与一些底层系统如操作系统或某些硬件交换信息时的情况。本地方法正是这样一种交流机制：它为我们提供了一个非常简洁的接口，而且我们无需去了解java应用之外的繁琐的细节。 		 		
 		与操作系统交互： 		 		 

​		 JVM支持着java语言本身和运行时库，它是java程序赖以生存的平台，它由一个解释器（解释字节码）和一些连接到本地代码的库组成。然而不管怎 样，它毕竟不是一个完整的系统，它经常依赖于一些底层（underneath在下面的）系统的支持。这些底层系统常常是强大的操作系统。通过使用本地方法，我们得以用java实现了jre的与底层系统的交互，甚至JVM的一些部分就是用C写的，还有，如果我们要使用一些java语言本身没有提供封装的操作系统的特性时，我们也需要使用本地方法。 		 		
 三.JVM怎样使Native Method跑起来： 		 		    

​		我们知道，当一个类第一次被使用到时，这个类的字节码会被加载到内存，并且只会回载一次。在这个被加载的字节码的入口维持着一个该类所有方法描述符的list，这些方法描述符包含这样一些信息：方法代码存于何处，它有哪些参数，方法的描述符（public之类）等等。 		 		   

​		 如果一个方法描述符内有native，这个描述符块将有一个指向该方法的实现的指针。这些实现在一些DLL文件内，但是它们会被操作系统加载到java程序的地址空间。当一个带有本地方法的类被加载时，其相关的DLL并未被加载，因此指向方法实现的指针并不会被设置。当本地方法被调用之前，这些DLL才会被加载，这是通过调用java.system.loadLibrary()实现的。 		 		

 		

### 9.3 类和类之间的关系

```java
public class Boy {
    //有钱：
    public void havemoney(){
        System.out.println("买买买。。。180 180 180 180");
    }
}
```

```java
public class Girl {
    String name;
    int age;
    double weight;
    Mom m;//将另一个类作为属性
    //找男朋友：
    public void love(Boy b){//将另一个类作为形参传入
        b.havemoney();
    }
    //跟妈妈聊天：
    public void say(){
        m.wechat();
    }
}
```

```java
public class Mom {
    public void wechat(){
        System.out.println("跟妈妈微信聊天。。。");
    }
}
```

```java
public class Test {
    public static void main(String[] args) {
        //有一个具体的男孩：
        Boy b=new Boy();
        //有一个具体的女孩：
        Girl g=new Girl();
        //谈恋爱：
        g.love(b);
        //中华儿女千千万 不行咱就换：
        Boy b2=new Boy();
        g.love(b2);
        //小女孩跟妈妈聊天：
        //具体的妈：
        g.name="lili";
        g.age=10;
        g.m=new Mom();
        g.say();
    }
}
```

说明：

一、继承关系       

​		继承指的是一个类（称为子类、子接口）继承另外的一个类（称为父类、父接口）的功能，并可以增加它自己的新功能的能力。在Java中继承关系通过关键字extends明确标识，在设计时一般没有争议性。在UML类图设计中，继承用一条带空心三角箭头的实线表示，从子类指向父类，或者子接口指向父接口。  

二、实现关系       

​		实现指的是一个class类实现interface接口（可以是多个）的功能，实现是类与接口之间最常见的关系。在Java中此类关系通过关键字implements明确标识，在设计时一般没有争议性。在UML类图设计中，实现用一条带空心三角箭头的虚线表示，从类指向实现的接口。  

三、依赖关系       

​		简单的理解，依赖就是一个类A使用到了另一个类B，而这种使用关系是具有偶然性的、临时性的、非常弱的，但是类B的变化会影响到类A。比如某人要过河，需要借用一条船，此时人与船之间的关系就是依赖。表现在代码层面，让类B作为参数被类A在某个method方法中使用。在UML类图设计中，依赖关系用由类A指向类B的带箭头虚线表示。

四、关联关系   

​		关联体现的是两个类之间语义级别的一种强依赖关系，比如我和我的朋友，这种关系比依赖更强、不存在依赖关系的偶然性、关系也不是临时性的，一般是长期性的，而且双方的关系一般是平等的。关联可以是单向、双向的。表现在代码层面，为被关联类B以类的属性形式出现在关联类A中，也可能是关联类A引用了一个类型为被关联类B的全局变量。在UML类图设计中，关联关系用由关联类A指向被关联类B的带箭头实线表示，在关联的两端可以标注关联双方的角色和多重性标记。   

五、聚合关系       

​		聚合是关联关系的一种特例，它体现的是整体与部分的关系，即has-a的关系。此时整体与部分之间是可分离的，它们可以具有各自的生命周期，部分可以属于多个整体对象，也可以为多个整体对象共享。比如计算机与CPU、公司与员工的关系等，比如一个航母编队包括海空母舰、驱护舰艇、舰载飞机及核动力攻击潜艇等。表现在代码层面，和关联关系是一致的，只能从语义级别来区分。在UML类图设计中，聚合关系以空心菱形加实线箭头表示。  

六、组合关系      

组合也是关联关系的一种特例，它体现的是一种contains-a的关系，这种关系比聚合更强，也称为强聚合。它同样体现整体与部分间的关系，但此时整体与部分是不可分的，整体的生命周期结束也就意味着部分的生命周期结束，比如人和人的大脑。表现在代码层面，和关联关系是一致的，只能从语义级别来区分。在UML类图设计中，组合关系以实心菱形加实线箭头表示。  

七、总结      

对于继承、实现这两种关系没多少疑问，它们体现的是一种类和类、或者类与接口间的纵向关系。其他的四种关系体现的是类和类、或者类与接口间的引用、横向关系，是比较难区分的，有很多事物间的关系要想准确定位是很难的。前面也提到，**这四种关系都是语义级别的，所以从代码层面并不能完全区分各种关系**，但总的来说，后几种关系所表现的强弱程度依次为：组合>聚合>关联>依赖。 

### 9.4 多态

​		多态意味着“不同的形式”，在面对对象的程序设计中，我们持有从基类继承而来的相同**接口**，以及使用该接口的不同形式，不同版本的动态绑定方法。

​		多态跟属性无关！ 

说明：

​		父类	---》再有子类：   继承  

​		有子类  --》提取父类：  泛化 （dog，cat 提取父类Animal）

【1】啥叫多态？ 

​			多种状态 ，动物可以是猫、狗、鱼等

【2】多态的好处： (重点理解) 

​			**提高了代码的扩展性，你增加代码，对其他类的影响降到了最低**

​		（多态可以提高扩展性，但是没有达到最好，---》反射

【3】多态构成要素：（重点实现）

​		（1）继承  Cat  extends Animal 

​		（2）重写  shout() {猫叫} ，有继承才有重写 

​		（3）**==父类引用指向子类对象==**  `Animal an = new Cat();  // 父类的引用 = 子类的对象`

```java
Cat c=new Cat(); // 子类的对象
Animal an = c; // 合成一句: Animal an=newCat();
```

应用代码实例：

1. 有一个抽象出来的父类

```java
package com.sxt.test02;
/*
多态的关键
	1. 有一个抽象出来的父类
	2. 子类继承并重写父类中的方法
	3. 父类引用指向子类的对象（最关键）
 */
public class Animal {

    // 我是小动物，我会叫
    public void shout(){
        System.out.println("我是小动物，我会叫");
    }
}
```

2. 子类继承并重写父类的方法

```java
package com.sxt.test02;

public class Cat extends Animal{

    // 叫
    public void shout(){
        System.out.println("我是小猫，我可以喵喵喵。。。");
    }

    // 挠人
    public void scratch(){
        System.out.println("我是小猫，我可以挠人。。。");
    }

}
```

```java
package com.sxt.test02;

public class Dog extends Animal{

    // 叫 --> 我是小狗，我可以汪汪叫
    public void shout(){
        System.out.println("我是小狗，我可以汪汪叫。。。");
    }

    // 看家护院 --> 我是小狗， 我可以看家护院
    public void look(){
        System.out.println("我是小狗，我可以看家护院");
    }
}
```

```java
package com.sxt.test02;

public class Fish extends Animal{

    // 我是鱼，我可以吐泡泡。。。
    public void shout(){
        System.out.println("我是鱼，我可以吐泡泡。。。");
    }
}
```



```java
package com.sxt.test02;

public class Girl {

    // 小女孩的方法: 跟谁玩：跟猫玩儿--->我一根猫玩，猫就开始的叫起来来了
    public void play(Cat c){ // 引用对象
        c.shout();
    }

    // 跟狗玩儿--->狗叫
    public void play2(Dog g){
        g.shout();
    }

    // 你随意添加扩展，但是对其他类的影响降到最低
    // 跟小动物儿--->小动物叫
    public void play3(Animal an){
        an.shout();
    }
}
```

3. 父类指向子类对象的引用

```java
package com.sxt.test02;

import org.w3c.dom.ls.LSOutput;

public class Test {

    public static void main(String[] args) {

        // 具体的猫
        Cat c = new Cat();

        // 具体的小女孩
        Girl g = new Girl();

        // 小女孩和猫玩儿
        g.play(c);

        System.out.println("------------------");
        // 具体的狗
        Dog d = new Dog();

        // 跟狗玩儿
        d.shout();

        System.out.println("------------------");

        // 小女孩跟小动物完
        Animal an = new Animal();

        // 具体的小动物：（我想让动物是一只具体的猫）
        an = new Cat(); // 上面两句可以合成: Animal an = new Cat();

        // 具体的小动物：（我想让动物是一直具体的狗）
        Animal an2 = new Dog();

        // 具体的小动物：（我想让动物是一直具体的鱼）
        Animal an3 = new Fish();

        g.play3(an);
        g.play3(an2);
        g.play3(an3);

    }
}
```

虚函数：

​		**java的普通成员函数（没有被static、native等关键字修饰）就是虚函数，原因很简单，它本身就实现虚函数实现的功能------多态。**



#### 9.4.1 内存分析

![image_26691](https://tva1.sinaimg.cn/large/0081Kckwly1gmc5lmn5aej310h0e20u5.jpg)

说明：

1. 只要子类重写，就会调用子类重写后的shout

#### 9.4.2 向上转型，向下转型

（视频无声音）

#### 9.4.3 简单工程设计模式

（视频无声音）



## 10. final

```java
public class Test {
    public static void main(String[] args) {
      
        //1......
        final int A = 10;//基本数据类型被final修饰，它的数值不可以被修改。
        // A=20;
        System.out.println(A);
        //当一个变量被final修饰，它就变成了一个常量，它的值不可以再被修改。
        //建议名字全部大写
      
      	//2......
        final Dog d=new Dog();//引用数据类型被final修饰，它的地址值不可以被修改。
        d.age = 10;
        d.age = 20;
        //d=new Dog();--->不可以
        
      	//3.......
        final Dog d2=new Dog();
        a(d2);//可以
        
      	//4.....
        final Dog d3=new Dog();
        b(d3);
        Dog d4=new Dog();
        b(d4);
    }
    public static void a(Dog d){
        d=new Dog();//可以
    }
    public static void b(final Dog d){
       // d=new Dog(); 不可以
    }
}
```

说明：

1. final修饰变量：基本数据类型被final修饰，它的数值不可以被修改。

2. final修饰类：如果一个类被final修饰，那么这个类就不可以被继承

3. final修饰方法： 

   （1）如果一个方法被final修饰，那么子类不可以重写这个方法 

   （2）虽然子类不能重写了，但是调用都是可以的！ 



## 11. 抽象类和抽象方法



```java
//3.只要类中有抽象方法，这个类就变成一个抽象类。
//4.那么抽象类中可以有0,1,2,,,,,n个抽象方法，
public abstract class Person {
  
    //1.在一个类中，有一部分方法，子类对他永远满意，直接用，不用重写
    public void eat(){
        System.out.println("吃食物");
    }
  
  	//在一个类中，还有一部分方法，无论怎么写子类都不满意，都要对它进行重写。
    //对于这样的方法，方法体就没有必要再写了
  
    //2.假如一个方法没有方法体，只有方法的声明，那么这个方法就变成了一个抽象方法
    public abstract void say();
    public abstract  void sleep();
  
}

//5.抽象类可以被继承吗？可以的，必须重写全部的抽象方法。
//6.假如子类没有重写全部的抽象方法，那么这个类也可以变为一个抽象类。
class Student extends Person{
    @Override
    public void say() {
        System.out.println("说普通话。。");
    }
    @Override
    public void sleep() {
    }
}

class Test{
    public static void main(String[] args) {
      
        //7.可否创建抽象类的对象：抽象类不可以创建对象。
        //Person p=new Person();
        Student s=new Student();
        s.eat();
        s.say();
        s.sleep();
        //8.就想创建抽象类的对象：
        Person p=new Student();//多态
    }
}
```

说明：

1. 为什么需要抽象类? 如何定义抽象类? 

   ​	是一种模版模式。 

   ​	抽象类为所有子类提供了一个通用模版，子类可以在这个模版基础上进行扩展。 

   ​	通过抽象类，可以避免子类设计的随意性。通过抽象类，我们就可以做到严格限制子类的设计，使子类之间更加通用。 

2. 面试题： 

   （1）抽象类不能创建对象，那么抽象类中是否有构造器？ 

   ​			必须有构造器，因为这个构造器不是给抽象类用的，而是给子类创建对象的时候调用的。 

   （2）抽象类可否被final修饰？ 

   ​			不可以的 

   ​			final修饰不能被子类继承，但是抽象类就是给子类定义模板的。 
   
   注：抽象基类简称抽象类

 ## 12. 接口

### 12.1 接口的定义

​		interface关键字使抽象方法更向前迈进了一步。abstract关键字允许人们创建一个或多个**没有任何定义的方法**——提供了接口部分，但是没有提供任何相应的具体实现，这些方法的实现是有子类的继承者实现的。

​		interface这个关键字产生一个完成抽象的类，它根本没有提供任何具体实现。它允许（这个抽象类的)创建者确定方法名、参数列表和返回类型，但是没有任何方法体。接口只提供了形式，而未提供任何具体实现。（java编程思想p172）

### 12.2 接口的好处

​		1.类与接口的关系，实现关系，而且是多实现，一个类可以实现多个接口，类与类之间是继承关系，java中的继承是单一继承，一个类只能有一个父类，打破了继承的局限性。

​		2.对外提供规则（USB接口）

​		3.降低了程序的耦合性（可以实现模块化开发，定义好规则，每个人实现自己的模块，提高了开发的效率）

### 12.3 接口的实现


```java
/*
//1.一个类假如是抽象类，那么其中可以有普通方法，也可以有抽象方法。
//2.当一个类中全部是抽象方法的时候，就变成了一个接口。（JDK1.8）, 因为接口中的方法就是抽象方法
//3.看着好像接口是特殊的抽象类，但是实际上  接口是接口，类是类。--》接口不是类。
//4.引用数据类型：类，数组，接口
//5.接口中有构造器吗？没有
//6.如何定义一个接口？interface
//7.接口中有啥啊？（JDK.1.8之前：）
	（1）常量：固定的修饰符：public static final
	（2）抽象方法：public abstract
		前面的确是有固定的修饰符，但是假如不写，系统会默认帮助我们补全。
		建议：自己全部都加上。
 */
public interface Test {
    //定义常量：
    public static final int NUM=10;
    public final int NUM2=20;
    //定义抽象方法：
    public abstract void eat();
    abstract void sleep();
}

interface Test2{
    public abstract  void study();
    public abstract  void drink();
}

    /*
    8.类和接口之间是什么关系呢？实现关系:implements
    9.一个类要是实现一个接口，必须要实现全部的抽象方法。
      Student--》实现类。
    10.一个类可以实现多个接口。
       一个类只能单继承。
    11.假如没有实现全部的抽象方法，那么这个类变成了一个抽象类。
    12.一个类可以既实现接口又继承其他类吗？可以：
        但是格式必须：先继承再实现：
        extends Person implements Test,Test2
    13.疑问？为啥可以实现多个接口，但是继承只有一个？
     */

class Student extends Person implements Test,Test2 {
    @Override
    public void eat() {
        System.out.println("我可以吃饭");
    }
    @Override
    public void sleep() {
        System.out.println("我可以睡觉。");
    }
    @Override
    public void study() {
        System.out.println("我可以学习");
    }
    @Override
    public void drink() {
        System.out.println("我可以喝酒。");
    }
}

class Person{
}

class Demo{
    public static void main(String[] args) {
        //14.给接口创建对象：
        //Test t=new Test();
        Test t=new Student();//接口 = 实现类 ---》多态
        t.eat();
        //15.访问Test接口中的NUM常量：
        System.out.println(Test.NUM);
        Student s=new Student();
        System.out.println(s.NUM);
        System.out.println(Student.NUM);
    }
}
```

说明:

​	1. 继承和接口的区别 (应用场景) 

​		手机 是一个 照相机  。 

​		手机    extends     照相机（安装胶卷）  *这里手机没有完全继承照相机的能力，所以用extend不合适，所以用接口*

​		手机具备照相的能力 

​			继承：“is-a” *什么什么是什么可以用继承表示*

​			接口："has-a" '什么什么有什么用接口表示' 

​	2， 接口举例

​		Fly接口： 

​		飞机，小鸟，风筝 

​		小鸟  extends Animal implements Fly接口 



## 13. 内部类

可以将一个类的定义放在另一个类的内部，这就是内部类。

​		 内部类作用： 

​		（1）创建了比private权限更小的范围。 

​		（2）可以帮助我们实现java的多继承。 

#### 13.1 成员内部类 

​		**成员内部类本身可以访问外部的所有资源，但是自身不能定义静态资源，因为其实例化本身就还依赖着外部类。**

```java
//2.外部类权限修饰符：public ,default,
public class TestOuter {
    /*
    类中组成部分：
    属性，方法，构造器，代码块（普通块，静态块，构造块，同步块），内部类
		内部类：1.成员内部类   4.匿名内部类： 2.静态内部类  3.方法内部类
     */
    private int age; // 属性
    int a=10; // 属性
    public void eat(){ // 方法
        {
            System.out.println("这是普通块");
        }
        //4.在外部类中访问内部类的属性：
        //System.out.println(name);不行
        TestInner t=new TestInner();
        System.out.println(t.name);//行
    }
    public TestOuter(){ // 构造器
    }
    {
        System.out.println("这是构造块");
    }
  
    static{ // 代码块
        System.out.println("静态块");
    }
  
    //1.成员内部类：前面的权限修饰符：public ,default,private,protected
    private class TestInner{
        String name;
        int a=20;
        public void sleep(){
            //3.内部类中可以访问外部类的属性：
            System.out.println(age);
            int a=30;
            //7.当局部变量和外部类，内部类属性重名时候如何访问：
            System.out.println(a);//30
            System.out.println(this.a);//20
            System.out.println(TestOuter.this.a);//10
        }
    }
    public static void main(String[] args) {
        //5.创建外部类对象：
        TestOuter to=new TestOuter();
        //6.创建内部类对象：
        //TestInner t=new TestInner();不行
        int age=to.age;
        TestInner ti=to.new TestInner();
    }
}
```

1.成员内部类：前面的权限修饰符：public ,default,private,protected

5.创建外部类对象：

```java
public class TestOuter {   
		public static void main(String[] args) {
        //5.创建外部类对象：
        TestOuter to=new TestOuter();
    }
}
```



6.创建内部类对象：

```java
public class TestOuter {   
		public static void main(String[] args) {
        //6.创建内部类对象：
        //TestInner t=new TestInner();不行
      	TestOuter to = new TestOuter();
        int age=to.age;
        TestInner ti=to.new TestInner();
    }
}
```



7.当局部变量和外部类，内部类属性重名时候如何访问：

```java
public class TestOuter {
    public class TestInner{
        // 7. 当局部变量和外部类，内部属性重名时如何访问：
        System.out.println(a); // 30 局部变量和属性重名，访问离得近的那个
        System.out.println(this.a); // 20
        System.out.println(TestOuter.this.a); // 10 外部类对象的a
    }
}
```



8.内部类会产生一个独自的字节码文件：

9.内部类作用： 

（1）创建了比private权限更小的范围。 

（2）可以帮助我们实现java的多继承。 

 

#### 13.2 静态内部类  

​		 **静态内部类本身可以访问外部的静态资源，包括静态私有资源。但是不能访问非静态资源，可以不依赖外部类实例而实例化。**



#### 13.3 方法内部类





#### 13.4 匿名内部类

​		匿名内部类就是没有名字的内部类。

​		正因为没有名字所以匿名内部类只能使用一次，它通常用来简化代码编写。

​		但是使用匿名内部类有个前提条件：必须继承一个父类或者实现一个接口。

```java
        showHouse(new LianJIaHouse() { // LianJIaHouse() 是一个接口
            @Override
            public void address() {
                System.out.println("南京。。。");
            }

            @Override
            public void price() {
                System.out.println("七亿。。。");
            }
        })
```

```java
public interface LianJIaHouse {

    // 告诉你房子的位置
    public void address();
    // 告诉你房价的价格
    public void price();
}
```



【1】应用

​		在项目中，这个类只应用一次，那么就可以用匿名内部类。 

​		---在java中，没有那么重要---》在安卓中用的多。 

【2】代码：

```java
public interface LianJiaHouse { // 链家
    //告诉你房子的位置
    public void address();
    //告诉你房子的价格
    public void price();
}
```



```java
public class Bj implements LianJiaHouse{
    @Override
    public void address() {
        System.out.println("北京五环。。");
    }
    @Override
    public void price() {
        System.out.println("三万一平。。");
    }
}
```

```java
public class Tj implements LianJiaHouse{
    @Override
    public void address() {
        System.out.println("天津市中心。。");
    }
    @Override
    public void price() {
        System.out.println("五万一平。。");
    }
}
```

重点看下面的测试类！！！

```java
package com.sxt.test09;

public class Test {

    public static void main(String[] args) {
        Bj b1 = new Bj();
//        b1.address();
//        b1.price();
        showHouse(b1);

        Bj b2 = new Bj();
//        b1.address();
//        b1.price();
        showHouse(b2);

        Tj t1 = new Tj();
        showHouse(t1);

        Tj t2 = new Tj();
        showHouse(t2);

//        Guju g = new Guju();
//        showHouse(g);

        // 如果只用一次，用下面这种写法

        // 匿名内部类（匿名：lj是对象名字，不是类的名字，只有接口的名字；内部类：是在类内部的，里面的方法都是在类内部才有的东西）
        // 相当于创建了一个匿名内部类的对象给了lj
/*         LianJIaHouse lj = new LianJIaHouse() {
             @Override
             public void address() {
                 System.out.println("南京。。。");
             }

             @Override
             public void price() {
                 System.out.println("七亿。。。");
             }
         };*/

        // 除了这种方法，还可以用
        showHouse(new LianJIaHouse() {
            @Override
            public void address() {
                System.out.println("南京。。。");
            }

            @Override
            public void price() {
                System.out.println("七亿。。。");
            }
        });
    }

/*    public static void showHouse(Bj bj){
        bj.address();;
        bj.price();
    }

    public static void showHouse(Tj tj){
        tj.address();;
        tj.price();
    }*/

    // 将上述两个方法换成下面一个
    public static void showHouse(LianJIaHouse lj){ // 这里接口当做方法的形参，具体传入的是实现类，多态的一种应用
        lj.address();
        lj.price();
    }
}
```

​		注：在匿名类中不吭有命名构造器（因为根部不可能有名字！）但通过实例初始化，就能够达到为匿名对象传建一个构造器的效果。

​				所以对于内部类而言，实例化初始化的实际效果就是构造器。当然它也受到了限制——你不能重载实例化方法，所以你仅有一个这样的构造器。



应用：修改一下之前的代码

```java
public class Test {
    public static void main(String[] args) {
        Student a=new Student(28,"Alili",178.5);
        Student b=new Student(19,"aanana",171.5);
        /*Comparator bj= new Comparator(){
            @Override
            public int compare(Object o1, Object o2) {
                Student a= ((Student) o1);
                Student b= ((Student) o2);
                return a.name.compareTo(b.name);
            }
        };
        int num= bj.compare(a,b);*/
       int num = new Comparator(){
            @Override
            public int compare(Object o1, Object o2) {
                Student a= ((Student) o1);
                Student b= ((Student) o2);
                return a.name.compareTo(b.name);
            }
        }.compare(a,b);
        System.out.println(num);
    }
}
```


​		此外，静态内部类和方法内部类应用极少所以不讲



## 14.== 与 equals

== : 它的作用是判断两个对象的地址是否相等。即判断两个对象是否是同一个对象。（基本数据类型==比较的是值，引用数据类型==比较的是内存地址）

equals(): 它的作用也是判断两个对象是否相等。但是一般有两种情况：

* 情况1：类没有override equals()方法。则通过equals()比较该类的两个对象时，等价于通过“==”比较两个对象。

* 情况2：类override equals()方法，一般都override equals()方法来比较两个对象的内容相同，如果相同则返回true。

  补充：【重写equals的时候为什么需要重写hashcode】因为如果只重写了 equals 方法，两个对象 equals 返回了true，但是如果没有重写 hashCode 方法，集合还是会插入元素。这样集合中就出现了重复元素了。

```java
public class Test {

    public static void main(String[] args){

        String a = new String("ab"); // a为一个引用
        String b = new String("ab"); // b为另一个引用，对象的内容都是一样的

        String aa = "ab"; // 放入常量池中
        String bb = "ab"; // 从常量池中查找

        System.out.println(aa == bb); // true
        System.out.println(a == b); // false
        System.out.println(a.equals(b)); // true: String类 override equals方法
        System.out.println(42==42.0); // true
      
    }
}
```

说明：

1. String中的equals方法是被重写过的，因为Object的equals是比较的两个对象的地址，而String的equals方法比较的是对象的值。
2. 当创建String类型的对象时，虚拟机会在常量池中查找有没有已经存在的值和要创建的值相同的对象，如果有就把它赋给当前的引用。如果没有就在常量池中重新创建一个String对象。

