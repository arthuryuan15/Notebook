## 第二部分 Spring的IoC容器

FX项目，经常需要近乎实时地为客户提供外汇新闻。通常情况下，都是先从不同的新闻社订阅新闻来源，然后通过批处理程序定时地到指定的新闻服务器抓取最新的外汇新闻，接着 将这些新闻存入本地数据库，最后在FX系统的前台界面显示。

```java
// FXNewsProvider 需要依赖 IFXNewsListener 来帮助抓取新闻内容，并依赖IFXNewsPersister存储抓取的新闻。

public class FXNewsProvider {

    private IFXNewsListener newsListener;
    private IFXNewsPersister newsPersistener;
  
    public void getAndPersistNews(){
        String[] newsIds = newsListener.getAvailableNewsIds();
        for(String newsId; newsIds){
            FXNewsBean newsBean = newsListener.getNewsByPK(newsId);
            newsPersistener.persistNews(newBean);
            newsListener.postProcessIfNecessary(newsId);
        }
    }
}
```



如果使用Dow Jones新闻社的新闻，那么就得提供DowJonesnewsListener和DowJonesnewsPersistener两个实现。==需要在构造函数中构造JFXNewsProvider依赖这两个类==



```java
public class FXNewsProvider {

		newsListener = new DowJonesnewsListener();
    newsPersistener = new DowJonesnewsPersistener();
}
```



如果依赖某个服务或者类，最简单有效的办法就是直接在类的构造函数中新建相应的依赖类。==可是我们最终要做的是依赖的对象的某项服务，只要用到这个依赖对象的时候，它能够准备就绪，我们可以完全不用管这个对象是自己找来的还是自己送过来的。

### 1 IoC的基本概念

IoC的理念就是，让别人（Ioc Service Provider）为你服务。

IoC Service Provider 就是通常的IoC容器。

从被注入对象的角度来看，与之前直接寻求依赖对象相比，依赖对象的取得方式发生了反转，控制也从被注入对象转到了IoC Service Provider那里。


### 2 IoC的注入方式
#### 2.1 Constructor注入
GM通过往A的构造函数中传入一个B来达到将其交给A的目的；

原理：IoC Service Provider会检查被注入对象的构造方法，取得它所需要的依赖对象列表，进而为其注入相应的对象。同一个对象是不可能被构造两次的，因此，被注入对象的构造乃至其整个生命周期， 应该是由IoC Service Provider来管理的。



#### 2.2 Setter注入
A通过添加成员变量，并且添加一个B的Setter方法，GM（不知道GM是啥意思？回头瞅瞅吧）检测到A中有B，就创建一个B，然后通过A的Setter方法把现成的B给A。



#### 2.3 Interface注入
这种方法正在被淘汰。。。。它需要A实现一个接口，叫啥不重要，只需要有一个方法，该方法叫啥也不重要（实际上，这种方法也不重要。。。。），只要有个B参数就好。GM发现A实现了该接口，就会通过其方法将B传给A。

这种方法非要A实现一个不重要的接口，不友好；所以，逐渐被抛弃。。

从这三种方法来看，GM不仅是个Good Man，而且还是个Super Man。很厉害，对不对。他还有个名字，叫：IoC Service Provider。

另外，有没有发现，A要使用B，就得将B作为一个成员变量，那么如果A只是有一个方法需要使用B，那也没有必要把B上升到成员变量的级别，只需要成为局部变量就好。但是，此场景就不是“注入”了，自然也就不再属于DI的范畴了。实际上，此时A可以向GM主动索要嘛，就像唐僧对孙悟空说：“你想要就告诉我嘛，你不说，我怎么知道你想要呢？”；



综上所述，构造方法注入和setter方法注入因为其侵入性较弱，且易于理解和使用，所以是现在使 用最多的注入方式



IoC附加值

为MarketWin24的FXNewsProvider提供相应的MarketWin24NewsListener注入就可以了。

