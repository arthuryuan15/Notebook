# LeetCode Solution: Greedy
The problems where choosing locally optimal also leads to global solution are best fit for Greedy.

## LeetCode

### 1 Assign Cookies

455\. Assign Cookies (Easy)

[Leetcode](https://leetcode.com/problems/assign-cookies/description/)

```html
Input: grid[1,3], size[1,2,4]
Output: 2
```



```java
class Solution {
    public int findContentChildren(int[] g, int[] s) {
        
        if(g == null || s == null) return 0;
        Arrays.sort(g);
        Arrays.sort(s);
    
        int i = 0; // visit grid
        int j = 0; // visit size
        
        while(i < g.length && j < s.length){
            if(g[i] <= s[j]){
                i++;
            }
            j++;
            
        }
        return i;
    }
}
```

### 2 Non-overlapping Intervals

435\. Non-overlapping Intervals (Medium)

*minimum number of intervals you need to remove to make the rest of the intervals non-overlapping*.

[Leetcode](https://leetcode.com/problems/non-overlapping-intervals/description/)

```html
Input: [ [1,2], [1,2], [1,2] ]

Output: 2

Explanation: You need to remove two [1,2] to make the rest of intervals non-overlapping.
```

```html
Input: [ [1,2], [2,3] ]

Output: 0

Explanation: You don't need to remove any of the intervals since they're already non-overlapping.
```

```java
class Solution {
    public int eraseOverlapIntervals(int[][] intervals) {
        
        if(intervals.length < 0 || intervals[0].length < 0) return 0;
        
        Arrays.sort(intervals, (o1, o2) ->{
	        return o1[1] - o2[1];
        });
        
        int res = 1;
        int i = 0; // left
        int j = 1; // right
        int len = intervals.length;
        while(i < len && j < len){
            if(intervals[i][1] <= intervals[j][0]){
                res++;
                i = j;   
            }
            j++;
        }
        return len - res;        
    }
}
```





### 3 Minimum Number of Arrows to Burst Balloons

452\. Minimum Number of Arrows to Burst Balloons (Medium)

[Leetcode](https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/description/)

```
Input:
[[10,16], [2,8], [1,6], [7,12]]

Output:
2
```

We need a `end` to store the end value of last interval 

We need `comparator` to lift accuracy of compare 

```java
Arrays.sort(points, Comparator.comparingInt(o -> o[1]));
```



```java
class Solution {
    public int findMinArrowShots(int[][] points) {
        
        if(points.length < 0 || points[0].length < 0) return 0;
        Arrays.sort(points, Comparator.comparingInt(o -> o[1]));
        
        int len = points.length;
        long end = points[0][1];
        int res = 1;
        
        for(int i = 1; i < len; i++){
            if(end >= points[i][0]){
                continue;
            }else{
                end = points[i][1];
                res++;        
            }
        }
        
        return res;
    }
}
```

### 4 Queue Reconstruction by Height

406\. Queue Reconstruction by Height (Medium)

[Leetcode](https://leetcode.com/problems/queue-reconstruction-by-height/description/) 

```html
Input:
[[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]

Output:
[[5,0], [7,0], [5,2], [6,1], [4,4], [7,1]]
```

Height descending, if two elements are same in height, the k will be ascending,

then add them into a queue from inserting or appending

![image-20211008094214873](https://p.ipic.vip/zpdhol.jpg)

Summary:

​	insert sorted array by k as index into result.

```java
class Solution {
    public int[][] reconstructQueue(int[][] people) {
        
        if(people.length < 1 || people[0].length < 1) return new int[][]{};
        
        Arrays.sort(people, (o1, o2) ->{
            return o1[0] == o2[0]?o1[1] - o2[1]:o2[0] - o1[0];});
        
        List<int[]> res = new ArrayList<>();
        for(int[] p : people){
            res.add(p[1], p);
        }
        return res.toArray(new int[res.size()][2]);
    }
}
```

### 5 Best Time to Buy and Sell Stock

121\. Best Time to Buy and Sell Stock (Easy)

[Leetcode](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/)

```java
class Solution {
    public int maxProfit(int[] prices) {
        if(prices.length < 2) return 0;
        int len = prices.length;
        int res = 0;
        int[] maxNum = new int[len];
        int m = -1; // max
        for(int i = len - 1; i >= 0; i--){
            if(prices[i] > m){
                m = prices[i];
            }
            maxNum[i] = m;
        }
        
        // get max profit
        for(int i = 0; i < len; i++){
            if(maxNum[i] > prices[i]){
                res = Math.max(res, maxNum[i] - prices[i]);    
            }
        }
        return res;
    }
}
```


### 6  Best Time to Buy and Sell Stock II

122\. Best Time to Buy and Sell Stock II (Medium)

[Leetcode](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/description/)

local profit is best profit for global

```java
public int maxProfit(int[] prices) {
    int profit = 0;
    for (int i = 1; i < prices.length; i++) {
        if (prices[i] > prices[i - 1]) {
            profit += (prices[i] - prices[i - 1]);
        }
    }
    return profit;
}
```


### 7 Can Place Flowers 

605\. Can Place Flowers (Easy)

[Leetcode](https://leetcode.com/problems/can-place-flowers/description/)

```html
Input: flowerbed = [1,0,0,0,1], n = 1
Output: True
```

```java
class Solution {
    public boolean canPlaceFlowers(int[] flowerbed, int n) {
        if(n < 1) return true;
        
        int len = flowerbed.length;
        
        for(int i = 0; i < len; i++){
            
            if(flowerbed[i] == 0){
                // [0] only one 
                if(i == len - 1 && i == 0) return true;    

              	//  first one
                if(i == 0 && flowerbed[i+1] != 1){
                    n--;
                    flowerbed[i] = 1;
                    continue;
                }
							 //  last one
                if(i == len - 1  && flowerbed[i-1] != 1){
                    n--;
                    flowerbed[i] = 1;
                    continue;
                }
                // other one 
                if(i > 0 && i < len -1 && flowerbed[i-1]  != 1 && flowerbed[i+1]  != 1){
                    n--;
                    flowerbed[i] = 1;
                    continue;
                }
            }
        }
        
        if(n < 1) return true;
        else return false;
        
    }
}
```



### 8 Is Subsequence

392\. Is Subsequence (Medium)

[Leetcode](https://leetcode.com/problems/is-subsequence/description/) 

```html
s = "abc", t = "ahbgdc"
Return true.
```

```java
class Solution {
    public boolean isSubsequence(String s, String t) {
        if(s.length() < 1) return true;
        if(s.length() > t.length()) return false;
        int j = 0;
        for(int i = 0; i < t.length(); i++){
            if(s.charAt(j) == t.charAt(i)){
                j++;
                if(j == s.length()) return true;
            }
        }
        
        return false;
    }
}
```

### 9 Non-decreasing Array

665\. Non-decreasing Array (Medium)

[Leetcode](https://leetcode.com/problems/non-decreasing-array/description/)

```html
Input: [4,2,3]
Output: True
Explanation: You could modify the first 4 to 1 to get a non-decreasing array.
```

```
[4,2,3] true
[4,2,1] false
[3,4,2,3] false
dont update current num[i] unless you have to
```

```java
public boolean checkPossibility(int[] nums) {
    int cnt = 0;
    for (int i = 1; i < nums.length && cnt < 2; i++) {
        if (nums[i] >= nums[i - 1]) {
            continue;
        }
        cnt++;
        if (i - 2 >= 0 && nums[i - 2] > nums[i]) {
            nums[i] = nums[i - 1];
        } else {
            nums[i - 1] = nums[i];
        }
    }
    return cnt <= 1;
}
```



### 10  Maximum Subarray

53\. Maximum Subarray (Easy)

[Leetcode](https://leetcode.com/problems/maximum-subarray/description/) 

```html
For example, given the array [-2,1,-3,4,-1,2,1,-5,4],
the contiguous subarray [4,-1,2,1] has the largest sum = 6.
```

**PreSum = nums[0];**

**Define frist number as target to be PreSum**

```java
public int maxSubArray(int[] nums) {
    if (nums == null || nums.length == 0) {
        return 0;
    }
    int preSum = nums[0];
    int maxSum = preSum;
    for (int i = 1; i < nums.length; i++) {
	      if(preSum > 0){
          preSum = preSum + nums[i];
        }else{
          preSum = nums[i];
        }
        maxSum = Math.max(maxSum, preSum);
    }
    return maxSum;
}
```

### 11 Partition Labels

763\. Partition Labels (Medium)

[Leetcode](https://leetcode.com/problems/partition-labels/description/) 

```html
Input: S = "ababcbacadefegdehijhklij"
Output: [9,7,8]
Explanation:
The partition is "ababcbaca", "defegde", "hijhklij".
This is a partition so that each letter appears in at most one part.
A partition like "ababcbacadefegde", "hijhklij" is incorrect, because it splits S into less parts.
```

![image-20210928164223471](https://p.ipic.vip/35y1d0.jpg)

```java
class Solution {
    public List<Integer> partitionLabels(String s) {
        
        // store each char appeared last position
        int lastIndex[] = new int[128];
        int len = s.length();
        for(int i = 0; i < len; i++){
            lastIndex[(int)s.charAt(i)] = i;
        }
        
        System.out.println(lastIndex[(int)s.charAt(0)]);
        
        int start = 0; // start position of interval
        int end = 0; // end position of interval
        List<Integer> res = new ArrayList<>();
        
        for(int i = 0; i < len; i++){
            if(lastIndex[(int)s.charAt(i)] > end){
                end = lastIndex[(int)s.charAt(i)];
            }
            if(end == i){
                // add current partition in the result
                res.add(end - start + 1);
                start = i + 1;
            } 

        }
        
        return res;
         
    }
}
```





