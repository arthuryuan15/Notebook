

## guideware

2022

1.   ~~第一题iteraotor implementation,~~
2.   ~~第二题 n-tree getNthLevel, getLeafNodes.~~



2021

1.   java: volatile, annotation, interface, 事务,modifier.
2.   如何设计一个聊天室，讲一下大概模块有哪些，数据库如何设计。记得了解一下websocket



2021

1.   ~~两个人各有一个schedule，就是哪一天在哪个城市出差。 两个人需要拿一天出来一起吃饭。求哪一天一起吃饭时，走的路最少。 有3种情况。~~
     
     1)   两个人正好在同一个城市，就是最优解。
     
     2)   两个人在相邻的城市，其中有一个人走到另一个人的城市就行了。
     
     3)   两个人有共同的相邻城市，两个人都要走到共同的邻居城市才行。
     
          给的schedule 并不是每个人每天都有空。我在这个上面花了些时间，因为不熟悉项目的相关类。解法就是，首先生成一个HashMap<哪一天, 两个人各自在哪个城市的列表>。这个map的value可能只有一个值，可能有两个值。我们只拿有两个值的(就是代表两个人在当天都是available的)。然后比较城市和距离就行了。
     
2. ~~实现一个钱包。钱包有支‍‍‌‍‌‍‍‌‍‍‌‌‌‍‍‍‌‌‍‌持5种美分Penny, Nickel, Dime, Quater, Half_Dollar. 要实现的功能有增加/减少某种钱币。统计总共多少钱。统计总的钱币数量。然后就是把零钱换成整的钱。比如5个penny 换成1个nickel. 这里我就是因为不了解美分的兑换走错了路， Dime 和quater并不能1:N互换。~~

      因此好的做法就是用总量减去Hafl_dollar的数量，再减quater的数量，再减Dime的数量



2021

1.   ~~第一题是关于写一个license plate 的iterator. 之前也有人发过，但是好像没人给出详细的代码。~~
     输入Iterator<String> platenumbers, 里面包含了很多错误的牌照号，遇到错误的Licenseplate构造函数会抛出异常，因此外面初始化的时候需要抓异常。
     输出是一个一个的合法校验过的Liscenseplate类.

```java
代码如下:
import java.util.*;
// import java.lang.Exception;
class Licenseplate{
    enum STATE {CA,NY,NJ,WA,PA};
    private String content = "";
    private static HashSet<String> statesSet = new HashSet<String>();
    static{
        for(STATE state : STATE.values()){
            statesSet.add(state.name());
        }
    }
    public Licenseplate(String input) throws Exception {
        /*
            wrong: 'CA123456 ', 'CC123456', 'CCC23456', 'CA123 46'
        */
        //check len of input, 8
        if (input == null || input.length() != 8){
            throw new Exception("Wrong input len:" + input);
        }
        //check first two chars. in table.
        if(!statesSet.contains(input.substring(0,2))){
            throw new Exception("Wrong input state:" + input);
        }
        //check the later 6 digits.
        for(int i = 2; i < input.length(); i++){
            if(!('0'<= input.charAt(i) && input.charAt(i) <= '9')){
                throw new Exception("Wrong input numbers:" + input);
            }
        }
        content = input;
    }
    public String toString(){
        return content;
    }
    static class LicenseplateIterator implements Iterator<Licenseplate>{
        private Iterator<String> iterator = null;
        private Licenseplate next = null;
        
        public LicenseplateIterator(Iterator<String> iterator){
            // store the iterator
            this.iterator = iterator; //todo if it's null
            //prepare the next element
            prepareNext();
        }
        
        private void prepareNext(){
            next = null;
            while(iterator.hasNext()){
                try{
                    Licenseplate lp = new Licenseplate(iterator.next());
                    next = lp;
                    break;
                }catch(Exception e){
                    System.out.println(e);
                }
            }
        }

        public Licenseplate next() {
            Licenseplate lp = next;
            //prepare the next of next element
            prepareNext();
					//return the next element
            return lp;
        }
        public boolean hasNext() {
            //check if has next
            return next != null;
        }
    }
}
```

2 ~~第二题是遍历 N-arr Tree.~~
	第一个子问是用BFS遍历第n层的所有节点。 蠡口 司二久
	第二个自问是用DFS递归调用自己，获取所有叶节点。蠡口 三流流的简化版。 就取最外面一层叶节点。



2021

1.   ~~设计iterator那个~~



2020

1.   ~~视频面试是写一个iterator，关于licenseplate的，求出给出的licenseplate是否合法，比如：CA123456, 这是一个合法牌照（2 char state + 6 digits），注意constuctor有判定valid与否的功能。~~
     具体class and APIs如下：

```java

class Licenseplate {
    enum STATE {
        CA,
        NY,
        NJ,
        WA,
        PA
    }
    public Licenseplate(String input) {
    }
    static class LicenseplateIterator implements Iterator<Licenseplate> {
        public LicenseplateIterator(Iterator<String> iterator){
        		  
        }
        
        public boolean hasNext() {
        }
        public Licenseplate next() {
        }
    }
}

```

Task.zip



2019

1.   private class，什么是多线程的raise，hashmap的

前天做的OA，题目和这个帖子说的一样https://www.1point3acres.com/bbs ... highlight=Guidewire
2. ~~第二题是maximum subarray II的变种，不同的是给定了两个subarray的长度，一个是K， 一个是L~~
https://www.jiuzhang.com/solution/maximum-subarray-ii/



2018

