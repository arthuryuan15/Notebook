# 2 线性DP

## [898. 数字三角形](https://www.acwing.com/problem/content/900/)

状态表示：f[i,j]
集合：所有从起点到(i,j)的路径 属性：Max 集合的划分：来自左上，来自右上

`f[i][j] = max(f[i - 1][j] + w[i][j], f[i][j - 1] + w[i][j])`

**注意的地方:** 线性dp的边界问题可以用把边界外的dp置为INF处理（求最大取负无穷）

```java
import java.util.*;

public class MainA {

    static int N = 510;
    static int[][] v = new int[N][N];
    static int[][] dp = new int[N][N];

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= i; j++) {
                v[i][j] = sc.nextInt();
            }
        }

        for (int i = 0; i <= n; i++) {
            for (int j = 0; j <= i + 1; j++) {
                dp[i][j] = Integer.MIN_VALUE; // 为了处理边界问题，把所有dp置为负无穷
            }
        }

        dp[1][1] = v[1][1]; // 起点只有一个数，所以和是一个数
        for (int i = 2; i <= n; i++) {
            for (int j = 1; j <= i; j++) {
                dp[i][j] = Math.max(dp[i - 1][j - 1], dp[i - 1][j]) + v[i][j];
            }
        }

        int res = Integer.MIN_VALUE;
        for (int k = 1; k <= n; k++) {
            res = Math.max(res, dp[n][k]);
        }
        System.out.println(res);
    }
}
```

## [895. 最长上升子序列](https://www.acwing.com/problem/content/897/)

时间复杂度O(n^2)

LIS

状态的维度的原则： 答案能够表示出来，且能推出来，维数越少越好 状态表示f[i]
集合: 所有以第i个数结尾的上升子序列的集合 属性：最大值 集合的划分：按子序列的第i-1个数是哪个数进行作为划分
`f[i] = min(f[i], f[j] + 1); // j : 0 -> i-1 （从j没有一个，到i-1个`
因为要满足上升的序列 比较的前提是 `a[j] < a[i]`

```java
import java.util.*;

public class MainA {

    static int N = 1010;
    static int n;
    static int[] a = new int[N];
    static int[] dp = new int[N];

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        n = sc.nextInt();
        for (int i = 1; i <= n; i++) a[i] = sc.nextInt();

        Arrays.fill(dp, 1); // 初始化所有初始dp为1，因为每个数的最长上升子序列就是自己为1

        for (int i = 1; i <= n; i++) {
            for (int j = 1; j < i; j++) {
                if (a[j] < a[i]) {
                    dp[i] = Math.max(dp[i], dp[j] + 1);
                }
            }
        }

        int res = 0; //通过遍历f数组，来求最大值
        for (int i = 1; i <= n; i++) res = Math.max(res, dp[i]);
        System.out.println(res);
    }

}
```

## [896. 最长上升子序列 II](https://www.acwing.com/problem/content/898/)

时间复杂度O(nlogn)

优化：记一下状态转移过程

直接看步骤：如果可以过一段时间可以直接看懂，其他的地方可以删减 （2021-11-03)

**引入**

a[] = 3 1 2 1 8 5 6

先看长度是1的上升子序列，从3开始，3后面的数如果可以接到3的后面，那么一定可以接到1(idx=1)的后面，比如8可以接到3的后面，也可以接到1的后面, 那么3就没有必要存下来，因为1比3适用的值域更大。

【关键】那么3就没有必要存下来，因为1比3适用的值域更大。

**=> 每个长度选择最小的数为结尾，可以使得后面接在后面的上升子序列可能性更大。=> 这个最长长度就是返回值**

**归纳**

* 以此类推，如果当前求到了第i个数，那么前面的所有上升子序列可以按照长度进行分类。
* 长度为1的只存一个结尾最小的，长度为2的只存一个结尾最小的，长度为3的只存一个结尾最小 ... 因为结尾大的肯定不如结尾小的好。
* 反证法：因为如果可以接到一个结尾大的上升子序列后面的话，一定可以接到结尾小的上升子序列的后面，而结尾小的适用范围更广。
* 按照上述要求存的话，会得到一个结尾元素的值随着长度增加而上升（严格递增）

