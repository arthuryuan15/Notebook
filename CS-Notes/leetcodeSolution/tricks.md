# 1 Sort

## Sort int[]

1. Ascending 

    ```java
    int[] nums1 = {3, 8, 5, 6};
    Arrays.sort(nums1);
    System.out.println(Arrays.toString(nums1)); // [3, 5, 6, 8]
    ```

    

2. Decending

    ```java
    Integer[] nums1 = {3, 8, 5, 6};
    // need Integer
    Arrays.sort(nums1, Collections.reverseOrder());
    
    int[] nums1 = {3, 8, 5, 6};
    Arrays.sort(nums1);
    
    int[]
    for(int i = 0; i < n; i++)
    ```

    

## Sort by class parameter

2. Ascending class by a parameter 

   ```java
   public static class Edge{
     int a,b,c;
     public Edge(int a, int b, int c) {
       this.a = a;
       this.b = b;
       this.c = c;
     }
   }
   // If you want to use this, you need to set scope  in edges
   Arrays.sort(edges, 0, n, (o1, o2)->{
     return o1.c-o2.c;
   }); // 不包含n
   ```

   ```java
   Arrays.sort(edges, new Comparator<Edge>(){
    //将两边的权值按照从小到大排序
    @Override
    public int compare(Edge o1, Edge o2){
        return o1.c-o2.c;
    }
   });
   ```

3. sort part of aray

   ```java
   int N = 5010;
   int[][] arr = new int[N][2]; // citys 
   
   // because you made a large array, and you want to sort some of them
   Arrays.sort(arr, 0, n, (o1, o2) -> {return o1[0] - o2[0];});
   ```

   

## Sort **2d** `int[][]`

1. Ascending order by frist number

```java
int[][] nums = {{3, 2}, {2, 3}, {2, 4}};
Arrays.sort(nums, (o1, o2) ->{
	return o1[0] - o2[0];   // normal ascending, because if ture, we need to adjust.
});

2 3 
2 4 
3 2
```

```java
int[][] nums = {{3, 2}, {2, 3}, {2, 4}};
Arrays.sort(nums, new Comparator<int[]>() {
  @Override
  public int compare(int[] o1, int[] o2) {
    return o1[0] - o2[0];
  }
});
```



1. Descending order by frist number

```java
int[][] nums = {{3, 2}, {2, 3}, {2, 4}};
Arrays.sort(nums, (o1, o2) ->{
	return o2[0] - o1[0]; // need > 0 to be true, so o2[]
});
3 2 
2 3 
2 4
```

3. Descending order by second number

```java
int[][] nums = {{3, 2}, {2, 3}, {2, 4}};
Arrays.sort(nums, (o1, o2) ->{
  return o2[1] - o1[1]; // need > 0 to be true, so o2[]
});
2 4 
2 3 
3 2
```

4. Ascending order by frist number if same by second one

```java
Arrays.sort(nums, (o1, o2) ->{
	if(o1[0] == o2[0]) {
		return o1[1] - o2[1];
	}
	return o2[0] - o1[0];
});
````

`order by o2[0] first, order by o1[1] secondly`

Note:

Ascending rules:1 2 3

- o1> o2, return a positive number, true, indicate the need to adjust the order, ascending.
- o1 <o2, return a negative number, false, indicating that the order does not need to be adjusted, ascending order.

Descending rule: 3 2 1

- o1> o2, return a negative number, false, indicating that the order does not need to be adjusted, descending order.
- o1 <o2, return a positive number, true, indicate the need to adjust the order, descending order. To

No sorting rules:

- o1 = o2, return 0, just follow the current order, or compare other parameters.



## Sort List

```java
List<Integer> res = new ArrayList<>();

Collections.sort(res);
```



## sort map by key

Using the `TreeMap` you can sort the map.

```java
Map<String, String> map = new HashMap<>();        
Map<String, String> treeMap = new TreeMap<>(map);
for (String str : treeMap.keySet()) {
    System.out.println(str);
}
```



## sort Character

1.   Ascending

     ```java
     char[] chrs = new char[]{'a', 'b', 'a'};
     
     Arrays.sort(chrs); 
     System.out.println(Arrays.toString(chrs));
     ```

     

2.   Decending

     ```java
     char[] chrs = new char[]{'a', 'b', 'a'};
     Arrays.sort(chrs);
     
     // add external code
     a = new char[n];
     for(int i = 0; i < n; i++) a[i] = arr[n - i - 1];
     
     System.out.println(Arrays.toString(a));
     ```

     

## sort String

`a.compareTo(b)`

```java
String[] strs = new String[]{"abcd", "acd"};

