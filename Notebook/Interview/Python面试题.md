# Python面试题

**一、变量与对象**

　1、Python缓存了整数和短字符串，因此每个对象在内存中只存有一份，引用所指对象就是相同的，即使使用赋值语句，也只是创造新的引用，而不是对象本身；

　　2、Python没有缓存长字符串、列表及其他对象，可以由多个相同的对象，可以使用赋值语句创建出新的对象。

Python的内存管理机制：引入计数、垃圾回收、内存池机制

## 1. 内存管理机制

###1.1引入计数

​		 在Python中，每个对象都有指向该对象的引用总数---引用计数

​		查看对象的引用计数：`sys.getrefcount()`

 #### 1.1.1 普通引用 

```Python
In [2]: import sys
 
In [3]: a=[1,2,3]
In [4]: getrefcount(a)
Out[4]: 2
 
In [5]: b=a
In [6]: getrefcount(a)
Out[6]: 3
In [7]: getrefcount(b)
Out[7]: 3
```

 		注意：当使用某个引用作为参数，传递给getrefcount()时，参数实际上创建了一个临时的引用。因此，getrefcount()所得到的结果，会比期望的多1。

#### 1.1.2 容器对象 

​		Python的一个容器对象(比如：表、词典等)，可以包含多个对象。

```
In [12]: a=[1,2,3,4,5]
In [13]: b=a
 
In [14]: a is b
Out[14]: True
 
In [15]: a[0]=6   
In [16]: a
Out[16]: [6, 2, 3, 4, 5]
 
In [17]: a is b
Out[17]: True
 
In [18]: b
Out[18]: [6, 2, 3, 4, 5]
```

 ![1113510-20170703163942769-1617276581](/Users/yuanjinshuai/Library/Mobile Documents/com~apple~CloudDocs/notebook/java/pic/1113510-20170703163942769-1617276581.png)

​		由上可见，实际上，容器对象中包含的并不是元素对象本身，是指向各个元素对象的引用。 

####1.1.3 引用计数增加

1.  对象被创建 

```python
In [39]: getrefcount(123)
Out[39]: 6
 
In [40]: n=123
 
In [41]: getrefcount(123)
Out[41]: 7
```

 2 另外的别人被创建

```python
In [42]: m=n
In [43]: getrefcount(123)
Out[43]: 8
```

 3 作为容器对象的一个元素

```python
In [44]: a=[1,12,123]
In [45]: getrefcount(123)
Out[45]: 9
```

4 被作为参数传递给函数：foo(x)

#### 1.1.4 引用计数减少

1. 对象的别名被显式的销毁

   ```python 
   In [46]: del m
   In [47]: getrefcount(123)
   Out[47]: 8
   ```

2. 对象的一个别名被赋值给其他对象

   ```python
   In [48]: n=456
   In [49]: getrefcount(123)
   Out[49]: 7
   ```

3. 对象从一个窗口对象中移除，或，窗口对象本身被销毁

   ```python
   In [50]: a.remove(123)
   In [51]: a
   Out[51]: [1, 12]
   
   In [52]: getrefcount(123)
   Out[52]: 6
   ```

4. 一个本地引用离开了它的作用域，比如上面的foo(x)函数结束时，x指向的对象引用减1。

    

###1.2 垃圾回收 

​		当Python中的对象越来越多，占据越来越大的内存，启动垃圾回收(garbage collection)，将没用的对象清除。

#### 1.2.1 原理

　　当Python的某个对象的引用计数降为0时，说明没有任何引用指向该对象，该对象就成为要被回收的垃圾。比如某个新建对象，被分配给某个引用，对象的引用计数变为1。如果引用被删除，对象的引用计数为0，那么该对象就可以被垃圾回收。

```python
In [74]: a=[321,123]
 
In [75]: del a
```

 解析del

　　del a后，已经没有任何引用指向之前建立的[321,123]，该表引用计数变为0，用户不可能通过任何方式接触或者动用这个对象，当垃圾回收启动时，Python扫描到这个引用计数为0的对象，就将它所占据的内存清空。

 #### 1.2.2 注意

 1、 垃圾回收时，Python不能进行其它的任务，频繁的垃圾回收将大大降低Python的工作效率；

 2、Python只会在特定条件下，自动启动垃圾回收（垃圾对象少就没必要回收）

 3、 当Python运行时，会记录其中分配对象(object allocation)和取消分配对象(object deallocation)的次数。当两者的差值高于某个阈值时，垃圾回收才会启动。

 

###1.3 内存池机制 

　　Python中有分为大内存和小内存：（256K为界限分大小内存）

​		1、大内存使用malloc进行分配

​		2、小内存使用内存池进行分配 

​		3、Python的内存池(金字塔)

​		　　第3层：最上层，用户对Python对象的直接操作

　　		第1层和第2层：内存池，有Python的接口函数PyMem_Malloc实现-----若请求分配的内存在1~256字节之间就使用内存池管理系统进行分配，调用malloc函数分配内存，但是每次只会分配一块大小为256K的大块内存，不会调用free函数释放内存，将该内存块留在内存池中以便下次使用。

　　		第0层：大内存-----若请求分配的内存大于256K，malloc函数分配内存，free函数释放内存。

　　		第-1，-2层：操作系统进行操作		

![1113510-20170703164946409-1883256382](/Users/yuanjinshuai/Library/Mobile Documents/com~apple~CloudDocs/notebook/java/pic/1113510-20170703164946409-1883256382.png)

 

## 2. 生成器、迭代器

### 2.1 迭代器

​		迭代器就是用于迭代操作（for循环）的对象，它可以像列表一样可以迭代其中的每一个元素。

#### 2.1.1 引入

​		字符串是一个容器，同时也是一个迭代器

​		FOR 语句触发这个迭代器的迭代功能，依次拿出迭代器中的内容

```
>>> for i in "FishC":
...     print(i)
...
F
i
s
h
C
```

#### 2.1.2 iter()和next()

​		python两个内置函数：iter()和next()

​		it = iter('Fishc')  # it 就是迭代器，或者说是字符串的迭代器

​		用next()方法调用这个迭代器

​		next(it)抛出下一个元素		

​		如果没有元素，就会抛出一个StopIteration

```python
>>> string = "FishC"
>>> it = iter(string) # it 就是迭代器，或者说是字符串的迭代器
>>> next(it) # 用next()方法调用这个迭代器
'F'
>>> next(it)
'i'
>>> next(it)
's'
>>> next(it)
'h'
>>> next(it)
'C'
>>> next(it)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
StopIteration
```



### 2.2 生成器

​		python使用生成器对延时操作提供了支持。

​		所谓延迟操作，是指在需要的时候才产生结果，而不是立即产生效果。

#### 2.2.1 生产器函数

​		常规函数定义，但是使用yield语句而不是return返回结果。yield语句一次返回一个结果，在每个结果之间，挂起函数的状态，以便下次从它离开的地方继续执行。

```python
# -*- coding: utf-8 -*-
# Created by yuanjinshuai at 2019-10-12

def gensquares(N):
    for i in range(N):
        yield i ** 2 # 输出的结果是可以直接迭代的，不用新建一个list存

if __name__ == "__main__":
    for item in gensquares(5):
        print(item)
```



#### 2.2.2 生产器表达式

​		使用列表推导，将一次产生所有的效果

```python
>>> a = [i**2 for i in range(4)]
>>> print(a)
[0, 1, 4, 9]
```

