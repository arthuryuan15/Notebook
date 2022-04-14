#网络编程

## 1. 引入

【1】网络编程和网页编程侧重点是什么？ 

​		网页编程：更加注重用户交互，页面是否好看，后台性能高低 

​		网络编程：更加关注的是底层数据的传输。 

【2】网络： 

​		两台或者两台以上的计算机就构成了网络。 

​		教室中局域网 

![Screen Shot 2019-10-01 at 8.53.59 AM](/Users/yuanjinshuai/Library/Mobile Documents/com~apple~CloudDocs/java/pic/Screen Shot 2019-10-01 at 8.53.59 AM.png)

【3】我现在想跟：教室中的刘芳飞秋聊天： 

​	（1）IP地址 

​	（2）端口号 

定位：IP+端口号进行定位： 

浏览器：www.baidu.com--->域名--->DNS解析---》解析成为了一个IP地址 



【4】传送数据：遵照协议？ 



![Screen Shot 2019-10-01 at 8.55.26 AM](/Users/yuanjinshuai/Library/Mobile Documents/com~apple~CloudDocs/java/pic/Screen Shot 2019-10-01 at 8.55.26 AM.png) 

![Screen Shot 2019-10-01 at 8.56.03 AM](/Users/yuanjinshuai/Library/Mobile Documents/com~apple~CloudDocs/java/pic/Screen Shot 2019-10-01 at 8.56.03 AM.png)



## 2. Inet(Socket)Address

```java
import java.net.InetAddress;
import java.net.UnknownHostException;
public class Test {
    public static void main(String[] args) throws UnknownHostException {
      
      
        //InetAddress:封装IP的
        InetAddress ia1=InetAddress.getByName("192.168.153.253");
        System.out.println(ia1);
        System.out.println(ia1.getHostName());
        System.out.println(ia1.getHostAddress());
      
      
        InetAddress ia2=InetAddress.getByName("zhaoss");
        System.out.println(ia2);
        System.out.println(ia2.getHostName());
        System.out.println(ia2.getHostAddress());
      
      
        InetAddress ia3=InetAddress.getByName("localhost");//localhost代表本机的IP
        System.out.println(ia3);
        System.out.println(ia3.getHostName());
        System.out.println(ia3.getHostAddress());
      
      
        InetAddress ia4=InetAddress.getByName("127.0.0.1");//localhost代表本机的IP
        System.out.println(ia4);
        System.out.println(ia4.getHostName());
        System.out.println(ia4.getHostAddress());
      
      
        InetAddress ia5=InetAddress.getByName("192.168.153.81");
        System.out.println(ia5);
        System.out.println(ia5.getHostName());
        System.out.println(ia5.getHostAddress());
    }
}
```



```java
import java.net.InetAddress;
import java.net.InetSocketAddress;
public class Test2 {
    public static void main(String[] args) {
      
      
        //InetSocketAddress;封装IP和端口号
        InetSocketAddress isa=new InetSocketAddress("localhost",8888);
        System.out.println(isa);
        System.out.println(isa.getHostName());
        System.out.println(isa.getPort());
      
      
        InetAddress ia=isa.getAddress();
        System.out.println(ia);
        System.out.println(ia.getHostName());
        System.out.println(ia.getAddress());
    }
}
```



### 2.1 InetAddress.getByName()源码解析

```java
    public static InetAddress getByName(String host) throws UnknownHostException {
        return getAllByName(host)[0];
    }
```

```java
    public static InetAddress[] getAllByName(String host) throws UnknownHostException {
        return getAllByName(host, (InetAddress)null);
    }
```

