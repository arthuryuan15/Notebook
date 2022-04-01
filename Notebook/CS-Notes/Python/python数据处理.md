# 利用python进行数据处理

##基本框架

![Untitled picture](/Users/yuanjinshuai/Library/Mobile Documents/com~apple~CloudDocs/notebook/Python/pic/Untitled picture.png)



## 1 numpy

​		numpy 数据分析 非常快



### 1.1 numpy的属性

​		numpy是基于矩阵（一维、二维的数组）的计算

```python
list = [[1,2,3], [2,3,4]]
```

​		上面这个是列表，要转换成numpy可以识别矩阵，要把这个列表命名成array		

```python
array = np.array([[1,2,3], [2,3,4]])
array.ndim # 有多少维度
array.shape # 第一个代表有多少行，第二个数代表有多少列
array.size # 有多少元素
```

  

### 1.2 numpy创建array

```python
a = np.array([2,3,4])
print(a) # [2 3 4] 输出的数字中间没有逗号分隔，这是numpy和list的区别
```

​		

```python
# 每一个array你可以定义它的type
a = np.array([2,3,4], dtype=np.int) #numpy的格式定义是dtype 

np.ones((3,4), dtype = np.int64)

np.zeros((3,4))

np.empty((3,4))

# 生成一个有序数列
np.arange(10, 20, 2) 

# 生成一个0到12三行四列的数列
np.arange(12).shape((3,4))

# 生成一个线段
np.linspace(1, 10, 20) # 生成一个1到10一共20个数的数列

# 生成一个二维array
a = array( [[2,3,4], [3,4,5]] )
```







###1.3 numpy的索引

```python
A = np.arange(3, 15).reshape(3, 4)

A[1][1] # 索引第一行第一列 ，同样也放到一个括号里面 A[1, 1]

A[1, :] # 索引第二行的所有数

A[1, 1:3] 

A.flat # 转变成一行的数列 返回的是一个迭代器

A.flatten() # 返回的是一个数组 
```



### 1.4 numpy索引查找

```python
np.where(df.A == val)[0][0] # 返回A这一列值为val的index
```





## 2 pandas

pandas和numpy 数据分析 非常快； pandas C语言写 基于numpy的，它是numpy的升级版本，而且用到了矩阵计算

### 2.1 pandas 基本介绍

 ```python
import pandas as pd
pd.Series([1, 2, 2]) # 相当于一维的矩阵，打印出来会发现自动加上了序号
df = pd.DataFrame(np.random.randn(6,4), index = dates, columns = ['a', 'b', 'c', 'd'])
df = 
df.types # 我们不需要括号，因为这是它的一个属性

df.index

df.columns

df.values

df.describe() # describe是一个功能，而且只能描述数值

df.T # 转置

df.sort_index(axis = 1, ascending = False)

df.sort_values(by = 'columns')

df.size # 计算数组和矩阵所有数据的个数 

df.shape() # 得到矩阵每维的大小 
 ```



###  2.2 pandas选择数据 

(1) 整体选择某一行或者某一列 

 ```python
df['A'] or df.A ; df[['A', 'B']] # 选择（几）列 ，只用列可以当作属性直接调用

df[0:3] or df.['20130102', '20130104'] # 选择几行，只有行可以直接通过切片数字索引

OR（略）

df.loc['2012012'] # 通过标签选择，与上面的类似，但是会更加具体一点。

df.loc[[:, 'A', 'B']] 
 ```

(2) 选择某一行或者某一列的一部分

 ```python
df.A.iloc[idx] # 选出在A列的第idx个数  return numpy.float64

df.iloc[3:5, 1:3] # 通过位置进行选择

df.iloc[[1,2,3], 1:3]

df**.****ix**[:3, ['A', 'B']] # 按照标签和位置进行混合筛选

df[df.A > 8] # 筛选出大于8的数字

df.A.iloc[idx] # 选出在A列的第idx个数 
 ```

(3) 给A列的idx行赋值直接赋值 错误！

​	正确方案应该是生成好正确的数组再插入dataframe中。

```python
data.A.iloc[idx] = val.copy()	# val是int等基本数据类型
```



### 2.3 pandas处理数据

（1）pandas删除数据

```python
 >>> df
       A  B   C   D
    0  0  1   2   3
    1  4  5   6   7
    2  8  9  10  11
>>> df.drop(['B', 'C'], axis=1)
       A   D
    0  0   3
    1  4   7
    2  8  11
```