**=> 如何构造在len下的最小结尾数构成的数组: 枚举到ai时，从q[0 ~ len]中求出一个刚好小于ai的最大值的q[r] **

**关键问题**

1. 枚举到了长度为i，如何求以ai结尾的长度怎么求呢？

​        **假设求ai结尾的最长子序列的长度，如果要使长度最长，把ai接到一个最大的少于ai的数后面。**

* 可以把ai接到最大的小于ai的后面去，也就在新存的数组q中找一个最大的小于ai的数qr
* 然后，就找到了比qr长度大1的结尾最小值(因为qr后面就ai，中间没有任何数) q[r+1] = ai;

**算法步骤**

遍历a数组

1. 在数组q中找到比ai小且在数组q中最大的数 -> 二分

2. 看下是否找到的位置 r 是否是q的最后一个数 （找到的数一定在q的范围内，因为q的第一个数是Integer.MIN_VALUE）

​        (1) 如果是，ai加到q后面，数组q的长度加1

​        (2) 如果不是，ai更新r后面的一个数 ( 因为q[r]后面就ai，中间没有任何数）

 （反证法：如果q[r]原来后面的数比ai小，那就应该找到的小于ai最大的数是r+1的位置，而不是r的位置，矛盾了）

```java
import java.util.*;

public class MainA {
    /**
     *
     *                         原数组：3 1 2 1 8 5 6
     长度为1的上升子序列结尾的最小值  q[1]: 1
     长度为2的上升子序列结尾的最小值  q[1]: 2
     长度为3的上升子序列结尾的最小值  q[1]: 5
     长度为4的上升子序列结尾的最小值  q[1]: 6
     */

    static int N = 100010;
    static int[] a = new int[N]; // 存储每一个数
    static int[] q = new int[N]; // 所有不同长度的上升子序列结尾的最小值

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();

        for (int i = 1; i <= n; i++) a[i] = sc.nextInt();

        int len = 0; // 当前的最大长度, q 里面的元素个数，一开始一个也没有
        q[0] = Integer.MIN_VALUE;

        // 遍历a数组
        for (int i = 1; i <= n; i++) {

            // 二分出来q中小于ai的最大的数
            int l = 0;
            int r = len;
            while (l < r) {
                int mid = l + r + 1 >> 1;
                if (q[mid] < a[i]) l = mid;
                else r = mid - 1;
            }

            // 如果找到的ai的的下一个长度没有超过，直接更新
            if (l + 1 <= len) {
                q[l + 1] = a[i];
            } else { // 如果r + 1 超长了，len需要更新到r+1这么长
                len = l + 1;
                q[len] = a[i];
            }

        }
        System.out.println(len);
    }
}
```

## [897. 最长公共子序列](https://www.acwing.com/problem/content/899/)

LCS

DP:

1. 状态表示`f[i][j]`

 集合：**所有 A[1~i] 与 D[1~j] 公共子序列的集合**

 属性：MAX

2. 划分：找最后一个不同点进行划分，第一个字符串的最后一个A[i]包不包括在这个子序列中，以及B[j]是否包含在这个子序列中划分
    * 00:  `A[i]`和`D[j]`都不包含着子序列中 `f[i-1][j-1]`
    * 01:  `A[i]`一定不选，`D[j]`一定选， 但是`f[i-1][j]`表示的是A[i]一定不选，但是B[j]可能选，也可能不选，但是求最大值可以重复，但不漏
    * 10:  `A[i]`一定选，`D[j]`不选 -> `f[i][j - 1]`
    * 11:  `A[i]` `D[j]`都选 `1~i-1`和`1~j-1`的固定的，表示所有`A[1~i-1]`与`D[1~j-1]`公共子序列的集合，为`f[i-1][j-1]`
        * 不确定是A和B序列的最后一个数，如果 `a[i] == b[j]` 长度可以+1

```java
import java.util.*;

public class MainA {
    /**
     * 给定两个长度分别为 N 和 M 的字符串 A 和 D，求既是 A 的子序列又是 D 的子序列的字符串长度最长是多少。
     * [a] c [b][d]   
     * [a][b] e [d] c => 最长公共子序列是 3
     */

    static int N = 1010;
    static int[][] dp = new int[N][N];

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int m = sc.nextInt();

        sc.nextLine();

        String a = sc.nextLine();
        String b = sc.nextLine();

        dp[0][0] = 0;

        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                dp[i][j] = Math.max(dp[i - 1][j], dp[i][j - 1]);
                if (a.charAt(i - 1) == b.charAt(j - 1)) {
                    dp[i][j] = Math.max(dp[i][j], dp[i - 1][j - 1] + 1);
                }
            }
        }
        System.out.println(dp[n][m]);
    }
}
```

## [902. 最短编辑距离](https://www.acwing.com/problem/content/904/)

1. 状态表示`f[i][j]`

2. 集合：**所有将`a[1~i]`变成`b[1~j]`的操作方式**

3. 状态计算：（**划分一般考虑最后一步**）对a目前枚举到的字符ai 的操作
    * 删除 最后一步a删掉第i个数，`a[1~i-1]`和`b[1~j]`匹配 `f[i-1][j] + 1`
    * 增加 a增加第一个数之后和b匹配了，说明操作之前`a[1~i]`和`b[1~j-1]`匹配 `f[i][j-1] + 1`
    * 修改 `f[i-1][j-1] + 1/0` （如果a[i]和b[j]不相等 需要操作修改+ 1, 相等不需操作 + 0)