```java
private static InetAddress[] getAllByName(String host, InetAddress reqAddr) throws UnknownHostException {
        if (host != null && host.length() != 0) { // 如果host的不是空
            boolean ipv6Expected = false;  // 判断是否是ipv6
          	
          	// 判断是否是ipv6
            if (host.charAt(0) == '[') { // 如果host第一个字符串是"["
              	// 如果host长度小于2或者host的最后一个不是"]"，则抛出不是ipv6的异常
                if (host.length() <= 2 || host.charAt(host.length() - 1) != ']') {
                    throw new UnknownHostException(host + ": invalid IPv6 address");
                }
								// 如果满足条件，就取"[]"之间的数
                host = host.substring(1, host.length() - 1);
                ipv6Expected = true; // 如果满足就是输入的就是ipv6
            }
						
          	// 判断首位字符是否为数字字符
            if (Character.digit(host.charAt(0), 16) == -1 && host.charAt(0) != ':') {
                if (ipv6Expected) {
                    throw new UnknownHostException("[" + host + "]");
                }
            } else {
              	
                byte[] addr = null;
                int numericZone = -1;
                String ifname = null;
                byte[] addr = IPAddressUtil.textToNumericFormatV4(host);
              	
                if (addr == null) {
                    int pos;
                    if ((pos = host.indexOf(37)) != -1) {
                        numericZone = checkNumericZone(host);
                        if (numericZone == -1) {
                            ifname = host.substring(pos + 1);
                        }
                    }

                    if ((addr = IPAddressUtil.textToNumericFormatV6(host)) == null && host.contains(":")) {
                        throw new UnknownHostException(host + ": invalid IPv6 address");
                    }
                } else if (ipv6Expected) {
                    throw new UnknownHostException("[" + host + "]");
                }

                InetAddress[] ret = new InetAddress[1];
                if (addr != null) {
                    if (addr.length == 4) {
                        ret[0] = new Inet4Address((String)null, addr);
                    } else if (ifname != null) {
                        ret[0] = new Inet6Address((String)null, addr, ifname);
                    } else {
                        ret[0] = new Inet6Address((String)null, addr, numericZone);
                    }

                    return ret;
                }
            }

            return getAllByName0(host, reqAddr, true, true);
        } else {
            InetAddress[] ret = new InetAddress[]{impl.loopbackAddress()};
            return ret;
        }
    }
```



```java
public static byte[] textToNumericFormatV4(String src) {
        byte[] res = new byte[4];
        long tmpValue = 0L;
        int currByte = 0;
        boolean newOctet = true; // 记录是否是一个新的小段
        int len = src.length();
  			
  			// 如果ip地址的长度大于0且小等于15
        if (len != 0 && len <= 15) {
            for(int i = 0; i < len; ++i) {
                char c = src.charAt(i); // 遍历所有字符
                if (c == '.') { //  如果第字符是"."
               			
                  	// 如果是一个新的新的小段
                    if (newOctet || tmpValue < 0L || tmpValue > 255L || currByte == 3) {
                        return null;
                    }
										
                    res[currByte++] = (byte)((int)(tmpValue & 255L));
                    tmpValue = 0L;
                    newOctet = true;
                } else {
                    int digit = Character.digit(c, 10);
                    if (digit < 0) {
                        return null;
                    }

                    tmpValue *= 10L;
                    tmpValue += (long)digit;
                    newOctet = false;
                }
            }
						
          	// 如果位数不足
            if (!newOctet && tmpValue >= 0L && tmpValue < 1L << (4 - currByte) * 8) {	
              	// 目前的小段个数
                switch(currByte) {
                case 0:
                    res[0] = (byte)((int)(tmpValue >> 24 & 255L));
                case 1:
                    res[1] = (byte)((int)(tmpValue >> 16 & 255L));
                case 2:
                    res[2] = (byte)((int)(tmpValue >> 8 & 255L));
                case 3:
                    res[3] = (byte)((int)(tmpValue >> 0 & 255L));
                default:
                    return res;
                }
            } else {
                return null;
            }
        } else {
            return null;
        }
    }
```



## 3. 两台电脑传送数据原理

![Screen Shot 2019-10-01 at 9.00.42 AM](/Users/yuanjinshuai/Library/Mobile Documents/com~apple~CloudDocs/java/pic/Screen Shot 2019-10-01 at 9.00.42 AM.png)

说明：

​	编写应用层的代码

​	传输层 传输协议是TCP，UDP。是传TCP还是UDP是是有套接字决定的。

​	

## 4. 基于TCP的编程

利用账号和密码登陆，判断是否登陆成功



