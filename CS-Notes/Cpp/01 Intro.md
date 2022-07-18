# install

```shell
brew update
brew reinstall gcc11

vim ~/.bash_profile
// add following code
export PATH="/usr/local/Cellar/gcc/11.3.0_2/bin:$PATH"
```



change the version of gcc

Firstly, to install `gcc`/`g++` using Homebrew, you should use the following command as mentioned in the comments above: `brew install gcc`

After doing this, Homebrew should place the installed binaries/symlinks in the correct folders.

To correctly setup the `gcc`/`g++` command on mac to use the version you just downloaded, I do this by not changing the symlinks `gcc`/`g++` but instead creating aliases for both `gcc` and `g++` within my shell environment.

```cpp
alias gcc='gcc-11'
alias g++='g++-11'
```

`gcc-10` and `g++-10` were downloaded using Homebrew. When doing this, Homebrew places `gcc-10` and `g++-10` in /usr/local/bin (which is on the path) and it allows you to create an alias for the regular `gcc`/`g++` commands which point to the versions installed by Homebrew.

After doing this, running the command `g++ --version` should give you the following:

```cpp
g++-11 (Homebrew GCC 10.2.0) 10.2.0
Copyright (C) 2020 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

You may need to restart your terminal or run `source ~/.bashrc` depending on the type of shell you're using.

# configuration

Sublime-build

```
{
  "cmd" : ["g++ -std=c++11 $file_name -o $file_base_name && gtimeout 4s ./$file_base_name<inputf.in>outputf.in"], 
  "selector" : "source.c",
  "shell": true,
  "working_dir" : "$file_path"
}
```



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