4. 注意初始化

```java
import java.util.*;

public class MainA {

    /**
     * 给定两个字符串 A 和 D，现在要将 A 经过若干操作变为 D，可进行的操作有：
     * 删除–将字符串 A 中的某个字符删除。
     * 插入–在字符串 A 的某个位置插入某个字符。
     * 替换–将字符串 A 中的某个字符替换为另一个字符。
     * 现在请你求出，将 A 变为 D 至少需要进行多少次操作。
     */

    static int N = 1010;
    static int n, m;
    static String a, b;
    static int[][] dp = new int[N][N];

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        n = sc.nextInt();
        sc.nextLine();
        a = sc.nextLine();
        m = sc.nextInt();
        sc.nextLine();
        b = sc.nextLine();

        // 删除操作 a[1 ~ i]分别变成b(空)的操作次数 初始化
        for (int i = 0; i <= n; i++) dp[i][0] = i;
        // 添加操作 a(空)分别变成b[1 ~ j]的操作次数 初始化
        for (int j = 0; j <= m; j++) dp[0][j] = j;

        // 当状态转移方程中有i-1时，为了避免数组越界，从i = 1开始计算
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                // 处理删除和插入操作
                dp[i][j] = Math.min(dp[i - 1][j] + 1, dp[i][j - 1] + 1);
                // 处理替换操作
                if (a.charAt(i - 1) != b.charAt(j - 1)) dp[i][j] = Math.min(dp[i][j], dp[i - 1][j - 1] + 1);
                else dp[i][j] = Math.min(dp[i][j], dp[i - 1][j - 1]);
            }
        }

        System.out.println(dp[n][m]);
    }
}
```

## [899. 编辑距离](https://www.acwing.com/problem/content/901/)

```java
/**
 * 解法和 902 一样
 */

import java.util.*;

public class MainA {

    static int N = 15;
    static int M = 1010;
    static int n, m;
    static String[] strs = new String[M];
    static int[][] dp = new int[M][N];

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        n = sc.nextInt();
        m = sc.nextInt();
        for (int i = 1; i <= n; i++) strs[i] = sc.next();

        // m次询问
        while (m-- > 0) {
            String s = sc.next(); // 每次询问给出一个字符串
            int limit = sc.nextInt(); // 上限操作次数

            int res = 0;
            for (int i = 1; i <= n; i++) // 给定的 n 个字符串，进行比较
                if (editDistance(strs[i], s) <= limit) res++;

            System.out.println(res);
        }
    }

    // 最短编辑距离
    static int editDistance(String a, String b) {

        int la = a.length(); // a的长度
        int lb = b.length(); // b的长度

        for (int i = 0; i <= lb; i++) dp[0][i] = i;
        for (int i = 0; i <= la; i++) dp[i][0] = i;

        for (int i = 1; i <= la; i++) {
            for (int j = 1; j <= lb; j++) {
                dp[i][j] = Math.min(dp[i - 1][j] + 1, dp[i][j - 1] + 1);
                dp[i][j] = Math.min(dp[i][j], dp[i - 1][j - 1] + (a.charAt(i - 1) != b.charAt(j - 1) ? 1 : 0));
            }
        }

        return dp[la][lb];
    }
}
```

