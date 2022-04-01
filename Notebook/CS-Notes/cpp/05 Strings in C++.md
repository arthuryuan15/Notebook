

## 1 The relationship between String and integers-ASCII 

```cpp
#include<iostream>

using namespace std;

int main()
{
    char c = 'a';
    cout << (int)c << endl;

    int a = 66;
    cout << (char)a << endl;

    return 0;
}
```

Output:

```shell
yuanjinshuai@MacBook-Pro  ~/projects/helloworld  ./c5
97
B
```





```cpp
#include<iostream>

using namespace std;

int main()
{
    int a = 'B' - 'A';
    int b = 'A' * 'B';
    char c = 'A' + '2'; 
    
    
    cout << a << endl;
    cout << b << endl;
    cout << c << endl;

    return 0;
}
```

Output:

```shell
 yuanjinshuai@MacBook-Pro  ~/projects/helloworld  ./c5
1
4290
s
```

## 2 Array of string

The string is the character array plus the terminator '\0'

```cpp
#include<iostream>

using namespace std;

int main()
{
    char a1[] = {'c', '+', '+'};
    char a2[] = {'C', '+', '+', '\0'}; 
    char a3[] = "C++"; // add '\0' at end of array automatically
    // char a4[6] = "Daniel"; // error: this is no space to store '\0'
 
    return 0;
}
```



### 2.1 IO of Array of strings



```cpp
#include<iostream>

using namespace std;

int main()
{
    char str[100];

    cin >> str; //  it will stop when it encounters a space
    cout << str << endl;
    printf("%s\n", str);
    
}
```





### 2.3 Traverse the characters in the character array

```cpp
#include<iostream>
#include<string.h>

using namespace std;

int main()
{
    char a[100] = "hello world!";

    for (int i = 0; i < strlen(a); i++)
    {
        cout << a[i] << endl;
    }

    return 0;
}
```

```
 yuanjinshuai@MacBook-Pro  ~/projects/helloworld  ./c5
h
e
l
l
o
 
w
o
r
l
d
!
```



## 3 Strings libaray



