# MySQL

##  1. 数据库索引

 ### 1.1 哈希索引

​		对于哈希索引来说，底层的数据结构是哈希表，因此在绝大多少需求为单条记录查询的时候，可以使用哈希索引，查询性能最快，其余大部分场景，建议使用BTree索引。

### 1.2 BTree索引

​		Mysql的BTree索引使用的是B树种的B+Tree，但对于主要的两种存储方式（MylSAM和InnoDB）的实现方式是不同的。



## 2. 数据库优化方法

### 2.1 限定数据的范围

​		务必禁止不带任何限制数据范围条件的查询语句。比如：我们当用户在查询订单历史的时 候，我们可以控制在一个月的范围内。；

### 2.2 读/写分离

​		经典的数据库拆分方案，主库负责写，从库负责读；

### 2.3 垂直分区

​		根据数据库里面数据表的相关性进行拆分。 

​		例如，用户表中既有用户的登录信息又有用户的基本信息，可以将用户表拆分成两个单独的表，甚至放到单独的库做分库。简单来说垂直拆分是指数据表列的拆分， 把一张列比较多的表拆分为多张表。 如下图所示，这样来说大家应该就更容易理解了。

### 2.4 水平分区

​		保持数据表结构不变，通过某种策略存储数据分片。

​		这样每一片数据分散到不同的表或者库中，达 到了分布式的目的。 水平拆分可以支撑非常大的数据量。 水平拆分是指数据表行的拆分，表的行数超过200万 行时，就会变慢，这时可以把一张的表的数据拆成多张表来存放。举个例子：我们可以将用户信息表拆分成多 个用户信息表，这样就可以避免单一表数据量过大对性能造成影响。	

## 3. Transaction 事务

​	*Transactions in Java*, as in general refer to a series of **actions** that must all complete successfully

​	A *transaction* in sql is a unit of **work** that is performed in a database. 



​		mysql中，事务是一个**最小的不可分割的工作单元**。事务能保证一个业务的完整性。

 比如我们的银行转账：

```sql
 a -> 100

Update user set money = money-100 where name="a";

 B -> 100

Update user set money = money+100 where name ="b";
```

​		实际的程序中，如果只有一条语句执行成功了，而另外一条没有执行成功。

​		出现数据前后不一致。

​		多条sql语句，可能会有同时成功的要去，要么就同时失败。

 

### 3.1 Mysql 中如何控制事务？

### 3.1.1 mysql默认开始事务

​			（自动提交）

### 3.1.2 执行sql语句效果立即显示

​		事务回滚（rollback）：撤销sql语句的执行效果

​		设置mysql自动提交为false，set autocommit=0；

​		上面的操作，关闭了mysql的自动提交（commit）

 ### 3.1.3 手动开启事务

​		begin；或者start ；都可以手动开启事务；

​		手动开启事务也可以回滚。

​		事务开启之后，一旦commit提交，就不可以回滚。（也就是当前的这个事务在提交的时候就结束了）


### 3.1.4 事务的四大特征

​		A 原子性：事务是最小的单位，不可以再分割。

​		C 一致性：事务要求，同一事务中的sql语句，必须保证同时成功或者同时失败。

​		I 隔离性：事务1 和事务2 之间具有隔离性。

​		D持久性：事务一旦结束（commit, rollback），就不可以返回。

 

​		事务开启：

			1. 修改默认提交 set autocommit = 0；
			2. begin；
			3. start trainsaction；
​		事务手动提交；

​		commit;

 		事务手动回滚;

​		rollback;

 

###3.1.5 事务的隔离性

 

1. Read uncommitted； 读未提交的
2. Read     committed；   读已经提交的
3. Repeatable     read；   可以重复读
4. serializable；       串行化 

 

**1 Read uncommitted； 读未提交的**


​		如果事务a，和事务b

​		a事务对数据进行操作，在操作的过程中，事务没有被提交，但是b可以看见a操作的结果

 		如何查看隔离级别？