# 3 区间DP

在定义状态的时候**定义了一个区间**。

## [282. 石子合并](https://www.acwing.com/problem/content/284/)

只能合并相邻的两堆，如果没有这个限制，就是贪心问题。

集合表示: `dp[i][j]` 所有将`[i, j]`这一段合并到一堆的方案的集合

状态计算：可以 以区间左边和右边的分界点`k`作为划分依据。

​                   `[i,k]`和`[k + 1, j]`作为这个`[i,j]`区间最后一步合并的分界点。

这个集合可以表示` (j - i)!` 个方案，使用dp大大减小时间复杂度。

此外：

枚举所有的区间套路：`len = i - j + 1`

`for len: 2 ~ n`

​    `for i = 1; i + len - 1 <= n; i++`

​            `j = i + len - 1 =>[i, j] `

```java
import java.util.*;

public class MainA {

    static int N = 310;
    static int INF = 0x3f3f3f3f;
    static int[] s = new int[N];
    static int[][] dp = new int[N][N];

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        for (int i = 1; i <= n; i++) { // 从1开始方便取前缀和
            s[i] = sc.nextInt();
            s[i] += s[i - 1]; // 同时计算前缀和，快速计算代价
        }

        // 枚举区间套路：1 先枚举区间长度
        for (int len = 2; len <= n; len++) {
            // 枚举区间套路：2 再枚举区间左端点
            for (int i = 1; i + len - 1 <= n; i++) {
                int j = i + len - 1; // 右端点
                dp[i][j] = INF; // 求出区间[i, j]内的最小代价，初始为最大的代价
                for (int k = i; k < j; k++) { // 区间[i, j]内合并的分界点
                    dp[i][j] = Math.min(dp[i][j], dp[i][k] + dp[k + 1][j] + s[j] - s[i - 1]);
                }
            }
        }

        // 将枚举第1堆和第n堆合并的最小代价
        System.out.println(dp[1][n]);
    }
}
```

# 4 计数类DP

## [900. 整数划分](https://www.acwing.com/problem/content/902/)

整数划分 以5为例, 共以下7种

```
5 = 5
  = 4 + 1
  = 3 + 2
  = 2 + 2 + 1
  = 2 + 1 + 1 + 1
  = 3 + 1 + 1
  = 1 + 1 + 1 + 1 + 1
```

规定从小到大枚举，可以看成背包问题，**整数n是容量`j`**，n个物品`i`的体积是 1，2，3，..., n 无限拿

=> 完全背包问题

```java
import java.util.*;

public class MainA {
    /**
     * 一个正整数n可以表示成若干个正整数之和，形如：n=n1 + n2 + ... + nk 我们将这样的一种表示称为正整数 n 的一种划分。
     * 现在给定一个正整数 n，请你求出 n 共有多少种不同的划分方法。
     */
    static int N = 1010;
    static int mod = (int) (1e9 + 7);
    static int n;
    static int[][] dp = new int[N][N];

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        n = sc.nextInt();

        dp[0][0] = 1;

        // 类比完全背包问题： 遍历是考虑最后一个物品i选择几个，i是最后一个物品
        for (int i = 1; i <= n; i++) {
            for (int j = 0; j <= n; j++) { // 类比完全背包问题：体积为j
                for (int k = 0; k * i <= j; k++) { // 类比完全背包问题：每件物品选几个
                    dp[i][j] += dp[i - 1][j - k * i];
                    dp[i][j] %= mod; // 题目要求：由于答案可能很大，输出结果请对 1e9+7 取模
                }
            }
        }
        System.out.println(dp[n][n]);
    }
}
```

# 5 数位统计DP

## [338. 计数问题](https://www.acwing.com/problem/content/340/)

