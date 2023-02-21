# 	Leetcode Solution - Tree
## Summary for DFS

1. Recursion
   * if you need to backtrack, remember to restore

2. Traversal

   * use dfs without restore

3. if you need to output the path in the process. you need to create List and restore scene, or you can add variables into parameters of function such as `dfs(path.add(nums[i]))`

   if not , the algorhitm will help you to store the process.



Effective:

If you need to select more than 3 item from collection you can use dfs, otherwise you can select by for loop.





## Summary for BFS

1. Inorder/postorder/preorder or deformed

2. Case-by-case discussion for range problems




Template

```java
// Recursion
int dfs(int u, int[] nums){
  st[u] = true;
  for (int i = 0; i < nums.length; i++){
    if(!st[i]){
      path.add(nums[i]); // 
      st[i] = true;
      dfs(u+1, nums);
      path.remove(path.size() - 1); // this is backtrack
      st[i] = false;
    }
  }
}
```



```java
// Traversal
// preorder
void dfs(TreeNode root){
  visit(root);
  dfs(root.left);
  dfs(root.right);
}

// inorder
void dfs(TreeNode root){
  dfs(root.left);
  visit(root);
  dfd(root.right);
}

// postorder
void dfs(TreeNode root){
  dfs(root.left);
  dfs(root.right);
  visit(root);
}
```





##  Recursion

A tree is either empty or has two pointers which pzoints a tree. Tree is a structure of recursion, many trees could be solve by recursion.

1. Stop condition
2. focus on this level
3. the meaning of return val