Arrays.sort(strs, (o1, o2) -> {
		return o1.compareTo(o2); // ascending
});
System.out.println(Arrays.toString(strs));

Arrays.sort(strs, (o1, o2) -> {
		return o2.compareTo(o1); // descending
});
System.out.println(Arrays.toString(strs));
```



>   1.   the result is a negative integer if this String object lexicographically precedes the argument string.   a < b(b的位置靠后) => negative 不一定是-1
>   2.   The result is a positive integer if this String object lexicographically follows the argument string.   b < a (a的位置靠后) => positive
>   3.   The result is zero if the strings are equal;  a ==b => 0



# 2 Character

1.   isLetter isCharacter

```java
Character.isLetter(s.charAt(i))
```

2.   Consider iterater all 26 character

# 3 Number

```java
// 10^9+7 
static int mod = (int)1e9 + 7;
```



# 4 Print

*Arrays.toString()*

```java
int nums = {6, 2, 9, 1};
System.out.println(Arrays.toString(arr)); // [6, 2, 9, 1]
```



# 5 no { } in loop

only one line in the loop no need backet

```java
for(int i = 1; i <= n; i++)
  for(int j = 1; j <= m; j++)
    w[i][j] = sc.nextInt();
        
      
for(int i = 1; i <= n; i++)
  for(int j = 1; j<= m; j++)
    f[i][j] = Math.max(f[i-1][j], f[i][j-1]) + w[i][j];
```



# 6 Array copy

1. one dimenstion

```java
int[] src = new int[N];
int[] dst = new int[N];
dst = Arrays.copyOf(src, src.length);
```

```java
System.arraycopy(temp, startidx, c, startidx, c.length); // copy temp to existing c, please use this one
```

**Arrays.copyOf** does not only copy elements, it also creates a new array. 

**System. arraycopy ** copies into an existing array.

2. two deimenstion

```java
public static int[][] copy(int[][] src) {
    int[][] dst = new int[src.length][];
    for (int i = 0; i < src.length; i++) {
        dst[i] = Arrays.copyOf(src[i], src[i].length);
    }
    return dst;
}
```



## 6.1 ArrayList copy

```java
List<Integer> newList = new ArrayList<>(oldList);
```



# 7 Array fill

```java
int[] f = new int[10];
Arrays.fill(f, -1); // one dimension

```



# 8 heap

```java
Queue<Integer> minHeap = new PriorityQueue<>(); 

minHeap.add(1); // O(log(n))
minHeap.add(2);

System.out.println(minHeap.peek());

System.out.println(minHeap.size());

minHeap.poll(); // O(log(n))

minHeap.remove(2); // O(n) don't the reference of value

// maxHeap
PriorityQueue<Integer>  maxHeap = new PriorityQueue<>((o1, o2)-> o2 - o1);
PriorityQueue<PIS>  heap = new PriorityQueue<>((o1, o2)-> o2.x - o1.x);
Queue<Integer> maxHeap2 = new PriorityQueue<>(Collections.reverseOrder());

// long long compare
static PriorityQueue<long[]> heap1 = new PriorityQueue<>((o1, o2) -> {return Long.compare(o1[0], o2[0]);}); // price and idx
```



# 9 iostream

Note: you can use **StringBuilder** and ouput String in a line as well



```java
   public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
	
	String[] str = br.readLine().split(" ");
	
	bw.write(a[1]);
  bw.write("\n");
  // bw.write(String.valueOf(dp[n][m])); out number 
	bw.flush();
```





# 10 Quick Reader



```java
    static class FastScanner {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer("");
        String next(){
            while(!st.hasMoreTokens()){
                try{
                    st = new StringTokenizer(br.readLine());
                }catch (IOException e) {
                    e.printStackTrace();
                }
            }
            return st.nextToken();
        }
        int nextInt(){
            return Integer.parseInt(next());
        }

        int[] readArray(int n){
            int[] a = new int[n];
            for(int i = 0; i < n; i++) a[i] = nextInt();
            return a;
        }

        long nextLong(){
            return Long.parseLong(next());
        }
    }