先数位DP笔记（DFS）

```java
import java.util.*;

public class MainA {

    static int N = 12;
    static int cnt;
    static int[][] dp = new int[N][N];
    static int[] a = new int[N];

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        while (true) {
            int l = sc.nextInt();
            int r = sc.nextInt();
            if (l == 0 && r == 0) break;
            if (l > r) { // 如果l大于r，需要交换
                int temp = l;
                l = r;
                r = temp;
            }

            for (int i = 0; i <= 9; i++) {
                System.out.print(cal(r, i) - cal(l - 1, i) + " ");
            }
            System.out.println();
        }
    }

    static int cal(int x, int k) {

        for (int i = 0; i < N; i++) Arrays.fill(dp[i], -1);
        cnt = 0;
        while (x > 0) {
            a[cnt++] = x % 10;
            x = x / 10;
        }
        return dfs(cnt - 1, 0, k, true, true);
    }

    // sum 是单看某一个k在所有位上的出现次数之和
    static int dfs(int p, int sum, int k, boolean lead, boolean limit) {
        //lead为true说明有前导0 
        if (p < 0) {
            return sum;
        }
        // 非约束条件下，没有前导0，返回记忆化搜索结果
        if (!limit && !lead && dp[p][sum] != -1) return dp[p][sum];

        int res = 0;
        int up = limit ? a[p] : 9;

        for (int i = 0; i <= up; i++) {

            int temp = sum;
            if (k == i) { // 如果当前枚举的值是目标值，那么才考虑统计
                if (k == 0) {  // 如果0，需要判断是不是前导0，如果是不能加 01不行
                    sum += (!lead) ? 1 : 0;
                } else { // 如果当前这个num不是0, 直接加当前数就行
                    sum += 1; // 如果不用t的话，sum++，相当于没有回溯，需要单独写
                }
            }

            // 当前状态是前导0而且当前位上的数也是0，说明当前还是前导0的状态
            res += dfs(p - 1, sum, k, lead && i == 0, limit && i == a[p]);

            sum = temp; // 恢复现场
        }

        if (!lead && !limit) dp[p][sum] = res;

        return res;
    }

}
```

# 6 状态压缩DP

题意：

![image-20211231230720506](/Users/yuanjinshuai/Library/Application Support/typora-user-images/image-20211231230720506.png)

分析：

先放横着的，再放竖着的。（横着的先摆完的话，竖着的就剩一种方案了，塞进去就行了）

所以可以只统计只放横着的小方块的话，合法的放法有多少种

如何判断当前方案是否合法？

> 原则：所有剩余的位置，能够填充满竖着的小方块。
>
>   可以按列来看，每一列内部所有连续的空着的小方块，需要是偶数个。

![image-20211231231152666](/Users/yuanjinshuai/Library/Application Support/typora-user-images/image-20211231231152666.png)

动态规划 （化零为整的过程） 状态表示：$f[i,j]$ 表示已经前$i-1$列摆好，且从第$i-1$列伸出到第i列的状态是$j$的所有方案。

（化整为零的过程） 状态计算：

1. 枚举第$i-1$列和第$i$列，哪些行是放着横着的小方格。

2. 依据最后一步的操作来分割 => 第$i-2$列伸到第$i-1$列的状态来分割

3. 如何求每个子集里的方案数？ 满足两个条件：

   记录k是第i-1行伸到第i行的状态，j是第i行的状态，二者不能有冲突，否则就是同一块放两个了。

    1. j和k不在同一行 => `j & k == 0`
    2. 第`i-1`列空的方格能够被竖着的小方格塞满 => 所有连续空着的位置的长度必须是偶数
       `j | k` 或运算

优化：预处理下哪些k能到更新到j

步骤:

1. 枚举某一个列所有可能出现的方案，记录当前方案是否合法（连续的空个数需要是偶数个）

2. 枚举i这一列的状态j下对应i-1列状态k可以放的方案。`j & k == 0`  而且  `st[j|k]`

3. 开始dp ，枚举每一列i，枚举每一种状态j，累加当前状态j下i-1列可以放的状态k

   `dp[i][j] += dp[i -1][k]`

   注意:

    * dp要开long
    * dp初始化`dp[0][0] = 1`