内推guidewire，收到布兰特老爷爷电话，老爷爷虽然是hr但是会问很多

1.   java的基础，hashmap，access modifier，多线程什么的。

2.   ~~没多久收到店面，是个波兰小哥 给一个licenseplate class，有enum州名和车牌号，纯数字，~~
     给你一个string iterator，string是plate，然后让你实现一个plate的iterator
     其中州名不在enum里面的string在next的时候需要跳过
     hasnext的时候也要跳过，就是说如果后面全是invalid州名的车牌你要return false

3.   ~~第二个就是简单的树，实现两个方法~~

     返回n层的全部node和返回全部叶子
     花了老子四十分钟做第一个题，主要是iterator不大熟悉



2018

1.   ~~题目： license plate~~
     Inputs: 1）给了你一个StringIterator, StringIterator可以调用hasNext 和 next方法, next方法会返回一个车牌字符串例如"NY1234, CA5678, ZZ000", 注意 ZZ000是Invalid车牌，因为valid的州缩写只有6个，我们之后会将如何处理他
                 2）给你个LicensePlate的类，构造函数参数是字符串，例如"CA5678"， 实例化LicensePlate时如果字符串是Invalid，会抛出错误，这个类可以用来做州的validation

Tasks:  我们要写的是一个叫LicensePlateIterator, 构造函数已经定义好了，参数就是一个``terator<String> iterator`, 我们需要实现LicensePlateIterator里的 next 和 hasNext方法
            1 hasNext 返回是否还有下一个valid LicensePlate object可以被返回
            2 next 返回下一个valid LicensePlate object 或者 null， 要注意的是这个方法会跳过所有Invalid的车牌



讲下我最后的思路吧，定义一个全局变量 nextPlate, 在hasNext里不断循环调用StringIterator.next来创建LicensePlate对象并把值赋给nextPlate, 直到nextPlate非null或者StringIterator返回false, LicensePlateIterator.hasNext就完成了找下个valid Plate object的任务，这样在Licens‍‍‌‍‌‍‍‌‍‍‍‍‌‌‌‍‍‍‌‌ePlateIterator.next方法里只需要看下这个nextPlate是否为null, 是的话重新调用一下LicensePlateIterator.hasNext, 不是的话恭喜你，reset一下nextPlate变量后返回值就好了。
这应该不是最优解，面试官也没说是，前二十分钟楼主一直把重点放在LicensePlateIterator.next方法上饶了很大一个圈。代码写了快40分钟，当时感觉就是肯定跪了，不说第二题还没开始，测试都没跑呢。个人感觉还是自己太鱼了，工作了快两年写个Iterator还这么卡，这题相对于算法的难度
也就Easy偏medium的难度吧。
第一次在地理发面经，祝大家找工作顺利，共勉。



2015 

1.   之后就开始问 HashMap 的细节，包括 put(key,value), get(key), hash function, initial capacity, load factor, hashing collision
2.   ~~题目跟 iterator of iterator 很像，需要 implement hasNext()和 Next()并过 test case。~~用 arrayList 写完之后在提醒下讲了优化的思路，但是没有来得及写。。于是挂了



2015

1.   对HashMap的理解，问了好多细节问题，另一个是OOD，设计chess



2015

1.   Junit test for poker game
2.   ~~complete some functions in the project for determining two persons' meeting day and place given schedule and citymap.~~
3.   subset

2015

1.   what's the difference between interface and abstact?
2. what's recursion?
3.what's transient?
4. what's volatile?
4. implement hashtable
4. design chess game



2015

1.   解释一下interface以及其内部结构；interface里面是否可以有变量和常量？那这些变量和常量都有什么性质？（接口内部全是public）；
2.   HashTable和HashMap对于处理collision的机制
3.   Recursion的含义，举个例子，以及什么情况下停止（到底层的base case）；
4.   for loop和for-each loop的区别
5.   数据库的left-outer join的定义；
6.   Java里Generics的定义：
7.   ~~就是那个蜗牛的题了。“10米的枯井，一只蜗牛从井底往上爬，白天往上爬3 feet，晚上往下掉2 feet，问需要几天爬到枯井？”而且问这个问题的时候他直接说：“Please just tell me if you already heard of this question before.”这时候当然是说“好像听过但是没仔细思考过”然后故作思考状再给出答案；~~
8.   abstract class和interface的区别
9.   What is Volatile keyword in Java?
10.   Chess Game OOD‍‍
11.   ‌‍‌‍‍‌‍‍‍‍‌‌‍‌‌‌‌‍Implement a HashTable



2015

1.   问题大概就是什么Interface啦，如何解决Hashtable里面的collision啦，迭代器里面有什么methods啦，什么是Recurision啦



2015

1. Poker Game，同花顺，三对，两对，没对子等等情况，写比大小的comparator类实现。很多代码都已经写好了，只需要填关键function就行了，有test case给你看，已test case能不能过为标准。

2. ~~Power Set，也就是subset~~。用三种方法解决：1）dfs；2）bfs；3）bitMap

    subset，用bfs做就是这：
    {1，2，3}
    第一层：{}
    第二层：{} | {1}
    第三层：{} {1} | {2} {1, 2}
    第四层：{} {1} {2} {1, 2} | {3} {1, 3} {2, 3} {1, 2, 3}

3. Traveling Sales People

4. 第二轮不是coding啊，问了hashmap，只需要动动嘴皮子就可以了~如果你是remote，那么就有第三轮，是实现iterator of iterator

    

2015

1.   1.解释一下interface以及其内部结构；interface里面是否可以有变量和常量？那这些变量和常量都有什么性质？（接口内部全是public）；
     2.HashTable和HashMap对于处理collision的机制
     3.Recursion的含义，举个例子，以及什么情况下停止（到底层的base case）；
     4.for loop和for-each loop的区别（for-each loop是用enumeration，而for loop是用index）；
     5.数据库的left-outer join的定义；
     6.Java里Generics的定义‍‍‌‍‌‍‍‌‍‍‍‍‌‌‌‍‍‍‌‌：（They allow "a type or method to operate on objects of various types while providing compile-time type safety."，答题重点在于“compile-time type safety”）
     7.~~就是那个蜗牛的题了。“10米的枯井，一只蜗牛从井底往上爬，白天往上爬3 feet，晚上往下掉2 feet，问需要几天爬到枯井？”而且问这个问题的时候他直接说：“Please just tell me if you already heard of this question before.”这时候当然是说“好像听过但是没仔细思考过”然后故作思考状再给出答案；~~



2014

第一轮： 电话面试－－， 问了一大堆java的basic问题， 然后经典的蜗牛爬问题（白天爬3米，晚上掉2米， 什么时候爬出10米）， 最后设计蜗牛爬ood
第二轮： implement hashmap， 设计chess game ood
onsite： 第一轮－－》 poker game： 不好描述， 总之就是ide上机， 然后判断五张牌的组合。。吐槽，真的很无聊， code很多写好了。
            ~~第二轮 －－》 power set~~
             第三轮 －－》 travel‘s men： 两个人从一个城市到另一个城市，每人每天只能最多移动一个城市， 找出最短距离‍‍‌‍‌‍‍‌‍‍‌‌‌‍‍‍‍‍‌‌。
             第四轮 －－》 behavior

才看到不好意思，就是这几道。主要是根据他已经写好的类继续补充函数。



2014

1.   interface, abstract in Java 
2.    蜗牛爬井设计类和方法
3.   recursion，map
4.   volatile 是什么
5.   设计一个chess game。 然后还有一个就是实现一个**HashMap**。。。注意初始大小， put() and get()
6.   一串概念问题 map set tree list array iterator 反正这些基本的数据结构都要知道
     然后abstract interface 区别应用
     秒完这些一题智力题 蜗牛爬井 爬三米掉两米 问你几天可以爬出去
     然后针对这题进行OOD
7.   我面了第二轮。。。设计一个chess game， 还有就是implement a hashmap, 主要讲push() 和delete()

2014

1.   Can interfaces have variables?
2.   Let's talk about hashing. Do you know what is linear hashing?
3.   How about chain hashing?
4.   Let us discuss about snail in a well? two classes. the well has the snail. the property is ..... the action is .
5.    iterator need hasnext and next

2014

1.    implement hashmap, 最好是generic的了。 不过好像其实无所谓吧。。,enerice也不难啦。还有就是实现的method，大概就是put, get, remove,yes。 其实就是put 和get。 好像没说remove。 考虑一下collision就行，
2.    poker game， 然后判断五张牌的组合。。
3.    ~~power set~~
4.    travel‘s men
5.   junit， 你最好还是稍微懂点， 这样不会慌。 虽然不需要写junit把。
6.   什么interface 啊， 什么volatile， thread， runnable。。 我大概记得是这些，还有static， 都问了。。 





## Kijiji

![image-20220424180149562](https://tva1.sinaimg.cn/large/e6c9d24egy1h1ln4f1seyj21770eo421.jpg)

```java
public class DocumentCounter {