```



```java
    static class FastScanner {

        public BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        public StreamTokenizer st = new StreamTokenizer(br);
    
        public void token() {
            try {
                st.nextToken();
            } catch (IOException e) {}
        }
    
        public int nextInt() {
            token();
            return (int)st.nval;
        }
    
        public String next() { // String
            token();
            return st.sval;
        }
    }
```





```java
static StreamTokenizer in = new StreamTokenizer(new BufferedReader(new InputStreamReader(System.in)));

static PrintWriter out = new PrintWriter(new OutputStreamWriter(System.out));

public static double nextDouble() throws IOException{ in.nextToken(); return in.nval; }

public static float nextFloat() throws IOException{ in.nextToken(); return (float)in.nval; }

public static int nextInt() throws IOException { in.nextToken(); return (int)in.nval; }

public static String next() throws IOException{ in.nextToken(); return in.sval;}

static BufferedReader re = new BufferedReader(new InputStreamReader(System.in));
```

该模板中的next方法在读取字符串的时候，如果读取的字符串开头有数字，st类就会默认以数字方式处理字符串，因为StreamTokenizer类里面有个参数是ttType，该类型决定了你的nextToken的处理类型，如果你输入的开始是例如123abc，他的ttType就是number类型，如果你的输入是例如abcder，他的ttType类型就是word类型，所以可以用readLine来读，但是readLine不要和StreamTokenizer混着使用，会读空字符串的



uwi

```java
import java.io.*;
import java.util.*;
 
public class E {
	InputStream is;
	FastWriter out;
	String INPUT = "";
	
	void solve()
	{
		int n = ni();
		int[] ms = new int[n];
		int[] ks = new int[n];
		for(int i = 0;i < n;i++){
			ms[i] = ni();
			ks[i] = ni();
		}
		long bnum = 0;
		long bden = 1;
		int[] seled = new int[]{1};
 
		for(int pin = 1;pin <= 20;pin++){
			long[][] hi = new long[200001][2];
			for(int i = 0;i < 200001;i++){
				hi[i][1] = i;
			}
			for(int i = 0;i < n;i++){
				hi[ms[i]][0] += Math.min(pin, ks[i]);
			}
			Arrays.sort(hi, Comparator.comparingLong(x -> x[0]));
			long num = 0;
			for(int i = 0;i < pin;i++){
				num += hi[200000-i][0];
			}
			long den = pin;
			if(bnum * den < num * bden){
				bnum = num;
				bden = den;
				seled = new int[pin];
				for(int i = 0;i < pin;i++){
					seled[i] = (int)hi[200000-i][1];
				}
			}
		}
		out.println(bden);
		out.println(seled);
	}
 
	void run() throws Exception
	{
		is = oj ? System.in : new ByteArrayInputStream(INPUT.getBytes());
		out = new FastWriter(System.out);
		
		long s = System.currentTimeMillis();
		solve();
		out.flush();
		tr(System.currentTimeMillis()-s+"ms");
	}
	
	public static void main(String[] args) throws Exception { new E().run(); }
	
	private byte[] inbuf = new byte[1024];
	public int lenbuf = 0, ptrbuf = 0;
	
	private int readByte()
	{
		if(lenbuf == -1)throw new InputMismatchException();
		if(ptrbuf >= lenbuf){
			ptrbuf = 0;
			try { lenbuf = is.read(inbuf); } catch (IOException e) { throw new InputMismatchException(); }
			if(lenbuf <= 0)return -1;
		}
		return inbuf[ptrbuf++];
	}
	
	private boolean isSpaceChar(int c) { return !(c >= 33 && c <= 126); }
	private int skip() { int b; while((b = readByte()) != -1 && isSpaceChar(b)); return b; }
	
	private double nd() { return Double.parseDouble(ns()); }
	private char nc() { return (char)skip(); }
	
	private String ns()
	{
		int b = skip();
		StringBuilder sb = new StringBuilder();
		while(!(isSpaceChar(b))){ // when nextLine, (isSpaceChar(b) && b != ' ')
			sb.appendCodePoint(b);
			b = readByte();
		}
		return sb.toString();
	}
	
