## 1 springMVC
Spring MVC 是一个模型 - 视图 - 控制器（MVC）的Web框架建立在中央前端控制器

​	模型(Model)封装了应用程序数据，通常它们将由POJO类组成。

​	视图(View)负责渲染模型数据，一般来说它生成客户端浏览器可以解释HTML输出。

​	控制器(Controller)负责处理用户请求并构建适当的模型，并将其传递给视图进行渲染



## 2 springMVC在B/S系统中的应用
springmvc是Spring的一个模块，提供web层解决方案(就与MVC设计架构)，如下图所示：
MVC是一种设计模式，在B/S中的应用如下图所示：

```
B/S结构（Browser/Server，浏览器/服务器模式），是WEB兴起后的一种网络结构模式，WEB浏览器是客户端最主要的应用软件。
```



![image-20210506170425789](https://p.ipic.vip/9banzf.jpg)

## 3 SpringMVC的框架

![image-20210506170458065](https://p.ipic.vip/mvf5lb.jpg)


## 4 springMVC项目执行过程

基于mvc框架的web项目执行过程大致如下：

​	第一步:  用户通过postman等发起request请求，请求至DispatcherServlet前端控制器。

​	第二步：前端控制器请求处理器映射器（HandlerMappering）去查找处理器（Handle）：通过xml配置或者注解进行查找

​	第三步：找到以后处理器映射器（HandlerMappering）像前端控制器返回执行链（HandlerExecutionChain）

​	第四步：前端控制器（DispatcherServlet）调用处理器适配器（HandlerAdapter）去执行处理器（Handler）

​	第五步：处理器适配器去执行Handler

​	第六步：Handler执行完给处理器适配器返回ModelAndView

​	第七步：处理器适配器向前端控制器返回ModelAndView

​	第八步：前端控制器请求视图解析器（ViewResolver）去进行视图解析

​	第九步：视图解析器（ViewResolver）给前端控制器返回View

​	第十步：前端控制器调用view的渲染视图的方法，将模型数据填充到request域

​	第十一步：前端控制器向用户响应结果(jsp页面、json数据......)

​	DispatcherServlet：前端控制器，由SpringMVC提供。

​	HandlerMapping：处理器映射器，由SpringMVC提供。

​	HandlerAdapter：处理器适配器，由SpringMVC提供。

​	Handler：处理器，需要程序员开发。

​	ViewResolver：视图解析器，由SpringMVC提供。

​	view：真正的视图页面，由程序员编写。