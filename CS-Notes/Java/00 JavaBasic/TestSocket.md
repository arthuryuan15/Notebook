```java
package com.sxt.test04;

import java.io.IOException;
import java.net.*;
import java.util.Scanner;

public class TestSend {

    public static void main(String[] args) throws IOException {
        System.out.println("亚亚上线。。。。");
        // 1. 创建套接字 // 指定发送方的端口
        DatagramSocket ds = null;
        try {
            ds = new DatagramSocket(8888);
            while(true){
                // 2. 创建数据包
                Scanner sc = new Scanner(System.in);
                System.out.print("亚亚：");
                String str = sc.next();
                byte[] b = str.getBytes();// 因为输入要是byte类的数组，所以在输入之前转成byte类型的数组
                DatagramPacket dp = new DatagramPacket(b, b.length, InetAddress.getByName("localhost"),9999);

                // 3.发送数据包：
                ds.send(dp);
                if(str.equals("byebye")){
                    System.out.println("帅帅下线");
                    break;
                }

                // 学生接收
                byte[] by = new byte[1024];
                DatagramPacket dp2 = new DatagramPacket(by, by.length);

                // 3。接收数据
                ds.receive(dp2);

                String s = new String(dp2.getData(), 0, dp2.getLength()); // 将getdata得到的字节数组转化为String类型
                System.out.println("帅帅对我说：" + s);

            }
        }catch (SocketException e){
            e.printStackTrace();
        }catch (UnknownHostException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }finally {
            // 4.关闭资源
            ds.close();
        }

    }

}
```

```java

import java.io.IOException;
import java.net.*;
import java.util.Scanner;

public class TestReceive {

    public static void main(String[] args) throws IOException {

        System.out.println("小可爱上线了。。。。。");

        // 1. 创建套接字，并指定接收方的端口号
        DatagramSocket ds = null;

        try{
            ds = new DatagramSocket(9999);
            while(true){
                // 2. 接收数据包
                byte[] b = new byte[1024];
                DatagramPacket dp = new DatagramPacket(b, b.length);

                // 3。接收数据
                ds.receive(dp);

                String str = new String(dp.getData(), 0, dp.getLength());
                if(str.equals("byebye")){
                    System.out.println("小可爱下线了");
                    break;
                }
                System.out.println("帅帅对我说：" + str );
                dp.getData();

                // 再跟亚亚说话：
                Scanner sc = new Scanner(System.in);
                System.out.print("帅帅说:");
                String s = sc.next();
//                System.out.println(s);
//        String s = "你也好";
                byte[] by = s.getBytes();// 因为输入要是byte类的数组，所以在输入之前转成byte类型的数组
                DatagramPacket dp2 = new DatagramPacket(by, by.length, InetAddress.getByName("localhost"),8888);

                // 3.发送数据包：
                ds.send(dp2);
            }
        }catch (SocketException e){
            e.printStackTrace();
        }catch (UnknownHostException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }finally {
            // 4.关闭资源
            ds.close();
        }
    }
}
```