（2）pandas去重

```python
In [141]: obj=pd.Series(['c','a','d','a','a','b','b','c','c','c'])

In [142]: obj.unique()
Out[142]: array(['c', 'a', 'd', 'b'], dtype=object)
```

（3）pandas去掉某一列含空的数据

```python
# 可以通过subset参数来删除在age和sex中含有空数据的全部行
df4 = df4.dropna(subset=["age", "sex"])
```

（4）排序

```python
df.sort_values(by="sales" , ascending=False) # by 指定列 ascending
b = df.sort_values(by="sales" , ascending=False) # 想显示结果的话 print(b)
```

（5）数值运算

### 2.4 pandas导入导出

 ```python
pd.read_csv('student.csv')

df.to_csv(file_name3,encoding="utf_8_sig") # 解决乱码
 ```

（6）更新index



 ### 2.5 pandas合并concat

```python
df1 = pd.Dataframe(np.ones((3,4))*0, columns = ['a', 'b', 'c', 'd'])

df2 = pd.Dataframe(np.ones((3,4))*0, columns = ['a', 'b', 'c', 'd'])

df3 = pd.Dataframe(np.ones((3,4))*0, columns = ['a', 'b', 'c', 'd'])

 
res = pd.concat([df1, df2, df3], axis = 0) # 横向的进行合并

res = pd.concat([df1, df2, df3], axis = 0, ignore_index = Ture) # 解决index有重合的问题

res = pd.concat([df1, df2, df3], 'join', axis = 0) # 解决没有地方用NAN填充的问题，只合并共同拥有的列

 res = res = pd.concat([df1, df2, df3], axis = 1, join_axes = [df.index]) # 指定dataframe是根据哪一个index进行处理

 df1.append([df2, df3], ignore_index = Ture)

 s2 = pd.Series([1,2,3,4], index = ['a', 'b', 'c', 'd'])

df1.append(s1) # 每次添加一行
```



 ###2.6 pandas 合并 merge

 merge 可是实现关于index或者key的对照，然后把它们合并在一起

```python
pd.merge(left, right, on ='key'， how = 'linear') # 基于key这个column进行合并 (左边是left key 右边right)
how = 'outer' 

# merge by index
pd.merge()
```



 ### 2.6 pandas plot

 ```python
import matplotlib.pyplot as plt
# Series

data = pd.Series(np.random.randn(1000), index=np.arange(1000))

data = data.cumsum()

data.plot() / 与plt.plot(x= , y = ) #是一样的效果，因为data是个dataframe里面本身就包含了x和y的数据

plt.show()

# Dataframe
data = pd.Dataframe(np.random.randn(1000, 4), index = np.arange(1000), columns = list('ABCD'))

data.plot()

plt.show()

 # method

'bar', 'hist', 'box', 'kde' ,'area', 'scatter', 'hexbin', 'pie'

 # 把两类数据同时画到一张图上

ax = data.plot.scatter(x ='A', y = 'B', color = 'DarkBlue', label = 'Class1')

data.plot.scatter(x ='A', y = 'C', color = 'DarkGreen', label = 'Class2', ax = ax)
 ```



 ## 3 正则表达式

​		re模块的函数可以分为三个大类：模式匹配、替换以及拆分。

​		当然，它们之间是相辅相成的。

```python
# -*- coding: utf-8 -*-
# Created by yuanjinshuai at 2019-11-04

import re

# 1. 拆分一个字符串（拆分）
# 描述一个或者多个空白符的regex是\s+
text = "foo bar\t baz \tqux"
print(re.split('\s+', text))  # ['foo', 'bar', 'baz', 'qux']

# 同样可以通过re.compile创建regex对象
regex = re.compile('\s+')
print(regex.split(text))    # ['foo', 'bar', 'baz', 'qux']


# 2. 匹配邮箱 (模式匹配)
text = """Dave dave@google.com

Steve steve@gmail.com

Rob rob@gmail.com

Ryan ryan@yahoo.com

"""
pattern = r'[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}'     # 写出这个模式
regex = re.compile(pattern, flags=re.IGNORECASE)  # re.IGNORECASE makes the regex case-insensitive
print(regex.findall(text))  # ['dave@google.com', 'steve@gmail.com', 'rob@gmail.com', 'ryan@yahoo.com']


# 3.替换
# sub方法可以将匹配到的模式替换为指定字符串，并返回所得到的新字符串
print(regex.sub('REDACTED', text))

"""
Dave REDACTED

Steve REDACTED

Rob REDACTED

Ryan REDACTED

"""
```