```mysql
Mysql 8.0；

--系统级别的

Select @@global.transaction_isolation;

--会话级别的

Select @@trainsaction_isolation;
```

​		如何修改隔离级别？

```mysql
Set transaction isolation level read uncommitted; 
```

​		如果在两个不同的地方，都在进行操作，如果事务a开启之后，他的数据可以别其他事务读取到，这样就会出现脏读。

​		**脏读**：一个事务读到了另外一个事务没有提交的数据，就叫做脏读。

​		实际开发中不允许出现脏读。

 

**2 Read committed；   读已经提交的 **

```mysql
Set transaction isolation level read committed;
```


​		虽然我只能读到另外一个事务提交的数据，但还是会出现问题，就是读取同一个表的数据，发现前后不一致。

​		不可重复读现象：read committed

 

**3 Repeatable read；   可以重复读**

```mysql
 Set transaction isolation level repeatable read;
```

​		事务a和事务b同时操作一张表，事务a提交的数据， 也不能被事务b读到，就可以造成幻读。



**4 serializable；       串行化 **

 ```mysql
Set transaction isolation level serializable;
 ```

​		当user表被另外一个事务操作的时候，其他事务里面的写操作，是不可进行的。进入排队状态（串行化），直到另外一边的事务结束后，当前事务的写入操作才会执行。

 		串行化问题是，性能特差！！！

 












**隔离级别越高，性能越差**

READ-UNCOMMITTED > READ-COMMITED > REPEATABLE-READ > SERIALIZABLE

 mysql默认隔离级别是 REPEATABLE-READ



## 4 Install

how to install on centos

### 1 install yum repo



>   version 5.7

1 because yum doesn't have mysql, so you need to download from offical website by 

```shell
wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
```

2 and install by repo

```shell
rpm -ivh mysql57-community-release-el7-9.noarch.rpm
```

​	after this /etc/yum.repos.d/ will create two repo files which are `mysql-community.repo` `mysql-community-source.repo`



>   version 8.0

1 because yum doesn't have mysql, so you need to download from offical website by 

```shell
wget https://repo.mysql.com//mysql80-community-release-el7-6.noarch.rpm
```

2 and install by repo

```shell
rpm -ivh mysql80-community-release-el7-6.noarch.rpm
```

​	after this /etc/yum.repos.d/ will create two repo files which are `mysql-community.repo` `mysql-community-source.repo`



### 2 install mysql by yum

1 install command

```shell
yum install mysql-server
```

2 start mysql

```shell
systemctl start mysqld #start MySQL
```

3 get temporary password

```shell
grep 'temporary password' /var/log/mysqld.log
```

4 if you don't have password

```shell
rm -rf /var/lib/mysql
systemctl start mysqld #start MySQL
```



### 3 login mysql

```shell
mysql -u root -p
```

enter your password you just changed

after you login at frist time you need to change the password by following command.

```shell
ALTER USER 'root'@'localhost' IDENTIFIED  BY 'MYSQL_ROOT_PASSWORD';
```



### 4 restart mysql

```shell
systemctl restart mysqld
```

https://zhuanlan.zhihu.com/p/267289541



## 5 mysql command

https://dev.mysql.com/doc/refman/8.0/en/creating-database.html

### Creating and Selecting a Database

```mysql
mysql> CREATE DATABASE menagerie;
```



### SQL INSERT INTO Statement

```mysql
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
```

```mysql
INSERT INTO table_name
VALUES (value1, value2, value3, ...);
```



## 6 questions

### 1 error: Failed dependencies

Check `#rpm -qa | grep mysql` to query list all rpm packages related to mysql

------

To remove mysql57-community-release issue:

```
# rpm -e --nodeps mysql57-community-release
```

Note: --no-deps no longer works, need to be --nodeps



### 2 ERROR 2003 (HY000)