```java
import java.io.*;
import java.net.Socket;
import java.util.Scanner;
public class TestClient {//客户端：
    public static void main(String[] args) throws IOException {
        System.out.println("-----------客户端启动了----------");
        //1.创建Socket，用来发送请求的，指定服务器段的IP和端口号：
        Socket s=new Socket("localhost",8888);
        //录入账号密码：
        Scanner sc=new Scanner(System.in);
        System.out.print("账号：");
        String username=sc.next();
        System.out.print("密码：");
        String password=sc.next();
        //将账号和密码封装成为User对象：
        User user=new User(username,password);
        //2.对于客户端来说，我们直观的感受是用来流发送数据：
        OutputStream os = s.getOutputStream();
        ObjectOutputStream oos=new ObjectOutputStream(os);
        oos.writeObject(user);
        //客户端接收服务器端数据：
        s.shutdownOutput();
        InputStream is = s.getInputStream();
        DataInputStream dis=new DataInputStream(is);
        System.out.println("登陆结果是："+dis.readUTF());
        //3.关闭流，关闭套接字资源
        dis.close();
        is.close();
        oos.close();
        os.close();
        s.close();
    }
}
```



```java
import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
public class TestServer {//服务器端：
    public static void main(String[] args) throws IOException, ClassNotFoundException {
        System.out.println("-------服务器端启动了-------------------");
        //1.创建一个套接字，指定本侧的端口号：
        ServerSocket ss=new ServerSocket(8888);
        //2.通过ServerSocket的accept的方法，来获取服务器端的套接字：
        Socket s=ss.accept();//阻塞方法
        //3.对于服务器端来说，我们是利用流来接收数据：
        InputStream is = s.getInputStream();
         ObjectInputStream ois=new ObjectInputStream(is);
         User user=(User)(ois.readObject());
         //进行校验：
        String str=null;
        if(user.getUsername().equals("lili")&&user.getPassword().equals("123123")){
            str="登陆成功";
        }else{
            str="登陆失败";
        }
        //服务器对客户端的响应：
        s.shutdownInput();
        OutputStream os = s.getOutputStream();
        DataOutputStream dos=new DataOutputStream(os);
        dos.writeUTF(str);
        //4.关闭流，网络资源关闭：
        dos.close();
        os.close();
        ois.close();
        is.close();
        s.close();
        ss.close();
    }
}
```



```java
import java.io.Serializable;
public class User implements Serializable{//序列化
    private String username;
    private String password;
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }
}
```



### 分解1：单向通信

```java
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
public class TestClient {//客户端：
    public static void main(String[] args) throws IOException {
        System.out.println("-----------客户端启动了----------");
        //1.创建Socket，用来发送请求的，指定服务器段的IP和端口号：
        Socket s=new Socket("localhost",8888);
        //2.对于客户端来说，我们直观的感受是用来流发送数据：
        OutputStream os = s.getOutputStream();
        DataOutputStream dos=new DataOutputStream(os);
        dos.writeUTF("你好呀。。。");
        //3.关闭流，关闭套接字资源
        dos.close();
        os.close();
        s.close();
    }
}
```



```java
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.ServerSocket;
import java.net.Socket;
public class TestServer {//服务器端：
    public static void main(String[] args) throws IOException {
        System.out.println("-------服务器端启动了-------------------");
        //1.创建一个套接字，指定本侧的端口号：
        ServerSocket ss=new ServerSocket(8888);
        //2.通过ServerSocket的accept的方法，来获取服务器端的套接字：
        Socket s=ss.accept();//阻塞方法
        //3.对于服务器端来说，我们是利用流来接收数据：
        InputStream is = s.getInputStream();
        DataInputStream dis=new DataInputStream(is);
        String str=dis.readUTF();
        System.out.println("客户端对我说："+str);
        //4.关闭流，网络资源关闭：
        dis.close();
        is.close();
        s.close();
        ss.close();
    }
}
```

注意： 

【1】IP不行就换成localhost 

【2】必须先启动服务器再启动客户端（先启动客户端找到服务器出错） 

