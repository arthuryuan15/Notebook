# interview prepare - tech

岗位职责：

1、参与公司区块链基础设施项目的技术调研、开发和维护。

岗位要求：

1、3年以上java使用经验，熟练掌握spring全家桶的使用和原理；

2、良好的代码风格，编程习惯；

3、拥有较强的英语读写能力；

4、学习能力强、对前沿技术和新知识快速接受和研究的能力；

5、对区块链技术有强烈的兴趣或坚定的信仰。

加分项：

1、了解主流公链(包括bitcoin/ethereum/eos/ripple/polkadot等)的共识、钱包、节点维护；

2、熟悉主流公链(BTC/ETH/Polkadot)应用开发流程、框架、工具。

Responsibilities• Responsible for the architecture and R&D of the company’s platform services• Continuously deliver data value (services) for the company in high quality, low cost, and excellent efficiency• Provide architecture and performance optimization solutions, and lead the rapid iteration of the data platform services• Familiar with distributed system, caching, messaging and other mechanism, have experience in using redis, kafka, storm, flink, zookeeper.

Requirements• Degree or above in Computer Science, Computer Engineering, Math or a related field with strong experience in Java development, and in depth understanding of JVM principles• Familiar with common framework (Spring, Mybatis)• Solid computer science foundation, master computer operating system, network architecture, familiar with common algorithms, data structure and design patterns• Familiar with distributed system, caching, messaging and other mechanism, using redis, kafka, storm, flink, zookeeper• Experienced in data platform (front, middle, end) or microservice design and development, focusing on the high availability and scalability of the architecture is preferred

multi-threading:

1.  用户获取筛选的课堂，可以用线程池提高响应速度。由于多线程的缘故导致顺序乱序，按照原有顺序排列，返回结果

    ```java
    @Override
        @Bean(name = "executor")
        public Executor getAsyncExecutor() {
            log.info("start asyncServiceExecutor");
            ThreadPoolTaskExecutor executor = new VisableThreadPoolExecutor();
            // 配置核心线程数
            executor.setCorePoolSize(corePoolSize);
            // 配置最大线程数
            executor.setMaxPoolSize(maxPoolSize);
            // 配置队列大小
            executor.setQueueCapacity(queueCapacity);
            // 配置线程池中的线程的名称前缀
            executor.setThreadNamePrefix("async-service-");
    
            // rejection-policy：当pool已经达到max size的时候，如何处理新任务
            // CALLER_RUNS：不在新线程中执行任务，而是有调用者所在的线程来执行
            executor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());
            // 执行初始化
            executor.initialize();
            return executor;
        }
    ```

Spring

SpringBoot

SpringCloud

Maven:

1.  maven 寻找依赖顺序：本地-公司私服-中央仓库
2.  maven 周期: complie test package install deploy ,  clean
3.  通过groupId, artifactId, version 确定依赖的位置。groupid 网站反写+项目名 artifactId 项目名+ 模块名
4.  依赖传递原则: 最短路 + 最先声明

Kafka - Message Queue:

好处:

1.  提高响应速度，无需等待返回结果，放到队列中就返回状态
2.  提高系统稳定，
3.  如何配置:

redis

1.  k v (String, hashMap List Set Zset)
2.  存到内存 磁盘IO影响性能
3.  Redis 是不支持回滚的，不会像mysql的事务一样，要么执行要么都不执行

mysql

1.  B+Tree
2.  优化：限定数据范围，读写分离（主库负责写，从库负责读，redis中间件记录是否最近写的，如果是读主库，否则读从库）

Swagger

Git:

从上面可以看到，merge和rebasea都是合并历史记录，但是各自特性不同：

**merge**

通过merge合并分支会新增一个merge commit，然后将两个分支的历史联系起来

其实是一种非破坏性的操作，对现有分支不会以任何方式被更改，但是会导致历史记录相对复杂

**rebase**

rebase会将整个分支移动到另一个分支上，有效地整合了所有分支上的提交

主要的好处是历史记录更加清晰，是在原有提交的基础上将差异内容反映进去，消除了 git merge所需的不必要的合并提交

**revert && reset**

-   -mixed(默认)：默认的时候，只有暂存区变化
-   -hard参数：如果使用 --hard 参数，那么工作区也会变化
-   -soft：如果使用 --soft 参数，那么暂存区和工作区都不会变化
-   git revert是用一次逆向的commit“中和”之前的提交，因此日后合并老的branch时，之前提交合并的代码仍然存在，导致不能够重新合并
-   但是git reset是之间把某些commit在某个branch上删除，因而和老的branch再次merge时，这些被回滚的commit应该还会被引入

最大线程数设定

吞吐量来规划；

1.  CPU密集型的任务，最大线程数<=CPU的可用核心数。
2.  IO密集型的任务，最大线程数和CPU核心数没有很强的联系，根据任务量的大小和服务器的性能来设定一个值。

mybatis

同事负责的项目，什么样的项目需要涉及多人沟通

1 负责收集表单等数据，给运营

2 task任务

3 微信小程序

4 运营工具

5 pc端

7 课程购买

8 课程设置

9 我负责作业

nacos

ones mq:

how anotation work in java?

What is AbstractQueuedSynchronizer?

springboot how to run?

**Thread Safety and how to achieve it in Java?**

https://www.geeksforgeeks.org/thread-safety-and-how-to-achieve-it-in-java/

**design pattern？**

单例模式、工厂模式

springboot reflecting done

依赖注入

OOP question

bit manipulation (copying), SQL (delete query), Bash (chmod), Binary Trees, Bug fixing (smart pointers)

For example what data structure(s) can you use to efficiently find minimum 10 numbers in an incredibly large data set.

What is a protected class member?

**Senior Java Developer - Consumer BG - Contract**

## About the job

We are seeking bright Java Application developer with hands-on experience in integration platform or related development to join Consumer Business Group. The team's mission is to leverage innovative technologies improve the performance of Huawei’s mobile system.

-   Analyze, research, and implementation on Android application
-   Development of Huawei mobile platform.

**Qualifications**

· 3+ years Java application development experience.

· Concrete knowledge in Java programing model and JavaScript/TypeScript.

· Knowledge on compiler

· Ability to rapidly learn new software, frameworks, open-source tools, and development languages.

· Excellent organization skills, attention to detail, and ability to multi-task under considerable pressure and changing priorities.

· Strong interpersonal and team communications skills are essential.

· BS degree in Computer Science or equivalent; advanced degree a plus





1. 