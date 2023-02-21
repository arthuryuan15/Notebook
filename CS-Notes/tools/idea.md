

# 1 common

## 1.1 

Editor -> File and Code Templates -> Files -> Class



<img src="/Users/yuanjinshuai/Library/Application Support/typora-user-images/image-20210707150126336.png" alt="image-20210707150126336" style="zoom:50%;" width=1500/>

# 2 idea





## 2.1 IDEA导入项目

https://www.baidu.com/link?url=koUWw2g7kfyE08bijqPlq9N_aZIfTofrvmEiPRxPvY6WMyMsdcIaad5XvHYg6M7_snlsZazHXfKqiGGppVoq__&wd=&eqid=ed169bed0004885f0000000460add9fe

**idea导入多模块项目**



![image-20210526132902940](https://p.ipic.vip/93ivco.png)

![image-20210526132928844](https://p.ipic.vip/1pvy1n.png)



## 2.2 add library to classpath 飘红？

![这里写图片描述](https://p.ipic.vip/fxdfr4.png)



## 2.3  IDEA Maven Dependencies标红报错

https://www.cnblogs.com/jifengblog/p/12387656.html

1. 删除repository下飘红的依赖

2. maven工具左上角的自动导入

   ![image-20210511105601557](https://p.ipic.vip/vvn4w9.png)



3. 如果还飘红重启电脑就可以了




## 2.4 IDEA插件

https://zhuanlan.zhihu.com/p/112858445

### 2.4.1 CodeGlance

**CodeGlance**是一款非常好用的**代码地图**插件，可以在代码编辑区的右侧生成一个竖向可拖动的代码缩略区，可以快速定位代码的同时，并且提供放大镜功能

**右侧代码缩略图效果：**

![img](https://p.ipic.vip/pwudip.jpg)

### 2.4.2 Rainbow Brackets

在代码非常复杂时，各种**俄罗斯套娃式**的括号简直让人心碎，**Rainbow Brackets**则是一款可以对**成对括号**进行着色的插件，顾名思义“彩虹色的括号”，从此复杂代码一眼即可看穿！



### 2.4.3 Grep Console

默认情况下，IDEA控制台窗口在打印日志时都是一种颜色到底，比如各种`info`,`warn`,和`error`等类型的日志信息交织在一起，不好分辨。

**Grep Console**插件则可以帮助我们自定义设置不用日志用不同的颜色进行标识，非常方便观看！

**设置自定义颜色：**

![img](https://p.ipic.vip/be0rfv.jpg)



**着色后的日志打印效果：**

![img](https://p.ipic.vip/wwvqj1.jpg)





### 2.4.4 RestfulToolkit

**IDEA2020版本及以后无法使用**

- 你知道你项目里到底写了多少个URL接口吗？
- 如何快速定位某个`URL`接口对应的`Controller`代码？
- 如何快速测试你的`Controller`接口？

**RestfulToolkit**则是一个可以解决上述问题的，非常方便的IDEA集成插件，从此`Postman`怕是要下岗了：

![img](https://p.ipic.vip/7widap.jpg)

------



### 2.4.5 GsonFormat

给你一段`Json`格式数据，除了手写之外，如何快速生成一个和该`Json`数据对应的`Java`对象？

比如一段`Json`格式数据如下：

```text
{
    "status": 0,
    "msg": "操作成功",
    "data": 1
}
```

**GsonFormat**则是一个**JSON格式数据 → 对象**的快速**代码自动生成**插件。

<img src="https://p.ipic.vip/bhyind.jpg" alt="img" style="zoom:33%;" />

<img src="https://p.ipic.vip/s24jnv.jpg" alt="img" style="zoom:33%;" />

<img src="https://p.ipic.vip/ca62sd.jpg" alt="img" style="zoom:33%;" />




### 2.4.6 cherry-pick

https://blog.csdn.net/qq_23167527/article/details/102595278