    public static abstract class AbstractDocumentCounter {
        private int count = 0;
        private int increment;

        public AbstractDocumentCounter(int increment) {
            this.increment = increment;
        }

        protected int getAndIncrement() {
            this.count += this.increment;
            return this.count;
        }

        public abstract String getNewDocumentName();
    }

    public static class DocumentNameCreator extends AbstractDocumentCounter {
        private String prefix;

        public DocumentNameCreator(int increment, String prefix) {
            super(increment);
            this.prefix = prefix;
        }

        public String getNewDocumentName() {
            return prefix + getAndIncrement();
        }
    }
}
```

![image-20220424180518294](https://tva1.sinaimg.cn/large/e6c9d24egy1h1ln814t7dj219d0axn0l.jpg)



```java
class RainStorm {
    protected double eyeRadius;
    protected double eyePositionX;
    protected double eyePositionY;

    public RainStorm(double eyeRadius, double eyePositionX, double eyePositionY) {
        this.eyeRadius = eyeRadius;
        this.eyePositionX = eyePositionX;
        this.eyePositionY = eyePositionY;
    }

    public boolean isInEyeOfTheStorm(double positionX, double positionY) {
        double distance = Math.sqrt(Math.pow(positionX - eyePositionX, 2) +
                                    Math.pow(positionY - eyePositionY, 2));
        return distance < eyeRadius;
    }

    public double amountOfRain() {
        return eyeRadius * 20;
    }
    
	public double getEyeRadius() {
		return eyeRadius;
	}

	public double getEyePositionX() {
		return eyePositionX;
	}

	public double getEyePositionY() {
		return eyePositionY;
	}
}

class SnowStorm {
    
    protected double eyeRadius;
    protected double eyePositionX;
    protected double eyePositionY;
    private double amountOfSnow;

    public SnowStorm(double eyeRadius, double eyePositionX, double eyePositionY, double amountOfSnow) {
		this.eyeRadius = eyeRadius;
		this.eyePositionX = eyePositionX;
		this.eyePositionY = eyePositionY;
		this.amountOfSnow = amountOfSnow;
	}

