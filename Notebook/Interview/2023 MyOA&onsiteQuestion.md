# 



Sep 5

Guidwire

minLen , maxLen, minAlpha, maxAlpha, minUpper, maxUpper, minLower, maxLower,

prepare

domain knowlegdge, backend frontend ,system desgin, background



Tiktok

First round(easy)

https://leetcode.com/problems/valid-parentheses/

Bybit



```java
/**
	
 bybit
 
 indexOf(int[] a, int[] b)
 indexOf({1,3,2,4,6}, {2, 4}) = 2

 indexOf({1,3,2,4}, {3,4}) = -1

* */
public class Main {

    public static void main(String[] args) {

//        int[] a = new int[]{1,3,2,4,6}; // 2 done
//        int[] b = new int[]{2,4};

//        int[] a = new int[]{1,3,2,4}; // -1 done
//        int[] b = new int[]{3,4};

//        int[] a = new int[]{1,3,2,4,6,2,4}; // 2 done
//        int[] b = new int[]{2,4};

//        int[] a = new int[]{1}; // -1 done
//        int[] b = new int[]{2,4};
//
//        int[] a = new int[]{2,4}; // 0 done
//        int[] b = new int[]{2,4};

//        int[] a = new int[]{2,4}; // -1 done
//        int[] b = new int[]{2,3};

//        int[] a = new int[]{2,4,1,1,1,1}; // 2 done
//        int[] b = new int[]{1};

//        int[] a = new int[]{1,3,3,4}; // 2 done
//        int[] b = new int[]{3,4};
//        int[] a = new int[]{1,3,2,4,3,4,4}; // 0
//        int[] b = new int[]{1,3};

        // b find later
//        int[] a = new int[]{1,3,2,4,3,4,4}; // 4 done
//        int[] b = new int[]{3,4};

        // b empty
//        int[] a = new int[]{1,3,2,4,3,4,4}; // -1 done
//        int[] b = new int[]{};

        // a empty
//        int[] a = new int[]{}; // -1 done
//        int[] b = new int[]{1,2,3};

        // b only 1 find
//        int[] a = new int[]{1,3,2,4,3,4,4}; // 1
//        int[] b = new int[]{3};

        // b only 1 not find
        int[] a = new int[]{1,3,2,4,3,4,4}; // -1
        int[] b = new int[]{5};

        System.out.println(indexOf(a, b));
    }

    static int indexOf(int[] a, int[] b){

        int n = a.length;
        int m = b.length;
        if(m == 0) return -1;
        int i = 0;
        while (i < n){
            int st = i;
            if(a[i] == b[0]){
                int j = 0;
                int cnt = 0;
                while(i < n && j < m){
//                    System.out.println(i + " " + j + " " + cnt);
                    if(a[i] == b[j]){
                        i++;
                        j++;
                        cnt++;
//                        System.out.println(" -> " + i + " " + j + " " + cnt);
                    }else break;
                }
//                System.out.println(i + " " + j + " " + cnt);
                if(cnt == m) return st;
            }else{
                i = st;
                i++;
            }
        }
        return -1;
    }
}
```





Huawei Java with Typescript 

Date: 0407

1. A canvas of your project
2. Map map = new HashMap<>(); it's inherientance, not polynorithm
3. javascript
4. socket

























## 百度

2019-11-03

（一面+二面）

1. 斐波那契数列的代码实现
2. 字符转换成数字的异常捕获
3. 进程和线程之间如何通信
4. SQL题目：从一个表中找不在另一个表中的内容



## 华瑞泰 

2019-11-04

（一面）

1. echo pwd
2. Linux 重定向命令
3. 设计模式之间的优缺点 
4. 网络 class C 有多少个ip可以选择
5. 邻接表的空间复杂度
6. 正则表达式获取一个ip地址
7. SYN的含义
8. 如何设计一个秒杀软件
9. python 中的with语句



## 鲸算科技

1. 最大子序列、最长子序列
2. 染色问题



## 美团

1. 贝叶斯公式

   $P(A|B)=\frac{P(B|A)P(A)}{P(B)}$



2. get() post() 方法



3. 精确率和召回率

精确率：$Pre=\frac{TP}{TP+FP}$

精确率：$Pre=\frac{TP}{TP+FN}$

 FP和FN都是正的的样本，一个是错误的预测为正，一个是本来是正，错误的预测为负



4. 接口和抽象类的区别



**revert && reset ** 

-   --mixed(默认)：默认的时候，只有暂存区变化
-   --hard参数：如果使用 --hard 参数，那么工作区也会变化
-   --soft：如果使用 --soft 参数，那么暂存区和工作区都不会变化
-   git revert是用一次逆向的commit“中和”之前的提交，因此日后合并老的branch时，之前提交合并的代码仍然存在，导致不能够重新合并
-   但是git reset是之间把某些commit在某个branch上删除，因而和老的branch再次merge时，这些被回滚的commit应该还会被引入



**merge&&merge--squash&&rebase**

1.   merge

      ![image-20220331193929731](https://tva1.sinaimg.cn/large/e6c9d24egy1h0tz2ulwfxj20du07zweq.jpg)

2.   merge--squash

     ![image-20220331193941812](https://tva1.sinaimg.cn/large/e6c9d24egy1h0tz2w4tnyj20gt0803z0.jpg)

3.   rebase

     ![image-20220331194005063](https://tva1.sinaimg.cn/large/e6c9d24egy1h0tz3922r1j20f409x3z3.jpg)



![image-20220331185143063](https://tva1.sinaimg.cn/large/e6c9d24egy1h0txowrn9nj20r1089t94.jpg)



<img src="https://tva1.sinaimg.cn/large/e6c9d24egy1h0txrvj8nmj20dt04jmxa.jpg" alt="image-20220331185433549" style="zoom:80%;" />

then master add m3

<img src="https://tva1.sinaimg.cn/large/e6c9d24egy1h0txwfhr66j20r00ew0to.jpg" alt="image-20220331185856777" style="zoom:33%;" />

feature add f1 and f2

<img src="https://tva1.sinaimg.cn/large/e6c9d24egy1h0txx739ysj20qk0icdh0.jpg" alt="image-20220331185940913" style="zoom: 33%;" />

then merge feature to master, feature doen't change and master become

<img src="https://tva1.sinaimg.cn/large/e6c9d24egy1h0ty14rzyxj20qw0qyac2.jpg" alt="image-20220331190327514" style="zoom: 33%;" />







