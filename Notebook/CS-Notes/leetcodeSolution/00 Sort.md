```java
// from smaller from larger
Arrays.sort(nums, new Comparator<int[]>() {
     @Override
     public int compare(int[] o1, int[] o2) {
         return o1[0] - o2[0];
     }
 });
```



```java
// from larger to smaller
Arrays.sort(properties, (a, b) -> (b[0] == a[0]) ? (a[1] - b[1]) : b[0] - a[0]);
```

## QuickSort

Quicksort can be used to solve Kth Element problem.

215. Kth Largest Element in an Array (Medium)

[Leetcode](https://leetcode.com/problems/kth-largest-element-in-an-array/description/) 

```text
Input: [3,2,1,5,6,4] and k = 2
Output: 5
```

Given an integer array `nums` and an integer `k`, return *the* `k` *most frequent elements*. You may return the answer in **any order**.

```java
class Solution {
    public int findKthLargest(int[] nums, int k) {
        quickSort(nums, 0, nums.length - 1);
        return nums[nums.length - k];
    }
    
    private static void quickSort(int[] arr, int l, int r){
        
        if(l < r){
            int i = l - 1;
            int j = r + 1;
            int x = arr[r]; // breakpoint for right
            
            while(i < j){
                
                do{
                    i++;
                }while(i < j && arr[i] < x);
                
                do{
                    j--;
                }while(i < j && arr[j] > x);
                
                if(i < j){
                    // switch number
                    int temp = arr[i];
                    arr[i] = arr[j];
                    arr[j] = temp;
                }
            }
            quickSort(arr, l, i -1);
            quickSort(arr, i, r);
        }
        
    }
}
```



## Bucket sort

347\. Top K Frequent Elements (Medium)

[Leetcode](https://leetcode.com/problems/top-k-frequent-elements/description/) 

```html
Given [1,1,1,2,2,3] and k = 2, return [1,2].
```

Set there are many bucket, every bucket stores the frequency of occurrence. The index of bucket is the frequency, so the number in i st bucket is i. After putting all number into the bucket, traverse from left to right, the top k number is most frequent number.

![image-20210831215402491](https://tva1.sinaimg.cn/large/008i3skNgy1gu0zlbn7r2j608i09a74q02.jpg)

```java
class Solution {
    public int[] topKFrequent(int[] nums, int k) {
        Map<Integer, Integer> map = new HashMap<>();
        
        for(int num: nums){
            map.put(num, map.getOrDefault(num, 0) + 1);
        }
        List<Integer>[] buckets = new ArrayList[nums.length + 1];
        
        // keySet
        for(int key: map.keySet()){
            int f = map.get(key);
            if(buckets[f] == null){
                buckets[f] = new ArrayList<>();
            }
            buckets[f].add(key);
        }
        List<Integer> topK = new ArrayList<>();
       // from right to left  
        for(int i = buckets.length - 1; i >= 0 && topK.size() < k; i--){
            if(buckets[i] == null) continue;
            if(buckets[i].size() <= (k - topK.size())){ // rest top
                topK.addAll(buckets[i]);
            }else{
                topK.addAll(buckets[i].subList(0, k - topK.size())); // add all rest buckets
            }
        }
        int[] res = new int[k];
        for (int i = 0; i < k; i++) {
            res[i] = topK.get(i);
        }
        return res;
    }
}
```



##  Employee Free Time

[leetcode](https://zxi.mytechroad.com/blog/geometry/leetcode-759-employee-free-time/)

![image-20211005212026938](https://tva1.sinaimg.cn/large/008i3skNgy1gv5fb7mwmqj60d30q140j02.jpg)

![image-20211005212059113](https://tva1.sinaimg.cn/large/008i3skNgy1gv5fbp5s2yj60ia0gst9v02.jpg)

```java
/*
// Definition for an Interval.
class Interval {
    public int start;
    public int end;

    public Interval() {}

    public Interval(int _start, int _end) {
        start = _start;
        end = _end;
    }
};
*/

class Solution {
    public List<Interval> employeeFreeTime(List<List<Interval>> schedule) {
        List<Interval> all = new ArrayList<>();
        List<Interval> res = new ArrayList<>();
        
        if(schedule.size() == 0) return res;
        
        // add all intervals to all list
        for(List<Interval> list : schedule){
            all.addAll(list);
        }
        
        // sort all intervals by start time
        Collections.sort(all, (a, b)->{
            return a.start - b.start;
        });
        
        // traversal all 
        int end = all.get(0).end;
        for(Interval busy : all){
            if(busy.start > end){ // non-overlaping
                res.add(new Interval(end, busy.start));
            }
            end = Math.max(end, busy.end);
        }
        
        return res;
    }
}
```



## Meeting Scheduler

`1229. Meeting Scheduler`

![image-20211005221254503](https://tva1.sinaimg.cn/large/008i3skNgy1gv5gtqt9vdj60dl0icgn402.jpg)

```java
class Solution {
    public List<Integer> minAvailableDuration(int[][] slots1, int[][] slots2, int duration) {
        
        List<Integer> res = new ArrayList<>();
        
        if(slots1.length < 1 || slots1.length < 1) return res;
        
        int len1 = slots1.length;
        int len2 = slots2.length;
        
        // sort by start time
        Arrays.sort(slots1, (o1, o2) ->{
            return o1[0] - o2[0];
        });
        Arrays.sort(slots2, (o1, o2) ->{
            return o1[0] - o2[0];
        });
        
        int p1 = 0; 
        int p2 = 0;
        
        while(p1 < len1 && p2 < len2){
            
            int st = Math.max(slots1[p1][0], slots2[p2][0]);
            int ed = Math.min(slots1[p1][1], slots2[p2][1]);
            
            // if intersection or not
            if(ed - st >= duration){
                res.add(st);
                res.add(st + duration);
                return res;
            }
            // if no good intersection
            if(slots1[p1][1] < slots2[p2][1]){
                p1++;
            }else{
                p2++;
            } 
        }
        
        return res;
        
    }
}
```