	public double getAmountOfSnow() {
		return amountOfSnow;
	}
    
	public boolean isInEyeOfTheStorm(double positionX, double positionY) {
        double distance = Math.sqrt(Math.pow(positionX - eyePositionX, 2) +
                                    Math.pow(positionY - eyePositionY, 2));
        return distance < eyeRadius;
    }

	public double getEyeRadius() {
		return eyeRadius;
	}

	public double getEyePositionX() {
		return eyePositionX;
	}

	public double getEyePositionY() {
		return eyePositionY;
	}
}
```



# bybit

一轮

针对简历 问项目经验 技术词汇 

二轮

coding

三轮

culture fit



## 度小满——测试开发

```
作者：promising6
链接：https://www.nowcoder.com/discuss/272421?type=2&order=3&pos=22&page=1
来源：牛客网

度小满测开面经（9/21、9/22）

一面（50min）
    自我介绍？
    讲下spring？spring用到的设计模式？
    hashmap底层？
    进程、线程？
    乐观锁，悲观锁？
    mysql索引？
    mysql：order by和group by区别？
    访问一个页面的流程？
    访问一个页面响应慢，是什么原因？
    项目有用到多线程吗？项目有用到分布式吗？
    linux常用的命令？写过脚本吗？
    手撕代码：统计一个字符串每个字符出现的次数？
    讲下创新基金？创新基金的创新点在哪？
    论文是第几作？跟导师意见不一致怎么处理？
    接口测试的测试点？
    对测开的理解？
    平时怎么学习？有木有自己总结？
    有什么问题要问？
    
二面（30min）
    自我介绍？
    说下常用的黑盒测试方法？什么情况下用哪种？
    手撕代码：把字符串转为数字？根据所写的代码设计测试用例？
    数据库：事务特性？
    数据库隔离级别？
    讲下创新基金？
    手上目前有哪些offer？
    为什么要去北京？
    有什么问题要问？
    
    
三面（20min）
    自我介绍？
    实习的岗位为什么不是测试而是开发？
    讲了创新基金？如果再给你一次机会重新做实验，你会从哪些方面提高效率？
    对度小满的了解？
    有什么问题要问？
    可以实习吗？
    
总结：9/21面的一面，然后等二面等到中午吃饭时间，临时有点事，就调到第二天，二面面试官声音有点小，有的听不太清楚。三面是测试经理，小姐姐真的很有气质，讲话语速也挺快的，然后面到一半说我三面过了，问我可以去实习吗，讲了度小满的业务，办公环境，地点之类的。
```



```
作者：Dvelpro
链接：https://www.nowcoder.com/discuss/330577?type=2&order=3&pos=1&page=1
来源：牛客网

度小满
    1. 桶排序
    2. 给出一个有向图，找出环
    3. 如何用hashMap存图 //以上都手写
    4. jvm，哪些地方会发生oom，以及经常发生stop the word 如何排查，以及如何改善
    5. tcp/ip四层，每一层的协议 问到了http https dns tcp/udp 还有加密协议有哪些种类 每种有哪些
    6. java 网络编程 tcp 和udp
    7. redis 的几种数据结构，string 的底层实现有哪几种，
    8. redis rdb aof 以及 如果set key 设置的有过期时间，比如 set key 为500毫秒 aof 1s写一次，这个key会被写入到aof 里面吗（这个求解答）
    9. 进程线程的区别，进程之间的通信，线程之间的通信
```



```
作者：天上砸offer
链接：https://www.nowcoder.com/discuss/183885?type=2&order=3&pos=29&page=1
来源：牛客网

度小满

一面
    sql怎么添加一列 添加索引 （alter语句）
    快排
    写余额宝用例
    访问一个URL流程
    三次握手四次挥手及原因（双工通信
    int integer区别
    java八大基础类型
    byte short int long floate double char boolean
    方法入栈 对象入堆 为什么 jvm内存分配
    （栈针 执行程序的方法要一个连续的存储区域且先进后出 eg main方法先入栈然后最后出栈）
    测试返回数据：
    请求头（数据类型定义位置）请求行 请求体（json在请求体中）
    
二面
    （因为单例居然没写出来大减分导致后面没什么问）
    单例模式
    深度 广度优先遍历
    测试微信红包用例
```



## 百度——测试开发

```
作者：Pluto_95
https://www.nowcoder.com/discuss/239888?type=post&order=time&pos=&page=1来源：牛客网

  2、python当中迭代器和生成器的区别； 

  3、python的类中加下划线的含义； 

  4、python中用于自动关闭字符流的with open ... as ...内部是怎么实现的？ 

  5、通过概率为p的二项分布怎么生成概率为1/2的二项分布？ 

  6、两个单向链表，怎么判断他们是否相交，交点在哪里？ 
  
  7、pandas的功能 

  8、SCP握手协议
```



##美团——测试开发

```
一面：
1. 算法：写冒泡排序，问如何优化，简单讲了快排和堆排序的原理
2. 数据库：解释左连接
3. linux：怎么查看内存；怎么查看进程，ps命令一般在什么情况下使用。
4. 测试：性能测试有哪些指标，吞吐量怎么理解，实际测试时达到了多少？对结果有什么优化？对JMeter怎么理解的？使用Jmeter做过功能测试吗？回归测试的时候想过自动化吗？登录用例用selenium应该怎么实现？用python怎么读取文件？
5. 对测试的理解。对自己未来方向的规划。
6. 对测试流程怎么理解的。你的项目覆盖了哪些流程？
7. 发现的bug有遗漏吗？
8. 发现bug后怎么和开发沟通，解决问题？
9. 和开发沟通顺畅吗？会遇到什么问题？


