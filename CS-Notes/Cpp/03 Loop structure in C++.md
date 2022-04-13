## 1 while

```cpp
#include <cstdio>
#include <iostream>

using namespace std;

int main()
{
    int i = 0;
    while (i < 10)
    {
        i++;
        cout << i << endl;
    }
    return 0;

}
```



**do while**

```cpp
#include <cstdio>
#include <iostream>

using namespace std;

int main()
{
    int i = 0;
    while (i < 1)
    {
        cout << i << endl;
        i++;
    }

    int y = 1;
    do
    {
        /* code */
        cout << "y!" << endl;
    } while (/* condition */ y < 1);
    
    return 0;

}
```



## 2 for

```cpp
#include <cstdio>
#include <iostream>

using namespace std;

int main()
/*
for (init-statement : condition: expression)
{
    statement
}
 */
{
    for(int i = 0; i < 10; i++)
    {
        cout << i << endl;
    }

}
```



**break**

```cpp
#include <cstdio>
#include <iostream>

using namespace std;

int main()
{

    int n;
    cin >> n;

    bool is_prime = true;
    for (int i = 2; i < n; i++)
    {
        if(n % i == 0)
        {
            is_prime = false;
            break;
        }

    }

    if(is_prime) cout << "yes" << endl;
    else cout << "no" << endl;

    return 0;
}
```

