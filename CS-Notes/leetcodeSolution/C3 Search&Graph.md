### DFS

### 1 The Time When the Network Becomes Idle

  2039 The Time When the Network Becomes Idle

```java
class Solution {
    
    int N = 200100;
    int[] e = new int[N];
    int[] ne = new int[N*2];
    int[] h = new int[N];
    int[] d = new int[N];
    boolean[] st = new boolean[N];
    int idx = 0;
    int n;
    
    public int networkBecomesIdle(int[][] edges, int[] patience) {
        
        n = patience.length;
        for(int i = 0; i < N; i++) h[i] = -1;
        
        for(int i = 0; i < edges.length; i++){
            int x = edges[i][0] + 1;
            int y = edges[i][1] + 1;
            add(x, y);
            add(y, x);
            
        }
        
        int a = bfs();
        int res = 0;
        
        for(int i = 2; i <= n; i++){
            int lastTime = d[i] * 2;
            int now = 0;
            
            if(lastTime % patience[i-1] == 0){
                now = (lastTime - patience[i-1] + d[i] * 2);
            }else{
                now = ((lastTime / patience[i-1]) * patience[i-1]) + d[i] * 2;
            }
            
            res = Math.max(res, now);
        }
        
        return res + 1;
    }
        
    
    void add(int a, int b){
        e[idx] = b;
        ne[idx] = h[a];
        h[a] = idx++;
    }
  
    int bfs(){
    
        Queue<Integer> queue = new LinkedList<>();
        queue.add(1); 
    
        for(int i = 0; i < N; i++) d[i] = -1; 
        d[1] = 0;
    
        while(queue.size() > 0){
            int t = queue.poll();
            for(int i = h[t]; i != -1; i = ne[i]){
                int j = e[i];
                if(d[j] == -1){
                    d[j] = d[t] + 1;
                    queue.add(j);
                }
            }
        }
    
        return d[n];
    }
}
```