二面：
1.知道测试开发是干嘛的吗？
2. 你做过哪一块的测试？
3. 讲一讲接口测试，http请求是怎么流转的？ip是怎么寻址的？路由算法？A类地址有多少位？
4. Git用的多吗？git和SVN有什么区别？为什么要进行add、commit、push三步？
5. linux怎么对CPU分配？
6. 测试的各种模型，瀑布模型。

三面：
1. 怎么设计测试方案和测试报告？
2. α测试和β测试有什么区别？
3. 考虑过自动化方案吗？
4. 会做性能测试吗？
5. 出于什么原因想做测试？
6. 实习主要做什么？
7. 参加过社团吗？怎样能让合作更顺畅，遇到矛盾怎么处理？在沟通过程中出现过什么问题？怎么解决的？举一个具体的例子。
8.有什么问题吗？
```

```
作者：茶月猫
链接：https://www.nowcoder.com/discuss/253972?type=post&order=time&pos=&page=1
来源：牛客网

一共经历了三轮技术面+一轮hr面，将面试题分享给牛油们。
一面

1.http的几种方法，比如get、post都是怎么用的，带了什么参数。

2.主键和外键是什么意思

3.linux操作的指令：查看内存的命令（top），查看一个文件里面的第x行到x行的内容（cat filename head-n 1000 tail -n 50啥的），压缩（tar zxvf）、打包（tar zcvf）、文件统计有多少行数据 wc -l filename

4.数据库统计有多少行数据，select count（*） from 表名 where 字段名='字段值'；数据库排序输出前top k个，用的是order by xx desc where rownum<k

5.测试相关的知识都懂哪些

6.让写了段代码，怎么自己测试。设计测试用例。

7.substr拆分字符串，要去看看spilt怎么弄的。

8.map<string,int>排序完之后，要怎么输出top3。

9.手撕代码输入一个数，判断是否为素数



10.给一个长字符串，其中单词用空格分隔，统计出现最多的3个单词和它们出现的次数



二面

1.http讲一下

2.考察测试思路：

①有个界面，有用户名、密码、提交。设计测试用例。我分了五个方面：正确/错误的用户名密码组合、特殊字符、网络状况、界面配色及易用程度、大数据高并发时怎么办。

于是就问了我，怎样测试高并发的情况，于是我不会。

②这有一个水杯，设计测试用例，怎么测试。分了几个方面：性能（杯子漏不漏水、有没有盖子密封性怎样）、质量（是否耐高温、材料有毒与否、容量）、用户体验（易用否、是否美观）。

3.一个小球从200米处落下，每次反弹下落高度的1/3的，问总共小球走了多长的距离。

4.字母统计并排序，

5. 数据库

题目：表1：id，name、age 表2：id，id_ex，score 第一题：创建两张表 第二题：求出名字为李四的同学的分数 第三题：为第二题的查询创建索引



三面

1.写题。输入一个整形数组，有正数 有负数，但是没有零。

在原数组上进行操作把负数放在数组的前面，正数放在数组的后面。（讲了好久，因为一直在让优化，时间复杂度）

2.什么是虚拟内存？

3.什么是缓存？

4.都拿到哪些offer了？

5.对于未来工作和个人发展有什么想法？
```



百度测开

```java
自我介绍、项目介绍
内存分配方式
堆区：由程序员手动分配和释放 内存泄漏是指分配的内存空间无法被系统回收也无法被继续使用
栈区：由编译器自动分配自动释放，用于存放局部变量和参数，栈区的对象先进后出
常量区：存放常量字符串，程序结束后系统释放
静态变量区：存放全局变量和静态变量，在变量在程序运行期间都存在
进程和线程（协程）
进程是具有一定独立功能的程序关于某个数据集合上的一次运行活动，线程是进程的一个实体，是cpu调度和分配的基本单位，是比进程更小的能独立运行的基本单位。协程是轻量级线程
进程是资源分配的基本单位，线程是调度的基本单位。
进程和线程的关系：
资源分配给进程，所有线程共享这个进程的所有资源
处理机分给线程，即真正在处理机上运行的是线程
线程在运行时过程中，需要协作同步。不同的进程的线程间要利用消息通信的办法实现同步
进程和线程的区别
调度：
并发性
拥有资源
系统开销
死锁、产生死锁的原因及必要条件
概念：多个线程因争夺资源而造成的僵局
条件：
资源不可剥夺
请求和保持条件：当进程因请求资源而阻塞时，对已获得的资源保持不放。
不剥夺条件：进程已获得的资源在未使用之前，不能剥夺，只能自己释放
环路等待条件 即进程集合{P0，P1，P2，···，Pn}中的P0正在等待一个P1占用的资源；P1正在等待P2占用的资源，……，Pn正在等待已被P0占用的资源。
IPC 通信方式
管道
消息队列
信号量
共享内存
排序算法
各种排序算法总结

分类
基于比较的排序算法：时间复杂度O(nlog(n))~O(n^2) 主要有 冒泡、选择、插入、归并、快排、堆排序。
非比较排序：时间复杂度O(n),计数、基数、桶排序
重点：
快排的partition
def partition(arr,left:int,right:int,pivot:int) ->int : # 
    pass
    # 返回分割点的下标
