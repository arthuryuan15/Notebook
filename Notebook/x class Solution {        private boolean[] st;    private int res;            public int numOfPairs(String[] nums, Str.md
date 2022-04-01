1111


```java
class Solution {
    
    private boolean[] st;
    private int res;
        
    public int numOfPairs(String[] nums, String target) {
        
        if(nums.length < 1) return 0;
        int len = nums.length;
        st = new boolean[len];
        dfs(0, "", nums, target);
        return res;
        
    }
    
    private void dfs(int u, String temp, String[] nums, String target){
        
        if(target.length() < temp.length() || !target.substring(0, temp.length()).equals(temp)){
            return;
        }
        
        // check only two to select 
        if(u == 2){
            System.out.println(temp);
            if(temp.equals(target)){
                res++;
            }
        }
        
        for(int i = 0; i < nums.length; i++){
            if(!st[i] && target.length() > temp.length()){
                st[i] = true;
                dfs(u + 1, temp + nums[i], nums, target);
                st[i] = false;
            }
        }
        
    }
    
}
```



```java
class Solution {
    
    private List<Integer> arr = new ArrayList<>();
    private int res = 0;
    private boolean[] st;
    
    
    public int maxConsecutiveAnswers(String answerKey, int k) {
        
        st = new boolean[answerKey.length()];
        
        for(int i = 0; i <= k; i++){
            dfs(0, i, answerKey);
        }
        
        return res;
    }
    
    private void dfs(int u, int k, String answerKey){
        
        if(u == k){
            // get k time to turn
            res = Math.max(res, getMaxCon(arr, answerKey));
            // System.out.println("------");
        }
        
        for(int i = 0; i < answerKey.length(); i++){
            if(!st[i]){
                arr.add(i);
                st[i] = true;
                
                dfs(u + 1, k, answerKey);
                
                st[i] = false;
                arr.remove(arr.size() - 1);
            }
        }
        
    }
    
    private int getMaxCon(List<Integer> arr, String answerKey){
        int resMax = 1;
        int curMax = 1;
        
        char lastB = answerKey.charAt(0);
        for(int i = 1; i < answerKey.length(); i++){
            
            char curB = answerKey.charAt(i);
            
            if(arr.contains(i)){ // if need to turn
                if(curB == 'T'){
                    curB = 'F';
                }else{
                    curB = 'T';
                }
            }
            
            if(lastB == curB){
                curMax++;
                // System.out.print(curB + " ");
                resMax = Math.max(curMax, resMax);
            }else{
                lastB = curB;
                curMax = 1;
            }
        }
        
        return resMax;
    }
}
```

