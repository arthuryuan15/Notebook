# Markdown语法

## 1. 标题显示

### 1.1 使用 = 和 - 标记

```markdown
大标题
=
中标题
-

注：没有效果
```

### 1.2 使用 # 号标记

```markdown
# 一级标题 

## 二级标题  

### 三级标题  

#### 四级标题  

##### 五级标题  

###### 六级标题  
```



## 2. 显示文本

直接输入的文字就是普通文本。需要注意的是要换行的时候不能直接通过回车来换行，需要使用`<br>(或者<br/>)`

```markdown
1. [普通文本]
	我想要换行<br>
	我换行了
	
2. [单行文本]
	使用两个Tab

3. [多行文本]
	在每行行首加上两个Tab
	
4. [部分文字的高亮]
		把它用 `  ` 包围起来
```



## 3. 文字超链接

```markdown
[我的博客](http://blog.csdn.net/guodongxiaren)
```
## 4. 插入符号

```markdown
* 昵称：果冻虾仁 

* 别名：隔壁老王 

* 英文名：Jelly 
```



## 5. 缩进


```markdown
>数据结构  
>>树  
>>>二叉树  
>>>>平衡二叉树  
>>>>>满二叉树  
```



## 6. latex公式

[Markdown中的LaTeX格式](https://www.jianshu.com/p/8c46e915c45e)


### 6.1  Markdown排版格式
####   6.1.1 行内公式排版

```markdown
 $ c = \sqrt{a^{2}+b_{xy}^{2}+e^{x}} $
```

 $ c = \sqrt{a^{2}+b_{xy}^{2}+e^{x}} $

#### 6.1.2 块公式排版

```markdown
$$
c = \sqrt{a^{2}+b_{xy}^{2} +e^{x}} 
$$
```

$$
c = \sqrt{a^{2}+b_{xy}^{2} +e^{x}}
$$



###  6.2 常用规则

**1）转义**

一下几个字符: # $ % & ~ _ ^ \ { }有特殊意义，需要表示这些字符时，需要转义，即在每个字符前加上 \ 。
\boxed命令给公式加一个方框。

```markdown
$E = mc^2 $
$ \boxed{E=mc^2} $
```

$E = mc^2 $
$ \boxed{E=mc^2} $

**2）希腊字母**

![3187098-f9884c349c6d36df](/Users/yuanjinshuai/Library/Mobile Documents/com~apple~CloudDocs/notebook/pic/3187098-f9884c349c6d36df.png)

**3）上下标和根号**

​		用^来表示上标
​		用_来表示下标
​		根号用\sqrt表示

​		注意：上下标如果多余一个字符或符号，需要用{}括起来。

```markdown
$ \sum_{i=1}^n a_i $
```

$	 \sum_{i=1}^n a_i $

​		\sqrt[开方次数，默认为2]{开方公式}， 例如：

```markdown
$$ x_{ij}^2\quad \sqrt{x}\quad \sqrt[3]{x} $$
```

$$
x_{ij}^2\quad \sqrt{x}\quad \sqrt[3]{x}
$$

​	其中\quad表示添加空格。

**4）分数**

分数用\frac表示。

字号工具环境设置：
\dfrac命令把字号设置为独立公式中的大小；
\tfrac则把字号设置为行间公式中的大小。

```markdown
$ \frac{1}{2} \dfrac{1}{2} $ 
```

$ \frac{1}{2}  \dfrac{1}{2} $

```markdown
$$ \frac{1}{2} \tfrac{1}{2} $$ 
```

$$ \frac{1}{2} \tfrac{1}{2} $$ 

**5）运算符**

\+ - * / = 直接输入；

特殊运算则用以下特殊命令

\pm\;   $\pm$ 

\times\;  $\times$

\div\;  $\div$

\cdots\; $\cdots$

\cap\; $\cap$  

\cup\; $\cup$ 

\geq\; $\geq$ greater

\leq\; $\leq$ less

\neq\; $\neq$

\approx\; $\approx$

\equiv; $\equiv$



和、积、极限、积分等运算符用\sum, \prod, \lim, \int,这些公式在行内公式被压缩，以适应行高，可以通过\limits和\nolimits命令显示制动是否压缩。

```markdown
$ \sum_{i=1}^n i$
```
$ \sum_{i=1}^n i$

```markdown
$ \prod_{i=1}^n $
```
$ \prod_{i=1}^n $

```markdown
$ \lim_{x\to0}x^2 $
```

$\lim_{x\to0}x^2$

```markdown
$\int_{a}^{b}x^2 dx $
```

$\int_{a}^{b}x^2 dx $

```markdown
$\int_{a}^{b}x^2 dx $
```

$\int_{a}^{b}x^2 dx $

```markdown
$\sum_{i=1}^n i \quad\prod_{i=1}^n$
```

$\sum_{i=1}^n i \quad\prod_{i=1}^n$

```markdown
$ \lim_{x\to0}x^2 \quad\int_{a}^{b}x^2 dx $
```

$ \lim_{x\to0}x^2 \quad\int_{a}^{b}x^2 dx $

**6）多重积分**

使用如下形式：\int、\iint、\iiint、\iiiint、\idotsint

```markdown
$$ \int \int \quad \int \int \int \quad 
 \int \int \int \int \quad \int \dots \int $$

$$ \iint \quad \iiint \quad \iiiint \quad \idotsint $$
```

$$ \int \int \quad \int \int \int \quad 
 \int \int \int \int \quad \int \dots \int $$

$$ \iint \quad \iiint \quad \iiiint \quad \idotsint $$

**7) 无穷**

1. 正无穷 +∞

   `$+\infty$`

   $+\infty$

2. 负无穷 −∞ 

   `$-\infty$`

   $-\infty$ 

