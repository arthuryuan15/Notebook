# python基础

![20160630234148703](/Users/yuanjinshuai/Library/Mobile Documents/com~apple~CloudDocs/notebook/Python/pic/20160630234148703.png)

## 2 魔术方法

### 2.1 构造和初始化

(1) `__init__`

​		是使用频率最高的魔术方法，作用是在初始化一个对象的时候，定义这个对象的初始值。

```python
class Person(object):
  
  def __init__(self, name, age):
    self.name = name
    self.age = age
    
p1 = Person('mike', 22)
p2 = Person('lili', 23)
```



(2) `__new__`

```python
class Singleton(object):
  """单例"""
  _instance = None
  def __new__(cls, *args, **kwargs):
    if not cls._instance:
      cls._instance = super(Singleton, cls).__new__(cls, *args, **kwargs)
     return cls._instance
 
class Mysingleton(Singleton):
  
  pass

a = MySingleton()
b = MySingleton()

assert a is b # True
```

​		实际上，这才是“真正的构造方法”，它会在对象实例化时第一个被调用，然后再调用`__init__`，它们的区别主要如下：

- `__new__`的第一个参数是cls，而`__init__`的第一个参数是self
- `__new__`返回值是一个实例，而`__init__`没有任何返回值(return None)，只做初始化操作
- `__new__`由于是返回一个实例对象，所以它可以给所有实例进行**统一**的初始化操作

由于`__new__`优先于`__init__`调用，且返回一个实例，所以我们可以利用这种特性，每次返回同一个实例来实现一个单例类



(3) `__del__`

```python
class Person(object):
  def __del__(self):
    print('__del__')
  
a = Person()
del a # __del__
```





​		这个方法代表**析构方法**，也就是在对象被垃圾回收时被调用。但是请注意，执行del x不一定会执行此方法。

​		由于Python是通过引用计数来进行垃圾回收的，也就是说，如果这个实例还是有被引用到，即使执行del销毁这个对象，但其引用计数还是大于0，所以不会触发执行`__del__`。



##  9 输入和输出

- 有些时候你的程序会与用户产生交互。举个例子，你会希望获取用户的输入内容，并向用户打印出一些返回的结果。我们可以分别通过 `input()` 函数与`print` 函数来实现这一需求。
- 对于输入，我们还可以使用 str  String，字符串 类的各种方法。例如，你可以使用 rjust方法来获得一个右对齐到指定宽度的字符串。你可以查看 help(str)  来了解更多细节。
- 另一个常见的输入输出类型是处理文件。创建、读取与写入文件对于很多程序来说是必不可少的功能，而我们将在本章探讨这一方面。



### 9.1 用户输入内容

```python
# -*- coding: utf-8 -*-
# Created by yuanjinshuai at 2019-11-05


def reverse(text):
    return text[::-1]


def is_palindrome(text):
    return text == reverse(text)


something = input("Enter text:")
if is_palindrome(something):
    print("Yes, it is a palindrome")
```



### 9.2 文件

​		你可以通过创建一个属于 file 类的对象并适当使用它的 read 、 readline 、 write 方法来打开或使用文件，并对它们进行读取或写入。读取或写入文件的能力取决于你指定以何种方式打开文件。最后，当你完成了文件，你可以调用close方法来完成了对该文件的使用。

```python
poem = '''\

Programming is fun

When the work is done

if you wanna make your work also fun:

use Python!

'''
# 打开文件以编辑
f = open('./datasets/poem.txt', 'w')
# 向文件中编写文本
f.write(poem)
# 关闭文件
f.close()

# 如果没有特别制定，将嘉定启动默认的阅读模式
f = open('poem.txt')
line = f.readline()
len(line)

# 如果没有特别指定，
# 将假定启用默认的阅读（'r'ead）模式
f = open('poem.txt')
while True:

    line = f.readline()
    # 零长度指示 EOF
    if len(line) == 0:
        break
    # 每行（`line`）的末尾
    # 都已经有了换行符
    #因为它是从一个文件中进行读取的
    print(line, end='')

# 关闭文件
f.close()
```

​	**python推荐款使用with方法来读取文件，防止程序员打开文件后忘记关闭文件。**

```python
class Sample:
	def __enter__(self):
		print("In __enter__()")
		return "Foo"
	def __exit__(self,type, value, trace):
		print("In __exit__()")
def get_sample():
	return Sample()

with get_sample() as sample:
	print("sample:" + sample)
```



### 9.3 Pickle

​		通过pickle可以将任何纯python对象储存到一个文件中，并在稍后将其取回。这叫做持久地储存对象。

```python
import pickle

# 存储相关对象的文件名称
shoplistfile = './datasets/shoplist.data'
# 需要储存的购买的物品清单
shoplist = ['apple', 'mango', 'carrot']

# 准备写入文件
f = open(shoplistfile, 'wb')
# 转储对象至文件
pickle.dump(shoplist, f)
f.close

# 清除 shoplist 变量
del shoplist

# 重新打开储存文件
f = open(shoplistfile, 'rb')
# 从文件中载入对象
storelist = pickle.load(f)
print(storelist) # ['apple', 'mango', 'carrot']
```

- 通过open以写入（write）二进制（binary）模式打开文件
- 然后调用pickle模块的dump函数，这一过程被称作封装
- 通过pickle模块的load函数接收返回的对象

### 9.4 Unicode

将Unicode字符串转换成为一个能够被发送和接受的格式。这个格式叫“UTF-8”

```python
# encoding = utf-8
import io

f = io.open('./datasets/abc.txt', 'wt', encoding='utf-8')
f.write(u'Image non-English language here')
f.close()

text = io.open('./datasets/abc.txt', encoding='utf-8').read()
print(text)
```



### 9.5 格式化输出

```python
name = '1'
age = '23'
height = '190'

print('I am', name) OR print('I am %s' %name)
print("I am %s, age: %s, height: %s" % (name, age, height))
print("Total score for %s is %s" % (name, score))

```

保留n为小数

​	`print('%.nf' % l)`

```python
# 输出百分比

# （1）显示小数点后两位
print('percent: {:.2%}'.format(42/50)) # percent: 84.00%
			
# （2）不显示小数位：{:.0%}，即，将2改为0：
print('percent: {:.0%}'.format(42/50)) # percent: 84%
  		
# (3) 输出2位小数
print('%.2lf%%' %10) # 10.00% 
```

打印刷新

Python 3.x里面的print函数新增加的功能，使用\r可以刷新当前行输出，

```python
print ("\r Loading... ".format(i)+str(i), end="") 
```

