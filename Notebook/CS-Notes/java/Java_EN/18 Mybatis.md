# Mybatis

https://www.bilibili.com/video/av71389596/?p=5

## 1 框架

​		框架是我们在软件开发中的一套解决方案，不同的框架解决的是不同的问题。

### 1.1 三层架构

​		表现层：是用于展示数据的

​		业务层：是处理业务需求的

​		持久层：是和数据库交互的

### 1.2 持久层技术解决方案

1. JDBC：

​				Connection

​				PreparedStatement

​				ResultSet

2. Spring的jdbcTemplate：

   ​		Spring中对jdbc的简单封装	

3. Apache的DBUtils：

   ​		它和Spring的jdbcTemple很像，也是对jdbc的简单封装

   以上这些都不是框架

   ​		JDBC是规范

   ​		Spring的jdbcTemple和Apache的DBUtils都只是工具类

## 2 Mybatis框架

​		mybatis是一个优秀的基于java的持久层框架，它==内部封装了jdbc==，使开发者只需要关注sql语句本身，而不需要花费精力去处理加载驱动，创建连接、创建statement等繁杂的过程。

​		采用ORM思想解决了实体和数据库映射的问题。实现了结果集的封装。

​		ORM：

​				Object Relational Mapping 对象关系映射

​				简单来说：

​							就是把数据库表和实体类以及实体类的属性对应起来

​							让我们可以操作实体类就实现操作数据库表。

​							user表												user类

​							id 列名											    userid 属性名

​							user_name 列名                                userName 属性名

​		

## 3. mybatis的入门

​		mybatis的环境搭建

​		[IDEA导入JDBC驱动的jar包](https://blog.csdn.net/SSY_1992/article/details/88344709)



​		mybatis的入门案例



resultmap resulttype 区别

* resultType是直接表示返回类型的(对应着我们的model对象中的实体)

  * 当提供的返回类型属性是resultType时，MyBatis会将Map里面的键值对取出赋给resultType所指定的对象对应的属性

* resultMap则是对外部ResultMap的引用(提前定义了db和model之间的隐射key-->value关系)，但是resultType跟resultMap不能同时存在。

  ```xml
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
  <mapper xmlns="http://mybatis.org/schema/mybatis-mapper" namespace="com.example.demo.dao.mapper.BookPoMapper">
  
      <insert id="insert" parameterType="com.example.demo.dao.entity.BookPO">
          INSERT INTO book(id, isbn, title)
          VALUE(#{id}, #{title}, #{isbn})
      </insert>
  
  </mapper>
  ```

  