### 3.1 简单python匹配

```python
# -*- coding: utf-8 -*-
# Created by yuanjinshuai at 2019-11-04
pattern1 = 'cat'
pattern2 = 'bird'
string = 'dog runs to cat'
print(pattern1 in string) # True
print(pattern2 in string)	# False
```



### 3.2 用正则寻找配对

```python
# -*- coding: utf-8 -*-
# Created by yuanjinshuai at 2019-11-04

import re
pattern1 = 'cat'
pattern2 = 'bird'
string = 'dog runs to cat'
print(re.search(pattern1, string))  # 返回的是一个object <re.Match object; span=(12, 15), match='cat'>
print(re.search(pattern2, string))  # None

# multiple patterns("run" or '"ran")
ptn = r"r[au]n"  # ran or run 两种情况都考虑
print(re.search(ptn, "dog rans to cat"))   # <re.Match object; span=(4, 7), match='ran'>

# continue
print(re.search(r"r[a-z]n", 'dog runs to cat'))     # <re.Match object; span=(4, 7), match='run'>
print(re.search(r"r[A-Z]n", 'dog runs to cat'))     # None
print(re.search(r"r[0-9]n", 'dog runs to cat'))     # None
print(re.search(r"r[0-9a-z]n", 'dog runs to cat'))  # <re.Match object; span=(4, 7), match='run'>
```



### 3.3 特殊种类匹配

```python
# -*- coding: utf-8 -*-
# Created by yuanjinshuai at 2019-11-04

import re

# 1. 数字
# \d :decimal digit 十进制数位
print(re.search(r'r\dn', "run r4n"))  # <re.Match object; span=(4, 7), match='r4n'>
# \D: any non-decimal digit
print(re.search(r"r\Dn", "run r4n"))  # <re.Match object; span=(0, 3), match='run'>


# 2.空白
# \s : any white space [\t\n\r\f\v] s代表所有的空白符 \t -tab \n-新的一行
print('r\nn r4n')
"""
r
n r4n
"""
print(re.search(r'r\sn', 'r\nn r4n'))   # <re.Match object; span=(0, 3), match='r\nn'>
# \S: opposite to \s, any non-white space
print(re.search(r"r\Sn", "r\nn r4n"))   # <re.Match object; span=(4, 7), match='r4n'>


# 3.所有的字母数字和“_”
# \w：[a-zA-z0-9_]
print(re.search(r"r\wn", "r\nn r4n"))   # <re.Match object; span=(4, 7), match='r4n'>
# \W: opposite to \w
print(re.search(r"r\Wn", "r\nn r4n"))   # <re.Match object; span=(4, 7), match='r4n'>


# 4.空白字符
# \b: empty string(only at the start or end of the word)
print(re.search(r"\bruns\b", 'dog runs to cat'))    # runs的前后有空格 <re.Match object; span=(4, 8), match='runs'>
# \B: empty string (but not at the start or end of word)
print(re.search(r"\B runs \B", "dog runs to cat"))  # None


# 5. 特殊字符 任意字符
# \\ : match \
print(re.search(r"runs\\", "runs\ to me"))  # <re.Match object; span=(0, 5), match='runs\\'>
# . :match everything
print(re.search(r"r.n", "r[ns to me"))  # <re.Match object; span=(0, 3), match='r[n'>


# 6.句尾句首
# ^ : match line beginning
print(re.search(r"^dog", "dog runs to cat"))    # <re.Match object; span=(0, 3), match='dog'>
# $: match line ending
print(re.search(r"cat$", "dog runs to cat"))    # <re.Match object; span=(12, 15), match='cat'>


# 7.是否
# ?: may or may not occur
print(re.search(r"Mon(day)?", "Monday"))    # <re.Match object; span=(0, 6), match='Monday'>
print(re.search(r"Mon(day)?", "Mon"))      # <re.Match object; span=(0, 6), match='Monday'>


# 8.多行匹配
# multi-line
string = '''
dog tuns to cat.
I run to dog.
'''
print(re.search(r"^I", string)) # None
print(re.search(r"^I", string, flags =re.M))    # <re.Match object; span=(18, 19), match='I'>


# 9.0或多次
# *: occur 0 or more times
print(re.search(r"ab*", 'a'))   # <re.Match object; span=(0, 1), match='a'>
print(re.search(r"ab*", 'abbbbbb'))     # <re.Match object; span=(0, 7), match='abbbbbb'>


# 10. 1或多次
# +: occur 1 or more times
print(re.search(r"ab+", 'a'))   # None
print(re.search(r"ab+", 'abbbbbb'))     # <re.Match object; span=(0, 7), match='abbbbbb'>


# 11.可选次数
# {n, m} : occur n to m times
print(re.search(r"ab{2, 10}", "a"))     # None
print(re.search(r"ab{2,10}", "abbbbbbb"))   # <re.Match object; span=(0, 8), match='abbbbbbb'>


# 12.group组
# group
match = re.search(r"(\d+), Date: (.+)", "ID:021523, Date: Feb/12/2017")
print(match.group())   # 021523, Date: Feb/12/2017
print(match.group(1))   # 指定第一个括号里面的东西  021523
print(match.group(2))   # Feb/12/2017

match = re.search(r"(?P<id>\d+), Date: (?P<date>.+)", "ID:021523, Date: Feb/12/2017")
print(match.group('id'))    # 021523
print(match.group('date'))  # Feb/12/2017
```



