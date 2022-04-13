# 1. web相关概念

## 1.1 软件架构

1. C/S：客户端/服务器端
2. B/S：浏览器/服务器端

## 1.2 资源分配

1. 静态资源：所有用户访问后，得到的结果都是一样的，称为静态资源

   如：html，css， javascript

2. 动态资源：每个用户访问相同的资源后，得到的结果可能不太一样。称为动态资源。动态资源被访问后，需要先转换为静态资源，再返回给浏览器

   如：servlet/jsp, php, asp....

## 1.3 网络通讯三要素

1. IP：电子设备（计算机）在网络中的唯一标识
2. 端口：应用程序在计算机中的唯一标识。0～65536
3. 传输协议：规定了数据传输的规则
   1. 基础协议：
      1. tcp：安全协议，三次握手，速度慢
      2. udp：不安全协议，速度快

# 2. web服务器软件：Tomcat

* 服务器：安装了服务器软件的计算机
* 服务器软件：接受用户的请求，处理请求，作出响应
* web服务器软件：接受用户的请求，处理请求，作出响应
  * 在web服务器软件中，可以部署web项目，让用户通过浏览器来访问这些内容
  * web容器
* 常见java相关的web服务器软件：
  * weblogic
  * webSphere
  * JBOSS
  * Tomcat：中小型的JavaEE服务器，仅仅支持少量的JavaEE规范Serlvet/jsp, 开源免费

1. 下载
	​		https://tomcat.apache.org/download-80.cgi
2. 安装
	​		解压压缩包即可
3. 卸载
	​		删除目录即可
4. 启动

* bin/startup.bat ,双击运行该文件即可

* 访问：浏览器输入：http://localhost:8080 回车访问自己
  		  http://别人的ip:8080 访问别人
* tomcat目录结构
  * bin 二进制文件，可执行文件
  * conf 配置文件
  * lib 依赖jar包
  * log 日志文件
  * temp 临时文件
  * webapps 存放的web项目
  * work 存在运行时的数据

* 补充：

​		127.0.0.1:8080

​		Localhost:127.0.0.1

​		本机ip：192.168.1.109

​		/Users/yuanjinshuai/Library/Preferences/IdeaIC2019.2/settings.zip	

```terminal
>>ifconfig

en4: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
				options=6407<RXCSUM,TXCSUM,VLAN_MTU,CHANNEL_IO,PARTIAL_CSUM,ZEROINVERT_CSUM>
	ether 34:29:8f:74:04:9d
	inet6 fe80::10b6:6479:6303:eead%en4 prefixlen 64 secured scopeid 0x8
	inet 192.168.1.109 netmask 0xffffff00 broadcast 192.168.1.255
	nd6 options=201<PERFORMNUD,DAD>
	media: autoselect (100baseTX <full-duplex>)
	status: active
```

5. 关闭

   1. 正常关闭
     
      * `./bin/shutdown.sh`

      * ctrl+c
      
   2. 强制关闭

      * 关闭终端窗口

   ​	注：更多的时候是结合idea进行关闭

6. 配置(最重要)

* 部署项目的方式：

   1. 直接将hello项目放到webapps目录下即可，然后浏览器访问localhost/hello/hello.html
      * /hello：项目的访问路径--> 虚拟目录（专业名称）
      * 简化部署：将hello 项目打包成一个war包，再将war包放置到webapps下。

   2. 配置conf/server.xml文件

     在<Host>标签体中配置
     <Context docBase="D:\hello" path="/hehe" />

     * docBase:项目存放的路径
     * path：虚拟目录

   3. 在conf\Catalina\localhost创建任意名称的xml文件。在文件中编写
      	<Context docBase="D:\hello" />
       
       * 虚拟目录：xml文件的名称

* 动态项目和静态项目

  * 目录结构

    * java动态项目：

      -- 项目名称

      ​		--WEB-INF

      ​			-- web.xml : 该项目的核心配置文件

      ​			-- classes目录：放置字节码文件

      ​			-- lib目录：放置项目依赖的jar包

* 将Tomcat集成到IDEA中，并且创建JavaEE的项目，部署项目。

遇到问题：HTTP Satus 404 ： 这个问题主要是在终端里面启动了Tomcat，在idea中又再次启动后冲突了。



# 3. Servlet applet

* 概念：运行在服务器端上的小程序 server applet
  * Servlet就是一个借口，定义了java类（java EE）被浏览器访问到（tomcat）的规则
  * 将来自定义一个类，实现Servlet借口，重写方法。

## 3.1 快速入门

1. 创建javaEE项目

2. 定一个类，实现Servlet方法

   ```java
   public class ServletDemo1 implements Servlet {}
   ```

   

3. 实现接口中的抽象方法

4. 配置Servlet

   ​	在web.xml中配置：

   ```xml
   <!--配置Servlet标签-->
   <servlet>
     <servlet-name>demo1</servlet-name>
     <servlet-class>com.yjs.web.servlet.ServletDemo1</servlet-class>
   </servlet>
   
   <servlet-mapping>
     <servlet-name>demo1</servlet-name>
     <url-pattern>demo1</url-pattern>
   </servlet-mapping>
   ```

   