【3】不能重复启动服务器端（否则端口号冲突） 



### 分解2：双向通信

```java
import java.io.*;
import java.net.Socket;
public class TestClient {//客户端：
    public static void main(String[] args) throws IOException {
        System.out.println("-----------客户端启动了----------");
        //1.创建Socket，用来发送请求的，指定服务器段的IP和端口号：
        Socket s=new Socket("localhost",8888);
        //2.对于客户端来说，我们直观的感受是用来流发送数据：
        OutputStream os = s.getOutputStream();
        DataOutputStream dos=new DataOutputStream(os);
        dos.writeUTF("你好呀。。。");
      
      	/*改进从这里开始*/
      
        //客户端接收服务器端数据：
        s.shutdownOutput();
        InputStream is = s.getInputStream();
        DataInputStream dis=new DataInputStream(is);
        System.out.println("服务器端对我说："+dis.readUTF());
      
      	/*改进从这里结束*/
      
        //3.关闭流，关闭套接字资源
        dos.close();
        os.close();
        s.close();
    }
}
```

​	

```java

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
public class TestServer {//服务器端：
    public static void main(String[] args) throws IOException {
        System.out.println("-------服务器端启动了-------------------");
        //1.创建一个套接字，指定本侧的端口号：
        ServerSocket ss=new ServerSocket(8888);
        //2.通过ServerSocket的accept的方法，来获取服务器端的套接字：
        Socket s=ss.accept();//阻塞方法
        //3.对于服务器端来说，我们是利用流来接收数据：
        InputStream is = s.getInputStream();
        DataInputStream dis=new DataInputStream(is);
        String str=dis.readUTF();
        System.out.println("客户端对我说："+str);
      
      	/*改进从这里开始*/
      
        //服务器对客户端的响应：
        s.shutdownInput();
        OutputStream os = s.getOutputStream();
        DataOutputStream dos=new DataOutputStream(os);
        dos.writeUTF("你也好。。。");
      	
      	/*改进从这里结束*/
      
        //4.关闭流，网络资源关闭：
        dis.close();
        is.close();
        s.close();
        ss.close();
    }
}
```



### 分解3：用账号密码登录

```java
import java.io.*;
import java.net.Socket;
import java.util.Scanner;
public class TestClient {//客户端：
    public static void main(String[] args) throws IOException {
        System.out.println("-----------客户端启动了----------");
      
        //1.创建Socket，用来发送请求的，指定服务器段的IP和端口号：
        Socket s=new Socket("localhost",8888);
      
      	/*改进从这里开始*/
      
        //录入账号密码：
        Scanner sc=new Scanner(System.in);
        System.out.print("账号：");
        String username=sc.next();
        System.out.print("密码：");
        String password=sc.next();
      
        //将账号和密码封装成为User对象：
        User user=new User(username,password);
      
        //2.对于客户端来说，我们直观的感受是用来流发送数据：
        OutputStream os = s.getOutputStream();
        ObjectOutputStream oos=new ObjectOutputStream(os);
        oos.writeObject(user);
      
        //客户端接收服务器端数据：
        s.shutdownOutput();
        InputStream is = s.getInputStream();
        DataInputStream dis=new DataInputStream(is);
        System.out.println("登陆结果是："+dis.readUTF());
      	
      	/*改进从这里结束*/
      
        //3.关闭流，关闭套接字资源
        dis.close();
        is.close();
        oos.close();
        os.close();
        s.close();
    }
}
```



```java

import java.io.Serializable;
public class User implements Serializable{//序列化
    private String username;
    private String password;
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }
}
```



