```cpp
int s[300] = {0};
```

There is no default value so it's garbage. If define in global, there will have a default value is 0.

## 1 one-demensional array

```cpp
#include <iostream>

using namespace std;

int main()
{
  
    int a[3] = {0, 1, 2};
    int b[] = {0, 0, 1};
    int c[5] = {0, 12, 2}; // equal to c[] = {0, 1, 2, 0, 0};
    char d[3] = {'a', 'c', 'd'};
    
    return 0;
}
```



## 2 get a value from a array

```cpp
#include <iostream>

using namespace std;

int main()
{

    int a[3] = {0, 1, 2};
    int b[] = {0, 0, 1};
    int c[5] = {0, 12, 2}; // equal to c[] = {0, 1, 2, 0, 0};
    char d[3] = {'a', 'c', 'd'};

    cout << a[1] << endl;

    return 0;
}
```



## 3 Multidimensional array

```cpp
#include <iostream>

using namespace std;

int main()
{

    int b[3][4] = {
        {0, 1, 2, 3},
        {4, 5, 6, 7},
        {8, 9, 10, 11}
    };

    return 0;
}
```





transfer 2d - array in function

```cpp
#include<iostream>
#include<cstring>

using namespace std;

void print2D(int a[][100], int row, int col){ // need 100 to 
    for(int i = 0; i < row; i++){
        for(int j = 0; j < col; j++){
            cout << a[i][j] << " ";
        }
        cout << endl;
    }

}


int main(){

    int r, c;
    cin >> r >> c;

    int a[100][100]; // need to initial array with 100

    for(int i = 0; i < r; i++){
        for(int j = 0; j < c; j++){
            cin >> a[i][j];      
        }
    } 
    print2D(a, r, c);
}
```



