

function will be ahead of who uses it.



```cpp
#include <iostream>

using namespace std;

int f(int n)
{
    int res  = 1;
    for (int i = 1; i <= n; i++) res *= i;
    return res;

}
 
int main()
{
    
    int x = f(5);
    cout << x << endl;
    return 0;
}
```

