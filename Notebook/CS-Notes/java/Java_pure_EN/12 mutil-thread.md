# Multithreading

## Object

* To get an overview of multithreading (§30.2).

* To develop task classes by implementing the Runnable interface (§30.3).

* To create threads to run tasks using the Thread class (§30.3).

* To control threads using the methods in the Thread class (§30.4). To control animations using threads and use Platform.runLater to run the code in the application thread (§30.5).

* To execute tasks in a thread pool (§30.6).

* To use synchronized methods or blocks to synchronize threads to avoid race conditions (§30.7).

* To synchronize threads using locks (§30.8).

* To facilitate thread communications using conditions on locks (§§30.9 and 30.10).

* To use blocking queues (ArrayBlockingQueue, LinkedBlockingQueue, PriorityBlockingQueue) to synchronize access to a queue (§30.11).

* To restrict the number of concurrent tasks that access a shared resource using semaphores (§30.12).

* To use the resource-ordering technique to avoid deadlocks (§30.13). To describe the life cycle of a thread (§30.14).

* To create synchronized collections using the static methods in the Collections class (§30.15).

* To develop parallel programs using the Fork/Join Framework (§30.16).

  

## 1 Thread Concepts

​		A thread is the flow of execution, from beginning to end, of a task.

​		In Java, each task is an instance of the Runnable interface, also called a *runnable object*. A thread is essentially an object that facilitates the execution of a task.



## 2 Creating Tasks and Thread

​	Tasks are objects. To create tasks, you have to first define a class for tasks, which implements the **Runnable** interface.

![image-20210618102747329](https://tva1.sinaimg.cn/large/008i3skNly1grm7mh660hj31f60lcjwl.jpg)

```java
Thread thread = new Thread(task);
```

​	A task must be executed in a thread. The Thread class contains the constructors  for the creating threads and many useful methods for controlling threads.

    ```java
    thread.start();
    thread.run();
    ```

​     The **run()** method in a task specifies how to perform the task. This method is automatically invoked by the JVM. You should not invoke it. Invoking **run() **directly merely executes this method in the same thread; no new thread is started.



## The Thread Class

​	The thread class contains the constructors for creating threads for tasks and the methods for controlling threads.

​	![image-20210618105225350](https://tva1.sinaimg.cn/large/008i3skNly1grm8c1wqhnj31cs0o27at.jpg)

Since the **Thread** class implements Runnable, you could define a class that extends **Thread** and implements the run method,





## 4  Thread Pools

```java
Runnable task = new TaskClass(task); 
new Thread(task).start();
```

​	This approach is convenient for a single task execution, but it is not efficient for a large number of tasks because you have to create a thread for each task.

​	Using a thread pool is an ideal way to manage the number of tasks executing concurrently.

​	![image-20210618105934424](https://tva1.sinaimg.cn/large/008i3skNly1grm8jhpj9xj31hu0n8dmq.jpg) 

​	The **newFixedThreadPool(int) ** method creates a fixed number of threads in pool.

![image-20210618110136768](https://tva1.sinaimg.cn/large/008i3skNly1grm8lmx4t4j31hs0dojvx.jpg)

## 5 Thread Synchronization

​	A shared resource may become corrupted if it is accessed simultaneously  by multiple threads.

![image-20210618111110404](https://tva1.sinaimg.cn/large/008i3skNly1grm8vk7jmnj31480ayac0.jpg)

​	Obviously, the problem is that Task 1 and Task 2 are accessing a common resource in a way that causes a conflict. This is a common problem, know as race condition.

### 5.1 The synchronized Keyword

```java
public synchronized void deposit(double amount)
```



![image-20210618111150411](https://tva1.sinaimg.cn/large/008i3skNly1grm8w9flhoj312k0mkq5y.jpg)



### 5.2 Synchronizing Statements

```java
synchronized (expr) { 
  statements; 
}
```



## 6 Synchronization Using Locks

​	A synchronization instance method implicitly acquires a *lock* on the instance before it executes the method.

​	![image-20210618111958974](https://tva1.sinaimg.cn/large/008i3skNly1grm94q7xktj31900keafi.jpg)



## 7 Cooperation among Threads

​	A thread can specify what to do under a certain condition. Conditions are objects created by invoking the **newCondition()** method on a **Lock** object. Once a condition is created, you can use its **await()**, **signal**, and **signalAll()** methods for thread communications.

![image-20210618112454022](https://tva1.sinaimg.cn/large/008i3skNly1grm99unw2aj615g0bwdj102.jpg)









