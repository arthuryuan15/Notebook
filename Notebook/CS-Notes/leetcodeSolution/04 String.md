# Leetcode solution - String

## 

## 1. Valid Anagram

242\. Valid Anagram (Easy)

[Leetcode](https://leetcode.com/problems/valid-anagram/description/)

```html
s = "anagram", t = "nagaram", return true.
s = "rat", t = "car", return false.
```

We can use hashMap to map characters and the number of occurance, then compare the number of characters by two strings 

Because this problem only has 26 lower case characters, so we can use Integer array of length 26 to statistic, no need HashMap anymore.('a' is 97)



```java
public boolean isAnagram(String s, String t) {
    int[] cnts = new int[26];
    for (char c : s.toCharArray()) {
        cnts[c - 'a']++;
    }
    for (char c : t.toCharArray()) {
        cnts[c - 'a']--;
    }
    for (int cnt : cnts) {
        if (cnt != 0) {
            return false;
        }
    }
    return true;
}
```

## 2.  Longest Palindrome

409\. Longest Palindrome (Easy)

[Leetcode](https://leetcode.com/problems/longest-palindrome/description/) 

```html
Input : "abccccdd"
Output : 7
Explanation : One longest palindrome that can be built is "dccaccd", whose length is 7.
```

Using the Integer array of length 256 to statistic the number of occurance of every characters, if the number of every characters is even, we can use it to build palindrome.

Becuase the middle character can occurance by odd times, so we can put it in the middle.

```java
class Solution {
    
    private int[] cnts = new int[256];
    public int longestPalindrome(String s) {
        int res = 0;
        for(int i = 0; i < s.length(); i++){
            cnts[s.charAt(i)]++;
        }
        
        for(int cnt: cnts){
            res += (cnt/2) * 2;
        }
        
        if(res < s.length()){
            res++;
        }
        
        return res;
    }
}
```

## 3. Isomorphic Strings

205\. Isomorphic Strings (Easy)

[Leetcode](https://leetcode.com/problems/isomorphic-strings/description/)

Two strings `s` and `t` are isomorphic if the characters in `s` can be replaced to get `t`.

```html
Given "egg", "add", return true.
Given "foo", "bar", return false.
Given "paper", "title", return true.
```

Record last occurance position of characters, If the position of the characters in the two strings is the same last time, then they are isomorphic.

<img src="https://tva1.sinaimg.cn/large/008i3skNgy1gufoz1y77zj60e80me76w02.jpg" alt="image-20210913151001975" style="zoom: 33%;" />

```java
class Solution {
    
    private HashMap<Character, Character> s2t = new HashMap<>();
    private HashMap<Character, Character> t2s = new HashMap<>();
    
    
    public boolean isIsomorphic(String s, String t) {
        
        int len = s.length();
        for(int i = 0; i < len; i++){
            char x = s.charAt(i);
            char y = t.charAt(i);
            if((s2t.containsKey(x) && s2t.get(x) != y) || t2s.containsKey(y) && t2s.get(y) != x){
               return false; 
            }
            
            s2t.put(x, y);
            t2s.put(y, x);
            
        }
        return true;
        
    }
}
```

## 4. Palindromic Substrings

647\. Palindromic Substrings (Medium)

[Leetcode](https://leetcode.com/problems/palindromic-substrings/description/) 

Given a string `s`, return *the number of **palindromic substrings** in it*.

```html
Input: "aaa"
Output: 6
Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".
```

From the beginning of a digit, try to extend substring.

<img src="https://tva1.sinaimg.cn/large/008i3skNgy1gufrhu1hyyj60uk0fwn0a02.jpg" alt="image-20210913163721428" style="zoom: 50%;" />

```java
class Solution {
    
    public int countSubstrings(String s) {
        
        int res = 0;
        int len = s.length();
        for(int i = 0; i < len; i++){
            
            // single number as center
            int l = i;
            int r = i;
            while(l >= 0 && r < len && s.charAt(l) == s.charAt(r)){
                l--;
                r++;
                res++;
            }
            
            // double number as center
            l = i;
            r = i + 1;
            while(l >= 0 && r < len && s.charAt(l) == s.charAt(r)){
                l--;
                r++;
                res++;
            }
        }   
        return res;
    }
}
```

## 5. Palindrome Number

9\. Palindrome Number (Easy)

[Leetcode](https://leetcode.com/problems/palindrome-number/description/)

```
Input: x = 121
Output: true

Input: x = 10
Output: false
Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
```

<img src="https://tva1.sinaimg.cn/large/008i3skNgy1gufszc4r7jj60ug0mkaf702.jpg" alt="image-20210913172845951" style="zoom:50%;" />

```java
class Solution {
    public boolean isPalindrome(int x) {
        if(x == 0) return true;
        if(x < 0 || x % 10 == 0) return false;
        int revertedNum = 0;
        while(x > revertedNum){
            revertedNum = x % 10 +  revertedNum * 10;
            x = x / 10;
        }
        
        return x == revertedNum || x == revertedNum / 10; // even || odd
    }
}
```





## 6. Count Binary Substrings

696\. Count Binary Substrings (Easy)

[Leetcode](https://leetcode.com/problems/count-binary-substrings/description/)

<img src="https://tva1.sinaimg.cn/large/008i3skNgy1guftthxuspj615g0hy42a02.jpg" alt="image-20210913175746111" style="zoom: 50%;" />

We start from second position and the length of cur is 1.`cur = 1, i = 1`

```html
Input: "00110011"
Output: 6
Explanation: There are 6 substrings that have equal number of consecutive 1's and 0's: "0011", "01", "1100", "10", "0011", and "01".
```

```java
public int countBinarySubstrings(String s) {
    int preLen = 0, curLen = 1, count = 0;
    for (int i = 1; i < s.length(); i++) {
        if (s.charAt(i) == s.charAt(i - 1)) {
            curLen++;
        } else {
            preLen = curLen;
            curLen = 1;
        }

        if (preLen >= curLen) {
            count++;
        }
    }
    return count;
}
```



## Trie

<div align="center"> <img src="https://cs-notes-1256109796.cos.ap-guangzhou.myqcloud.com/5c638d59-d4ae-4ba4-ad44-80bdc30f38dd.jpg"/> </div><br>

Trie，Store and search collection of string effectively.

![image-20210925121602541](https://tva1.sinaimg.cn/large/008i3skNgy1gutfdspj8wj60qq0oun1s02.jpg)

[Acwing](https://www.acwing.com/problem/content/837/)



## 1. Implement Trie (Prefix Tree) 

208\. Implement Trie (Prefix Tree) (Medium)

[Leetcode](https://leetcode.com/problems/implement-trie-prefix-tree/description/)

```java
class Trie {
    
    private int N = 100010;
    private int[][] son = new int[N][26];
    private int[] cnt = new int[N];
    private int idx = 0;
    
    public Trie() {
        
    }
    
    public void insert(String word) {
        int p = 0;
        for(int i = 0; i < word.length(); i++){
            int u = word.charAt(i) - 'a';
            if(son[p][u] == 0){
                son[p][u] = ++idx;
            }
            p = son[p][u];
        }
        cnt[p]++;
        
    }
    
    public boolean search(String word) {
        int p = 0;
        for(int i = 0; i < word.length(); i++){
            int u = word.charAt(i) - 'a';
            if(son[p][u] == 0) return false;
            p = son[p][u];
        }
        if(cnt[p] == 0) return false;
        return true;
    } 
    
    public boolean startsWith(String prefix) {
        int p = 0;
        for(int i = 0; i < prefix.length(); i++){
            int u = prefix.charAt(i) - 'a';
            if(son[p][u] == 0) return false;
            p = son[p][u];
        }
        return true;
    }
}
```



## 2 Map Sum Pairs 

677\. Map Sum Pairs (Medium)

[Leetcode](https://leetcode.com/problems/map-sum-pairs/description/) 

```html
Input: insert("apple", 3), Output: Null
Input: sum("ap"), Output: 3
Input: insert("app", 2), Output: Null
Input: sum("ap"), Output: 5
```

```java
class MapSum {

    private class Node {
        Node[] child = new Node[26];
        int value;
    }

    private Node root = new Node();

    public MapSum() {

    }

    public void insert(String key, int val) {
        insert(key, root, val);
    }

    private void insert(String key, Node node, int val) {
        if (node == null) return;
        if (key.length() == 0) {
            node.value = val;
            return;
        }
        int index = indexForChar(key.charAt(0));
        if (node.child[index] == null) {
            node.child[index] = new Node();
        }
        insert(key.substring(1), node.child[index], val);
    }

    public int sum(String prefix) {
        return sum(prefix, root);
    }

    private int sum(String prefix, Node node) {
        if (node == null) return 0;
        if (prefix.length() != 0) {
            int index = indexForChar(prefix.charAt(0));
            return sum(prefix.substring(1), node.child[index]);
        }
        int sum = node.value;
        for (Node child : node.child) {
            sum += sum(prefix, child);
        }
        return sum;
    }

    private int indexForChar(char c) {
        return c - 'a';
    }
}
```