	private char[] ns(int n)
	{
		char[] buf = new char[n];
		int b = skip(), p = 0;
		while(p < n && !(isSpaceChar(b))){
			buf[p++] = (char)b;
			b = readByte();
		}
		return n == p ? buf : Arrays.copyOf(buf, p);
	}
 
	private int[] na(int n)
	{
		int[] a = new int[n];
		for(int i = 0;i < n;i++)a[i] = ni();
		return a;
	}
 
	private long[] nal(int n)
	{
		long[] a = new long[n];
		for(int i = 0;i < n;i++)a[i] = nl();
		return a;
	}
 
	private char[][] nm(int n, int m) {
		char[][] map = new char[n][];
		for(int i = 0;i < n;i++)map[i] = ns(m);
		return map;
	}
 
	private int[][] nmi(int n, int m) {
		int[][] map = new int[n][];
		for(int i = 0;i < n;i++)map[i] = na(m);
		return map;
	}
 
	private int ni() { return (int)nl(); }
 
	private long nl()
	{
		long num = 0;
		int b;
		boolean minus = false;
		while((b = readByte()) != -1 && !((b >= '0' && b <= '9') || b == '-'));
		if(b == '-'){
			minus = true;
			b = readByte();
		}
 
		while(true){
			if(b >= '0' && b <= '9'){
				num = num * 10 + (b - '0');
			}else{
				return minus ? -num : num;
			}
			b = readByte();
		}
	}
 
	public static class FastWriter
	{
		private static final int BUF_SIZE = 1<<13;
		private final byte[] buf = new byte[BUF_SIZE];
		private final OutputStream out;
		private int ptr = 0;
 
		private FastWriter(){out = null;}
 
		public FastWriter(OutputStream os)
		{
			this.out = os;
		}
 
		public FastWriter(String path)
		{
			try {
				this.out = new FileOutputStream(path);
			} catch (FileNotFoundException e) {
				throw new RuntimeException("FastWriter");
			}
		}
 
		public FastWriter write(byte b)
		{
			buf[ptr++] = b;
			if(ptr == BUF_SIZE)innerflush();
			return this;
		}
 
		public FastWriter write(char c)
		{
			return write((byte)c);
		}
 
		public FastWriter write(char[] s)
		{
			for(char c : s){
				buf[ptr++] = (byte)c;
				if(ptr == BUF_SIZE)innerflush();
			}
			return this;
		}
 
		public FastWriter write(String s)
		{
			s.chars().forEach(c -> {
				buf[ptr++] = (byte)c;
				if(ptr == BUF_SIZE)innerflush();
			});
			return this;
		}
 
		private static int countDigits(int l) {
			if (l >= 1000000000) return 10;
			if (l >= 100000000) return 9;
			if (l >= 10000000) return 8;
			if (l >= 1000000) return 7;
			if (l >= 100000) return 6;
			if (l >= 10000) return 5;
			if (l >= 1000) return 4;
			if (l >= 100) return 3;
			if (l >= 10) return 2;
			return 1;
		}
 
		public FastWriter write(int x)
		{
			if(x == Integer.MIN_VALUE){
				return write((long)x);
			}
			if(ptr + 12 >= BUF_SIZE)innerflush();
			if(x < 0){
				write((byte)'-');
				x = -x;
			}
			int d = countDigits(x);
			for(int i = ptr + d - 1;i >= ptr;i--){
				buf[i] = (byte)('0'+x%10);
				x /= 10;
			}
			ptr += d;
			return this;
		}
 
		private static int countDigits(long l) {
			if (l >= 1000000000000000000L) return 19;
			if (l >= 100000000000000000L) return 18;
			if (l >= 10000000000000000L) return 17;
			if (l >= 1000000000000000L) return 16;
			if (l >= 100000000000000L) return 15;
			if (l >= 10000000000000L) return 14;
			if (l >= 1000000000000L) return 13;
			if (l >= 100000000000L) return 12;
			if (l >= 10000000000L) return 11;
			if (l >= 1000000000L) return 10;
			if (l >= 100000000L) return 9;
			if (l >= 10000000L) return 8;
			if (l >= 1000000L) return 7;
			if (l >= 100000L) return 6;
			if (l >= 10000L) return 5;
			if (l >= 1000L) return 4;
			if (l >= 100L) return 3;
			if (l >= 10L) return 2;
			return 1;
		}
 