### 3.4 寻找所有的匹配

```python
# findall 
print(re.findall(r"r[ua]n", 'run ran ren')) # ['run', 'ran']

# |: or 
print(re.findall(r"(ran|run)", 'run ran ren'))	# ['run', 'ran']
```



### 3.5 替换

```python
# re.split()
print(re.split(r"[,;\.]", 'a;b;c.d;e')) # 分裂的标准就是碰到, ; 任意一个形式 \ . 去掉任何的描述
```



### 3.6 split

```python
# re.split()
print(re.split(r"[,;\.]", 'a;b;c.d;e')) # 分裂的标准就是碰到, ; 任意一个形式 \ . 去掉任何的描述
```



### 3.7 complie

```python
# complie 用re.compile自己编译regex以得到一个可重用的regex对象
compiled_re = re.compile(r'r[au]n')
print(compiled_re.search("dog ran to cat"))
# <re.Match object; span=(4, 7), match='ran'>
```



### 3.8 应用：替换ip

```cpp
IP地址的长度为32位(共有2^32个IP地址)，分为4段，每段8位
用十进制数字表示，每段数字范围为0～255，段与段之间用句点隔开。
// 0.0.0.0 ～ 255.255.255.255
```

分析IP地址的组成特点：250-255、200-249、0-199.

这三种情况可以分开考虑：

* 250-255：三位数，百位是2，十位是5，个位是0～5，用正则表达式可以写成：`25[0-5]`
* 200-249: 三位数，百位是2，十位是0～4，个位是0～9，用正则表达式可以写成：`2[0-4][0-9]---> 2[0-4]/d`
* 0-199：这个可以继续拆分，如下：
  * 0-9:一位数，个位数是0～9，用正则表达式可以写成：`\d`
  * 10-99: 两位数，个位是0～9，十位数是0～9，用正则表达式可以写成`[1-9]\d`
  * 100-199:三位数，个位是1，十位数0～9，百位数是0～9，用正则表达式可以写成`1[0-9]\d--->1\d{2}`

​	于是0-9和10-99的正则表达式可以合写位`[1-9]?\d`

​	那么0-199用正则表达式就可以写成`(1\d{2})|([1-9]?\d)`

​	然后再把前面两段加起来，得到`(1\d{2})|([1-9]?\d)｜2[0-4]/d|(25[0-5])`



​	最后，可以在前面三段加上句点“.” ,也可以用{3}重复得到，第四段再来一次同样的匹配。

​		`((1\d{2})|([1-9]?\d)｜2[0-4]/d|(25[0-5]).{3}((1\d{2})|([1-9]?\d)｜2[0-4]/d|(25[0-5]).{3}))`



#### 关于Python数据可视化中文部分显示方块的解决方法

```python
import matplotlib
import matplotlib.pyplot as plt
plt.rcParams['font.sans-serif']=['SimHei']
plt.rcParams['axes.unicode_minus'] = False
```

