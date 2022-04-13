

# 1 common

## 1.1 

Editor -> File and Code Templates -> Files -> Class



<img src="/Users/yuanjinshuai/Library/Application Support/typora-user-images/image-20210707150126336.png" alt="image-20210707150126336" style="zoom:50%;" width=1500/>

# 2 idea





## 2.1 IDEA导入项目

https://www.baidu.com/link?url=koUWw2g7kfyE08bijqPlq9N_aZIfTofrvmEiPRxPvY6WMyMsdcIaad5XvHYg6M7_snlsZazHXfKqiGGppVoq__&wd=&eqid=ed169bed0004885f0000000460add9fe

**idea导入多模块项目**



![image-20210526132902940](https://i.loli.net/2021/05/31/LNBdbOn2SQseqPr.png)

![image-20210526132928844](https://i.loli.net/2021/05/31/nzUEbeVs6YZrWfB.png)



## 2.2 add library to classpath 飘红？

![这里写图片描述](https://img-blog.csdn.net/20170822194222897?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvZXhwZWN0NTIx/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)



## 2.3  IDEA Maven Dependencies标红报错

https://www.cnblogs.com/jifengblog/p/12387656.html

1. 删除repository下飘红的依赖

2. maven工具左上角的自动导入

   ![image-20210511105601557](https://i.loli.net/2021/05/31/K65q9JAohNWQinX.png)



3. 如果还飘红重启电脑就可以了




## 2.4 IDEA插件

https://zhuanlan.zhihu.com/p/112858445

### 2.4.1 CodeGlance

**CodeGlance**是一款非常好用的**代码地图**插件，可以在代码编辑区的右侧生成一个竖向可拖动的代码缩略区，可以快速定位代码的同时，并且提供放大镜功能

**右侧代码缩略图效果：**

![img](https://pic1.zhimg.com/80/v2-cf64c0f32d870095b5ad314a8dd17898_1440w.jpg)

### 2.4.2 Rainbow Brackets

在代码非常复杂时，各种**俄罗斯套娃式**的括号简直让人心碎，**Rainbow Brackets**则是一款可以对**成对括号**进行着色的插件，顾名思义“彩虹色的括号”，从此复杂代码一眼即可看穿！



### 2.4.3 Grep Console

默认情况下，IDEA控制台窗口在打印日志时都是一种颜色到底，比如各种`info`,`warn`,和`error`等类型的日志信息交织在一起，不好分辨。

**Grep Console**插件则可以帮助我们自定义设置不用日志用不同的颜色进行标识，非常方便观看！

**设置自定义颜色：**

![img](https://pic2.zhimg.com/80/v2-dbf1ea821e699ba4c31ffca259006ab5_1440w.jpg)



**着色后的日志打印效果：**

![img](https://pic4.zhimg.com/80/v2-6b1971d5f1a186075711c96eb212184b_1440w.jpg)





### 2.4.4 RestfulToolkit

**IDEA2020版本及以后无法使用**

- 你知道你项目里到底写了多少个URL接口吗？
- 如何快速定位某个`URL`接口对应的`Controller`代码？
- 如何快速测试你的`Controller`接口？

**RestfulToolkit**则是一个可以解决上述问题的，非常方便的IDEA集成插件，从此`Postman`怕是要下岗了：

![img](https://pic3.zhimg.com/80/v2-c4c7573d721e1c0ee318b4c3654b53fe_1440w.jpg)

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

<img src="https://pic1.zhimg.com/80/v2-0e93603daaf0604a7ae9b10a3580164c_1440w.jpg" alt="img" style="zoom:33%;" />

<img src="https://pic3.zhimg.com/80/v2-d1fc8421e5a5bb675ab0a561b3990a7e_1440w.jpg" alt="img" style="zoom:33%;" />

<img src="https://pic3.zhimg.com/80/v2-c14505696c3461151cdf9453b48f9666_1440w.jpg" alt="img" style="zoom:33%;" />




### 2.4.6 cherry-pick

https://blog.csdn.net/qq_23167527/article/details/102595278