		public FastWriter write(long x)
		{
			if(x == Long.MIN_VALUE){
				return write("" + x);
			}
			if(ptr + 21 >= BUF_SIZE)innerflush();
			if(x < 0){
				write((byte)'-');
				x = -x;
			}
			int d = countDigits(x);
			for(int i = ptr + d - 1;i >= ptr;i--){
				buf[i] = (byte)('0'+x%10);
				x /= 10;
			}
			ptr += d;
			return this;
		}
 
		public FastWriter write(double x, int precision)
		{
			if(x < 0){
				write('-');
				x = -x;
			}
			x += Math.pow(10, -precision)/2;
			//		if(x < 0){ x = 0; }
			write((long)x).write(".");
			x -= (long)x;
			for(int i = 0;i < precision;i++){
				x *= 10;
				write((char)('0'+(int)x));
				x -= (int)x;
			}
			return this;
		}
 
		public FastWriter writeln(char c){
			return write(c).writeln();
		}
 
		public FastWriter writeln(int x){
			return write(x).writeln();
		}
 
		public FastWriter writeln(long x){
			return write(x).writeln();
		}
 
		public FastWriter writeln(double x, int precision){
			return write(x, precision).writeln();
		}
 
		public FastWriter write(int... xs)
		{
			boolean first = true;
			for(int x : xs) {
				if (!first) write(' ');
				first = false;
				write(x);
			}
			return this;
		}
 
		public FastWriter write(long... xs)
		{
			boolean first = true;
			for(long x : xs) {
				if (!first) write(' ');
				first = false;
				write(x);
			}
			return this;
		}
 
		public FastWriter writeln()
		{
			return write((byte)'\n');
		}
 
		public FastWriter writeln(int... xs)
		{
			return write(xs).writeln();
		}
 
		public FastWriter writeln(long... xs)
		{
			return write(xs).writeln();
		}
 
		public FastWriter writeln(char[] line)
		{
			return write(line).writeln();
		}
 
		public FastWriter writeln(char[]... map)
		{
			for(char[] line : map)write(line).writeln();
			return this;
		}
 
		public FastWriter writeln(String s)
		{
			return write(s).writeln();
		}
 
		private void innerflush()
		{
			try {
				out.write(buf, 0, ptr);
				ptr = 0;
			} catch (IOException e) {
				throw new RuntimeException("innerflush");
			}
		}
 
		public void flush()
		{
			innerflush();
			try {
				out.flush();
			} catch (IOException e) {
				throw new RuntimeException("flush");
			}
		}
 
		public FastWriter print(byte b) { return write(b); }
		public FastWriter print(char c) { return write(c); }
		public FastWriter print(char[] s) { return write(s); }
		public FastWriter print(String s) { return write(s); }
		public FastWriter print(int x) { return write(x); }
		public FastWriter print(long x) { return write(x); }
		public FastWriter print(double x, int precision) { return write(x, precision); }
		public FastWriter println(char c){ return writeln(c); }
		public FastWriter println(int x){ return writeln(x); }
		public FastWriter println(long x){ return writeln(x); }
		public FastWriter println(double x, int precision){ return writeln(x, precision); }
		public FastWriter print(int... xs) { return write(xs); }
		public FastWriter print(long... xs) { return write(xs); }
		public FastWriter println(int... xs) { return writeln(xs); }
		public FastWriter println(long... xs) { return writeln(xs); }
		public FastWriter println(char[] line) { return writeln(line); }
		public FastWriter println(char[]... map) { return writeln(map); }
		public FastWriter println(String s) { return writeln(s); }
		public FastWriter println() { return writeln(); }
	}
 
	public void trnz(int... o)
	{
		for(int i = 0;i < o.length;i++)if(o[i] != 0)System.out.print(i+":"+o[i]+" ");
		System.out.println();
	}
 
	// print ids which are 1
	public void trt(long... o)
	{
		Queue<Integer> stands = new ArrayDeque<>();
		for(int i = 0;i < o.length;i++){
			for(long x = o[i];x != 0;x &= x-1)stands.add(i<<6|Long.numberOfTrailingZeros(x));
		}
		System.out.println(stands);
	}
 
