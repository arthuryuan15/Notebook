# 1 Spring的概述[了解]

​		针对Spring的学习，第一步就是理解IoC和AOP这是基础；

​		然后学习SpringMVC,其实还是Java EE开发

​	![框架](https://tva1.sinaimg.cn/large/006y8mN6ly1g8pjcvuqw3j30wh0g1wmd.jpg)



三层架构：即表现层、业务层、持久层。

1. 持久层：采用DAO模式，建立实体类和数据库表映射（ORM映射）。也就是哪个类对应哪个表，哪个属性对应哪个列。持久层的目的就是，完成对象数据和关系数据的转换。

2. 业务层：采用事务脚本模式。将一个业务中所有的操作封装成一个方法，同时保证方法中所有的数据库更新操作，即保证同时成功或同时失败。避免部分成功部分失败引起的数据混乱操作。

3. 表现层：采用MVC模式。

​        M称为模型，也就是实体类。用于数据的封装和数据的传输。

​        V为视图，也就是GUI组件，用于数据的展示。

​        C为控制，也就是事件，用于流程的控制



## 1.3 spring的优势

* 方便解耦，简化开发 
* AOP 编程的支持 
* 声明式事务的支持 
* 方便程序的测试 
* 方便集成各种优秀框架 
* 降低 JavaEE API 的使用难度

## 1.4 Spring的结构

![1](https://tva1.sinaimg.cn/large/006y8mN6ly1g8pjk2027aj30ki0egtd5.jpg)



Core Container ： 核心容器 IOC（控制翻转）



# 2 程序的耦合和解耦

 		曾经案例中的问题

​		 工程模式解耦

```java
package com.yjs.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/*
 * 程序的耦合
 *       耦合：程序间的依赖关系
 *           包括：
 *               类之间的依赖
 *               方法间的依赖
 *       解耦：
 *           降低程序间的依赖关系
 *       实际开发中：
 *           应该做到，编译器不依赖，运行时才依赖
 *       解耦的思路：   
 *           第一步，使用反射来创建对象，而避免使用new关键字。
 *           第二步，通过读取配置文件来获取要创建的对象全限类名
 *
 * */
public class jdbcDemo1 {
    public static void main(String[] args) throws Exception{
        // 1. 注册驱动
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        // 2. 获取连接
        Connection conn = new DriverManager.getConnection("jdbc:mysql://localhost:3306/eesy", "root", "yjs1994");
        // 3. 获取操作数据库的预处理对象
        PreparedStatement pstm = conn.prepareStatement("select * from account");
        // 4. 执行SQL，得到结果集
        ResultSet rs = pstm.executeQuery();
        // 5. 遍历结果集
        while(rs.next()){
            System.out.println(rs.getString("name"));
        }
        // 6. 释放资源
        rs.close();
        pstm.close();
        conn.close();
    }
}

```



## 2.1 编写工厂类和配置文件

**1 dao**

```java
package com.itheima.dao;

/*
* 账户的持久层接口
* */
public interface IAccountDao {
    /*
    * 模拟保存账户
    * */
    void saveAccount();
}
```

```java
package com.itheima.dao.impl;

import com.itheima.dao.IAccountDao;
import com.itheima.factory.BeanFactory;

/*
* 账户的持久层实现类
* */

public class AccountDaoImpl implements IAccountDao {

    public void saveAccount(){
        System.out.println("保存了账户");
    }
}
```

**2 service**

```java
package com.itheima.service.impl;

import com.itheima.dao.IAccountDao;
import com.itheima.dao.impl.AccountDaoImpl;
import com.itheima.factory.BeanFactory;
import com.itheima.service.IAccountService;

/*
* 账户的业务层实现类
* */

public class AccountServiceImpl implements IAccountService {

    // private IAccountDao accountDao = new AccountDaoImpl();
    private IAccountDao accountDao = (IAccountDao)BeanFactory.getBean("accountDao");

    private int i = 1;

    public void saveAccount(){
         accountDao.saveAccount();
        System.out.println(i);
        i++;

    }

}
```

```java
package com.itheima.service;
/*
* 业务层的接口
* */
public interface IAccountService {
    /*
    * 模拟保存账户
    * */
    void saveAccount();

}
```

**3 bean factory**

```java
package com.itheima.factory;

/**
* 一个创建Bean对象的工厂
*
* Bean，在计算机语言中，有可重用组件的含义
* JavaBean：
*       javabean > 实体类
*
*   他就是创建我们的service和dao对象的。
*
*   第一个，需要一个配置文件来配置我们的service和dao
*           配置内容：唯一标识=全限定类名（key-value）
*   第二个，通过读取配置文件中配置的内容，反射创建内容
*
*   我的配置文件可以是xml（也可以是properties）
*
* */

import java.io.InputStream;
import java.util.Properties;

public class BeanFactory  {

    // 定义一个properties对象
    private static Properties props;

    // 使用静态代码块为Properties对象赋值
    static {
        try {
            // 实例化对象
            props = new Properties();
            // 获取properties文件的流对象
            InputStream is = BeanFactory.class.getClassLoader().getResourceAsStream("bean.properties");
            props.load(is);
        }catch (Exception e){
            throw new ExceptionInInitializerError("初始化properties 失败！");
        }
    }
    /**
     * 根据bean的名称获取bean对象
     * @param beanName
     * @return
     */
    public static Object getBean(String beanName){
        Object bean = null;
        try {
            String beanPath = props.getProperty(beanName);
//            System.out.println(beanPath);
            bean = Class.forName(beanPath).newInstance();
        }catch (Exception e){
            e.printStackTrace();
        }
        return bean;
    }

}
```

**4 ui**

```java
package com.itheima.ui;

import com.itheima.factory.BeanFactory;
import com.itheima.service.IAccountService;
import com.itheima.service.impl.AccountServiceImpl;

/*
* 模拟一个表现层，用于调用业务层
* */
public class Client {

    public static void main(String[] args) {
        // IAccountService as = new AccountServiceImpl();
        for(int i = 0; i < 5; i++){
            IAccountService as = (IAccountService)BeanFactory.getBean("accountService");
            System.out.println(as);
            as.saveAccount();
        }

    }
}
```



分析工厂模式中存在的问题：

```
"/Applications/IntelliJ IDEA.app/Contents/jbr/Contents/Home/bin/java" "-javaagent:/Applications/IntelliJ IDEA.app/Contents/lib/idea_rt.jar=53786:/Applications/IntelliJ IDEA.app/Contents/bin" -Dfile.encoding=UTF-8 -classpath /Users/yuanjinshuai/IdeaProjects/day01_eesy_02factory/target/classes com.itheima.ui.Client
com.itheima.service.impl.AccountServiceImpl@7f63425a
保存了账户
1
com.itheima.service.impl.AccountServiceImpl@36d64342
保存了账户
1
com.itheima.service.impl.AccountServiceImpl@39ba5a14
保存了账户
1
com.itheima.service.impl.AccountServiceImpl@511baa65
保存了账户
1
com.itheima.service.impl.AccountServiceImpl@340f438e
保存了账户
1
```

上述工厂模式是多例设计模式（多例，是指多个实例对象）



# 3 IoC概念和spring中的IOC

​		Inversion of Control（控制反转），别名Dependency Injection（依赖注入）

​		在IoC场景中，被注入对象和被依赖对象之间通过**IoC Service Provider**沟通，两者由IoC Service Provider统一管理

## 3.1 ioc概念和作用

```java
public class AccountServiceImpl implements IAccountService {

    // private IAccountDao accountDao = new AccountDaoImpl();
    private IAccountDao accountDao = (IAccountDao)BeanFactory.getBean("accountDao");
```

```java
private IAccountDao accountDao = new AccountDaoImpl();
```

![A](https://tva1.sinaimg.cn/large/006y8mN6ly1g8r31zbowbj30w40gowga.jpg)

```
private IAccountDao accountDao = (IAccountDao)BeanFactory.getBean("accountDao");
```

![b](https://tva1.sinaimg.cn/large/006y8mN6ly1g8r34b8erwj30za0m2gow.jpg)



说明：

1. `AccountServiceImpl`这个类有自己的使用权利，到底使用new，还是工厂方法，都是可以创建对象的。
2. 当用工厂模式创建的时候，说明new把可以完全通过自己找到DOU的权利放弃了，把这个权利交给BeanFactory类，然后通过这个BeanFactory类和一个固定的名称之后找到我们想要的bean对象
3. 那么这种创建对象的权利转移，我们叫做控制翻转

### 3.1.1 官方概念

​		控制反转（Iversion of Control）把创建对象的权利交给框架，是框架的重要特征，并非面向对象编程的专门术语。它包括依赖注入（Dependency Injection）和依赖查找（Dependency Lookup）

```
**Spring IOC 容器就像是一个工厂一样，当我们需要创建一个对象的时候，只需要配置好配置文件/注解即可，完全不用考虑对象是如何被创建出来的。** IOC 容器负责创建对象，将对象连接在一起，配置这些对象，并从创建中处理这些对象的整个生命周期，直到它们被完全销毁。
```





###3.1.2 作用

​		削减计算机程序的耦合（解除我们代码中的依赖关系）



# 4 使用Spring的IOC解决程序耦合

## 4.1 Spring中的IOC的前期准备

### 4.1.1准备 spring 的开发包 

​	导入jar包或者直接在xml中添加，idea自动导入

### 4.1.2 创建业务层接口和实现类 

```java
/**
  * 账户的业务层接口
  * @author 黑马程序员
  * @Company http://www.ithiema.com
  * @Version 1.0
*/

public interface IAccountService {
  /**
    * 保存账户（此处只是模拟，并不是真的要保存）
  */
  void saveAccount();
  }

  /**
    * 账户的业务层实现类
    * @author 黑马程序员
    * @Company http://www.ithiema.com
    * @Version 1.0
  */

  public class AccountServiceImpl implements IAccountService {
    private IAccountDao accountDao = new AccountDaoImpl();//此处的依赖关系有待解决
    @Override
    public void saveAccount() {
    	accountDao.saveAccount();
    }
}
```



### 4.1.3 创建持久层接口和实现类 

```java
/**
  * 账户的持久层接口
  * @author 黑马程序员
  * @Company http://www.ithiema.com
  * @Version 1.0
*/

public interface IAccountDao {
  /**
  	* 保存账户
  */
	void saveAccount();
	}

  /**
    * 账户的持久层实现类
    * @author 黑马程序员
    * @Company http://www.ithiema.com
    * @Version 1.0
  */
  public class AccountDaoImpl implements IAccountDao {
  	@Override
    public void saveAccount() {
      System.out.println("保存了账户");
    }
}
```



## 4.2 基于 XML 的配置 

第一步：拷贝必备的 jar 包到工程的 lib 目录中

第二步：在类的根路径下创建一个任意名称的 xml 文件（不能是中文）

第三步：让 spring 管理 资源， 在prom.xml配置文件中配置 service 和 dao

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
        https://www.springframework.org/schema/beans/spring-beans.xsd">
  
    <!-- 把对象的创建交给spring来管理 -->
    <bean id = "accountService" class="com.itheima.service.impl.AccountServiceImpl"></bean>
    <bean id = "accountDao" class="com.itheima.dao.impl.AccountDaoImpl"></bean>

</beans>
```



## 4.3 Spring 基于 XML 的 IOC 细节 

### 4.3.1 spring中工厂的类结构图

### 4.3.2 IOC中bean标签和管理对象细节

**（1）bean标签**

​		1. 作用：

​			用于配置对象让 spring 来创建的。

​			默认情况下它调用的是类中的无参构造函数。如果没有无参构造函数则不能创建成功。

​		2. 属性：

​			id：给对象在容器中提供一个唯一标识。用于获取对象。

​			class：指定类的全限定类名。用于反射创建对象。默认情况下调用无参构造函数。

​			scope：指定对象的作用范围。

​				**singleton :默认值，单例的.**

​				**prototype :多例的.**

**（2）bean 的作用范围和生命周期**

1. 单例对象：scope="singleton"

   ​	一个应用只有一个对象的实例。它的作用范围就是整个引用。

   ​	生命周期：

   ​		对象出生：当应用加载，创建容器时，对象就被创建了。

   ​		对象活着：只要容器在，对象一直活着。

   ​		对象死亡：当应用卸载，销毁容器时，对象就被销毁了。

2. 多例对象：scope="prototype"

   ​	每次访问对象时，都会重新创建对象实例。

   ​	生命周期：

   ​		对象出生：当使用对象时，创建新的对象实例。

   ​		对象活着：只要对象在使用中，就一直活着。

   ​		对象死亡：当对象长时间不用时，被 java 的垃圾回收器回收了。

**（3）实例化 Bean 的三种方式**

第一种方式：使用默认无参构造函数

```xml
<!--在默认情况下：

它会根据默认无参构造函数来创建类对象。如果 bean 中没有默认无参构造函数，将会创建失败。-->

<bean id="accountService" class="com.itheima.service.impl.AccountServiceImpl"/>
```

第二种方式： spring 管理静态工厂 -使用静态工厂的方法创建对象

```java
/**
* 模拟一个静态工厂，创建业务层实现类
*/

public class StaticFactory {
	public static IAccountService createAccountService(){
		return new AccountServiceImpl();
	}
}

  
<!-- 此种方式是:
使用 StaticFactory 类中的静态方法 createAccountService 创建对象，并存入 spring 容器
id 属性：指定 bean 的 id，用于从容器中获取
class 属性：指定静态工厂的全限定类名
factory-method 属性：指定生产对象的静态方法
-->
<bean id="accountService"
class="com.itheima.factory.StaticFactory"
factory-method="createAccountService"></bean>
```

第三种方式： spring 管理实例工厂 -使用实例工厂的方法创建对象

```java
/**
		* 模拟一个实例工厂，创建业务层实现类
		* 此工厂创建对象，必须现有工厂实例对象，再调用方法
*/

public class InstanceFactory {
	public IAccountService createAccountService(){
		return new AccountServiceImpl();
	}
}

<!-- 此种方式是：
	先把工厂的创建交给 spring 来管理。	
	然后在使用工厂的 bean 来调用里面的方法
	factory-bean 属性：用于指定实例工厂 bean 的 id。
	factory-method 属性：用于指定实例工厂中创建对象的方法。
-->

<bean id="instancFactory" class="com.itheima.factory.InstanceFactory"></bean>
<bean id="accountService"
factory-bean="instancFactory"
factory-method="createAccountService"></bean>
```



### 4.3.3 依赖注入（Dependency Injection）

**（1）概念**

​		依赖注入：Dependency Injection。它是 spring 框架核心 ioc 的具体实现。

​		我们的程序在编写时，通过控制反转，把对象的创建交给了 spring，但是代码中不可能出现没有依赖的情况。

​		ioc 解耦只是降低他们的依赖关系，但不会消除。例如：我们的业务层仍会调用持久层的方法。

​		那这种业务层和持久层的依赖关系，在使用 spring 之后，就让 spring 来维护了。

​		简单的说，就是坐等框架把持久层对象传入业务层，而不用我们自己去获取。

**（2）构造函数注入**

​		顾名思义，就是使用类中的构造函数，给成员变量赋值。注意，赋值的操作不是我们自己做的，而是通过配置的方式，让 spring 框架来为我们注入。具体代码如下：

```java
public class AccountServiceImpl implements IAccountService {
	private String name;
	private Integer age;
	private Date birthday;
	
  // 类构造器
	public AccountServiceImpl(String name, Integer age, Date birthday) {
		this.name = name;
		this.age = age;
		this.birthday = birthday;
	}
	@Override
	public void saveAccount() {
		System.out.println(name+","+age+","+birthday);
	}
}
```

```xml
<!-- 使用构造函数的方式，给 service 中的属性传值
	要求：
		类中需要提供一个对应参数列表的构造函数。
	涉及的标签：
		constructor-arg
	属性：
		index:指定参数在构造函数参数列表的索引位置
		type:指定参数在构造函数中的数据类型
		name:指定参数在构造函数中的名称

		用这个找给谁赋值

=======上面三个都是找给谁赋值，下面两个指的是赋什么值的==============

value:它能赋的值是基本数据类型和 String 类型
ref:它能赋的值是其他 bean 类型，也就是说，必须得是在配置文件中配置过的 bean
-->

<bean id="accountService" class="com.itheima.service.impl.AccountServiceImpl">
<constructor-arg name="name" value="张三"></constructor-arg>
<constructor-arg name="age" value="18"></constructor-arg>
<constructor-arg name="birthday" ref="now"></constructor-arg>
</bean><bean id="now" class="java.util.Date"></bean>
```

**（3）set 方法注入**

​		顾名思义，就是在类中提供需要注入成员的 set 方法。具体代码如下：

```java
public class AccountServiceImpl implements IAccountService {
	private String name;
	private Integer age;
	private Date birthday;
	public void setName(String name) {
		this.name = name;
	}
  public void setAge(Integer age) {
      this.age = age;
  }

  public void setBirthday(Date birthday) {
    this.birthday = birthday;
  }
	@Override
	public void saveAccount() {
		System.out.println(name+","+age+","+birthday);
	}
}
```

```xml
<!-- 通过配置文件给 bean 中的属性传值：使用 set 方法的方式

涉及的标签：
	property属性：
		name：找的是类中 set 方法后面的部分
		ref：给属性赋值是其他 bean 类型的
		value：给属性赋值是基本数据类型和 string 类型的
	实际开发中，此种方式用的较多。
-->

<bean id="accountService" class="com.itheima.service.impl.AccountServiceImpl">
<property name="name" value="test"></property>
<property name="age" value="21"></property>
<property name="birthday" ref="now"></property>
</bean><bean id="now" class="java.util.Date"></bean>
```

**（4）使用 p 名称空间注入数据（本质还是调用 set 方法）**

​		此种方式是通过在 xml 中导入 p 名称空间，使用 p:propertyName 来注入数据，它的本质仍然是调用类中的

​		set 方法实现注入功能。

```java
/**
		* 使用 p 名称空间注入，本质还是调用类中的 set 方法
*/
public class AccountServiceImpl4 implements IAccountService {
	private String name;
	private Integer age;
	private Date birthday;
  public void setName(String name) {
    this.name = name;
  }
  public void setAge(Integer age) {
    this.age = age;
  }

  public void setBirthday(Date birthday) {
    this.birthday = birthday;
  }
  
  @Override
  public void saveAccount() {
  System.out.println(name+","+age+","+birthday);
  }
}
```

```xml
<beans xmlns="http://www.springframework.org/schema/beans"
 			 xmlns:p="http://www.springframework.org/schema/p"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			 xsi:schemaLocation=" http://www.springframework.org/schema/beans
http://www.springframework.org/schema/beans/spring -beans.xsd">

<bean id="accountService"
			class="com.itheima.service.impl.AccountServiceImpl4"
			p:name="test" p:age="21" p:birthday-ref="now"/>
</beans>
```



**（5）注入集合属性**

​		顾名思义，就是给类中的集合成员传值，它用的也是 set 方法注入的方式，只不过变量的数据类型都是集合。

​		我们这里介绍注入数组，List,Set,Map,Properties。具体代码如下：

```java
public class AccountServiceImpl implements IAccountService {

  private String[] myStrs;
  private List<String> myList;
  private Set<String> mySet;
  private Map<String,String> myMap;
  private Properties myProps;
  public void setMyStrs(String[] myStrs) {
	  this.myStrs = myStrs;
  }

  public void setMyList(List<String> myList) {
	  this.myList = myList;
  }
  
  public void setMySet(Set<String> mySet) {
	  this.mySet = mySet;
  }

  public void setMyMap(Map<String, String> myMap) {
	  this.myMap = myMap;
  }

  public void setMyProps(Properties myProps) {
	  this.myProps = myProps;	
  }
  @Override
  public void saveAccount() {
	  System.out.println(Arrays.toString(myStrs));
	  System.out.println(myList);
	 	System.out.println(mySet);
	  System.out.println(myMap);
    System.out.println(myProps);
  }
}
```

```xml
<!-- 注入集合数据
		List 结构的：
			array,list,set
		Map 结构的
			map,entry,props,prop
-->

<bean id="accountService" class="com.itheima.service.impl.AccountServiceImpl">
  
  <!-- 在注入集合数据时，只要结构相同，标签可以互换 -->

  <!-- 给数组注入数据 -->
  <property name="myStrs">
    <set>
        <value>AAA</value>
        <value>BBB</value>
        <value>CCC</value>
    </set>
  </property>

  <!-- 注入 list 集合数据 -->
  <property name="myList">
    <array>
      <value>AAA</value>
      <value>BBB</value>
      <value>CCC</value>
    </array>
  </property>

  <!-- 注入 set 集合数据 -->
  <property name="mySet">
    <list>
      <value>AAA</value>
      <value>BBB</value>
      <value>CCC</value>
    </list>
  </property>

  <!-- 注入 Map 数据 -->
  <property name="myMap">
    <props>
      <prop key="testA">aaa</prop>
      <prop key="testB">bbb</prop>
    </props>
  </property>

  <!-- 注入 properties 数据 -->
    <property name="myProps">
      <map>
        <entry key="testA" value="aaa"></entry>
        <entry key="testB">
          <value>bbb</value>
        </entry>
    </map>
    </property>
</bean>
```



## 5 springTest

```xml
<!-- https://mvnrepository.com/artifact/org.springframework/spring-test -->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-test</artifactId>
    <version>5.3.7</version>
    <scope>test</scope>
</dependency>

```

![image-20210605105139786](https://i.loli.net/2021/06/05/OIWlPxwmsfRr2pN.png)

ModelAndViewAssert

MockHttpServletRequest

MockHttpSession



![image-20210605114114051](https://i.loli.net/2021/06/05/PjxQlGOVAvIcp2H.png)

e 'cacheGetAdvice'

![image-20210605153014002](/Users/yuanjinshuai/Library/Application Support/typora-user-images/image-20210605153014002.png)