归并的merge
def merge(arr,left,right) # 
    pass
    # 返回的是合并之后的列表

判断链表有环
提高检索效率
最大子数组和
def func(nums):
    n = len(nums)
    dp = [0 for _ in range(n)]
    dp[0] = nums[0]
    for i in range(1,n):
        dp[i] = max(dp[i]+nums[i],nums[i])
    return max(dp)
数组中超过一半的数字
def func(nums):
    nums.sort()
    mid = len(nums) >> 1 # 左移动一位 代表除以2 
    res = nums[mid]
    return res

TCP和UDP tCP五层协议 TCPsyn攻击原理
数据库
基本增删查改
Linux基本命令行
查询CPU使用情况
Top命令
对测试的了解
Linux及命令
找名为”XX”的文件
find [path] -name filename # 查找文件名
find -size [+-]SIZE # 查找比SIZE大或者小的文件
名为”XX”文件，输出第一行的内容
head -n 1 filename # 查看第一行内容
tail -n 1 filename #查看最后一行内容
怎样一页一页地查看大文件的内容
cat filename.txt | more
Linux开机启动顺序
加载BIOS
读取MBR
启动Boot Loader
加载内核
初始化工作
启动开机自启动软件
进入登录状态
查看进程
ps aux : 查看系统所有的进程数据
ps -ef|grep XXXX #得到XXXX进程的pid
查看CPU使用的情况
top
gerp awk sed
awk :
sed ：
查看磁盘空间
free df
熟悉的shell命令
echo 用于字符串的输出 echo “hello world”
$(var) ： 传递参数
可以直接在shell里面运行command命令行
正则表达式:读懂正则表达式就这么简单
^:正则匹配的开始 $正则比配的结束
\d 表示数字 [1-9]
\w 表示 [A-Z][a-z]
{m,n}匹配的个数
. (.表示匹配任意字符 表示任意次数的 ？表示0次或者1次，匹配模式是非贪婪的)
设计模式
实现单例模式
线程安全的单例模式
class singleton():
    def __init__(self):
        pass
    def __new__(cls):
        if not hasattr(cls,"_instance"):
            cls._instance = super().__new__(cls)
            return cls._instance
        else:
            return cls._instance
观察者模式
数据结构
AVL树的用途，怎么删除一个节点 AVL树的特点
AVL树本质是一颗二叉搜索树 left< root < right
增删查改的时间复杂度均为log(n)
增加节点 都是先在叶子节点添加，然后通过上浮的操作，找到最终的位置
删除节点 都是通过将其字结点代替该节点，在删除子节点。
单分支情况 ： replace操作
双分支情况 ：swap操作（后续在递归为删除交换后的节点）
数据库
数据库的事务概念和使用场景
概念：逻辑上的一组操作，组成这组操作的各个单元，要么全部成功，要么全部不成功
事务的四大特性（ACID）：
原子性：事务是指不可分割的工作单位
一致性：一篇文章看懂事务的一致性 快速理解脏读、不可重复读、幻读
一致性应该理解为动词：多个参与者达成一致，达成共识。
引出事务的概念，事务单元是完成一个具体业务的最小单元。和线程安全的内容相似，必须让访问的共享资源资源互斥。
强一致性：所有的事务串行的执行。事务隔离级别中的序列化
事务的隔离级别：
可重复读：读读 是可并行的，但是会出现幻读，因为，这个级别，表示不会被看作共享资源的，所以可以insert。
读已提交：读锁被升级为写锁，当对共享资源正在读时，可以被写升级为写锁，那么读读，读写可以并行，于是出现了幻读。不可重复读等等现象。
读未提交：只加写锁，读不用申请锁(这样读操作可以读取在写的过程中的中间数据)，这样读读、读写、写读都可以并行执行，但是写写还不能执行。出现脏读，不可重复读，幻读
事务的一致性和线程安全所面临的问题一模一样，想要维持一致性，需要保证两点：共享变量和可见性、临界区代码访问的顺序性。
隔离性
持久性：事务一旦提交，它对数据库中的改变就是永久性的
InnoDB引擎
深入了解MySQL存储引擎-------InnoDB
InnoDB存储引擎
InnoDB是事务型数据库的首选引擎，支持事务安全表（ACID）
InnoDB是mySQL默认的存储引擎，默认的隔离级别是RR，并且在RR的隔离级别下更近一步，通过多版本并发控制（MVCC）解决不可重复读问题，加上间隙锁（也就是并发控制）解决幻读问题。因此InnoDB的RR隔离级别其实实现了串行化级别的效果，而保留了比较好的并发性能。
InnoDB支持行级锁。行级锁可以最大程度的支持并发，行级锁是由存储引擎层实现的。
InnoDB是为处理巨大数据量的最大性能设计。它的CPU效率可能是任何基于磁盘的关系型数据库引擎所不能匹敌的
InnoDB引擎的底层实现

InnoDB引擎采用B+Tree结构来作为索引结构
通常在B+Tree上有两个头指针，一个指向根节点，另一个指向关键字最小的叶子节点，而且所有叶子节点（即数据节点）之间是一种链式环结构。
B+Tree:B+Tree是在B-Tree基础上的一种优化，使其更适合实现外存储索引结构，B-Tree中每个节点中有key，也有data，而每一页的存储空间是有限的，如果data数据较大时将会导致每个节点（即一个页）能存储的key的数量很小。当存储的数据量很大时同样会导致B-Tree的深度较大，增大查询时的磁盘I/O次数，进而影响查询效率。
索引