```java
import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
public class TestServer {//服务器端：
    public static void main(String[] args) throws IOException, ClassNotFoundException {
        System.out.println("-------服务器端启动了-------------------");
        
      	//1.创建一个套接字，指定本侧的端口号：
        ServerSocket ss=new ServerSocket(8888);
        
      	//2.通过ServerSocket的accept的方法，来获取服务器端的套接字：
        Socket s=ss.accept();//阻塞方法
        
      	/*改进从这里开始*/
      	//3.对于服务器端来说，我们是利用流来接收数据：
        InputStream is = s.getInputStream();
         ObjectInputStream ois=new ObjectInputStream(is);
         User user=(User)(ois.readObject());
      
         //进行校验：
        String str=null;
        if(user.getUsername().equals("lili")&&user.getPassword().equals("123123")){
            str="登陆成功";
        }else{
            str="登陆失败";
        }
        
      	//服务器对客户端的响应：
        s.shutdownInput();
        OutputStream os = s.getOutputStream();
        DataOutputStream dos=new DataOutputStream(os);
        dos.writeUTF(str);
      
      	/*改进从这里结束*/	
      
        //4.关闭流，网络资源关闭：
        dos.close();
        os.close();
        ois.close();
        is.close();
        s.close();
        ss.close();
    }
}
```

### 分解4：正确处理异常

【1】修改客户端

```java
import java.io.*;
import java.net.Socket;
import java.util.Scanner;
public class TestClient {//客户端：
    public static void main(String[] args){
        System.out.println("-----------客户端启动了----------");
        //1.创建Socket，用来发送请求的，指定服务器段的IP和端口号：
        Socket s= null;
        OutputStream os = null;
        ObjectOutputStream oos= null;
        InputStream is= null;
        DataInputStream dis= null;
        try {
            s = new Socket("localhost",8888);
          
            //录入账号密码：
            Scanner sc=new Scanner(System.in);
            System.out.print("账号：");
            String username=sc.next();
            System.out.print("密码：");
            String password=sc.next();
          
            //将账号和密码封装成为User对象：
            User user=new User(username,password);
          
            //2.对于客户端来说，我们直观的感受是用来流发送数据：
            os = s.getOutputStream();
            oos=new ObjectOutputStream(os);
            oos.writeObject(user);
          
            //客户端接收服务器端数据：
            s.shutdownOutput();
            is = s.getInputStream();
            dis=new DataInputStream(is);
            System.out.println("登陆结果是："+dis.readUTF());
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
          
            //3.关闭流，关闭套接字资源
            try {
                if(dis!=null){//预防空指针异常
                    dis.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                if(is!=null){
                    is.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                if(oos!=null){
                    oos.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
               if(os!=null){
                   os.close();
               }
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                if(s!=null){
                    s.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
              
            }
        }
    }
}
```

【1】修改服务器

```java
import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
public class TestServer {//服务器端：
    public static void main(String[] args) {
        System.out.println("-------服务器端启动了-------------------");
      
        //1.创建一个套接字，指定本侧的端口号：
        ServerSocket ss= null;
        Socket s=null;
        InputStream is =null;
        ObjectInputStream ois=null;
        OutputStream os =null;
        DataOutputStream dos=null;
        try {
            ss = new ServerSocket(8888);
          
            //2.通过ServerSocket的accept的方法，来获取服务器端的套接字：
           s=ss.accept();//阻塞方法
          
            //3.对于服务器端来说，我们是利用流来接收数据：
            is = s.getInputStream();
            ois=new ObjectInputStream(is);
            User user=(User)(ois.readObject());
            //进行校验：
            String str=null;
            if(user.getUsername().equals("lili")&&user.getPassword().equals("123123")){
                str="登陆成功";
            }else{
                str="登陆失败";
            }
          
            //服务器对客户端的响应：
            s.shutdownInput();
            os = s.getOutputStream();
            dos=new DataOutputStream(os);
            dos.writeUTF(str);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally{
          
            //4.关闭流，网络资源关闭：
            try {
                dos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                os.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                ois.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                is.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                s.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                ss.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
       
        
    }
}
```

### 分解5：完成代码

客户端和服务器：改哪个？？ 

​		服务器 

```java
import com.bjsxt.test02.ServerThread;
import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
public class TestServer {//服务器端：
    public static void main(String[] args) {
        System.out.println("-------服务器端启动了-------------------");
        //1.创建一个套接字，指定本侧的端口号：
        ServerSocket ss= null;
        Socket s=null;
        //定义一个计数器，用来计算有多少个用户访问：
        int count=0;
        try {
            ss = new ServerSocket(8888);
           while(true){
               //2.通过ServerSocket的accept的方法，来获取服务器端的套接字：
               s=ss.accept();//阻塞方法
               //每接收一个就是一个线程来处理：
               new ServerThread(s).start();
               count++;
               System.out.println("当前是第"+count+"个用户在访问,当前用户的ip是："+s.getInetAddress());
           }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
```



