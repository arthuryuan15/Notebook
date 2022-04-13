# MySQL

假设远程的ip为：10.154.0.43

端口为：3341

输入如下命令：

```shell
mysql -uroot -p -h10.154.0.43 -P3341
```



##  1. 数据库索引

 ### 1.1 哈希索引

​		hash的基本原理是把任意长度的输入，通过hash算法变成固定长度的输出。这个映射规则就是对应的hash算法。

​		对于哈希索引来说，底层的数据结构是哈希表，因此在绝大多少需求为==单条记录===查询的时候，可以使用哈希索引，查询性能最快，其余大部分场景，建议使用BTree索引。

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





## 3. 事务

​		mysql中，事务是一个**最小的不可分割的工作单元**。事务能保证一个业务的完整性。



 比如我们的银行转账：

```sql
 a -> 100

Update user set money = money-100 where name="a";

 B -> 100

Update user set money = money+100 where name ="b";
```

​	

   	实际的程序中，如果只有一条语句执行成功了，而另外一条没有执行成功。

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





## 4 mysql命令

### 4.1 表创建

```mysql
CREATE DATABASE `ssmbuild`;

USE `ssmbuild`;

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
`bookID` INT(10) NOT NULL AUTO_INCREMENT COMMENT '书id',
`bookName` VARCHAR(100) NOT NULL COMMENT '书名',
`bookCounts` INT(11) NOT NULL COMMENT '数量',
`detail` VARCHAR(200) NOT NULL COMMENT '描述',
KEY `bookID` (`bookID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8



INSERT  INTO `books`(`bookID`,`bookName`,`bookCounts`,`detail`)VALUES
(1,'Java',1,'从入门到放弃'),
(2,'MySQL',10,'从删库到跑路'),
(3,'Linux',5,'从进门到进牢');
```



学生分数sql查询

student

score

```mysql
CREATE TABLE `grades` (
`id` INT(10) NOT NULL AUTO_INCREMENT COMMENT '书id',
`name` VARCHAR(100) NOT NULL COMMENT '姓名',
`subject` VARCHAR(100) NOT NULL COMMENT '学科',
`score` INT(11) NOT NULL COMMENT '分数',
KEY `id` (`id`)
);

INSERT INTO grades VALUES(1, '小明','数学',95);
INSERT INTO grades VALUES(2, '小李','数学',96);
INSERT INTO grades VALUES(3, '小红','数学',88);
INSERT INTO grades VALUES(4, '小绿','数学',92);
INSERT INTO grades VALUES(5, '小莫','语文',92);
INSERT INTO grades VALUES(6, '小燕','语文',82);
INSERT INTO grades VALUES(7, '小婷','语文',85);
INSERT INTO grades VALUES(8, '小小','英语',68);
INSERT INTO grades VALUES(9, '小诊','英语',78);
INSERT INTO grades VALUES(10,'小雪','英语',88);

```



```mysql
mysql> select *  from grades;
+----+--------+---------+-------+
| id | name   | subject | score |
+----+--------+---------+-------+
|  1 | 小明   | 数学    |    95 |
|  2 | 小李   | 数学    |    96 |
|  3 | 小红   | 数学    |    88 |
|  4 | 小绿   | 数学    |    92 |
|  5 | 小莫   | 语文    |    92 |
|  6 | 小燕   | 语文    |    82 |
|  7 | 小婷   | 语文    |    85 |
|  8 | 小小   | 英语    |    68 |
|  9 | 小诊   | 英语    |    78 |
| 10 | 小雪   | 英语    |    88 |
+----+--------+---------+-------+
```





如果出现： `ERROR this is incompatible with sql_mode=only_full_group_by`

```mysql
set sql_mode=(select replace(@@sql_mode,'ONLY_FULL_GROUP_BY',''))
```



统计分学科，每学科的人数

```
mysql> select subject, count(*) as name from grades group by subject;
+---------+------+
| subject | name |
+---------+------+
| 数学    |    4 |
| 语文    |    3 |
| 英语    |    3 |
+---------+------+
3 rows in set (0.00 sec)
```



### 4.2 查询每科最高分数对应的学生

两个表进行自连接，先创建一个a和b表，a表统计每门课的最高分数；b是整个表。

创建a表，(select subject, max(score) as max from grades group by subject) as a

创建b表，grades as b

a表中的最高学科和最高分数和b表中相同，对应的名字就是相应的学生

```
mysql> select b.* from (select subject, max(score) as max from grades group by subject) as a, grades as b where a.max = b.score and a.subject = b.subject;
+----+--------+---------+-------+
| id | name   | subject | score |
+----+--------+---------+-------+
|  2 | 小李   | 数学    |    96 |
|  5 | 小莫   | 语文    |    92 |
| 10 | 小雪   | 英语    |    88 |
+----+--------+---------+-------+
3 rows in set (0.00 sec)
```



### 4.3 查询每门课都大约90分的学生

```mysql
CREATE TABLE `aa` (
`id` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
`name` VARCHAR(100) NOT NULL COMMENT '姓名',
`subject` VARCHAR(100) NOT NULL COMMENT '学科',
`score` INT(11) NOT NULL COMMENT '分数',
KEY `id` (`id`)
);

insert into aa values(1,'张三','语文',81);
insert into aa values(2,'张三','数学',75);
insert into aa values(3,'李四','语文',76);
insert into aa values(4,'李四','数学',90);
insert into aa values(5,'王五','语文',81);
insert into aa values(6,'王五','数学',100);
insert into aa values(7,'王五','英语',90);
```



1.   查询每个人最低的分数。

```mysql
mysql> select name, min(score) from aa group by name;
+--------+------------+
| name   | min(score) |
+--------+------------+
| 张三   |         75 |
| 李四   |         76 |
| 王五   |         81 |
+--------+------------+
3 rows in set (0.00 sec)
```

2. 通过having 过滤小于80的数据。

```mysql
mysql> select name, min(score) from aa group by name having min(score) > 80;
+--------+------------+
| name   | min(score) |
+--------+------------+
| 王五   |         81 |
+--------+------------+
1 row in set (0.00 sec)
```

3. 只获取name这个数据。

 ```mysql
mysql> select name from(select name, min(score) from aa group by name having min(score) > 80) as std ;
+--------+
| name   |
+--------+
| 王五   |
+--------+
1 row in set (0.01 sec)
 ```

