# JDBC

## 1. 引入

![image-20210412225524567](https://tva1.sinaimg.cn/large/008eGmZEly1gphcppd4fmj320g0tmam0.jpg)

需要导入一个jar包。mysql-connector-java-5.1.12-bin.jar

## 2. 添加一条信息

```java
package com.sxt.test03;

import java.sql.*;
import java.sql.DriverManager;

public class Test {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        // 完成连接数据库的操作，简单的JDBC操作
        //1. 加载驱动
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("加载驱动成功");

        //2. 获取连接
        String url = "jdbc:mysql://localhost:3306/test?useSSL=false";
        String name = "root";
        String psw = "yjs1994";
        Connection con = DriverManager.getConnection(url,name,psw);
        System.out.println("获取连接成功");

        //3. 创建会话
        Statement sta = con.createStatement();
        System.out.println("开始创建会话");

        //4. 发送sql
        int n = sta.executeUpdate("insert into pet values('nana', 'cc1', 'dog2', 'f', '1995-5-5', null)");
        System.out.println(n);

        //5. 处理结果
        if(n>0){
            System.out.println("插入数据成功！");
        }else {
            System.out.println("插入数据失败！");
        }
        //6. 关闭资源
        sta.close();
        con.close();
    }
}
```



## 3. 另一种处理异常的方式

```java
package com.sxt.test03;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Test02 {

    public static void main(String[] args) {
        String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/test?useSSL=false";
        String name = "root";
        String psw = "yjs1994";
        Statement sta = null;
        Connection con = null;

        // 完成连接数据库的操作，简单的JDBC操作
        //1. 加载驱动
        try {
            Class.forName(driver);
            System.out.println("加载驱动成功");

            //2. 获取连接

            con = DriverManager.getConnection(url, name, psw);
            System.out.println("获取连接成功");

            //3. 创建会话
            sta = con.createStatement();
            System.out.println("开始创建会话");

            //4. 发送sql
            int n = sta.executeUpdate("insert into pet values('mike', 'cc1', 'dog2', 'f', '1995-5-5', null)");
            System.out.println(n);

            //5. 处理结果
            if(n>0){
                System.out.println("插入数据成功！");
            }else {
                System.out.println("插入数据失败！");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            //6. 关闭资源
            try {
                if(sta !=null){ // 避免空指针异常
                    sta.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if(con != null){
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
```



## 4. 修改操作

```java
package com.sxt.test03;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Test03 {

    public static void main(String[] args) {
        String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/test?useSSL=false";
        String name = "root";
        String psw = "yjs1994";
        Statement sta = null;
        Connection con = null;

        // 完成连接数据库的操作，简单的JDBC操作
        //1. 加载驱动
        try {
            Class.forName(driver);
            System.out.println("加载驱动成功");

            //2. 获取连接

            con = DriverManager.getConnection(url, name, psw);
            System.out.println("获取连接成功");

            //3. 创建会话
            sta = con.createStatement();
            System.out.println("开始创建会话");

            //4. 发送sql
            int n = sta.executeUpdate("update pet set owner = 'cc10' where name = 'nana'");
            System.out.println(n);

            //5. 处理结果
            if(n>0){
                System.out.println("更新数据成功！");
            }else {
                System.out.println("更新数据失败！");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            //6. 关闭资源
            try {
                if(sta !=null){ // 避免空指针异常
                    sta.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if(con != null){
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
```



## 5. 删除操作

```java
package com.sxt.test03;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Test04 {

    public static void main(String[] args) {
        String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/test?useSSL=false";
        String name = "root";
        String psw = "yjs1994";
        Statement sta = null;
        Connection con = null;

        // 完成连接数据库的操作，简单的JDBC操作
        //1. 加载驱动
        try {
            Class.forName(driver);
            System.out.println("加载驱动成功");

            //2. 获取连接

            con = DriverManager.getConnection(url, name, psw);
            System.out.println("获取连接成功");

            //3. 创建会话
            sta = con.createStatement();
            System.out.println("开始创建会话");

            //4. 发送sql
            int n = sta.executeUpdate("delete from pet where name = 'nana'");
            System.out.println(n);

            //5. 处理结果
            if(n>0){
                System.out.println("删除数据成功！");
            }else {
                System.out.println("删除数据失败！");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            //6. 关闭资源
            try {
                if(sta !=null){ // 避免空指针异常
                    sta.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if(con != null){
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
```

总结：增加删除修改全部都可以用executeUpdate



## 6. 查询操作

 ```java
package com.sxt.test03;

import java.sql.*;

public class Test05 {

    public static void main(String[] args){
        String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/test?useSSL=false";
        String name = "root";
        String psw = "yjs1994";
        Statement sta = null;
        Connection con = null;
        ResultSet res = null;

        // 完成连接数据库的操作，简单的JDBC操作
        //1. 加载驱动
        try {
            Class.forName(driver);
            System.out.println("加载驱动成功");

            //2. 获取连接

            con = DriverManager.getConnection(url, name, psw);
            System.out.println("获取连接成功");

            //3. 创建会话
            sta = con.createStatement();
            System.out.println("开始创建会话");

            //4. 发送sql
            res = sta.executeQuery("select * from pet");
            // ResultSet 是结果集，那些数据查询到的数据都放这个集合里面了
            System.out.println(res);

            //5. 处理结果
            while (res.next()){
                String pet_name = res.getString(1);
//                String pet_name = res.getString("name");
                String owner =  res.getString(2);
                String specise = res.getString(3);
                String sex = res.getString(4);
                java.sql.Date date = res.getDate(5);
                java.sql.Date death = res.getDate(6);

                System.out.println(pet_name + "\t"+ owner+ (owner.length()>=8?"\t":"\t\t") + specise + "\t" + sex + "\t" + date + "\t"+ death +"\t ");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            //6. 关闭资源
            try {
                if(res != null){
                    res.close();
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                if(sta !=null){ // 避免空指针异常
                    sta.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if(con != null){
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
 ```



## 7. PreparedStatement

自己创建一个用户表，字段（用户名，密码） 

​	，然后在java程序中用用户名和密码登陆（键盘录入）， 

​	然后校验是否登陆成功 

【1】在数据库中建表

```sql
create table t_user(
	username VARCHAR(10),
  pwd VARCHAR(10)
)

select * from t_user;
insert into t_user values ('lili','123123'),('nana','456456'),('feifei','789789');
```

【2】开始java逻辑：

```java
package com.bjsxt.test03;
import java.sql.*;
import java.util.Scanner;
public class Test06 {
    public static void main(String[] args)  {
        String dirver="com.mysql.jdbc.Driver";
        String url="jdbc:mysql://localhost:3306/test0517";
        String username="root";
        String password="123123";
        Statement sta =null;
        Connection conn =null;
        ResultSet rs=null;
        //完成连接数据库的操作：简单的JDBC操作：
        try {
            //键盘录入账号和密码：
            System.out.println("----欢迎进入登陆界面-----");
            Scanner sc=new Scanner(System.in);
            System.out.print("账号：");
            String name=sc.next();
            System.out.print("密码：");
            String pwd=sc.next();
            //1.加载驱动
            Class.forName(dirver);
            System.out.println("加载驱动成功");
            //2.获取连接
            conn = DriverManager.getConnection(url, username, password);
            System.out.println("获取连接成功");
            //3.创建会话
            sta = conn.createStatement();
            System.out.println("开始创建会话");
            //4.发送sql
            String sql="select * from t_user where username='"+name+"' and pwd='"+pwd+"'";
            rs=sta.executeQuery(sql);
            System.out.println(sql);
            //ResultSet是结果集 ：那些数据查到的数据都放在这个集合里面了
            //5.处理结果
            if(rs.next()){
                System.out.println("登陆成功");
            }else{
                System.out.println("登陆失败，请查看用户名或者密码是否录入错误！");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            //6.关闭资源
            try {
                if(rs!=null){
                    rs.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
               if(sta!=null){//避免空指针异常
                   sta.close();
               }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
               if(conn!=null){
                   conn.close();
               }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
```

【3】上面的代码缺点是什么： 

（1）字符串的拼接麻烦 

（2）不安全： 

![Screen Shot 2019-10-04 at 2.12.46 PM](/Users/yuanjinshuai/Library/Mobile Documents/com~apple~CloudDocs/java/pic/Screen Shot 2019-10-04 at 2.12.46 PM.png)

【4】防止sql注入的解决办法：

```java
package com.bjsxt.test03;
import java.sql.*;
import java.util.Scanner;
public class Test07 {
    public static void main(String[] args)  {
        String dirver="com.mysql.jdbc.Driver";
        String url="jdbc:mysql://localhost:3306/test0517";
        String username="root";
        String password="123123";
        PreparedStatement ps =null;
        Connection conn =null;
        ResultSet rs=null;
        //完成连接数据库的操作：简单的JDBC操作：
        try {
            //键盘录入账号和密码：
            System.out.println("----欢迎进入登陆界面-----");
            Scanner sc=new Scanner(System.in);
            System.out.print("账号：");
            String name=sc.nextLine();
            System.out.print("密码：");
            String pwd=sc.nextLine();
          
          	//1.加载驱动
            Class.forName(dirver);
            System.out.println("加载驱动成功");
            
          	//2.获取连接
            conn = DriverManager.getConnection(url, username, password);
            System.out.println("获取连接成功");
          
          	/*
          	** 主要从这里开始修改
          	*/
          
            //3.创建会话并且预编译sql
            ps = conn.prepareStatement("select * from t_user where username=? and pwd=?");
            //?相当于条件的占位符，输入的name和pwd分别放到第一个？和第二个？之间
            
          	//4.设置？的值：
            ps.setString(1,name);	// 把第一个问号？设置为name
            ps.setString(2,pwd);	// 把第二个问号？设置为pwd
            
          	//5.执行：
            rs=ps.executeQuery();
          
            /*
          	** 从这里修改结束
          	*/
            
          	//6.处理结果
            if(rs.next()){
                System.out.println("登陆成功");
            }else{
                System.out.println("登陆失败，请查看用户名或者密码是否录入错误！");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            //6.关闭资源
            try {
                if(rs!=null){
                    rs.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
               if(ps!=null){//避免空指针异常
                   ps.close();
               }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
               if(conn!=null){
                   conn.close();
               }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
```

注：

​	此时` ps = conn.prepareStatement("select * from t_user where username=? and pwd=?");` 中SQL查询语句没有引号，只有问号，输入账号'lili' 和密码：dadsf' or '1'='1 , 会将整个部分放到问号的位置，只有匹配的密码才能应用。

【5】PreparedStatement好处：

![image_29579](/Users/yuanjinshuai/Library/Mobile Documents/com~apple~CloudDocs/java/pic/image_29579.png)

![image_28557](/Users/yuanjinshuai/Library/Mobile Documents/com~apple~CloudDocs/java/pic/image_28557.png)

![image_19481](/Users/yuanjinshuai/Library/Mobile Documents/com~apple~CloudDocs/java/pic/image_10974.png)



## 8. 银行转账-事务

```java
package com.bjsxt.test03;
import java.sql.*;
import java.util.Scanner;
public class Test08 {
    public static void main(String[] args)  {
        String dirver="com.mysql.jdbc.Driver";
        String url="jdbc:mysql://localhost:3306/test0517";
        String username="root";
        String password="123123";
        Statement sta =null;
        Statement sta2 =null;
        Connection conn =null;
        ResultSet rs=null;
        //完成连接数据库的操作：简单的JDBC操作：
        try {
            //1.加载驱动
            Class.forName(dirver);
            System.out.println("加载驱动成功");
            //2.获取连接
            conn = DriverManager.getConnection(url, username, password);
            System.out.println("获取连接成功");
          
          	/*
          	** 这里开始修改
          	*/
            //设置为同一个事务：
            //将事务的自动提交功能关闭：
            conn.setAutoCommit(false);
          
            //3.创建会话
            sta = conn.createStatement();
            sta.executeUpdate("update t_account set balance=balance-100 where id=1");
            sta2 = conn.createStatement();
            sta2.executeUpdate("update t_account set balance2=balance3+100 where id=2");
          
            //设置手动提交：
            conn.commit();
          
        } catch (ClassNotFound Exception e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            //6.关闭资源
            try {
                if(rs!=null){
                    rs.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
               if(sta!=null){//避免空指针异常
                   sta.close();
               }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
               if(conn!=null){
                   conn.close();
               }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
```

