Frist program

```cpp
#include <iostream>

using namespace std;

int main()
{
  cout << "Hello world" << endl;
  return 0;
}
```



How to run a cpp in vscode:

1. F5 complie and debug
2. run `./c5.cpp` in terminal 



## 1 Defination of variables

Variables must be definated by using, and not having same name.

How variables are defined:

```cpp
#include <iostream>

using namespace std;

int main()
{
  int a, b;
  cin >> a >> b; //input ">>" likes puting something into a and b 
  cout << a + b << endl; //output
  
  cout << a + b;
  cout << ' ';
  cout << a + b;
  cout << endl;

  return 0;
}
```

| type | keywords |
| ---- | -------- |
| bool |          |
|char||
|int||
|float||
|double||
|long||

IO

```cpp
#include <cstdio>
#include <iostream>

using namespace std;

int main() 
{   
    /*
    int: %d
    float: %f
    double: %lf
    char: %c
    long long %lld
    */
    double a, b; // defination two variables
    scanf("%lf%lf", &a, &b); // The %d indicates that the second argument (an integer) should be placed there. 
    printf("a + b = %.2f\n a * b = %.3f\n", a  + b, a * b);

    return 0;
}
 
```



## 2 Variable type conversion

```cpp
#include <iostream>
#include <cstdio>

using namespace std;

int main()
{

    float x = 123.12;

    int y = (int)x;

    cout << x << ' ' << y << endl;

    return 0;

}
```



## 3 Sequential statement

```cpp
#include <iostream>

using namespace std;

int main()
{
    int a, b, c;
    cin >> a >> b >> c;
    cout << b << endl;

    return 0;
}
```