```java
import com.bjsxt.test03.test02.User;
import java.io.*;
import java.net.Socket;
public class ServerThread extends Thread {
    Socket s=null;
    InputStream is =null;
    ObjectInputStream ois=null;
    OutputStream os =null;
    DataOutputStream dos=null;
    public ServerThread(Socket s){
        this.s=s;
    }
    @Override
    public void run() {
        //服务器处理逻辑的代码：
        try {
            //3.对于服务器端来说，我们是利用流来接收数据：
            is = s.getInputStream();
            ois=new ObjectInputStream(is);
            User user=(User)(ois.readObject());
            //进行校验：
            String str=null;
            if(user.getUsername().equals("lili")&&user.getPassword().equals("123123")){
                str="登陆成功";
            }else{
                str="登陆失败";
            }
            //服务器对客户端的响应：
            s.shutdownInput();
            os = s.getOutputStream();
            dos=new DataOutputStream(os);
            dos.writeUTF(str);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally{
            try {
                dos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                os.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                ois.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                is.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
```



## 5. 基于UDP的编程

最终：在线客服聊天： 

TCP： 

​		客户端：Socket                               发送：用输出流         

​		服务器：ServerScoket-->Socket     接收：用输入流 

UDP： 

​		发送方：DatagramSocket      数据包：DatagramPacket 

​		接收方：DatagramSocket      数据包：DatagramPacket 

### 分解1： 单向聊天

```java
import java.io.IOException;
import java.net.*;
public class TestSend {//发送方：
    public static void main(String[] args) throws IOException {
        System.out.println("学生上线。。");
        //1.创建套接字：//指定端口是发送方的端口
        DatagramSocket ds=new DatagramSocket(8888);
        //2.创建数据包：
        //发送：“你好”
        String str="你好";
        byte[] b=str.getBytes();
        DatagramPacket dp=new DatagramPacket(b,b.length, InetAddress.getByName("localhost"),9999);
        //3.发送数据包：
        ds.send(dp);
        //4.关闭资源：
        ds.close();
    }
}
```



```java
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;
public class TestReceive {//接收方：
    public static void main(String[] args) throws IOException {
        System.out.println("老师上线。。。");
        //1.创建套接字，并且指定接收方的端口号：
        DatagramSocket ds=new DatagramSocket(9999);
        //2.接收数据包：
        byte[] b=new byte[1024];
        DatagramPacket dp=new DatagramPacket(b,b.length);//数据包是空的
        //3.接收数据：将数据放入数据包
        ds.receive(dp);//这个数据包还是空的吗？不是：
        String str= new String(dp.getData());//将getData得到的字节数组转换为String类型
        System.out.println("学生对我说："+str);
        //4.关闭资源：
        ds.close();
    }
}
```



### 分解2： 双向聊天

```java
import java.io.IOException;
import java.net.*;
import java.util.Scanner;
public class TestSend {//发送方：
    public static void main(String[] args) throws IOException {
        System.out.println("学生上线。。");
        //1.创建套接字：//指定端口是发送方的端口
        DatagramSocket ds=new DatagramSocket(8888);
        //2.创建数据包：
        //发送：“你好”
        Scanner sc=new Scanner(System.in);
        System.out.print("学生：");
        String str=sc.next();
        byte[] b=str.getBytes();
        DatagramPacket dp=new DatagramPacket(b,b.length, InetAddress.getByName("localhost"),9999);
        //3.发送数据包：
        ds.send(dp);
        //学生接收：
        //2.接收数据包：
        byte[] by=new byte[1024];
        DatagramPacket dp2=new DatagramPacket(by,by.length);//数据包是空的
        //3.接收数据：将数据放入数据包
        ds.receive(dp2);//这个数据包还是空的吗？不是：
        String s= new String(dp2.getData());//将getData得到的字节数组转换为String类型
        System.out.println("老师对我说："+s);
        //4.关闭资源：
        ds.close();
    }
}
```