```java
FXNewsProvider dowJonesNewsProvider = new FXNewsProvider(new DowJonesNewsListener(),new DowJonesNewsPersister());

FXNewsPrivider marketWin24NewsProvider = new FXNewsProvider(new MarketWin24NewsListener(),new DowJonesNewsPersister());
```



### 3 IoC的职责

IoC Service Provider是一个抽象出来的概念，可以是一段代码，也可以是一组相关的类，比如下面的代码可以绑定与新闻相关的对象。

```java
IFXNewsListener newsListener = new DowJonesNewsListener();
IFXNewsPersister newsPersister = new DowJonesNewsPersister();
FXNewsProvider newsProvider = new FXNewsProvider(newsListener,newsPersister); newsProvider.getAndPersistNews();
```

* 业务对象的构建管理。
* 业务对象间的依赖绑定。



#### 3.1 IoC Service Provider如何管理对象间的依赖关系

1. 直接编码方式

2. ==配置文件方式==

   采用XML文件来管理和保存依赖注入信息的。

   ```xml
   <bean id="newsProvider" class="..FXNewsProvider">
     <property name="newsListener"> 
       <ref bean="djNewsListener"/> 
     </property> 
     <property name="newPersistener">
       <ref bean="djNewsPersister"/> 
     </property>
   </bean>
   
   <bean id="djNewsListener" 
         class="..impl.DowJonesNewsListener"> 
   </bean> 
   <bean id="djNewsPersister"
         class="..impl.DowJonesNewsPersister"> 
   </bean>
   ```

   ```java
   container.readConfigurationFiles(...); 
   FXNewsProvider newsProvider = (FXNewsProvider)container.getBean("newsProvider"); newsProvider.getAndPersistNews();
   ```

    可以向上面的代码那样，通过“newsProvider”这个名字，从容器中取得 已经组装好的FXNewsProvider并直接使用。

3. 元数据方式

   ```java
   public class FXNewsProvider {
   	private IFXNewsListener newsListener; 
     private IFXNewsPersister newPersistener; 
     @Inject 
     public FXNewsProvider(IFXNewsListener listener, IFXNewsPersister persister) {
       this.newsListener = listener;
       this.newPersistener = persister; 
     } 
   	...
   }
   ```

   通过@Inject，我们指明需要IoC Service Provider通过构造方法注入方式，为FXNewsProvider注入 其所依赖的对象。至于余下的依赖相关信息，在Guice中是由相应的Module来提供的，代码清单3-7给 出了FXNewsProvider所使用的Module实现。



### 第4章 BeanFactory

Spring提供了两种容器类型：BeanFactory和ApplicationContent

* BeanFactory。基础，延期初始化策略，容器启动初期较快，所需要的资源有限。
* ApplicationContent。在BeanFactory的基础上，还提供了更高级的特性，比如事件发布、国际化信息支持。

JavaBean对象

	1、所有属性为private
	2、提供默认构造方法
	3、提供getter和setter
	4、实现serializable接口

把每个业务对象看作一个JavaBean对象。

作为Spring提供的基本IoC容器，BeanFactory可以完成作为IoC Service Provider的所有职责，包括业务对象的注册和对象间依赖关系的绑定。

