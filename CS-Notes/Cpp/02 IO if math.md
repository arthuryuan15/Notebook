## input



```cpp
while (cin >> a >> b){ // input until null
  
}
```



input a line

```cpp
string a;
getline(cin, a);
```



## 1 printf

**only for char!!!**

cautions: adding `#include<cstdio>`before using prinf

```cpp
#include <iostream>
#include <cstdio>

using namespace std;

int main()
{
    printf("Hello world!!");

    return 0;

}
```


| type   | usage |
| ------ | ----- |
| int    | %d    |
| float  | %f    |
| double | %lf   |
| char   | %c    |

'\n' means **Enter**

```cpp
#include <iostream>
#include <cstdio>

using namespace std;

int main()
{
    int a = 3;
    float b = 3.123423424;
    double c = 3.123423424;
    char d = 'y';

    printf("%d\n", a);
    printf("%f\n", b);
    printf("%lf\n", c);
    printf("%c\n", d);

    return 0;
}
```



 using only one prinf

```cpp
#include <iostream>
#include <cstdio>

using namespace std;

int main()
{
    int a = 3;
    float b = 3.123423424;
    double c = 3.123423424;
    char d = 'y';

    printf("int a = %d, double b = %f\ndouble c = %lf, char d = %c\n", a, b, c, d);

    return 0;
}
```



If

```cpp
#include <iostream>
#include <cstdio>

using namespace std;

int main()
{
    int a = 3;
    float b = 3.123423424;
    double c = 3.123423424;
    char d = 'y';

    printf("int a = %d, double b = %f\ndouble c = %lf, char d = %c\n", a, b, c, d);

    return 0;
}
```



```cpp
    printf("A=%.4f", 3.1415926 * r * r);
```



how to print % by printf

%%

```cpp
printf("Em percentual: %d %%", p); // Em percentual: 15 %
```



## 2 if statement



```cpp
#include <cstdio>
#include <iostream>

using namespace std;

int main()
{
    int a;
    cin >> a;

    if(a > 5)
    {
        printf("%d is big!\n", a);
        printf("%d + 1 = %d\n", a, a+1);
    }
    else
    {
        /* code */
        printf("%d is small !!", a);
        printf("%d - 1 = %d\n", a, a -1);
    }
    
    return 0;

}
```



**if else if else**

```cpp
#include <cstdio>
#include <iostream>

using namespace std;

int main()
{
    int s;
    cin >> s;

    if(s >= 85)
    {
        printf("A");
    }
    else if (s >= 70)
    {
        printf("B");
    }
    else if (s >= 60)
    {
         printf("C");
    }
    else
    {
         printf("D");
    }
    
    return 0;

}
```



## Math

```cpp
#include <cmath>
sqrt(4); // 2
max(2, 3); // 3
min(2, 3); // 2
```