```java
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.util.Scanner;
public class TestReceive {//接收方：
    public static void main(String[] args) throws IOException {
        System.out.println("老师上线。。。");
        //1.创建套接字，并且指定接收方的端口号：
        DatagramSocket ds=new DatagramSocket(9999);
        //2.接收数据包：
        byte[] b=new byte[1024];
        DatagramPacket dp=new DatagramPacket(b,b.length);//数据包是空的
        //3.接收数据：将数据放入数据包
        ds.receive(dp);//这个数据包还是空的吗？不是：
        String str= new String(dp.getData());//将getData得到的字节数组转换为String类型
        System.out.println("学生对我说："+str);
        //再跟学生说话：
        Scanner sc=new Scanner(System.in);
        System.out.print("老师：");
        String s=sc.next();
        byte[] by=s.getBytes();
        DatagramPacket dp2=new DatagramPacket(by,by.length, InetAddress.getByName("localhost"),8888);
        //发送数据包：
        ds.send(dp2);
        //4.关闭资源：
        ds.close();
    }
}
```



### 分解3： 处理异常

```java
import java.io.IOException;
import java.net.*;
import java.util.Scanner;
public class TestSend {//发送方：
    public static void main(String[] args)  {
        System.out.println("学生上线。。");
        //1.创建套接字：//指定端口是发送方的端口
        DatagramSocket ds= null;
        try {
            ds = new DatagramSocket(8888);
           while(true){
               //2.创建数据包：
               //发送：“你好”
               Scanner sc=new Scanner(System.in);
               System.out.print("学生：");
               String str=sc.next();
               byte[] b=str.getBytes();
               DatagramPacket dp=new DatagramPacket(b,b.length, InetAddress.getByName("localhost"),9999);
               //3.发送数据包：
               ds.send(dp);
               if("byebye".equals(str)){
                   System.out.println("学生下线");
                   break;
               }
               //学生接收：
               //2.接收数据包：
               byte[] by=new byte[1024];
               DatagramPacket dp2=new DatagramPacket(by,by.length);//数据包是空的
               //3.接收数据：将数据放入数据包
               ds.receive(dp2);//这个数据包还是空的吗？不是：
               String s= new String(dp2.getData(),0,dp2.getLength());//将getData得到的字节数组转换为String类型
               System.out.println("老师对我说："+s);
           }
        } catch (SocketException e) {
            e.printStackTrace();
        } catch (UnknownHostException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            //4.关闭资源：
            ds.close();
        }
    }
}
```

```java
import java.io.IOException;
import java.net.*;
import java.util.Scanner;
public class TestReceive {//接收方：
    public static void main(String[] args) {
        System.out.println("老师上线。。。");
        //1.创建套接字，并且指定接收方的端口号：
        DatagramSocket ds= null;
        try {
            ds = new DatagramSocket(9999);
            while(true){
                //2.接收数据包：
                byte[] b=new byte[1024];
                DatagramPacket dp=new DatagramPacket(b,b.length);//数据包是空的
                //3.接收数据：将数据放入数据包
                ds.receive(dp);//这个数据包还是空的吗？不是：
                String str= new String(dp.getData(),0,dp.getLength());//将getData得到的字节数组转换为String类型
                System.out.println("学生对我说："+str);
                if("byebye".equals(str)){
                    System.out.println("老师下线");
                    break;
                }
                //再跟学生说话：
                Scanner sc=new Scanner(System.in);
                System.out.print("老师：");
                String s=sc.next();
                byte[] by=s.getBytes();
                DatagramPacket dp2=new DatagramPacket(by,by.length, InetAddress.getByName("localhost"),8888);
                //发送数据包：
                ds.send(dp2);
            }
        } catch (SocketException e) {
            e.printStackTrace();
        } catch (UnknownHostException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            //4.关闭资源：
            ds.close();
        }
    }
}
```

