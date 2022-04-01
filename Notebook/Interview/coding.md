````java
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

````