数据库查询 数据库中select 查询详解
查询所有数据
查询指定字段
消除重复数据 distinct
带条件查询 where 字句 where
比较运算符 = > < >=
逻辑运算符 and or not
模糊查询 like % _
范围查询 between and
空判断 is null / is not null
查询结果排序 order by
单字段
多字段
分页查询 limit startcount*
聚合函数
sum
avg
max
min
count
分组 group by desc
建库、建表、插入元素。
creat DATABASE 'db_test' 建库
use 'db_test' 选择数据库
creat TABLE 'student' 创建学生表
drop TABLE 'student' 删除表
Python数据库连接
import pymysql
conn = pymysql.connect(
    host="localhost",
    port="3306",
    user="root",
    password="",
    database="test",
    charset="utf8" # 中间没有-    
)
cursor = conn.cursor()

sql = """
select * from student;
""" 
# 查询

sql = """
insert into student(name,age) values(%s,%s);
"""
#插入

res = cursor.execute(sql)
cursor.close()
conn.close()
计算机网络
输入www.baidu.com发生了什么
浏览器对用户输入的网址做初步的格式化检查，补齐为https://或者HTTP
通过DNS将域名转换为ip地址：DNS 是个老实孩子，嫩自己查询的绝不会麻烦别人，这个机制感觉在局部变量，ARP中的查询都是类似的。（注意的是DNS使用的协议是UDP）
DNS 先查询缓存，在查询本地的host文件，再通过DNS ip地址查询（例如 电信 114.114.114.114 谷歌的 8.8.8.8）
Python之变量的作用域：LEGB 局部作用域local>嵌套作用域enclosing>全局作用域global>内置作用域build
ARP先查询arp 高速缓存表
浏览器与该服务器建立TCP连接（默认80端口），浏览器向WEB服务器发送一个HTTP请求
服务器处理请求，返回一个HTTP响应
浏览器显示HTML
阻塞非阻塞与同步异步的区别是什么?
POST和GET方法区别
DNS
TCP和UDP
三次握手和四次挥手（每个过程中都会携带seq的信息）
三次握手
TCP把把连接作为最基本的对象，每一条TCP连接都有两个端点，这种端点称之为套接字（socket）。定义为端口号拼接到IP地址即构成套接字，例如 192.168.0.1：80
主要关注几个标志为 SYN ACK seq 客户端和服务器端都会有这几个标志位。
首先两者都是closed的状态客户端是主动打开 服务器端是被动打开，都会建立一个TCB（Tcp 控制块）
客户端向服务器端发送连接请求，主要SYN标志为设置为1 seq = x 。TCP客户端此时进入SYN-SENT的状态。SYN报文段不携带数据 但是消耗掉一个序号
服务器端接收到连接请求，如果同意连接，则发出确认报文 确认报文中ACK = 1 SYN = 1 seq = y ack = x+1 (通过这个小写的ack进行对报文接收成功的确认，因为两边都会有一个ack的预期值，如果不一致，则会重新发送)。此时服务器端进入SYN-RCVD(同步收到)的状态。这个报文不能携带数据，但是要消耗一个序号
当客户端进程收到确认后，，还要想服务器给出确认。ACK = 1 seq = x+1 ack = y+1. 客户端进入ESTABLISHED 状态。当服务器收到客户端的确认后也进入ESTABLISHED状态。
四次挥手 （客户端的 seq第一次是u后，之后都是u+1）
客户端主动关闭，服务器被动关闭
客户端发出连接释放报文，并停止发送数据。释放数据报文首部 FIN =1 其序列号为seq = u,此时客户端进入FIN-WAIT-1 状态。
服务器收到连接释放的报文，发出确认报文。ACK = 1 ack = u+1 并且带上自己的序列号seq = v。 服务端进入CLOSE-WAIT 状态。此时进入了半关闭状态 客户端不能像服务器发送数据，但是能够接受服务器端发送的数据了
可端端收到服务器的确认请求后，客户端进入FIN_WAIT-2状态，等待服务器发送释放连接请求。
服务器端发送完一些数据之后，先客户端发送连接释放报文，FIN = 1 ack = u+1 ACK =1 .此时服务器端进入LAST-ACK（最后确认状态）。
客户端接收到服务器的连接释放报文后，必须发出确认，ACK = 1 ack = w+1。 客户端进入LIME-WAIT状态，此时TCP连接还没有释放，必须经过2*MSL（最大报文段寿命）的时间后。进入CLOSED的状态。
服务器收到客户端发出的确认后，立即进入CLOSED 的状态。（可以看出服务器端结束TCP连接的时间比客户端早一些）
socket编程实现过程
网络进程之间的通信。socket抽象层是在传输层和应用层之间（典型的例子可以从FQ的故事讲起。shadowsock和VPN的区别）。socket是在tcp/ip上编程的。大致过程如下
服务器端：
创建socket socket()
绑定socket和端口号 bind()
监听该端口号 listen()
接收来自客户端的连接请求 accept()

HTTP返回码

FTP端口号
HTTP和HTTPS的区别
场景题
餐馆推荐
进程和线程
进程通信方式
进程个线程的区别
多线程如何保证数据同步？
进程死锁的概念
进程调度的方法
进程的状态，进程的相互转换
编程题
排序问题
输入一个字符串类型的数字，有可能有正负号，或者0X开头的16进制，将其转换为int类型
链表反转
def reverseLinkedlist(head)：
  if not head:
    return None
  pre = None
  cur = head
  while(cur):
    _next = cur.next 
    cur.next = pre
    pre = cur
    cur = _next
  return pre
