# Redis

[reference](https://zhuanlan.zhihu.com/p/37982685)

Redis: **RE**mote **DI**ctionary **S**erver(远程字典服务器)



## 1 Redis概述

​		一些商品抢购的情景，或者是主页访问量瞬间较大的时候，单一使用数据库来保存数据的系统会因为面向磁盘，磁盘读/写速度比较慢的问题而存在严重的性能弊端，一瞬间成千上万的请求到来，需要系统在极短的时间内完成成千上万次的读/写操作，这个时候往往不是数据库能够承受的，极其容易造成数据库系统瘫痪，最终导致服务宕机的严重生产问题。

​		Redis不仅仅支持简单的key-value类型的数据，同时还可以提供list，set，hash等数据结构的存储



## 2 NoSQL技术

​		为了克服上述的问题，Java Web项目通常会引入NoSQL技术，这是一种**基于内存的数据库**，并且提供一定的持久化功能。		

​		**Redis**和**MongoDB**是当前使用最广泛的NoSQL，而就Redis技术而言，它的性能十分优越，可以**支持每秒十几万此的读/写操作**，其性能远超数据库，并且还**支持集群、分布式、主从同步等**配置，原则上可以无限扩展，让更多的数据存储在内存中，更让人欣慰的是它还**支持一定的事务能力**，这保证了高并发的场景下数据的安全和一致性。



备注：对于读远大于写的情况，读可以用redis，写可以通过mysql的分库分表、读写分离。



## 3 Redis 在 Java Web 中的应用

Redis 在 Java Web 主要有两个应用场景：

- 存储 **缓存** 用的数据；
- 需要高速读/写的场合**使用它快速读/写**；



### 3.1 缓存

​		在日常对数据库的访问中，读操作的次数远超写操作，比例大概在 **1:9** 到 **3:7**，所以需要读的可能性是比写的可能大得多的。当我们使用SQL语句去数据库进行读写操作时，数据库就会**去磁盘把对应的数据索引取回来**，这是一个相对较慢的过程。

​		如果我们把数据放在 Redis 中，也就是直接放在内存之中，让服务端**直接去读取内存中的数据**，那么这样速度明显就会快上不少，并且会极大减小数据库的压力，但是使用内存进行数据存储开销也是比较大的，限于成本的原因，一般我们**只是使用 Redis 存储一些常用和主要的数据**，比如用户登录的信息等。

​		一般而言在使用 Redis 进行存储的时候，我们需要从以下几个方面来考虑：

- **业务数据常用吗？命中率如何？**如果命中率很低，就没有必要写入缓存；
- **该业务数据是读操作多，还是写操作多？**如果写操作多，频繁需要写入数据库，也没有必要使用缓存；
- **业务数据大小如何？**如果要存储几百兆字节的文件，会给缓存带来很大的压力，这样也没有必要；

在考虑了这些问题之后，如果觉得有必要使用缓存，那么就使用它！使用 Redis 作为缓存的读取逻辑如下图所示：

![读取逻辑](https://tva1.sinaimg.cn/large/006y8mN6ly1g8nfcqhzqkj30g209kab4.jpg)

从上图我们可以知道以下两点：

1. 当**第一次读取数据的时候**，读取 Redis 的数据就会失败，此时就会触发程序读取数据库，把数据读取出来，并且写入 Redis 中；
2. 当**第二次以及以后需要读取数据时**，就会直接读取 Redis，读到数据后就结束了流程，这样速度就大大提高了。

从上面的分析可以知道，读操作的可能性是远大于写操作的，所以使用 Redis 来处理日常中需要经常读取的数据，速度提升是显而易见的，同时也降低了对数据库的依赖，使得数据库的压力大大减少。



​		分析了读操作的逻辑，下面我们来看看**写操作的流程**：

![写操作](https://tva1.sinaimg.cn/large/006y8mN6ly1g8nfe4fzwgj306e077aa8.jpg)

​		从流程可以看出，更新或者写入的操作，需要多个 Redis 的操作，如果业务数据写次数远大于读次数那么就没有必要使用 Redis。

> 关于使用内存存储数据，我知道谷歌好像就是**把所有互联网的数据都存储在内存条**的，所以才会有如此高质量、高效的搜索，但它毕竟是谷歌…



### 3.2 高速读/写的场合

​		在如今的互联网中，越来越多的存在高并发的情况，比如天猫双11、抢红包、抢演唱会门票等，这些场合都是在某一个瞬间或者是某一个短暂的时刻有**成千上万的请求**到达服务器，如果单纯的使用数据库来进行处理，就算不崩，也会很慢的，**轻则造成用户体验极差用户量流失**，**重则数据库瘫痪，服务宕机**，而这样的场合都是不允许的！

　	所以我们需要使用 Redis 来应对这样的高并发需求的场合，我们先来看看**一次请求操作的流程图**：

![高并发](https://tva1.sinaimg.cn/large/006y8mN6ly1g8o2ucbh0yj30eh0alt9s.jpg)



​	我们来进一步阐述这个过程：

1. 当一个请求到达服务器时，只是把业务数据在 Redis 上进行读写，而没有对数据库进行任何的操作，这样就能大大提高读写的速度，从而满足**高速响应的需求**；

2. 但是这些缓存的数据仍然需要持久化，也就是存入数据库之中，所以在一个请求操作完 Redis 的读/写之后，会去**判断该高速读/写的业务是否结束**，这个判断通常会在秒杀商品为0，红包金额为0时成立，如果不成立，则不会操作数据库；如果成立，则触发事件将 Redis 的缓存的数据以批量的形式**一次性写入数据库**，从而完成持久化的工作。

	
	
	
	
## 4 Redis安装

mac 安装Redis

[reference](https://medium.com/@petehouston/install-and-config-redis-on-mac-os-x-via-homebrew-eb8df9a4f298)

```shell
$ brew install redis

// 1 Launch Redis on computer starts.
$ ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents

//2 Start Redis server via “launchctl”.
$ launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist

//3 Start Redis server using configuration file. (用这个启动)
$ redis-server /usr/local/etc/redis.conf

//4 Stop Redis on autostart on computer start.
$ launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist

//5 Location of Redis configuration file.
/usr/local/etc/redis.conf

//6 Uninstall Redis and its files.
$ brew uninstall redis
$ rm ~/Library/LaunchAgents/homebrew.mxcl.redis.plist

//7 Get Redis package information.
$ brew info redis

//8 Test if Redis server is running.
$ redis-cli ping

```



```shell
1. 确保Linux已经安装gcc
2. 下载Redis
wget http://download.redis.io/releases/redis-4.0.1.tar.gz
3. 解压
tar -zxvf redis-4.0.1.tar.gz
4. 进入目录后编译
cd redis-4.0.1
make MALLOC=libc
安装
make PREFIX=/usr/local/redis install #指定安装目录为/usr/local/redis
启动
/usr/local/redis/bin/redis-server
```





## 5 在java中使用Redis

###5.1 添加 Jedis 依赖



```java
import redis.clients.jedis.Jedis;

public class Test {

    public void redisTester() {
        Jedis jedis = new Jedis("localhost", 6379, 100000);
        int i = 0;
        try {
            long start = System.currentTimeMillis();// 开始毫秒数
            while (true) {
                long end = System.currentTimeMillis();
                if (end - start >= 1000) {// 当大于等于1000毫秒（相当于1秒）时，结束操作
                    break;
                }
                i++;
                jedis.set("test" + i, i + "");
            }
        } finally {// 关闭连接
            jedis.close();
        }
        // 打印1秒内对Redis的操作次数
        System.out.println("redis每秒操作：" + i + "次");
    }

    public static void main(String[] args){
        Test t= new Test();
        t.redisTester();
    }
}

```

官方的性能测试方法: 十万级别

```
redis-benchmark -n 100000 -q
```



### 5.2 使用 Redis 连接池

跟数据库连接池相同，Java Redis也同样提供了类`redis.clients.jedis.JedisPool`来管理我们的Reids连接池对象，并且我们可以使用`redis.clients.jedis.JedisPoolConfig`来对连接池进行配置，代码如下



### 5.3 在 Spring 中使用 Redis



### 5.4 在 SpringBoot 中使用 Redis





### 5.5 在Redis中操作集合

**启动redis：**

```shell
redis-server
```

 ```
redis-cli -p 6379
 ```

**关闭redis**

```
redis-cli shutdown
```



#### 5.5.1 在Redis中操作List

​		类似于Java中的LinkedList。

```java
// list数据类型适合于消息队列的场景:比如12306并发量太高，而同一时间段内只能处理指定数量的数据！必须满足先进先出的原则，其余数据处于等待
@Test
public void listPushResitTest() {
	// leftPush依次由右边添加
	stringRedisTemplate.opsForList().rightPush("myList", "1");
	stringRedisTemplate.opsForList().rightPush("myList", "2");
	stringRedisTemplate.opsForList().rightPush("myList", "A");
	stringRedisTemplate.opsForList().rightPush("myList", "B");
	// leftPush依次由左边添加
	stringRedisTemplate.opsForList().leftPush("myList", "0");
}

@Test
public void listGetListResitTest() {
	// 查询类别所有元素
	List<String> listAll = stringRedisTemplate.opsForList().range("myList", 0, -1);
	logger.info("list all {}", listAll);
	// 查询前3个元素
	List<String> list = stringRedisTemplate.opsForList().range("myList", 0, 3);
	logger.info("list limit {}", list);
}

@Test
public void listRemoveOneResitTest() {
	// 删除先进入的B元素
	stringRedisTemplate.opsForList().remove("myList", 1, "B");
}

@Test
public void listRemoveAllResitTest() {
	// 删除所有A元素
	stringRedisTemplate.opsForList().remove("myList", 0, "A");
}
```



#### 5.5.2 在Redis中操作Hash

​		Redis hash是一个string类型的field和value的映射表，**hash特别适用于存储对象**。每个hash可以存储$2^{32}-1$键值对。可以看成KEY和VALUE的MAP容器。相比于JSON，hash占用很少的内存空间

```java
@Test
public void hashPutResitTest() {
	// map的key值相同，后添加的覆盖原有的
	stringRedisTemplate.opsForHash().put("banks:12600000", "a", "b");
}

@Test
public void hashGetEntiresResitTest() {
	// 获取map对象
	Map<Object, Object> map = stringRedisTemplate.opsForHash().entries("banks:12600000");
	logger.info("objects:{}", map);
}

@Test
public void hashGeDeleteResitTest() {
	// 根据map的key删除这个元素
	stringRedisTemplate.opsForHash().delete("banks:12600000", "c");
}

@Test
public void hashGetKeysResitTest() {
	// 获得map的key集合
	Set<Object> objects = stringRedisTemplate.opsForHash().keys("banks:12600000");
	logger.info("objects:{}", objects);
}

@Test
public void hashGetValueListResitTest() {
	// 获得map的value列表
	List<Object> objects = stringRedisTemplate.opsForHash().values("banks:12600000");
	logger.info("objects:{}", objects);
}

@Test
public void hashSize() { // 获取map对象大小
	long size = stringRedisTemplate.opsForHash().size("banks:12600000");
	logger.info("size:{}", size);
}
```



#### 5.5.3 在Redis中操作String

​		string类型是二进制安全的，redis的string可以包含任何数据，如图像、序列化对象。一个键最多能存储512MB。==二进制安全是指，在传输数据的时候，能保证二进制数据的信息安全，也就是不会被篡改、破译；如果被攻击，能够及时检测出来 ==



#### 5.5.4 在Redis中操作Set

​		唯一、无序