```java
import java.util.*;

public class MainA {

    static int N = 12;
    static int M = 1 << N;
    static int n, m;
    static long[][] f = new long[N][M];
    static List<Integer>[] state = new ArrayList[M]; // 存所有合法状态
    static boolean[] st = new boolean[M]; // 判断某个状态是不是合法

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        while (sc.hasNext()) {
            int n = sc.nextInt();
            int m = sc.nextInt();
            if (n == 0 && m == 0) break;

            // 预处理一下 state
            for (int i = 0; i < M; i++) state[i] = new ArrayList<>();

            // 预处理一下
            for (int i = 0; i < (1 << n); i++) {
                int cnt = 0; // 表示0的个数
                boolean isValid = true;
                // 枚举一下每一行
                for (int j = 0; j < n; j++) {
                    // 如果当前这一位是1的话
                    if ((i >> j & 1) != 0) {
                        // 如果是上面有连续奇数个零说明不合法
                        if ((cnt & 1) == 1) {
                            isValid = false;
                            break;
                        }
                        cnt = 0;
                    } else {
                        cnt++;
                    }
                }
                // 判断最后一段零，如果是奇数也是不合法的
                if ((cnt & 1) == 1) isValid = false;
                st[i] = isValid;
            }

            // 还是预处理, 枚举每个合法状态
            for (int j = 0; j < (1 << n); j++) {
                // 枚举所有的方案
                for (int k = 0; k < (1 << n); k++) {
                    // j和k不在同一行 => j & k == 0                         
                    // 所有已经塞好的位置是i|j，如果这个位置是满足要求（所有连续空着的位置的长度必须是偶数）
                    if ((j & k) == 0 && st[j | k]) {
                        state[k].add(j);
                        // System.out.println(i + " " + j);
                    }
                }
            }

            // 开始DP，把所有的状态清空一下
            for (int i = 0; i < N; i++) Arrays.fill(f[i], 0);

            f[0][0] = 1; // 相当于空棋牌的时候有一种方案
            for (int i = 1; i <= m; i++) {
                for (int j = 0; j < (1 << n); j++) {
                    for (int k : state[j]) {
                        f[i][j] += f[i - 1][k];
                    }
                }
            }

            System.out.println(f[m][0]);
        }
    }
}
```

## 7 树形DP