字符串匹配

单链表找环入口
def searchLoop(head):
  fast,slow=head.next.next,head.next
  while(fast == slow and fast is not NOne):
    fast = fast.next.next
    slow = slow.next
  meeting = fast
  cur = meeting.next
  k= 0
  while(cur != meeting):
    k += 1
    cur = cur.next
  length = k
  first,second = head,head
  while(k != 0):
    first = first.next
  while(first != second):
    first = first.next
    second = second.next
  res = second
  return res



n*n的正方形网格找长方形的个数
10进制转K进制
字符串反转
def reverse_arr(arr):
  l = len(arr)
  mid = l//2
  for i in range(0, mid):
    arr[i] = arr[-(i+1)]
  return arr

二分查找
def binary_search(arr,target):
  l, r = 0,len(arr)-1
  while(l<r>):
    mid = (l+r)//2
    if arr[mid]== target:
      return mid
    elif arr[mid] < target:
      l = mid + 1
    else：
      r = mid-1
  return None

def binary_search_recur(arr,target,l,r):
  if l>r:
    return -1
  mid = (l+r)//2
  if arr[mid]>target:
    return binary_search_recur(arr,target,l,mid -1)
  elif arr[mid]<target:
    return binary_search_recur(arr,target,mid +1,r)
  else:
    return mid
两个栈实现一个队列 剑指offer
class MyQueue(object):

    def __init__(self):
        """
        Initialize your data structure here.
        """
        self.stack1 = []
        self.stack2 = []

    def push(self, x):
        """
        Push element x to the back of queue.
        :type x: int
        :rtype: void
        """
        self.stack1.append(x)

    def pop(self):
        """
        Removes the element from in front of queue and returns that element.
        :rtype: int
        """
        if len(self.stack2) == 0:
            self.stack2 = self.stack1[::-1]
            self.stack1 = []
            return self.stack2.pop()
        else:
            return self.stack2.pop()

    def peek(self):
        """
        Get the front element.
        :rtype: int
        """
        if len(self.stack2) == 0:

            return self.stack1[0]
        else:
            return self.stack2[-1]      

    def empty(self):
        """
        Returns whether the queue is empty.
        :rtype: bool
        """
        if self.stack1 or self.stack2:
            return False
        else:
            return True



# Your MyQueue object will be instantiated and called as such:
# obj = MyQueue()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.peek()
# param_4 = obj.empty()

回字形依次输出一个矩阵中的数(顺时针打印矩阵)
class Solution(object):
    def printMatrix(self, matrix):
        """
        :type matrix: List[List[int]]
        :rtype: List[int]
        """

        res = []

        while(matrix):
            res.extend(matrix[0])
            matrix = list(zip(*matrix[1:])) # 转置的操作 如果可以使用numpy，就可以直接.T就行了。
            print(matrix)
            matrix = matrix[::-1]

        return res

给定一个有序数组，找出连续子串和为M的一个子串 和为S的连续正数序列
def func(target):
  res = []
  left, right = 1,2
  mid = (target + 1) // 2
  while(right<= mid and left < right):
    tem = (left + right)*(right - left + 1) // 2
    if tem == target:
      right += 1
      res.append([x for x in range(left,right)])
    elif tem < target:
      right += 1
    else:
      left += 1
    return res
输入一行字符 分别统计中英文字母，空格，数字和其他字符个数
一个数组有n个元素，其中1<=a[i]<=n请找出[1,n]出现的元素
树的遍历（递归，非递归）
判断链表是否有环
微信发红包
字符串回文判断
字符串括号匹配
链表删除相同的节点
两个字符串的最长字符串
数组的最大子序列和
def maxSubArray(nums):
  n = len(nums)
  dp = [0 for _ in range(n)]
  dp[0] = nums[0]
  for i in range(1,n):
    dp[i] = max(dp[i-1]+nums[i],nums[i])
  return max(dp)



连续子数组最大和
# 使用动态规划
def maxSubArray(nums):
  pass
交换两个数字，不使用新的变量

数组第K小
有N个硬币，分别是一分，两分，五分的，加起来一起M元，写出所有硬币组合
快排
快速查找相同的字符串
给定一个字符串，包括字符串和空格，反转其中的字符串
链表中找出倒数的第K个节点
跳台阶问题
字符串中每个字符出现的次数
合并两个有序的数组
给一个数组，快拍一次后数组的情况
数组全排列
求m*n矩阵的逆转90度的矩阵
求3的n次方
一个数组的元素都可以乘以任意个2，可不可以调成都一样
海量数据
10个1G的文件，找出出现次数的前10单词
给定一个文件，可能非常大，100G左右，如何统计其中重复的行，输出哪些行重复和重复次数
智力题
两个桶 一个 5L一个6L,怎么量3L的水
四棵树，怎么两两相等
三等分一张纸
给你一个数n,求出所有和等于n的可能
有一个人流落荒岛，四天后才有人来救他，他有4个A药片和4个B药片，每天吃一个A一个B才能存活下来，但是A,B在外观上五法区分，问如何存活下来？
测试相关
对测试的了解，为什么想要从事测开这个职位
登录界面的测试
搜索框测试
selenium测页面的时候具体怎么实现
电梯怎么测
白盒测试有哪些方法
软件开发流程
软件测试方法
bug的生存周期

作者：WxZhu
链接：https://www.acwing.com/blog/content/646/
来源：AcWing
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
```