	public void tf(boolean... r)
	{
		for(boolean x : r)System.out.print(x?'#':'.');
		System.out.println();
	}
 
	public void tf(boolean[]... b)
	{
		for(boolean[] r : b) {
			for(boolean x : r)System.out.print(x?'#':'.');
			System.out.println();
		}
		System.out.println();
	}
 
	public void tf(long[]... b)
	{
		if(INPUT.length() != 0) {
			for (long[] r : b) {
				for (long x : r) {
					for (int i = 0; i < 64; i++) {
						System.out.print(x << ~i < 0 ? '#' : '.');
					}
				}
				System.out.println();
			}
			System.out.println();
		}
	}
 
	public void tf(long... b)
	{
		if(INPUT.length() != 0) {
			for (long x : b) {
				for (int i = 0; i < 64; i++) {
					System.out.print(x << ~i < 0 ? '#' : '.');
				}
			}
			System.out.println();
		}
	}
 
	private boolean oj = System.getProperty("ONLINE_JUDGE") != null;
	private void tr(Object... o) { if(!oj)System.out.println(Arrays.deepToString(o)); }
}
```



# 11 Compare String

```java
return o1.str.compareTo(o2.str);
```



![image-20211212114237890](https://tva1.sinaimg.cn/large/008i3skNgy1gxbkqv6sfij307705mdfy.jpg)

# 12 Map & set & List build-in Java



**TreeMap special useful method: **

```java
// TreeMap will sort key automatically
TreeMap<Integer, Integer> map = new TreeMap<>();

// floor[, ..., ceiling]
map.ceilingEntry(key).getValue(); // 返回大于等于key的Entry(a key-value mapping associate)（二分）
map.floorEntry(key).getValue(); // 返回小于key等于key 的Entry（二分）
map.lowerEntry(key).getValue(); // 返回小于key的Entry（二分），注意，如果没有key，会报空指针异常。

// ...floor[....]ceiling....
map.floorKey(key); // Returns the greatest key less than or equal to the given key
map.ceilingKey(key); // Returns the least key greater than or equal to the given key
// Be careful, return null if there is no such key.


map.higherKey(key); // Returns the least key **strictly** greater than the given key 
map.lowerKey(key); // Returns the greatest key **strictly** less than the given key
// Be careful, return null if there is no such key.
```

Shenyang Aerospace University 



**Normal map and set **

```java
// map
Map<Integer, Integer> map = new HashMap<>();
map.containsKey("1");
map.containsValue("2");
Set<Integer> integers = map.keySet();

// set 
Set<Integer> set = new HashSet<>();
set.add(1);
set.add(2);
List<Integer> res = new ArrayList<>(set);
System.out.println(res); // [1, 2]

// list 
List<Integer> list = new ArrayList<>();
List<Integer> list1 = new ArrayList<>();
System.out.println(list);
list.addAll(list1);
System.out.println(list);
```

## set with two demension array

```java
    static Set<Point> set = new HashSet<>();

    static class Point{
        int x;
        int y;
        public Point(int x, int y){
            this.x = x;
            this.y = y;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            Point point = (Point) o;
            return x == point.x && y == point.y;
        }

        @Override
        public int hashCode() {
            return Objects.hash(x, y);
        }
    }
```



# 13 String



```java
String t = "abcedf";
char[] arr = t.toCharArray(); // String to Char Array
String newt = String.valueOf(arr); // Char Array to String
```

![image-20211229114718873](https://tva1.sinaimg.cn/large/008i3skNgy1gxv8f2kezdj30mc0lptbc.jpg)



![image-20211229115053854](https://tva1.sinaimg.cn/large/008i3skNgy1gxv8iqmv7fj30rd0mb77f.jpg)



![image-20211229115533695](https://tva1.sinaimg.cn/large/008i3skNgy1gxv8nksvm6j30o80nfwhi.jpg)



## Contains

list.contains() => O(n)

`Set<Integer> set = new HashSet<>()`

用hash表查找 时间复杂度为O(1)  set.contains() => O(1) 



`StringBuilder.delete(stIdx, edIdx)` will be better then `res.substring(0, stIdx - 1) + res.substring(edIx)` when res.length >>= edIdx - stIdx



# 14 binary reprsentation

```java
Integer.toBinaryString(int i);
```

