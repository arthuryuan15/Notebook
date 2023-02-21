# html+css

## 1.前端 

### 1.1 网络传输三大基石

![Screen Shot 2019-10-29 at 9.48.21 PM](https://p.ipic.vip/74i2mf.jpg)



1. URL

2. html

3. HTTP协议

  1. 请求消息：客户端发送给服务器端的数据
     * 数据格式：
       1. 请求行
       2. 请求头
       3. 请求空行
       4. 请求体
  
  2. 响应消息：服务器端发送给客户端的数据
  
     * 数据格式
  
       1. 响应行
          1. 组成：协议/版本（HTTP/1.1 ） 响应状态码 （200 ）状态码描述（OK）
          2. 响应状态码：服务器告诉客户端本次请求和响应的状态
             1. 状态码都是3位数字
             2. 分类：
                1. 1xx：服务器接收客户端消息，但是没有接收完成，等待一段时间后，发送1xx状态码	
                2. 2xx：成功。代表：200
                3. 3xx：重定向。代表：302（重定向）304（访问缓冲）
                4. 4xx：客户端错误。
                   * 代表：
                     * 404（请求路径没有对应的资源）
                     * 405（请求方式没有对应的doxxx方法）
                5. 5xx：服务器端错误。代表：500（服务器内部出现异常）
       2. 响应头
       3. 响应空行
       4. 响应体
  
     * 响应字符串格式
  
       ```html
       (响应行)
       HTTP/1.1 200 OK
       (响应头)
       Bdpagetype: 1
       Bdqid: 0x94b4f55f00227318
       Cache-Control: private
       Connection: Keep-Alive
       Content-Encoding: gzip
       Content-Type: text/html
       Cxy_all: baidu+1f366a10226798ecfcba60a8397f8722
       Date: Mon, 18 Nov 2019 11:23:23 GMT
       Expires: Mon, 18 Nov 2019 11:22:23 GMT
       Server: BWS/1.1
       Set-Cookie: delPer=0; path=/; domain=.baidu.com
       Set-Cookie: BDSVRTM=0; path=/
       Set-Cookie: BD_HOME=0; path=/
       Set-Cookie: H_PS_PSSID=1427_21096_29567_29220_26350; path=/; domain=.baidu.com
       Strict-Transport-Security: max-age=172800
       Traceid: 1574076203272085069810715459201794208536
       Vary: Accept-Encoding
       X-Ua-Compatible: IE=Edge,chrome=1
       Transfer-Encoding: chunked
       (响应空行)
       
       (响应体)
       <!DOCTYPE html>
       <!-- [ published at 2019-11-18 19:27:00 ] -->
       <html>
       <head>
           <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
           <meta http-equiv="X-UA-Compatible" content="IE=edge" />
           <title>新浪首页</title>
       	<meta name="keywords" content="新浪,新浪网,SINA,sina,sina.com.cn,新浪首页,门户,资讯" />
       	<meta name="description" content="新浪网为全球用户24小时提供全面及时的中文资讯，内容覆盖国内外突发新闻事件、体坛赛事、娱乐时尚、产业资讯、实用信息等，设有新闻、体育、娱乐、财经、科技、房产、汽车等30多个内容频道，同时开设博客、视频、论坛等自由互动交流空间。" />
       	<meta content="always" name="referrer">
           <link rel="mask-icon" sizes="any" href="//www.sina.com.cn/favicon.svg" color="red">
       	<meta name="stencil" content="PGLS000022" />
       	<meta name="publishid" content="30,131,1" />
       	<meta name="verify-v1" content="6HtwmypggdgP1NLw7NOuQBI2TW8+CfkYCoyeB8IDbn8=" />
       	<meta name="360-site-verification" content="63349a2167ca11f4b9bd9a8d48354541" />
       	<meta name="application-name" content="新浪首页"/>
       	<meta name ="msapplication-TileImage" content="//i1.sinaimg.cn/dy/deco/2013/0312/logo.png"/>
       	<meta name="msapplication-TileColor" content="#ffbf27"/>
       	<meta name="sogou_site_verification" content="Otg5irx9wL"/>
       <link rel="apple-touch-icon" href="//i3.sinaimg.cn/home/2013/0331/U586P30DT20130331093840.png" />
       
       	
       ```
  
       

需要学习的知识

 		html：画不好看的页面

​		css：修饰不好看的页面，让页面更加美观

​		js：让页面动起来，有一些事件等效果



### 2.2 HTML

#### 2.2.1 引入

​		html:超文本标记语言

​		超文本：实现普通文本不能实现的功能，如页面跳转等

​		标记：标签，学习html就是学习各式各样的标签

​		<html> <y> <i>

（1）html的标准结构

```html
<html>
        <head></head>
        <body>
                this is my html....
        </body>
</html>
```

​		标准结构最外层是一个html的根标签，里面包含两个标签，一个是head，另一个是body，直接用浏览器运行即可，因为浏览器内置的html的解释器，可以直接对代码进行解析。

（2）2.4 快捷开发工具
		webstorm

#### 2.2.2 标准结构标签--head 

```html
<html>
<head>
        <!--告诉浏览器用utf-8格式来解析这个html文件-->
        <!--    <meta charset="UTF-8">-->
        <!-- 繁写：-->
        <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
        <!--  3秒之后刷新进入百度首页  -->
        <!--    <meta http-equiv="refresh" content="3;url=https://baidu.com"/>-->
        <!--    页面的作者信息，页面右键代码可以查看  -->
        <meta name="author" content="***公司名字；yjs；11323@qq.com" />
        <!--  keywords, description 组合使用，用于浏览器搜索引擎优化  -->
        <meta name="keywords" content="java零基础就业；大数据云计算；高薪就业" />
        <meta name="description" content="0元入学；可贷款" />
    
        <!-- link标签；用于引入外部资源  -->
        <link rel="shortcut icon" href="https://www.baidu.com/favicon.ico" type=image/x-icon>
        <!--标题标签，页面中显示的标签就是title-->
        <title>百度一下，你就知道</title>
    </head>
    <body>

    </body>
</html>
```

#### 2.2.3 标准结构标签--body

##### 2.2.3.1 文本标签

```html
<html>
    <head>
        <title>新闻页面</title>
        <meta charset="UTF-8">
    </head>
    <body>
        <!--在编辑器中的格式，不代表是页面中的格式， 浏览器中可能出现误解析，解析为一个小空格-->
        HELLO
        HTML

        <!--  1. 标题标签
              特点：加粗 自动换行
              h1-h6:有效的标签，字体逐渐减小
              h7,h8:无效的标签，浏览器在解析的时候，并没有找到对应的标签，没有找到，就按照普通文本处理-->

        <h1>特朗普：巴格达迪头号接班人已被美军击毙</h1><h1>特朗普：巴格达迪头号接班人已被美军击毙</h1>
        <h2>特朗普：巴格达迪头号接班人已被美军击毙</h2>
        <h3>特朗普：巴格达迪头号接班人已被美军击毙</h3>
        <h4>特朗普：巴格达迪头号接班人已被美军击毙</h4>
        <h5>特朗普：巴格达迪头号接班人已被美军击毙</h5>
        <h6>特朗普：巴格达迪头号接班人已被美军击毙</h6>
        <h7>特朗普：巴格达迪头号接班人已被美军击毙</h7>
        <h8>特朗普：巴格达迪头号接班人已被美军击毙</h8>

        <!--  2. 横线
              width: 设置宽度 200px占用200像素位置 30% 跟着浏览器变化，一直占用浏览器的百分之30
              aligh: 设置位置 靠左 left 靠右 right 居中（默认）center
              size：设置高度-->
        <hr width="200px" align="left" size="7"/>
        <hr width="30%" align="left" size="7"/>

        <!--  3. 段落标签
              每个段落中的文字，根据浏览器的大小会进行自动换行
              每个段落之间有默认的空白行

              4. 换行标签：br

              5. 实体字符：&nbsp; &emsp; &lt; &gt; &copy; -->

        <p>
            &nbsp;在个人ins上，伊布发&emsp;布了一段&lt;视频&gt;，视频中&copy;他表示：“Hola Espana, guess what? I'm coming back!（你好西班牙，猜猜我要说什么？我要回来了！）” <br/>4天前，伊布所在的洛杉矶银河3-5不敌洛杉矶FC，无缘季后赛。由于他与球队的合同将在年底到期，这也很可能是他在美职联的最后一战。伊布自己也暗示，很可能选择离开：“这可能是我在美职联的最后一场比赛，如果我走了，这里会变成什么样呢？”</p>
        <p>在个人ins上，伊布发布了一段视频，视频中他表示：“Hola Espana, guess what? I'm coming back!（你好西班牙，猜猜我要说什么？我要回来了！）” 4天前，伊布所在的洛杉矶银河3-5不敌洛杉矶FC，无缘季后赛。由于他与球队的合同将在年底到期，这也很可能是他在美职联的最后一战。伊布自己也暗示，很可能选择离开：“这可能是我在美职联的最后一场比赛，如果我走了，这里会变成什么样呢？”</p>

        <!--  6.预文本标签： 文本原样输出-->
        <pre>
        public static void main(String[] args){
            System.out.println("hello world");
        }
        </pre>

        <!--  7. 加粗：b
               倾斜：i
               下划线：u
               可以组合使用-->
        视频中，一名<b>女扶贫干部</b>在<u>讲话</u>时<i>说</i>，“大家都是经过苦日子的人，以前吃不饱、穿不暖。现在政策越来越好，国家退耕还林还给补贴，老了有养老保险、病了有医疗保险、日子过不下去了还有低保，盖房子了给你们补助，你们想一想，还有什么理由不把自己的日子过好。”

    <!--8. "一箭穿心"  -->
        <p>
        你好 <del>爱你爱你</del>
        </p>
    <!--9. 字体标签    -->
        <p>
        <font face="楷体" color="#f0f8ff" size="999">尚学堂</font>
        </p>
    </body>
</html>
```

##### 2.2.3.2 多媒体标签

```html
<!DOCTYPE html>
< lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
    </head>
    <!-- 图片标签：
           src:添加图片的路径
           可以添加本地的资源
           可以添加网络的资源


           width：设置宽度
           height：设置高度
           但是一般高度和宽度不同时设置，设置一个即可
           title：鼠标悬浮的时候会出现的提示效果
           在图片加载不出来的时候，title的内容会默认显示---前提；没有alt属性。

           alt属性：
           1.图片加载不出来的时候进行的提示
           2.浏览器进行搜索的时候，图片的关键字-->
        <img src="img/SS.png" width="300px" title="这是一个图" />
        <img src="http://b-ssl.duitang.com/uploads/item/201208/30/20120830173930_PBfJE.jpeg"/>

        <embed src="mp3/芒种.mp3"></embed>
        <embed src="mp4/道歉.mp4" width="800px" height="600px"> </embed>
        <iframe height=498 width=510 src='http://player.youku.com/embed/XNDQwMDYzNDY3Mg==' frameborder=0 'allowfullscreen'></iframe>

        <!--以上的音频、视频都是h4（html4）标签，下面是h5标签

            video:h5的视频标签
            在默认的情况下，如果只加src属性的话，视频没有加载
            必须要加入controls="controls" --加入控件
            页面在加载后，并没有自动播放，必须加入autoplay属性，才可以（普通的浏览器效果可能不同）

            -->
        <video src="mp4/道歉.mp4" controls="controls" autoplay="autoplay"></video>
</body>
</html>
```

##### 2.2.3.3 超链接标签

【1】基本应用

```html
<html>
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
    </head>
    <body>
        <!-- 超链接标签
             a: 只写a标签的话，什么作用都没有，必须加href属性
             href：实现跳转，跳转的地址
                "":默认跳转到自身页面
                可以跳转到本地资源
             target="_blank"：跳转到新的空白页面中去，如果不加这个属性，就是覆盖原来的网页

         -->

        <a href="">超链接</a>
        <a href="1html标准结构.html">超链接2</a>
        <a href="https://baidu.com">超链接3</a>
        <a href="1html标准结构.html" target="_blank">超链接2</a>
        <a href="https://baidu.com" target="_blank"><img src="img/login.png"></a>
    </body>
</html>
```

【2】设置锚点

​		a标签的name属性，设置锚点的位置

​		href属性用前面加#的方式来访问锚点

```html
<html>
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
    </head>
    <body>
        <a name="1F"></a>
        <h1>婴儿产品</h1>
        <p>奶粉</p>
        <p>奶粉</p>
        <p>奶粉</p>
        <p>奶粉</p>
        <p>奶粉</p>
        <p>奶粉</p>
        <p>奶粉</p>
        <p>奶粉</p>
        <p>奶粉</p>
        <p>奶粉</p>
        <p>奶粉</p>
        <p>奶粉</p>
        <p>奶粉</p>
        <p>奶粉</p>
        <p>奶粉</p>
        <a name="2F"></a>
        <h1>手机</h1>
        <p>三星</p>
        <p>三星</p>
        <p>三星</p>
        <p>三星</p>
        <p>三星</p>
        <p>三星</p>
        <p>三星</p>
        <p>三星</p>
        <p>三星</p>
        <p>三星</p>
        <p>三星</p>
        <p>三星</p>
        <a name="3F"></a>
        <h1>图书</h1>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>
        <p>java核心编程</p>

        <a name="4F"></a>
        <h1>日用品</h1>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>
        <p>纸抽</p>

        <a href="#1F">婴儿产品</a>
        <a href="#2F">手机</a>
        <a href="#3F">图书</a>
        <a href="#4F">日用品</a>
        <a href="">返回页面首段</a>
    </body>
</html>
```



【3】访问其他页面的锚点

```html
<a href="5锚点练习.html#2F">访问另一个页面的锚点-------手机</a>
```

##### 2.2.3.4 列表标签

```html
<html>
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
    </head>
    <body>
        <h1>你最喜欢的明星？</h1>
        <!--无序列表：
            默认每个列前都有一个实心的圆形图案。
            type：可以控制前面的图案
                circle:空心圆形
                disc:实心圆形
                square:实心方形
            -->
        <u1 type="square">
            <li>吴亦凡</li>
            <li>鹿晗</li>
            <li>王宝强</li>
        </u1>

        <!-- 有序列表：
             type 可以控制序号的种类：1，a, A, i, I
             start属性可以控制从第几个序号开始
        -->

        <h1>课程的顺序</h1>
        <ol type="A">
            <li>html</li>
            <li>css</li>
            <li>12306</li>
            <li>java</li>
            <li>mysql</li>
        </ol>

        <!--有序列表和无序列表集合在一起使用    -->
        <h1>高中的课程有哪些</h1>
        <ul>
            <li> 物理
                <ol>
                    <li>力学</li>
                    <li>电磁学</li>
                    <li>光学</li>
                </ol>
            </li>
            <li>生物</li>
            <li>化学</li>
        </ul>

        <!-- 自动以列表：适用于图文混排  -->
        <dl>
            <dt><img src="img/SS.png" width="200px"/></dt>
            <dd> 颜色艳丽，适用性强</dd>
            <dd> $3000</dd>
        </dl>
    </body>
</html>
```

##### 2.2.3.5 表格标签

```html
<html>
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
    </head>
    <body>
        <!--
            table:表格标签
            tr：行
            th：表头 加粗+居中
            td：行
            border：设置外边框
            width：设置宽度
            height：设置高度
            cellspacing:表格之间的空隙
            ellpadding：表格字体距离，边框之间的距离
            aligh="center"：居中
            background: 背景图片
            bgcolor：背景色

            行合并：rowspan="3" -- 合并了3个
            列合并：colspan="2" -- 合并了2个

        -->
        <table border="1px" width="350px" height="150px" cellspacing="0px" cellpadding="10px" bgcolor="#7fffd4" >
            <tr>
                <th>游戏名称</th>
                <th>擅长角色</th>
                <th>每周游戏时长</th>
            </tr>
            <tr>
                <td rowspan="3">LOL</td>
                <td align="center">女枪</td>
                <td>10</td>
            </tr>
            <tr>
<!--                <td>DNF</td>-->
                <td colspan="2">红狗</td>
<!--                <td>19</td>-->
            </tr>
            <tr>
<!--                <td>绝地求生</td>-->
                <td>落地成盒</td>
                <td>12</td>
            </tr>
        </table>
    </body>
</html>
```

#### 2.2.4 内嵌框架

【1】基本页面

```html
<html>
    <head>
        <meta charset="UTF-8">
        <title>内嵌框架</title>
    </head>
    <body>
        <iframe src="内嵌框架左侧页面.html" height="500px"></iframe>
        <iframe width="500px" height="500px" name="myiframe"></iframe>
    </body>
</html>
```

【2】左侧页面

```html
<!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
    </head>
    <body>
        <ul>
            <li><a href="img/book/物理.jpg" target="myiframe" >物理</a></li>
            <li><a href="img/book/语文.jpeg"  target="myiframe">英语</a></li>
        </ul>
    </body>
</html>
```

#### 2.2.5  框架集合

最终框架集合

![Screen Shot 2019-10-31 at 1.59.10 PM](/Users/yuanjinshuai/Library/Mobile Documents/com~apple~CloudDocs/java/pic/Screen Shot 2019-10-31 at 1.59.10 PM.png)

```html
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
    </head>
    <!-- frameset框架集合，不能放入body中，有frameset就不能有body了    -->
        <frameset rows="20%, *">
            <frame src="top.html"/>
            <frameset cols="25%,*">
                <frame src="left.html"/>
                <frame name="right" />
            </frameset>
        </frameset>

</html>
```



Top.html

```html
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
    </head>
    <body>
        <ul>
            <li><a href="7表格标签.html" target="right">写信</a></li>
            <li><a href="内嵌框架左侧页面.html" target="right">收件箱</a></li>
            <li><a href="3多媒体标签.html" target="right">发件箱</a></li>
        </ul>
    </body>
</html>
```



left.html

```html
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
    </head>
    <body>
        <ul>
            <li><a href="7表格标签.html" target="right">写信</a></li>
            <li><a href="内嵌框架左侧页面.html" target="right">收件箱</a></li>
            <li><a href="3多媒体标签.html" target="right">发件箱</a></li>
        </ul>
    </body>
</html>
```



#### 2.2.6  form表单

【1】form表单的作用：用于前后台交互，可以将数据发送到后台

```html
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>表单元素</title>
    </head>
    <body>
        <br action="aa" method="get">
            <input type="hidden" name="a" value="123" />
            <!--
               1. input标签通过type属性的不同值来控制为不同的表单元素
               2. type="text" 文本框
               type="password" 密码框
               type="hidden" 隐藏域
               type="submit" 提交按钮 -------value: 按键上的名字
                      name: 用于提交数据的名字，假如没有name属性，这个数据即使录入也不提交
                      value：提交的数据的具体数值
                      -->
            用户名：<input type="text" name="username" value="lili"/><br/>
            密码：<input type="password" name="psw" value="123123"/><br/>

            <!--
                5. type="radio" 单选按钮
                每组通过name来控制成为一组，在一组中只能选择一个
                假如没有写value属性的话，提交的数据是：gender=on
                要是提交数据，必须加上value的具体数值
                默认选中，checked="checked"
                         checked
                         checked = "true"

                6. disabled 和 readonly 区别
                disabled 禁用 可适用于所有元素 数据不能别提交
                readonly 禁用 只读 只用于文本框 数据可以被提交
             -->

            性别：<input type="radio" name="gender" value="0" checked="checked"/> 男
                    <input type="radio" name="gender" value="1"/> 女 <br />

            爱好课程：<input type="radio" name="fav" value="0" checked="checked"/> html
                        <input type="radio" name="fav"value="1"/> css
                             <input type="radio" name="fav"value="2" checked="checked"/> js <br />

            <input type="text" name="username1" value="zhaoss" disabled="disabled" />
            <input type="text" name="username2" value="lili" readonly="readonly" /><br />

            <!--
                7. 复选框---------type="checkbox"
                name属性：必须：比较的名字
                如果没有value。提交就是on
                所以要提交具体的数据，必须脚上不同的value


                            -->
            喜欢的明星：<input type="checkbox" name="star" value="1"/> 李易峰
            <input type="checkbox" value="2"/> 鹿晗
            <input type="checkbox" value="3"/> 蔡徐坤
            <input type="checkbox" value="4"/> 李宇春
            <input type="checkbox" value="5"/> 周杰伦<br />

            <!--
                8. 下拉框
                select 默认是单选下来框
                name value 跟以前的功能一样
                multiple = "multiple" 单选变多选
                selected="selected" 默认选择
                        -->
            你所在的省份：
            <select name="province">
                <option value="0"> 请选择</option>
                <option value="1"> 黑龙江</option>
                <option value="2" > 山东省</option>
                <option value="3"> 江西省</option>
                <option value="4"> 河南省</option>

            </select>
            <br />
            <!--文本域
                rows="10" cols="30" 控制行，列的多少
                style="resize: none" ---利用css样式，使文本域不可以改变大小
                -->
            <textarea rows="10" cols="30" style="resize: none"></textarea><br />

            <!--
                10.
                type="number"   数字，只能录入数组，可加减
                type="color"    颜色
                type="file"     文件
                type="button"   普通按钮
                type="reset"    重置

                        -->
            <input type="number" /></br>
            <input type="color" /></br>
            <input type="file" /></br>
            <input type="button" value="普通按钮"/></br>
            <input type="reset"> </br>


            <!--11
                type="image" 和普通图片的区别
                type="reset" 有提交表单的功能

                        -->
            <input type="image" src="img/登陆按钮.png" />
            <img src="mg/登陆按钮.png"><br />

            <!--
                12
                accesskey="m" 快速定位到元素的快捷键
                label 用id定位到对应的元素
                        -->
            <label for="tt">测试：</label>
            <input type="text" accesskey="u">

            <!--        -->

            <input type="submit" value="提交"/>

        </form>
    </body>
</html>
```



## 2.3 CSS

### 2.3.1 引入

【1】某些想要的实现的样式，通过html自身的属性不能完成，引入一个新的技术

【2】新的技术：css层叠样式表

层叠：叠加样式

样式表：各种各样的样式集合

【3】css的作用：

html：画页面的，描述页面组成

css：修饰页面样式



```html
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>css引入</title>
    </head>
    <body>
    <h1 style="color: blueviolet; font-family: 萝莉体 第二版；">爱的魔力转圈圈</h1>
    <h1 style="color: blueviolet; font-family: 萝莉体 第二版；">想你想到心花怒放</h1>
    <h1 style="color: blueviolet; font-family: 萝莉体 第二版；">黑天白夜</h1>
    </body>
</html>
```



【4】css的三种书写方式

【4.1】直接在标签上添加style属性

```html
<html>
    <head>
        <meta charset="UTF-8">
        <title>css引入</title>
    </head>
    <body>
    <h1 style="color: blueviolet; font-family: 萝莉体 第二版；">爱的魔力转圈圈</h1>
    <h1 style="color: blueviolet; font-family: 萝莉体 第二版；">想你想到心花怒放</h1>
    <h1 style="color: blueviolet; font-family: 萝莉体 第二版；">黑天白夜</h1>
    </body>
</html>
```

【4.2】在head标签上加上style标签，整个页面中都起作用

<style type="text/css"> 可以省略不写

```html
<html>
    <head>
        <meta charset="UTF-8">
        <title>css引入</title>
      	<style type="text/css">
          h1{
          		color:deepskyblue;
            	font-family:萝莉体 第二版；
          }
        </style>
    </head>
    <body>
    <h1>爱的魔力转圈圈</h1>
    <h1>想你想到心花怒放</h1>
    <h1>黑天白夜</h1>
    </body>
</html>
```

【4.3】引入外部文件，整个项目中都起作用。

```html
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>css引入</title>
        <!--
            link 引入外部资源的标签
            rel 关联--要关联一个样式表
            type 样式表对应的类型；css的样式表
            href 引入资源的位置
                -->
        <link rel="stylesheet" type="text/css" href="css/mycss.css" />
    </head>
    <body>
    <h1 style="color: blueviolet; font-family: 萝莉体 第二版；">爱的魔力转圈圈</h1>
    <h1 style="color: blueviolet; font-family: 萝莉体 第二版；">想你想到心花怒放</h1>
    <h1 style="color: blueviolet; font-family: 萝莉体 第二版；">黑天白夜</h1>
    </body>
</html>
```

【5】假如三个同时运行，那个优先？就近原则，哪个样式离得近，就用哪个 



### 2.3.2 选择器

####2.3.2.1 基本选择器

```html
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
        <style type="text/css">
            /*
            基本选择器：
            【1】元素选择器
            格式：对应的元素名称：
            */

            h1{
                color: blueviolet;
            }
            /*
            【2】id选择值
            格式：#id的名字{属性；}
            注意，一般，我们控制id的时候，不同的标签用不同的id值，确保id是不重复的。
            因为以后要学习js，用的id都是唯一的
            */

            #myh2{
                color: red;
            }
            /*
            【3】class选择器
            应用场合：不同的元素用对应的样式
            格式 .class 对应的值{ 属性；}
            */

            .mycls{
                color: yellow;
            }
        </style>
    </head>
    <body>
        <h1>我在学习css选择器</h1>
        <h1>我在学习css选择器</h1>
        <h1>我在学习css选择器</h1>
        <h2 id="myh2">我在学习css选择器</h2>
        <h2 class="mycls">我在学习css选择器</h2>
        <h3 id="myh3">我在学习css选择器</h3>
        <h3 class="mycls">我在学习css选择器</h3>


        <h1></h1>
    </body>
</html>
```



#### 2.3.2.2 关系选择器

```html
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
        <style type="text/css">
            /*关系选择器*/
            /*只要div下面的所有h1标签，样式都会改变---层级选择器*/
            /*div h1{*/
            /*    color: aquamarine;*/
            /*}*/
            
            div>h1{
                color: aquamarine;
            }
            span>h1{
                color: aliceblue;
            }
        </style>

    </head>
    <body>
        <!-- div; span 就是划分区域的
             div: 行级元素
             span:里面的元素有多大，这个区域就有多大-->
        <div style="border: blueviolet 1px solid;">adasdad</div>
        <span style="border: blueviolet 1px solid">adadad</span>

        <div>
            <h1>我在学习</h1>
            <h1>我在学习</h1>
            <h1>我在学习</h1>
            <h1>我在学习</h1>
            <h1>我在学习</h1>
            <h1>我在学习</h1>
            <span>
                <h1>我在学习2</h1>
                <h1>我在学习2</h1>
                <h1>我在学习2</h1>
                <h1>我在学习2</h1>
                <h1>我在学习2</h1>
                <h1>我在学习2</h1>
            </span>
        </div>
    </body>
</html>
```



#### 2.3.2.3 属性选择器

```html
<!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
        <style type="text/css">
            /*属性选择器*/
            /*input标签带value属性的，就改变样式*/
            /*input[value]{*/
            /*    background-color: red;*/
            /*}*/

            /*input标签中value的属性值是"456789"的就可以定位*/
            input[value="456789"]{
                background-color: aquamarine;
            }

            input[type="password"][name="pwd"]{
                background-color: azure;
            }
        </style>

    </head>
    <body>
    <form action="aa" method="get"></form>
        <input type="text" name="username" />
        <input type="pasword" name="pwd" value="123456"/>
        <input type="text" name="pwd2" value="3424234"/>

    </body>
</html>
```



#### 2.3.2.4 伪元素选择器

【1】伪元素选择器：给出选择器做一些特殊的效果

【2】代码

```html
<!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
        <style>
            h1:hover{ /*鼠标悬浮的特殊效果*/
                color: red; /*变成红色*/
                cursor: pointer;/*鼠标变成小手样式*/
            }

            /*静止状态
              假如要是超靓姐
            */
            a:link{
                color: red;
            }

            /*悬浮状态*/
            a:hover{
                color: azure;
            }

            /*触发状态*/
            a:active{
                color: blue;
            }

            /*完成状态*/
            a:visited{
                color: green;
            }
        </style>
    <body>
    <h1>我在学习
    </head></h1>
    </body>
</html>
```



【3】模拟百度首页



```html
<!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>百度一下，你就知道</title>
        <style type="text/css">
            /*1.将无序列表前面的点符号去掉*/
            u1{
                list-style-type: none;
            }
            /*2.增加超链接的样式*/
            a{
                font-family: "微软雅黑"; /*字体*/
                font-size: 9px;
                font-weight: bold;
                color: black;
            }
            /*3. 将列表横过来*/
            li {
                float: left;
                margin-left: 10px;
            }
            /*4. 利用div将元素移动到页面右侧*/
            div{
                position: absolute;
                right: 150px;
            }

            a:hover{
                color: red;
            }

            a:active{
                color: yellow;
            }
            #news:visited{
                color: purple;
            }
        </style>
    </head>
    <body>
        <div>
            <u1>
                <li><a id = "news" href="">新闻</a></li>
                <li><a href="">hao123</a></li>
                <li><a href="">地图</a></li>
                <li><a href="">视频</a></li>
            </u1>
        </div>
    </body>
</html>
```



### 2.3.3 浮动

【1】浮动 

飘---往左飘 往右飘

```html
<!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
    </head>
    <body>
        <div style="width: 300px; height: 300px; background-color: red; float: right;">
            <font size="10">1</font>
        <div style="width: 300px; height: 500px; background-color: blue; float:right;">
            <font size="10">2</font>
        </div>
        <div style="width: 800px; height: 300px; background-color: violet; float:right; margin-top: 20px">
            <font size="10">3</font>
        </div>
    </body>
</html>
```

### 2.3.4 定位

【1】绝对定位

```html
<!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
    </head>
    <body>

    <div style="width: 500px;height: 500px; background-color: bisque; margin-left: 100px; margin-top: 50px">
        <div style="width: 100px;height: 100px; background-color: red; position: absolute;left: 20px ;top: 30px">11111</div>
        <div style="width: 100px;height: 100px; background-color: yellow">11111</div>
    </div>
    </body>
</html>
```

绝对定位：只要一个元素加了绝对定位，就是对浏览器最左上角的原点进行的定位。

但是这个元素会影响其他的元素，假如这个元素用了绝对定位，那么就是释放父级原点，那么其他元素就会到父级原点的位置上去！



【2】相对定位

```html
<!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
    </head>
    <body>

<!--    <div style="width: 500px;height: 500px; background-color: bisque; margin-left: 100px; margin-top: 50px">-->

<!--    </div>-->

        <div style="width: 100px;height: 100px; background-color: red; position: relative; top: -20px; left: 20px">11111</div>
        <div style="width: 100px;height: 100px; background-color: yellow;">2222</div>
    </body>
</html>
```

就是对自身位置，进行相对定位！



【3】固定定位

```html
<!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
    </head>
    <body>

    <div style="width: 500px;height: 500px; background-color: bisque; position:fixed; top: 200px; left: 50px"></div>
    <p>111111</p>
    <p>111111</p>
    <p>111111</p>
    <p>111111</p>
    <p>111111</p>
<!--        <div style="width: 100px;height: 100px; background-color: red; position: relative; top: -20px; left: 20px">11111</div>-->
<!--        <div style="width: 100px;height: 100px; background-color: yellow;">2222</div>-->
    </body>
</html>
```



【4】模拟12306

```html
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>中国铁路12306</title>
    </head>
    <body>
        <div style="width: 50px; height: 85px; position: fixed; right: 0px; top: 170px; background-color: aquamarine">
            <font face="微软雅黑" size="3" style="padding-top: 10px; ">最新<br />发布</font>

        </div>

        <h1>1111</h1>
        <p>1111</p>
        <p>1111</p>
        <p>1111</p>
        <p>1111</p>

    </body>
</html>
```



### 2.3.5 盒子模型

![Screen Shot 2019-11-01 at 11.41.11 AM](https://p.ipic.vip/b3xaun.jpg)



```html
<!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
        <style type="text/css">
            #div01{
                width: 500px;
                height: 300px;
                background-color: bisque;
                border: 1px solid red;
                margin-left: 30px;
                margin-top: 40px;
            }

            #div02{
                width: 100px;
                height: 100px;
                background-color: aquamarine;
                margin-top: 30px;
                margin-left: 60px;
                padding-top: 20px;

            }

        </style>
    </head>
    <body>
        <div id="div01">
            <div id="div02" >xixi</div>

        </div>

    </body>
</html>
```



## 2.4 JavaScript

* 客户端脚本语言
  * 运行在客户端浏览器中的，每个浏览器都有JavaScript的解析引擎
  * 脚本语言，不需要编译
* 功能
  * 可以增强用户和html页面的交互过程，可以来控制html元素，让页面有一些动态的效果，增强用户体验

* JavaScript = ECMAscript + javaScript自己特有的东西（BOM+DOM）

### 2.4.1 ECMAscript

1. 基本语法

   1. 与html结合方式
      1. 内部js：
         * 定义`<script>` ，标签内容就是js代码
      2. 外部js：
         * 定义`<script>`，通过src属性引入到外部的js文件
      3. 注意：
         1. `<script>`可以定义在html页面的任何位置，但是定义的位置会影响执行的顺序。
         2. `<script>`可以定义多个
   2. 注释
   3. 变量
   4. 运算符
   5. 流程控制语句

2. 基本对象

   Function

   Array

   Boolean

   Date

   Math

   Number

   String

   Regexp

   Global

   

### 2.4.2 BOM

1. 概念：browser Object Model 浏览器对象模型

   * 将浏览器的各个组成部分分装为对象

     

### 2.4.3 DOM

1. 概念：Document Object Model 文档对象模型
   * 将标记语言文档的各个组成部分，封装为对象。可以使用这些对象，对标记语言文档进行CRUD动态操作。

* 功能：获取html文档的内容
* 代码：获取页面标签（元素）对象 Element
  * `document.getElementByID("id值")`：通过元素的id获取元素的对象
* 操作 Element对象
  1. 修改属性值
     1. 明确 
  2. 修改标签体内容
* 



### 2.4.4 事件监听机制（DOM的一部分）

1. 概念：某些组件被执行了某些操作以后，触发某些代码的执行。
   * 事件：某些操作，如：单击，双击，键盘
   * 事件源：组件，如：按钮、文本输入框
   * 监听器：代码
   * 注册监听：将事件、事件源，监听器结合在一起。当一个事件源头上发生了某个事件的时候，则会触发执行某个监听器的代码
2. 常见的事件
   1. 点击事件：
      1. onclick：单击事件
      2. ondblclick：双击事件
   2. 焦点事件
      1. onblur：失去焦点
      2. onfocus：元素获得焦点
   3. 加载事件
      1. onload：一张页面或一幅图像完成加载。
   4. 鼠标事件
      1. onmousedown 鼠标按钮被按下。
      2. onmouseup 鼠标按键被松开。
      3. onmousemove 鼠标被移动。
      4. onmouseover 鼠标移到某元素之上。
      5. onmouseout 鼠标从某元素上移开。
   5. 键盘事件
      1. onkeydown 某个键盘被按下
      2. onkeyup 某个键盘按钮被松开
      3. onkeypress 某个键盘被按下并松开
   6. 选择和改变
      1. onchange 域的内容被改变
      2. onselect 文本被选中
   7. 表单事件
      1. onsubmit 确认按钮被点击
      2. onreset 重置按钮被点击

## 2.5 XML

与html非常类似

1. 概念：Extensible Markup Language 可扩展标记语言

   * 可扩展：标签都是自定义的。<user> <student>

   * 功能
     * 存储数据

       1. 配置文件

       2. 在网络中传输

   * xml和html区别

     1. xml标签都是自定义的，html标签都是预定义。

     2. xml的语法严格，html语法松散

     3. xml是存储数据的，html是展示数据

2. 语法

   * 基本语法：
     1. xml文档的后缀名	.xml
     2. xml第一行必须定义为文档声明
     3. xml文档中有且仅有一个根标签
     4. 属性值必须使用引号（单双均可）引起来
     5. 标签必须正确关闭
     6. xml标签名称区分大小写

   ```xml
   <?xml version='1.0' ?>
   <user>
       <user id="1">
           <name>mike</name>
           <age>23</age>
           <gender>male</gender>
           <br/>
       </user>
   
       <user id="2">
           <name>james</name>
           <age>24</age>
           <gender>female</gender>
           <br/>
       </user>
   
   </user>
   ```

   



​	