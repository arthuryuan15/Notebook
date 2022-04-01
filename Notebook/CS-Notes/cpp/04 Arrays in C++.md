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