![image-20210902174902355](https://p.ipic.vip/hplvco.jpg)





### 1. Maximum Depth of Binary Tree

104\. Maximum Depth of Binary Tree (Easy)

[Leetcode](https://leetcode.com/problems/maximum-depth-of-binary-tree/description/)

```java
public int maxDepth(TreeNode root) {
    if (root == null) return 0;
    return Math.max(maxDepth(root.left), maxDepth(root.right)) + 1;
}
```

### 2. Balanced Binary Tree

110\. Balanced Binary Tree (Easy)

![image-20210902181627792](https://p.ipic.vip/3f7uny.jpg)

[Leetcode](https://leetcode.com/problems/balanced-binary-tree/description/) 

```html
    3
   / \
  9  20
    /  \
   15   7
```

A binary tree in which the left and right subtrees of every node differ in height by no more than 1.

```java
class Solution {
    public boolean isBalanced(TreeNode root) {
        // concer case
        if(root == null) return true;
        // stop condtion
        if(Math.abs(maxDepth(root.left)- maxDepth(root.right)) > 1){
            return false;
        }
        return isBalanced(root.left) && isBalanced(root.right);
    }
    
    private int maxDepth(TreeNode root){
        if(root == null) return 0;
        return Math.max(maxDepth(root.left), maxDepth(root.right)) + 1;
    }
}
```

### 3. Diameter of Binary Tree

543\. Diameter of Binary Tree (Easy)

[Leetcode](https://leetcode.com/problems/diameter-of-binary-tree/description/) 

```html
Input:

         1
        / \
       2  3
      / \
     4   5

Return 3, which is the length of the path [4,2,1,3] or [5,2,1,3].
```

<img src="https://p.ipic.vip/g2jl78.jpg" alt="image-20210902221830464" style="zoom:50%;" />

```java
class Solution {
    private int max = 0;
    public int diameterOfBinaryTree(TreeNode root) {
        if(root == null) return max;
        depth(root);
        return max;
    }
    
    private int depth(TreeNode root){
        // stop condition
        if(root == null) return 0;
        int left = depth(root.left);
        int right = depth(root.right);
        max = Math.max(max, left + right );
        // return the val
        return Math.max(left, right) + 1;
    }
}
```

### 4. Invert Binary Tree

226\. Invert Binary Tree (Easy)

[Leetcode](https://leetcode.com/problems/invert-binary-tree/description/) 

```java
class Solution {
    public TreeNode invertTree(TreeNode root) {
        // stop condition
        if(root == null) return root;
        // what's gonna happen in this level
        TreeNode left = invertTree(root.left);
        TreeNode right = invertTree(root.right);
        root.left = right;
        root.right = left;
        // return what's val
        return root;
    }
}
```

### 6. Path Sum

Leetcdoe : 112. Path Sum (Easy)

[Leetcode](https://leetcode.com/problems/path-sum/description/) 

```html
Given the below binary tree and sum = 22,

              5
             / \
            4   8
           /   / \
          11  13  4
         /  \      \
        7    2      1

return true, as there exist a root-to-leaf path 5->4->11->2 which sum is 22.
```

if the tree has a **root-to-leaf** path such that adding up all the values along the path equals `targetSum`.



**DFS**

```java
class Solution {
    private int res;
    // preorder root-> left -> right
    public boolean hasPathSum(TreeNode root, int targetSum) {
        if(root == null) return false;
        dfs(root, targetSum);
        if(res == 0) return false;    
        else return true;
    }
    
    private void dfs(TreeNode root, int targetSum){
        
        if(root == null){
            return;
        }
        int remain = targetSum - root.val;
        if(remain == 0 && root.left == null && root.right == null){
            res++;
        }
        
        dfs(root.left, remain);
        dfs(root.right, remain);
    }
}
```



```java
class Solution {
    public boolean hasPathSum(TreeNode root, int targetSum) {
        // stop condition
        if(root == null) return false;
        // how do you know you meet the leaf
        if(root.left == null && root.right == null && root.val == targetSum) return true;
        // focus on this level and what's going to happen
        return hasPathSum(root.left, targetSum - root.val) || hasPathSum(root.right, targetSum - root.val);
        
    }
}
```

### 7. Path Sum III

437\. Path Sum III (Easy)

[Leetcode](https://leetcode.com/problems/path-sum-iii/description/) 

```html
root = [10,5,-3,3,2,null,11,3,-2,null,1], sum = 8

      10
     /  \
    5   -3
   / \    \
  3   2   11
 / \   \
3  -2   1

Return 3. The paths that sum to 8 are:

1.  5 -> 3
2.  5 -> 2 -> 1
3. -3 -> 11
```

The path does not need to start or end at the root or a leaf, but it must go downwards (i.e., traveling only from parent nodes to child nodes).

![image-20210903180536675](https://p.ipic.vip/dpmsi1.jpg)



**DFS**

```java
class Solution {
    
    private int res;
    
    public int pathSum(TreeNode root, int targetSum) {
        
        if(root == null) return 0;
        
        dfs(root, targetSum); // from the root
        pathSum(root.left, targetSum); // start from left
        pathSum(root.right, targetSum); // start from right
        return res;
    }
    
    private void dfs(TreeNode root, int targetSum){
        if(root == null) return;
        
        int remaining = targetSum - root.val;
        
        if(remaining == 0){
            res++;
        }
        dfs(root.left, remaining);
        dfs(root.right, remaining);
    }
}
```





```java
class Solution {
    public int pathSum(TreeNode root, int targetSum) {
        // stop condition
        if(root == null) return 0;
        // focus on this level
       // pathSum could not be from root
        return pathSumStartWithRoot(root, targetSum) + pathSum(root.left, targetSum) + pathSum(root.right, targetSum);
    }
    
    private int pathSumStartWithRoot(TreeNode root, int targetSum){
        // corncer case
        if(root == null) return 0;
        int res = 0;
        // what's gonna on this level
        if(targetSum == root.val) res++;
        res += pathSumStartWithRoot(root.left, targetSum - root.val) + pathSumStartWithRoot(root.right, targetSum - root.val);
        // what's the return val
        return res;
    }
}
```

### 8. Subtree of Another Tree

572\. Subtree of Another Tree (Easy)

[Leetcode](https://leetcode.com/problems/subtree-of-another-tree/description/)

```html
Given tree s:
     3
    / \
   4   5
  / \
 1   2

Given tree t:
   4
  / \
 1   2

Return true, because t has the same structure and node values with a subtree of s.

Given tree s:

     3
    / \
   4   5
  / \
 1   2
    /
   0

Given tree t:
   4
  / \
 1   2

Return false.
```

Anylasis root, root.left,   root.right

```java
public boolean isSubtree(TreeNode s, TreeNode t) {
    if (s == null) return false;
    return isSubtreeWithRoot(s, t) || isSubtree(s.left, t) || isSubtree(s.right, t);
}

private boolean isSubtreeWithRoot(TreeNode s, TreeNode t) {
    if (t == null && s == null) return true;
    if (t == null || s == null) return false;
    if (t.val != s.val) return false;
    return isSubtreeWithRoot(s.left, t.left) && isSubtreeWithRoot(s.right, t.right);
}
```

### 9. Symmetric Tree

101\. Symmetric Tree (Easy)

[Leetcode](https://leetcode.com/problems/symmetric-tree/description/)

```html
    1
   / \
  2   2
 / \ / \
3  4 4  3
```

```java
public boolean isSymmetric(TreeNode root) {
    if (root == null) return true;
    return isSymmetric(root.left, root.right);
}

private boolean isSymmetric(TreeNode t1, TreeNode t2) {
    if (t1 == null && t2 == null) return true;
    if (t1 == null || t2 == null) return false;
    if (t1.val != t2.val) return false;
    return isSymmetric(t1.left, t2.right) && isSymmetric(t1.right, t2.left);
}
```

### 10. Minimum Depth of Binary Tree

111\. Minimum Depth of Binary Tree (Easy)

[Leetcode](https://leetcode.com/problems/minimum-depth-of-binary-tree/description/) 

Find minimum depth.

The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.

**DFS**

```java
class Solution {
    
    private int res = Integer.MAX_VALUE;
    private int curDepth;
    
    public int minDepth(TreeNode root) {
        if(root == null) return 0;
        dfs(root);
        return res;
    }
    
    private void dfs(TreeNode root){
        if(root == null) return;
        curDepth++;
        if(root.left == null && root.right == null){
            System.out.println(root.val);
            res = Math.min(curDepth, res);
        }
        
        dfs(root.left);
        dfs(root.right);
        curDepth--;
    }
}
```



```java
class Solution {
    public int minDepth(TreeNode root) {
        // stop condition
        if(root == null) return 0;
        // focus on this level, assume left and right are got minDepth already
        int left = minDepth(root.left); // 0 or 1
        int right = minDepth(root.right);
        if(left == 0 || right == 0){ // if either left or right has no node, we need to go having one continue
            return left + right + 1; // cus we have root
        }
        return Math.min(left, right) + 1; 
    }
}
```

### 11.  Sum of Left Leaves 

404\. Sum of Left Leaves (Easy)

[Leetcode](https://leetcode.com/problems/sum-of-left-leaves/description/)

```html
    3
   / \
  9  20
    /  \
   15   7

There are two left leaves in the binary tree, with values 9 and 15 respectively. Return 24.
```

![image-20210904113557198](https://p.ipic.vip/dyhnos.jpg)

**DFS**

```java
class Solution {
    
    private int res = 0;
    
    public int sumOfLeftLeaves(TreeNode root) {
        
        if(root == null){
            return 0;
        }
        
        dfs(root, false);
        return res;
        
    }
    
    private void dfs(TreeNode root, boolean stat){
        
        if(root == null) return;
        
        if(stat && root.left == null && root.right == null){
            System.out.println(root.val);
            res+= root.val;
        }
        
        dfs(root.left, true);
        dfs(root.right, false);
        
    }
}
```

```java
class Solution {
    public int sumOfLeftLeaves(TreeNode root) {
        // stop condition
        if(root == null) return 0;
        // focus on this level
        int res = 0;
        if(isleaf(root.left)){
            return root.left.val + sumOfLeftLeaves(root.right);
        }else{
            return sumOfLeftLeaves(root.left) + sumOfLeftLeaves(root.right);
        }
        
    }
    private boolean isleaf(TreeNode root){
        if(root == null) return false;
        return root.left == null && root.right == null;
    }
}
```



### 13. Second Minimum Node In a Binary Tree

671\. Second Minimum Node In a Binary Tree (Easy)

[Leetcode](https://leetcode.com/problems/second-minimum-node-in-a-binary-tree/description/)

```html
Input:
   2
  / \
 2   5
    / \
    5  7

Output: 5
```

We can tranform this problem to get minVal of left subtree and right subtree.

```java
class Solution {
    public int findSecondMinimumValue(TreeNode root) {
        
        return getMin(root, root.val);
        
    }
    
    private int getMin(TreeNode root, int minVal){ // this root means current node
        if(root == null) return -1;
        
        // if current val > root val 
        if(root.val > minVal){
            return root.val;
        }
        
        // otherwise, we need to search deeper
        int l = getMin(root.left, minVal);
        int r = getMin(root.right, minVal);
        
        if(l != -1 && r != -1){ // left and right both find min val
            return Math.min(l,r);
        }
     		// if left don't find min val, return right val
        if(l == -1) return r;
        return l;
            
            
    }
}
```





## DFS

Template for dfs

```c++
int dfs(int u){

    st[u] = true; // st[u] 表示点u已经被遍历过
  
    for (int i = h[u]; i != -1; i = ne[i]){
        int j = e[i];
        if (!st[j]){
         	dfs(j); 
        }
    }
}
```

```java
// Normal Path
vector<vector<int>>res;
void dfs(TreeNode*root,vector<int>path)
{
    if(!root) return;  //根节点为空直接返回
    path.push_back(root->val);  //作出选择
    if(!root->left && !root->right) //如果到叶节点  
    {
        res.push_back(path);
        return;
    }
    dfs(root->left,path);  //继续递归
    dfs(root->right,path);
}



// Certain path
void dfs(TreeNode*root, int sum, vector<int> path)
{
    if (!root)
        return;
    sum -= root->val;
    path.push_back(root->val);
    if (!root->left && !root->right && sum == 0)
    {
        res.push_back(path);
        return;
    }
    dfs(root->left, sum, path);
    dfs(root->right, sum, path);
}
```







DFS Step             | DFS vs BFS 
:-------------------------:|:-------------------------:
![](https://p.ipic.vip/4nf35d.jpg)  |  ![](https://p.ipic.vip/wygq68.jpg)



![image-20210906114004045](https://p.ipic.vip/qg1n61.jpg)

### 1. Acwing - Permutation

Acwing 842\. Permutation

[Acwing](https://www.acwing.com/problem/content/844/) 

==Permutation need a `st` variable to avid use number once.==

```
Given an integer n, and arranging the numbers 1 ~ n in a row, there will be many ways to arrange them. Now, please output all sorting methods.

Input
3

Output
1 2 3
1 3 2
2 1 3
2 3 1
3 1 2
3 2 1
```

![image-20210904121450457](https://p.ipic.vip/no5dp5.jpg)

```java
import java.util.*;

public class Main{
  
  private static int n; // input integer
  private static int N = 10; // output number
  private static int[] path = new int[N]; // save the path
  private static boolean[] st = new boolean[N]; // save used condition
  
  public static void main(String[] args){
    // input
    Scanner sc = new Scanner(System.in);
    n = sc.nextInt();
    dfs(0);
  }
  
  private static void dfs(int u){ // current position
    // meet last position
    if(u == n){
      for(int i = 0; i < n; i++){
        System.out.print(path[i] + " ");
      }
      System.out.println("");
    }
    
    for(int i = 1; i <= n; i++){ // every number need to put 
      if(!st[i]){ // the number used or not
        path[u] = i;
        st[i] = true;
        dfs(u+1); // there actullay has stack to store evey node
        // recursion to restore
        path[u] = 0;
        st[i] = false;
      }
    }
  }
}
```



### 2. Acwing - Combination

[Acwing 95](https://www.acwing.com/problem/content/95/)

```
Randomly select m from the n integers from 1 to n, and output all possible options.

The output must be from small to large
Input
3 3
Ouput
1 2 3

Input
5 3

Output
1 2 3 
1 2 4 
1 2 5 
1 3 4 
1 3 5 
1 4 5 
2 3 4 
2 3 5 
2 4 5 
3 4 5
```

![image-20210905133636696](https://p.ipic.vip/ltiacx.jpg)

```java
import java.util.*;

public class Main{
  
  private static int N = 30;
  private static int[] path = new int[N];
  private static int n, m;
  
  public static void main(String[] args){
    
    Scanner sc = new Scanner(System.in);
    n = sc.nextInt(); // 5
    m = sc.nextInt(); // 3
    dfs(1, 1);// frist level and start from 1
  }
  
  private static void dfs(int u, int start){ // u: crrent level, start: which val will be started
    
    if(u > m){
      for(int i = 1; i <= m; i++){
        System.out.print(path[i] +" ");
      }
      System.out.println("");
      return;
    }
    
    for(int i = start; i <= n; i++){
      path[u] = i;
      dfs(u+ 1, i + 1); // next level and start val from i + 1
      path[u] = 0;
    }
  }
}
```



### 3.  Combination Sum

39. Combination Sum(Medium)

    Given an array of **distinct** integers `candidates` and a target integer `target`, return *a list of all **unique combinations** of* `candidates` *where the chosen numbers sum to* `target`*.* You may return the combinations in **any order**.

    ```
    Input: candidates = [2,3,6,7], target = 7
    
    Output: [[2,2,3],[7]]
    
    Explanation:
    2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
    7 is a candidate, and 7 = 7.
    These are the only two combinations.
    ```

[leetCode](https://leetcode.com/problems/combination-sum/)

```java
class Solution {
    
    // need a start for combination
    private List<List<Integer>> res = new ArrayList<>();
    private List<Integer> path = new ArrayList<>();
    private int u; // current level
    
    public List<List<Integer>> combinationSum(int[] candidates, int target) {
        dfs(0, 0, 0, candidates, target);
        return res;
    }
    
    private void dfs(int u, int curSum, int start, int[] candidates, int target){
        
        if(curSum > target){
            return;
        }
        
        if(curSum == target){
            res.add(new ArrayList<>(path));
            return;
        }
        
        for(int i = start; i < candidates.length; i++){
            
            path.add(candidates[i]);
            curSum += candidates[i];
            dfs(u + 1, curSum, i, candidates, target); // the start from i means it can be same as last number
            curSum -= candidates[i];
            path.remove(path.size() - 1);
            
        }
        
    }
}
```



### 4 Combination Sum II

40. Combination Sum II

[LeetCode](https://leetcode.com/problems/combination-sum-ii/)

Given a collection of candidate numbers (`candidates`) and a target number (`target`), find all unique combinations in `candidates` where the candidate numbers sum to `target`.

Each number in `candidates` may only be used **once** in the combination.

```java
Example 1:

Input: candidates = [10,1,2,7,6,1,5], target = 8
Output: 
[
[1,1,6],
[1,2,5],
[1,7],
[2,6]
]

Example 2:

Input: candidates = [2,5,2,1,2], target = 5
Output: 
[
[1,2,2],
[5]
]
```

![image-20210918174916030](https://p.ipic.vip/f75ma8.jpg)

**key**

```
// remove duplicated path
if(i > start && candidates[i] == candidates[i - 1] && st[i-1] == false){
	continue;
}
```




```java
class Solution {
    
    List<List<Integer>> res = new ArrayList<>();
    LinkedList<Integer> path = new LinkedList<>();
    boolean[] st;
    public List<List<Integer>> combinationSum2(int[] candidates, int target) {
        
        Arrays.sort(candidates);
        st = new boolean[candidates.length];
        dfs(0, 0, candidates, target);
        return res;
        
    }
    
    private void dfs(int curSum, int start, int[] candidates, int target){
        
        if(curSum > target){
            return;
        }
        
        if(curSum == target){
            res.add(new ArrayList<>(path));
            return;
        }
        
        for(int i = start; i < candidates.length; i++){
            
            // remove duplicated path
            if(i > start && candidates[i] == candidates[i - 1] && st[i-1] == false){
                continue;
            }
            
            path.add(candidates[i]);
            curSum += candidates[i];
            st[i] = true;
            
            dfs(curSum, i + 1, candidates, target); // next level 
            
            st[i] = false;
            curSum -= candidates[i];
            path.removeLast();
            
        } 
    }
}
```



### 5 Permutations

46. Permutations

[leetcode](https://leetcode.com/problems/permutations/)

Given an array `nums` of distinct integers, return *all the possible permutations*. You can return the answer in **any order**.

```
Example 1:

Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
Example 2:

Input: nums = [0,1]
Output: [[0,1],[1,0]]
Example 3:

Input: nums = [1]
Output: [[1]]
```



```java
class Solution {
    
    private List<Integer> path = new ArrayList<>();
    private List<List<Integer>> res = new ArrayList<>();
    private int n;
    private boolean[] st;
    
    public List<List<Integer>> permute(int[] nums) {
        
        n = nums.length;
        st = new boolean[n];
        dfs(0, nums);
        return res;
        
    }
    
    private void dfs(int u, int[] nums){
        if(u == n){
            res.add(new ArrayList<>(path));
            return;
        }
        for(int i = 0; i < n; i++){
            if(!st[i]){
                path.add(nums[i]);
                st[i] = true;
                dfs(u + 1, nums);
                path.remove(path.size() - 1);    
                st[i] = false;
            }
            
        }
    }
}
```



### 6 Permutations II

47. Permutations II

==If you want to return all unique permutations, you need to do` nums[i] == nums[i-1] && st[i-1] = false`==



Given a collection of numbers, `nums`, that might contain duplicates, return *all possible unique permutations **in any order**.*

```
Example 1:

Input: nums = [1,1,2]
Output:
[[1,1,2],
 [1,2,1],
 [2,1,1]]
Example 2:

Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
```



```java
class Solution {
    
    List<List<Integer>> res = new ArrayList<>();
    List<Integer> path = new ArrayList<>();
    boolean[] st;
    
    public List<List<Integer>> permuteUnique(int[] nums) {
        int len = nums.length;
        st = new boolean[len];
        
        Arrays.sort(nums);
        dfs(nums);
        return res;
        
    }
    private void dfs(int[] nums){
        
        if(path.size() == nums.length){
            res.add(new ArrayList<>(path));
            return;
        }
        
        for(int i = 0; i < nums.length; i++){
            
            if(i > 0 && nums[i] == nums[i - 1] && st[i-1] == false){
                continue;
            }
            if(!st[i]){
                path.add(nums[i]);
                st[i] = true;
                dfs(nums);
                st[i] = false;
                path.remove(path.size() - 1);    
            }
        }
        
    }
}
```



### 7. N-Queens

[Acwing](https://www.acwing.com/problem/content/845/)/[leetcode](https://leetcode.com/problems/n-queens/)

The **n-queens** puzzle is the problem of placing `n` queens on an `n x n` chessboard such that no two queens attack each other.

<img src="https://p.ipic.vip/nv3na8.jpg" alt="image-20210904151504135" style="zoom:80%;" />

<img src="https://p.ipic.vip/4tcunx.jpg" alt="image-20210904151545659" style="zoom:50%;" />



![image-20210921214641084](https://p.ipic.vip/dzdadg.jpg)

Acwing version

```java
import java.util.*;

public class Main{
  static int n; // the size of chesseboard
  static int N = 20;
  static char[][] g = new char[N][N]; // current putting
  static boolean[] col = new boolean[N]; // column has chesse or not
  static boolean[] dg = new boolean[N];  // diagonal has chesse or not
  static boolean[] udg = new boolean[N]; // un-diagonal has chesse or not
  
  public static void main(String[] args){
    
    Scanner sc = new Scanner(System.in);
    n = sc.nextInt();
    
    // make a empty chesseboard
    for(int i = 0; i < n; i++){
      for(int j = 0; j < n; j++){
        g[i][j] = '.';
      }
    }
    dfs(0);
  }
  
  static void dfs(int u){
    if(u==n){
      for(int i = 0; i < n; i++){
        for(int j = 0; j < n; j++){
          System.out.print(g[i][j]);
        }
        System.out.println("");
      }
      System.out.println("");
    }
    
    for(int i = 0; i < n; i++){
      if(!col[i] && !dg[i-u+n] && !udg[i+u]){
        g[u][i] = 'Q';
        col[i] = dg[i-u+n] = udg[i+u] = true;
        dfs(u+1);
        col[i] = dg[i-u+n] = udg[i+u] = false;
        g[u][i] = '.';
      }
    }
  }
  
}
```



LeetCode

```java
class Solution {
    
    private int N = 20;
    private char[][] grid = new char[N][N];
    private boolean[] col = new boolean[N];
    private boolean[] dg = new boolean[N];
    private boolean[] udg = new boolean[N];
    private List<List<String>> res = new ArrayList<>();
    
    public List<List<String>> solveNQueens(int n) {
        
        // make a empty chesseboard
        for(int i = 0; i < n; i++){
            for(int j = 0; j < n; j++){
                grid[i][j] = '.';
            }
        }
        
        dfs(0, n);
        return res;
    }
    
    private void dfs(int u, int n){
        if(u == n){
            List<String> temp = new ArrayList<>();
            for(int i = 0; i < n; i++){
                StringBuffer sb = new StringBuffer();
                for(int j = 0; j < n; j++){
                    sb.append(grid[i][j]);
                    System.out.print(grid[i][j]);
                }
                System.out.println("");
                String colStr = sb.toString();
                temp.add(colStr);
            }
            System.out.println("");
            res.add(new ArrayList<>(temp));
            
            return;
            
        }
                
        
        for(int i = 0; i < n; i++){
            if(!col[i] && !dg[i-u+n] && !udg[i+u]){
                grid[u][i] = 'Q';
                col[i] = dg[i-u+n] = udg[i+u] = true;
                dfs(u+1, n);
                col[i] = dg[i-u+n] = udg[i+u] = false;
                grid[u][i] = '.';
            } 
        }     
    }
}
```







### 8. Longest Univalue Path (TBD)

687\. Longest Univalue Path (Easy)

[Leetcode](https://leetcode.com/problems/longest-univalue-path/) 

```html
             1
            / \
           4   5
          / \   \
         4   4   5

Output : 2
```

Create a function `int univaluePath()`

1. root must be used
2. update ans, can be both child
3. return longest path with only one child

```java
private int path = 0;

public int longestUnivaluePath(TreeNode root) {
    dfs(root);
    return path;
}

private int dfs(TreeNode root){
    // 
    if (root == null) return 0;
    int left = dfs(root.left);
    int right = dfs(root.right);
    int leftPath = root.left != null && root.left.val == root.val ? left + 1 : 0;
    int rightPath = root.right != null && root.right.val == root.val ? right + 1 : 0;
    path = Math.max(path, leftPath + rightPath);
    return Math.max(leftPath, rightPath);
}
```



## BFS

### 1 Acwing 844 Walk the maze

[Acwing](https://www.acwing.com/problem/content/description/846/)

```
Given an n×m two-dimensional integer array used to represent a maze, the array only contains 0 or 1, where 0 means a way to go, and 1 means an impassable wall.

Initially, there is a person at the upper left corner (1,1), and it is known that the person can move up, down, left, and right one position at a time.

How many times the person needs to move from the upper left corner to the lower right corner (n,m) at least.

The data guarantees that the numbers at (1,1) and (n,m) are 0, and there must be at least one path.

Input
The first line contains two integers n and m.

The next n lines, each line contains m integers (0 or 1), representing a complete two-dimensional array maze.
5 5
0 1 0 0 0
0 1 0 1 0
0 0 0 0 0
0 1 1 1 0
0 0 0 1 0

Output format
8 
Output an integer that represents the minimum number of moves from the upper left corner to the lower right corner.
```

<img src="https://p.ipic.vip/mrz6uh.jpg" alt="image-20210904202353220" style="zoom:50%;" />


```java
import java.io.*;

public class Main {
  
  
  private static int N = 120;
  private static int n, m;
  private static int[][] g = new int[N][N]; // save local map
  private static int[][] d = new int[N][N]; // make searched distance
  private static PII[] q = new PII[N * N]; 
  
  public static void main(String[] args) throws IOException{
    
    BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    String[] strs1 = br.readLine().split(" ");
    n = Integer.parseInt(strs1[0]);
    m = Integer.parseInt(strs1[1]);
    
    // read maze from bufferedReader
    for(int i = 0; i < n; i++){
      String[] strs2 = br.readLine().split(" ");
      for(int j = 0; j < m; j++){
        g[i][j] = Integer.parseInt(strs2[j]);
      }
    }
    System.out.println(bfs());
    br.close();
    
  }
    private static int bfs(){
    
    // initial all distance = -1
    for(int i = 0; i < d.length; i++){
      for(int j = 0; j < d[i].length; j++){
        d[i][j] = -1;
      }
    }
    
    // define move label
    int[] dx = {-1, 0, 1, 0}, dy = {0, 1, 0, -1};
    
    // initial queue
    d[0][0] = 0;
    int hh = 0, tt = 0;
    q[0] = new PII(0,0); // insert frist point
    
    while(hh <= tt){
      PII t = q[hh++];
      for(int i = 0; i < 4; i++){
        int x = t.getFirst() + dx[i], y = t.getSecond() + dy[i];
        if(x >= 0 && x < n && y >=0 && y < m && g[x][y] == 0 && d[x][y] ==-1){
          d[x][y] = d[t.getFirst()][t.getSecond()] + 1;
          q[++tt] = new PII(x, y);
        }
        
      }
    }
    
    return d[n-1][m-1];
    
  }
  
}

class PII {
  private int frist;
  private int second;
  
  public PII(int frist, int second){
    this.frist = frist;
    this.second = second;
  }
  
  public PII(){
    
  }
  
  public int getFirst(){
    return frist;
  }
  
  public int getSecond(){
    return second;
  }
}
```



Not strcuture body by Queue<> q = new LinkedList<>();

```java
import java.io.*;
import java.util.*;

public class Main{
  
  private static int n, m;
  private static int[][] g;
  private static int[][] dist;
  private static int[] dx = {0, 1, 0, -1};
  private static int[] dy = {1, 0, -1, 0};
  
  
  public static void main(String[] args) throws IOException{
    
    InputStream is = System.in;
    InputStreamReader isr = new InputStreamReader(is);
    BufferedReader br = new BufferedReader(isr);

    String[] str1 = br.readLine().split(" ");
    n = Integer.parseInt(str1[0]);
    m = Integer.parseInt(str1[1]);

    g = new int[n][m];
    dist = new int[n][m];


    for(int i = 0; i < n; i++){
        String[] strs2 = br.readLine().split(" ");
        for(int j = 0; j < m; j++){
            g[i][j] = Integer.parseInt(strs2[j]);
        }
    }

    System.out.println(bfs());
    br.close();
  }

  private static int bfs(){

      // initial all distance = -1 to set them not be visited
      for(int i = 0; i < dist.length; i++){
          for(int j = 0; j < dist[i].length; j++){
              dist[i][j] = -1;
          }
      }

      Queue<int[]> q = new LinkedList<>();
      // add first start point
      q.add(new int[]{0, 0});
      dist[0][0] = 0;
      int d = 0;

      while(q.size() > 0){
          d++;
          int size = q.size();
          // System.out.println("next layer queue size: " + size);
          for(int i = 0; i < size; i++){
              int[] curP = q.poll();
              // got to four direction
              for(int k = 0; k < 4; k++){
                  int x = curP[0] + dx[k];
                  int y = curP[1] + dy[k];
                  if(x < 0 || x > n - 1 || y < 0 || y > m - 1 || g[x][y] == 1 || dist[x][y] != -1) continue;
                  dist[x][y] = d;
                  // System.out.println("current pos:" + x + " " + y);
                  // System.out.println("current distance: " + d);
                  q.offer(new int[]{x, y});
              }
          }
      }
      
      return dist[n-1][m-1];
  }
}
```





### 2. Average of Levels in Binary Tree

637\. Average of Levels in Binary Tree (Easy)

[Leetcode](https://leetcode.com/problems/average-of-levels-in-binary-tree/description/)

```java
public List<Double> averageOfLevels(TreeNode root) {
    List<Double> ret = new ArrayList<>();
    if (root == null) return ret;
    Queue<TreeNode> queue = new LinkedList<>();
    queue.add(root);
    while (!queue.isEmpty()) {
        int cnt = queue.size();
        double sum = 0;
        for (int i = 0; i < cnt; i++) {
            TreeNode node = queue.poll();
            sum += node.val;
            if (node.left != null) queue.add(node.left);
            if (node.right != null) queue.add(node.right);
        }
        ret.add(sum / cnt);
    }
    return ret;
}
```

### 3.Find Bottom Left Tree Value

513\. Find Bottom Left Tree Value (Easy)

[Leetcode](https://leetcode.com/problems/find-bottom-left-tree-value/description/) 

```html
Input:

        1
       / \
      2   3
     /   / \
    4   5   6
       /
      7

Output:
7
```

```java
public int findBottomLeftValue(TreeNode root) {
    Queue<TreeNode> queue = new LinkedList<>();
    queue.add(root);
    while (!queue.isEmpty()) {
        root = queue.poll();
        if (root.right != null) queue.add(root.right);
        if (root.left != null) queue.add(root.left);
    }
    return root.val;
}
```



### 4. Shortest Distance from All Buildings

317. Shortest Distance from All Buildings



![image-20211005234225961](https://p.ipic.vip/qqgwql.jpg)



```java
class Solution {
    
    private int[] dx = {0, 1, 0, -1};
    private int[] dy = {1, 0, -1, 0};
     
    public int shortestDistance(int[][] grid) {
        
        if(grid.length < 1 || grid[0].length < 1) return -1;
        
        int rows = grid.length;
        int cols = grid[0].length;
        // save the number of (x, y) can reach to the building
        int[][] canReach = new int[rows][cols];
        // save sum dist of (x, y) can reach to the building 
        int[][] dist = new int[rows][cols];
        
        int totalBuildings = 0;
        for(int i = 0 ; i < rows; i++){
            for(int j = 0; j < cols; j++){
                if(grid[i][j] == 1){ // find building to empty land
                    totalBuildings++;
                    bfs(grid, i, j, canReach, dist);
                }
            }
        }
        
        
        int minDist = Integer.MAX_VALUE;
        for(int i = 0; i < rows; i++){
            for(int j = 0; j < cols; j++){
                if(canReach[i][j] == totalBuildings && dist[i][j] < minDist){
                    minDist =  dist[i][j];
                }
            }
        }
        
        return minDist == Integer.MAX_VALUE? -1: minDist;
    }
    
    private void bfs(int[][] grid, int x, int y, int[][] canReach, int[][] dist){
        int m = grid.length, n = grid[0].length;
        Queue<int[]> q = new LinkedList<>();
        boolean[][] st = new boolean[m][n];
        
        int d = 0; // current (x, y) distance
        q.offer(new int[]{x, y});
        st[x][y] = true;
        
        while(!q.isEmpty()){
            d++; // the distance of next layer are all d
            int size = q.size();
            
            for(int i = 0; i < size; i++){
                int[] cur = q.poll();
                for(int k = 0; k < 4; k++){
                    int nx = dx[k] + cur[0];
                    int ny = dy[k] + cur[1];
                    if(!isValid(grid, nx, ny, st)) continue;
                    st[nx][ny] = true;
                    q.offer(new int[]{nx, ny});
                    dist[nx][ny] += d;
                    canReach[nx][ny]++;
                }
                
                
            }
        }
        
    }
    
    private boolean isValid(int[][] grid, int x, int y, boolean[][] st){
        
        if(x < 0 || x > grid.length -1 || y < 0 || y > grid[0].length - 1) return false;
        
        if(st[x][y]) return false;
        if(grid[x][y] != 0) return false;
        return true;
    }
}
```



## Traversal

```
  1
 / \
2   3
   / \
  4   5
```

![image-20210905125727097](https://p.ipic.vip/3x0j4d.jpg)

```html
    1
   / \
  2   3
 / \   \
4   5   6
```

- level traversal：[1 2 3 4 5 6]
- preorder traversal：[1 2 4 5 3 6]
- inorder traversal：[4 2 5 1 3 6]
- postorder traversal：[4 5 2 6 3 1]

Level travesal can be achieved by BFS, using the characters of BFS.

However preorder/inorder/postorder achieved by DFS, among that, there has different in  visit order.

① Pre-order

```java
void dfs(TreeNode root) {
    visit(root);
    dfs(root.left);
    dfs(root.right);
}
```

② In-order

```java
void dfs(TreeNode root) {
    dfs(root.left);
    visit(root);
    dfs(root.right);
}
```

③ Post-order

```java
void dfs(TreeNode root) {
    dfs(root.left);
    dfs(root.right);
    visit(root);
}
```



### 1.  [B]Binary Tree Preorder Traversal

144\. Binary Tree Preorder Traversal (Medium)

[Leetcode](https://leetcode.com/problems/binary-tree-preorder-traversal/description/)

```java
// Basic Solution 1
class Solution {
    List<Integer> res = new ArrayList<>();
    public List<Integer> preorderTraversal(TreeNode root) {
        // preoder root-> left -> right
        if(root == null) return res;
        dfs(root);
        return res;
        
    }
    
    private void dfs(TreeNode root){
        if(root == null) return;
        res.add(root.val); // visit(root)
        dfs(root.left); // dfs(root.left)
        dfs(root.right); // dfs(root.right)
    }
}

// Advanced Solution 2
public List<Integer> preorderTraversal(TreeNode root) {
    List<Integer> ret = new ArrayList<>();
    Stack<TreeNode> stack = new Stack<>();
    stack.push(root);
    while (!stack.isEmpty()) {
        TreeNode node = stack.pop();
        if (node == null) continue;
        ret.add(node.val);
        stack.push(node.right);  // 先右后左，保证左子树先遍历
        stack.push(node.left);
    }
    return ret;
}
```

### 2.  [B]Binary Tree Postorder Traversal

145\. Binary Tree Postorder Traversal (Medium)

[Leetcode](https://leetcode.com/problems/binary-tree-postorder-traversal/description/)

Preorder is  root -\> left -\> right，Postorder is  left -\> right -\> root。

If we change Preorder to be  root -\> right -\> left, so we get the inverse sequence of postorder.

```java
// Basic Solution 1
class Solution {
    // postOrder left -> right -> root
    List<Integer> res = new ArrayList<>();
    
    public List<Integer> postorderTraversal(TreeNode root) {       
        if(root == null) return res;
        dfs(root);
        return res;
    }
    
    private void dfs(TreeNode root){
        if(root == null) return;
        dfs(root.left);
        dfs(root.right);
        res.add(root.val);
    }
}

// Advanced Solution 2
public List<Integer> postorderTraversal(TreeNode root) {
    List<Integer> ret = new ArrayList<>();
    Stack<TreeNode> stack = new Stack<>();
    stack.push(root);
    while (!stack.isEmpty()) {
        TreeNode node = stack.pop();
        if (node == null) continue;
        ret.add(node.val);
        stack.push(node.left);
        stack.push(node.right);
    }
    Collections.reverse(ret);
    return ret;
}
```

### 3.[B]Binary Tree Inorder Traversal

94\. Binary Tree Inorder Traversal (Medium)

[Leetcode](https://leetcode.com/problems/binary-tree-inorder-traversal/description/) 

```java
// Basic Solution 1
class Solution {
    // left - > root -> right
    
    private List<Integer> res = new ArrayList<>();
    public List<Integer> inorderTraversal(TreeNode root) {
        if(root == null) return res;
        dfs(root);
        return res;
    }
    
    void dfs(TreeNode root){
        if(root == null) return;       
        dfs(root.left);
        // visit(root.val);
        res.add(root.val);
        dfs(root.right);
        
    }
}

// Advanced Solution 2
public List<Integer> inorderTraversal(TreeNode root) {
    List<Integer> ret = new ArrayList<>();
    if (root == null) return ret;
    Stack<TreeNode> stack = new Stack<>();
    TreeNode cur = root;
    while (cur != null || !stack.isEmpty()) {
        while (cur != null) {
            stack.push(cur);
            cur = cur.left;
        }
        TreeNode node = stack.pop();
        ret.add(node.val);
        cur = node.right;
    }
    return ret;
}
```

### 5. Merge Two Binary Trees 

617\. Merge Two Binary Trees (Easy)

[Leetcode](https://leetcode.com/problems/merge-two-binary-trees/description/) 

```html
Input:
       Tree 1                     Tree 2
          1                         2
         / \                       / \
        3   2                     1   3
       /                           \   \
      5                             4   7

Output:
         3
        / \
       4   5
      / \   \
     5   4   7
```

![image-20210902225408248](https://p.ipic.vip/5m252b.jpg)

```java
    // preorder root-> left -> right
    // Not all the problem need to call dfs(), Especially the problem of trees!
    public TreeNode mergeTrees(TreeNode root1, TreeNode root2) {
        
        if(root1 == null) return root2;
        if(root2 == null) return root1;
        
        // visit root
        root1.val += root2.val;
        // left
        root1.left = mergeTrees(root1.left, root2.left);
        //right
        root1.right = mergeTrees(root1.right, root2.right);
        
        return root1;
    }
    
    // void dfs(TreeNode root){
    //     visit(root);
    //     dfs(root.left);
    //     dfs(root.right);
    // }
```



```java
public TreeNode mergeTrees(TreeNode t1, TreeNode t2) {
    if (t1 == null && t2 == null) return null;
    if (t1 == null) return t2;
    if (t2 == null) return t1;
    TreeNode root = new TreeNode(t1.val + t2.val);
    root.left = mergeTrees(t1.left, t2.left);
    root.right = mergeTrees(t1.right, t2.right);
    return root;
}
```

### 



## Binary Search Tree

**Binary Search Tree**（BST）：In computer science, a binary search tree, also called an ordered or sorted binary tree, is a rooted binary tree data structure whose internal nodes each store a key greater than all the keys in the node’s left subtree and less than those in its right subtree.

The inOrder trasveral of Binary Search Tree is Orderly

### 1. Trim a Binary Search Tree

669\. Trim a Binary Search Tree (Easy)

[Leetcode](https://leetcode.com/problems/trim-a-binary-search-tree/description/)

```html
Input:

    3
   / \
  0   4
   \
    2
   /
  1

  L = 1
  R = 3

Output:

      3
     /
   2
  /
 1
```

Given the `root` of a binary search tree and the lowest and highest boundaries as `low` and `high`, trim the tree so that all its elements lies in `[low, high]`

```java
class Solution {
    public TreeNode trimBST(TreeNode root, int low, int high) {
        if(root == null) return null;
        // if root.val not in [low, high] return subtree
        if(root.val > high) return trimBST(root.left, low, high); // root will be root.left if true
        if(root.val < low) return trimBST(root.right, low, high); // root will be root.right if true
        // deal with normal case
        root.left = trimBST(root.left, low, high); 
        root.right = trimBST(root.right, low, high);
        return root;
    }
}
```







### 2. Kth Smallest Element in a BST

230\. Kth Smallest Element in a BST (Medium)

[Leetcode](https://leetcode.com/problems/kth-smallest-element-in-a-bst/description/)

Inroder traversal

```java
class Solution {
    
    private List<Integer> arr = new ArrayList<>();
    
    public int kthSmallest(TreeNode root, int k) {
        if(root == null || k < 1) return 0;
        dfs(root);
        return arr.get(k-1);    
    }
    
    // inorder dfs(root.left) -> visit(root) -> dfs(root.right)
    private void dfs(TreeNode root){
        if(root == null) return;
        dfs(root.left);
        arr.add(root.val);
        dfs(root.right);
    }
}
```



### 3. Convert BST to Greater Tree

538 Convert BST to Greater Tree (Easy)

[Leetcode](https://leetcode.com/problems/convert-bst-to-greater-tree/description/)

```html
Input: The root of a Binary Search Tree like this:

              5
            /   \
           2     13

Output: The root of a Greater Tree like this:

             18
            /   \
          20     13
```

A Greater Tree such that every key of the original BST is changed to the original key plus sum of all keys greater than the original key in BST.

key: right -> root -> left

```java
class Solution {
    
    private int curSum = 0;
  
    public TreeNode convertBST(TreeNode root) {
        dfs(root);
        return root;
    }
    
    private void dfs(TreeNode root){ 
        if(root == null) return;
        dfs(root.right);
        curSum += root.val;
        root.val = curSum;
        dfs(root.left);
        
    }
}
```



### 4. Lowest Common Ancestor of a Binary Search Tree

235\. Lowest Common Ancestor of a Binary Search Tree (Easy)

[Leetcode](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/description/)

```html
        _______6______
      /                \
  ___2__             ___8__
 /      \           /      \
0        4         7        9
        /  \
       3   5

For example, the lowest common ancestor (LCA) of nodes 2 and 8 is 6. Another example is LCA of nodes 2 and 4 is 2, since a node can be a descendant of itself according to the LCA definition.
```

```java
class Solution {                               
    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
        
        // the node only has three states:
        // 1. p and q both are in right sub-tree (root less that p and q)
        // 2. p and q both are in left sub-tree(both greater than p and q)
        // 3. p and q the lowest common ancestor is root
        
        if(root.val > p.val && root.val > q.val) return lowestCommonAncestor(root.left, p, q);
    
        if(root.val < p.val && root.val < q.val) return lowestCommonAncestor(root.right, p, q);
        return root;
    }zw
}
```

### 5.  Lowest Common Ancestor of a Binary Tree

236\. Lowest Common Ancestor of a Binary Tree (Medium) 

[Leetcode](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/description/)

```html
       _______3______
      /              \
  ___5__           ___1__
 /      \         /      \
6        2       0        8
        /  \
       7    4

For example, the lowest common ancestor (LCA) of nodes 5 and 1 is 3. Another example is LCA of nodes 5 and 4 is 5, since a node can be a descendant of itself according to the LCA definition.
```

<img src="https://p.ipic.vip/s9q45k.jpg" alt="image-20210922233218284" style="zoom:50%;" />

From the above picture, we can know that the ancestors of Node 7 is Node 3, 5 ,2

If `root` is the common ancestor of `p` and `q`, only three conditions exist.

1. `p` and `q` are in the subtree of Node `root`, and in the left and right subtree seperately
2. `p = root`, and `q` is in the left subtree or right subtree
3. `q = root`, and `p` is in the left subtree or right subtree.

So, we can use preorder taversal 

```java
class Solution {
    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
        
        // preorder
        // deal wit root
        if(root == null || root == p || root == q) return root;
        // left
        TreeNode left = lowestCommonAncestor(root.left, p, q);
        // right
        TreeNode right = lowestCommonAncestor(root.right, p, q);
        
        // deal with three conditions of left and right
        if(left == null && right == null) return null;
        if(left == null) return right;
        if(right == null) return left;
        return root;
        
    }
}
```

### 6. Convert Sorted Array to Binary Search Tree

108\. Convert Sorted Array to Binary Search Tree (Easy)

[Leetcode](https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/description/)

```java
public TreeNode sortedArrayToBST(int[] nums) {
    return toBST(nums, 0, nums.length - 1);
}

private TreeNode toBST(int[] nums, int sIdx, int eIdx){
    if (sIdx > eIdx) return null;
    int mIdx = (sIdx + eIdx) / 2;
    TreeNode root = new TreeNode(nums[mIdx]);
    root.left =  toBST(nums, sIdx, mIdx - 1);
    root.right = toBST(nums, mIdx + 1, eIdx);
    return root;
}
```

### 7. Convert Sorted List to Binary Search Tree

109\. Convert Sorted List to Binary Search Tree (Medium)

[Leetcode](https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/description/)

```html
Given the sorted linked list: [-10,-3,0,5,9],

One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:

      0
     / \
   -3   9
   /   /
 -10  5
```

```java
class Solution {
    private List<Integer> arr = new ArrayList<>();
    
    public TreeNode sortedListToBST(ListNode head) {
        
        if(head == null) return null;
        while(head != null){
            arr.add(head.val);
            head = head.next;
        }
        
        return toBst(arr, 0, arr.size() - 1);
        
    }
    
    private TreeNode toBst(List<Integer> arr, int sIdx, int eIdx){
        
        if(sIdx > eIdx) return null;
        int mIdx = (sIdx + eIdx) / 2;
        TreeNode root = new TreeNode(arr.get(mIdx));
        root.left = toBst(arr, sIdx, mIdx - 1);
        root.right = toBst(arr, mIdx + 1, eIdx);
        
        return root;
    }
}
```



### 8. Two Sum IV - Input is a BST

653\. Two Sum IV - Input is a BST (Easy)

[Leetcode](https://leetcode.com/problems/two-sum-iv-input-is-a-bst/description/) 

```html
Input:

    5
   / \
  3   6
 / \   \
2   4   7

Target = 9

Output: True
```

Inorder traversal and two-point

```java
class Solution {
    
    private List<Integer> arr = new ArrayList<>();
    
    public boolean findTarget(TreeNode root, int k) {
        
        if(root == null) return false;
        dfs(root);
        
        int l = 0;
        int r = arr.size()  - 1;
        while(l < r){
            int sum = arr.get(l) + arr.get(r);
            if(sum > k){
                r--;
            }else if(sum < k){
                l++;
            }else{
                return true;
            }
        }
        
        return false;
        
    }
    
    private void dfs(TreeNode root){
        if(root == null) return;
        dfs(root.left);
        arr.add(root.val);
        dfs(root.right);
        
    }
}
```

### 9. Minimum Absolute Difference in BST

530\. Minimum Absolute Difference in BST (Easy)

[Leetcode](https://leetcode.com/problems/minimum-absolute-difference-in-bst/description/)

```html
Input:

   1
    \
     3
    /
   2

Output:

1
```

Inorder traversal + two point

```java
class Solution {
    
    private List<Integer> arr = new ArrayList<>();
    
    public int getMinimumDifference(TreeNode root) {
        
        dfs(root);
        int len = arr.size();
        int res  = Integer.MAX_VALUE;
        for(int i = 0; i < len - 1; i++){
            int curVal = arr.get(i+1) -arr.get(i);
            if(curVal < res){
                res = curVal;
            }
        }
        return res;
    }
    
    private void dfs(TreeNode root){
        if(root == null) return;
        dfs(root.left);
        arr.add(root.val);
        dfs(root.right);
    }
    
}
```

### 10. Find Mode in Binary Search Tree

501\. Find Mode in Binary Search Tree (Easy)

[Leetcode](https://leetcode.com/problems/find-mode-in-binary-search-tree/description/)

```html
   1
    \
     2
    /
   2

return [2].
```

**Key**: inorder ->  ascending list, we can use preVal and curVal to count curTimes

```java
class Solution {
    
    private int preVal = 0;
    private int curTimes = 0;
    private int maxTimes = 0;
    private List<Integer> list = new ArrayList<>();
    
    
    public int[] findMode(TreeNode root) {
        
        dfs(root);
        int n = list.size();
        int[] res = new int[n];
        int count = 0;
        for(int i = 0; i < n; i++){
            res[count++] = list.get(i);
        }
        return res;
    }
    
    private void dfs(TreeNode root){
        
        if(root == null) return;
        
        dfs(root.left);
        
        // compare current val and last val
        if(preVal == root.val){
            curTimes++;
        }else{
            preVal = root.val;
            curTimes = 1;
        }
        
        
        // compare current time and max time
        if(curTimes == maxTimes){
            list.add(root.val);
        }else if(curTimes > maxTimes){
            list.clear();
            list.add(root.val);
            maxTimes = curTimes;
        }
        
        dfs(root.right);
        
    }
}
```