[285. 没有上司的舞会](https://www.acwing.com/problem/content/287/)

![image-20211231122836406](https://tva1.sinaimg.cn/large/008i3skNgy1gxxkun14tfj30fc0kaju4.jpg)

1. 状态表示`f[u][0], f[u][1]`
2. 集合: `f[u][0]`: 表示所有以u为根的子树中选，并且不选u这个点的方案
   `f[u][1]`: 表示所有以u为根的子树中选，并且选u这个点的方案
3. 属性: Max
4. 集合的划分：
    1. `f[u][0]`: 可以选子树中最大的快乐值，其中子树S1的快乐值又可以分为选S1还是不选S1，即`Max(f[S1][1], f[S1][0], f[S2][0], f[S2][1]....)`
    2. ``f[u][1]`: 选u这个点的快乐值，子树就不能选，`f[S1][0] + f[S2][0] + ....`

5. 步骤：

    1. 从根节点递归求解

    2. 递归到u这个点，将u的儿子处理好(选/不选的情况)

    3. 遍历完成之后那根节点就是整个舞会的快乐值最大

```java
import java.util.*;

public class MainA {
    /**
     * Ural 大学有 N 名职员，编号为 1∼N。
     * 他们的关系就像一棵以校长为根的树，父节点就是子节点的直接上司。
     * 每个职员有一个快乐指数，用整数 Hi 给出，其中 1≤i≤N。
     * 现在要召开一场周年庆宴会，不过，没有职员愿意和直接上司一起参会。
     * 在满足这个条件的前提下，主办方希望邀请一部分职员参会，使得所有参会职员的快乐指数总和最大，求这个最大值。
     */

    static int N = 6010;
    static int n;
    static int[] happy = new int[N];
    static int[] h = new int[N]; // 邻接链表
    static int[] e = new int[N];
    static int[] ne = new int[N];
    static int idx;
    static int[][] f = new int[N][2]; // dp
    static boolean[] hasFather = new boolean[N]; // 判断是否是根节点，因为要从根节点开始

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        n = sc.nextInt();
        for (int i = 1; i <= n; i++) happy[i] = sc.nextInt();

        Arrays.fill(h, -1);
        // 读入边
        for (int i = 0; i < n - 1; i++) {
            int a = sc.nextInt();
            int b = sc.nextInt(); // b是a的父节点
            hasFather[a] = true;
            add(b, a); // b -> a
        }

        // 求根节点，用入度也可以，已验证
        int root = 1;
        while (hasFather[root]) root++;

        dfs(root);

        System.out.println(Math.max(f[root][0], f[root][1]));
    }

    static void dfs(int u) {

        f[u][1] = happy[u]; // 选择u这个点，happy加上
        for (int i = h[u]; i != -1; i = ne[i]) {
            int j = e[i];
            dfs(j); // 递归的原因是我要先求出来子节点j的f值。【漏 2021-11-03】
            f[u][0] += Math.max(f[j][0], f[j][1]);
            f[u][1] += f[j][0];
        }
    }

    // 在邻接表中插入一条边
    static void add(int b, int a) { // b -> a
        e[idx] = a;
        ne[idx] = h[b];
        h[b] = idx++;
    }
}
```

## 8 记忆化搜索

### [901. 滑雪](https://www.acwing.com/problem/content/903/)

题意：

 给定你一个二维矩阵表示滑雪场各区域的高度，一个人从滑雪场中的某个区域内出发，每次可以向上下左右任意一个方向滑动一个单位距离。

 当然，一个人能够滑动到某相邻区域的前提是该区域的高度低于自己目前所在区域的高度。

 请你找出在该滑雪场中能够完成的最长滑雪轨迹，并输出其长度(可经过最大区域数)。 分析:

记忆化搜索

> 本来可以用dfs来做，遍历所有的位置，找到从当前位置下去走的最大路径，然后再取最大值，但是这走会有很多重复的位置被计算，因此可以利用空间换时间的思想，把遍历过的位置往下走的路径的最大值进行记录，这就是记忆化搜索。(可以联系数位dp的dfs做法)

状态表示``f[i][j]``

集合：所有从`(i,j)`开始滑的路径

属性: max

按照第一步是往哪个方向滑动，把所有的路径分为4类。（上下左右）

从左上角到右下角依次算出来f的值，本次搜索的结果应用上一次的搜索结果

```java
import java.util.*;

public class MainA {

    static int N = 310;
    static int n, m;
    static int[][] h = new int[N][N];
    static int[][] dp = new int[N][N];
    static int[] dx = {-1, 0, 1, 0};
    static int[] dy = {0, 1, 0, -1};

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        n = sc.nextInt();
        m = sc.nextInt();

        for (int i = 1; i <= n; i++)
            for (int j = 1; j <= m; j++)
                h[i][j] = sc.nextInt();

        // 初始化，每个状态没有算过，记忆化所有常用
        for (int i = 0; i < N; i++) Arrays.fill(dp[i], -1);

        // 不知道哪个点是最长的需要枚举所有的起点
        int res = 0;
        for (int i = 1; i <= n; i++)
            for (int j = 1; j <= m; j++)
                res = Math.max(res, dfs(i, j));

        System.out.println(res);
    }

    // 全新的实现方式：递归
    // dp(a, b) 递归去深入找所有以（a,b）为开头的所有长度的最大值
    static int dfs(int x, int y) {

        if (dp[x][y] != -1) return dp[x][y];

        int res = 0;

        // 取往下走最大的方向
        int temp = 0;
        for (int k = 0; k < 4; k++) {
            int a = x + dx[k];
            int b = y + dy[k];
            if (a < 1 || a > n || b < 1 || b > m) continue;
            if (h[a][b] >= h[x][y]) continue;
            temp = Math.max(temp, dfs(a, b));
        }
        res = temp + 1; // 加上当这个点

        dp[x][y] = res;
        return res;
    }
}
```

