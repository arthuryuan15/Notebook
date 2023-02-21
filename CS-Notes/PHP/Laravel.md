https://laravel.com/docs/5.8

# Laravel框架关键技术解析





what is CLI and http?

* CLI: from command line input

* http: from web agent

  

Closures？





Eloquent?

Eloquent is Laravel’s ActiveRecord database object-relational mapper (ORM), which makes it easy to relate a Post class (model) to the posts database table and get all records with a call like Post::all().



Illuminate?



**Laravel’s Request Lifecycle** 

![Cover image for Laravel Request Lifecycle](https://p.ipic.vip/l08i43.jpg)









Routes, RequestHandlers, Middleware?

<img src="https://p.ipic.vip/oehjhf.jpg" alt="image-20210708123104139" style="zoom:33%;" />





Router->attach




之前一直在稀里糊涂的用laravel， 还没系统的看过， 这次在看的过程中算是真实感受到了laravel的强大。

第三章，光是一个 Route group就能讲那么多东西，各种组织方式，连CURD基本操作的controller人都帮忙封装好了，直接通过route可以绑定model，强大。待产品真正上线的时候必要的想 php artisan route:cache 这种优化还是要做的。

第四章，虽然Laravel设计了非常棒的Blade模板引擎，但在目前前后端分离的大趋势下，后端模板引擎的应用可以说是越来越少了。

第五章，内容稍微有点过时了，laravel5.4目前采用webpack作为前端的打包工具，另外分页那东西我感觉也不是特别实用，主要是前后端分离，messageBox也是如此。本地化的问题用到了再看，目前还不需要做多版本。 

第六章，主讲获取并处理用户数据，这应该是所有服务器程序的基本功了，能不能做的方便好用可以说是一个服务器框架的成本之本，很明显laravel做到了。

第七章，主讲larave对命令行指令的封装，为我们平时的一些任务提供了非常大的遍历，比如说我们要读取一个省市县的excel文件，然后将文件内容写入数据库，或者一个申万三级行业的文件，将这个文件内容写入数据库，都可以利用命令行指令来快速完成。 

第八章，主讲数据库操作和laravel封装的ORM的使用，对于简单的业务逻辑来说这简直就是神器，Eloquent这是对mysql的封装，对于mongo来说有第三方的Moloquent可用，强烈推荐。编排上存在一点问题，将Seeding的时候其实是涉及了Eloquent的知识，但是这点没有说明，如果只是按照书中内容去code，是没办法seed成功的，需要先创建对应的Eloquent class。Raw SQL看都不要看，现在真不能这么用了。 

第九章，属于绝对不能忽略的内容了，现在只要是个站就得有账号系统，如何快速的构建这块内容，laravel封装的既简单易用，又可扩展。其中关于Guards的介绍，若不是看书，估计很难自己遇到。



第十章，读完大概就能了解Laravel整个库的设计理念的大部分了，程序的请求流程，周期是怎样的，这期间均是哪些模块在起作用，认识Service Providers和middleware，这两块是非常重要的，举个例子，我最近要为内部系统接入运维同学开发的SSO服务，一个middleware就搞定了。 



第十一章，讲到了面向对象最重要的一个概念，注入依赖和控制翻转，相信只要学过java的同学就一定会对这个概念不陌生，这里重点介绍laravel对这两个机制的实现。

第十二章，国内目前自动化测试或者集成测试、单元测试基本上都不做，所以这张粗略翻翻就跳过了。

第十三章，主要讲如何利用Laravel打造RESTFUL API。以及它的两种授权模式，OAuth2.0和API Token Authentication.

第十四章，主讲session, cookies的应用，其中还有cache这一容器级的存储，凡是做过web后端的同学对这几个概念一定就不陌生了，至于文件和全文检索的处理则是用到的时候再去看就好了。第十五章，十六章也是同理，所以我很快浏览了一下便过去了。

第十七章，主讲laravel的工具箱，其中封装的可以大大加快我们开发效率的一些常用函数，这种东西没事常翻翻有个印象，这样用的时候才能想起来，或者遇到某种操作了，php原生没提供，但觉得又挺常见的，就应该来这里看看。





Databases and Eloquent