![image-20210507193150384](https://p.ipic.vip/2ug8rl.jpg)

![image-20210507193213835](https://p.ipic.vip/kvfemm.jpg)

如以上的实际开发代码中包含的查询相关方法。例如取得某个对象的方法（getBean）、查询 某个对象是否存在于容器中的方法（containsBean），或者取得某个bean的状态或者类型的方法等

因为通常情况下，对于独立的应用程序，只有主入口类才会跟容器的API直接耦合。

![image-20210507193520916](https://p.ipic.vip/f199dw.jpg)





### 第5章 Spring IoC容器ApplicationContext

Spring提供了一个Resource，Resource接口可以根据资源的不同类型，或者资源所处的不同场合，给出相应的具体实现。

Spring中的Resource ---》查找资源

ResourceLoader---》根据指定的资源位置，定位到具体的资源实例

ResourcePatternResolver --》批量查找的ResourceLoader

ApplicationContext可以当成ResourceLoader或者ResourcePatternResolver



ApplicationContext的Resource加载行为:

对于URL所接受的资源路径来说，通常开始都会有一个协议前缀，比如file:、http:、ftp: 等。同样也支持这样类型的资源路径。ResourceLoader中增加了一种新 的资源路径协议——classpath:，ResourcePatternResolver又增加了一种——classpath*:





### 第6章 Spring IoC容器之扩展篇

@Autowire是基于注解的依赖注入的核心注解,它的存在可以让容器知道为当前类注入那些依赖.（标注了依赖关系）



@Resource与@Autowired不同,它遵循的是byName自动绑定形式的行为准则,也就是说,IoC容器根据@Resource所指定的名称,到容器中查找beanName与之对应的实例,然后将查找到的对象实例注入给@Resource所标注的对象.



具体过程：

1. 使用相应的注解对组成的应用程序的相关类进行标注（@Component）之后，classpath-scanning功能可以从某一顶层报开始扫描。
2. 当扫描到某个标注了相应的注解的类之后，就好提取该类的相关信息，构建对应的BeanDefinition，然后把构建完的BeanDefinition注册到容器。

举例：

```xml
<beans>
	<context:component-scan base-package="org.spring21"/>
</beans>
```

其中，classpath-scanning功能的触发是由`<context:component-scan>`决定的，现在`<context:component-scan>`将遍历扫描org.spring21路径下所有类型定义，寻找标注了相应注解的类，并添加到IoC容器。

`<context:component-scan>`默认扫描的注解类型是@Component。不过在@Component语义基础上细化后的@Repository、@Service和@Controller也同样可以获得`<context:component-scan>` 的青睐。

一般使用@Service



## 第六部分

###  1 迈向Spring MVC的旅程

* Servlet独行天下的时代

* JSP时代（为了将Servlet中的视图渲染逻辑以独立的单元抽取出来）

  ![image-20210508145500795](https://p.ipic.vip/8ylgsm.jpg)

* Servlet和JSP的联盟

  ![image-20210508145517445](https://p.ipic.vip/1mh76s.jpg)

  通过结合Servlet和JSP，并且引入业务封装逻辑JavaBean，得到JSP Model2。

  这样对于JSP来说，只需要页面开发人员或者表现层（presentation layer）开发人员来负责和管理即可。而已经剥离了视图渲染逻辑Servlet，现在只负责请求处理流程的控制以及业务层的交互，这部分工作则由Java开发人员来负责。

* MVC（Model-View-Controller）

  ![image-20210508145701547](https://p.ipic.vip/yz4iow.jpg)

  * Controller负责接收视图发送的请求并进行处理，它会根据请求条件通知模型进行应用程序状态的更新，之后选择合适的视图给用户。
  * Model通过封装了应用的逻辑以及数据状态。
  * View是面向用户的接口。当用户通过视图发起某种请求的时候，视图这些请求转发给控制器进行处理。（View层负责前台jsp页面的表示）

### 2 Spring  MVC初体验

springMVC框架的处理控制器的实现策略，与其他的请求确定的Web框架在总体思路上市相似的。

回顾：

​	JSP Model2架构中提到的MockMagicServlet为例，它在处理Web请求的过程中所做的工作，可以归纳为以下三点：

* 获取请求信息，比如请求的路径、各种参数值等
* 根据请求信息，调用具体的服务对象处理具体的Web请求
* 处理完之后，将要在视图中显示的模型数据通过request进行传递，最后通过Request-Dispatcher选择具体的jsp视图并显示。

DIspatcherServlet在实现上没有太多不同或者改变。



