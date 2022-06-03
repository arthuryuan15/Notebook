# linux



## 2. 常见的 Linux 命令

### 2.1 目录切换命令

* `cd usr `： 切换到该目录下usr目录 
* `cd ..（或cd../）` ： 切换到上一层目录 
* `cd / `： 切换到系统根目录
* ` cd ~` ： 切换到用户主目录 
* `cd -` ： 切换到上一个所在目录

### 2.2 目录的操作系统（CRUD）

1. `mkdir` dir ： add directory

2. `ls或者ll` （ll是ls -l的缩写，ll命令以看到该目录下的所有目录和文件的详细信息）：查看目录信息

   1. `ls -1` only show output filenames in `dir`

3. `find` 目录 参数 ： 寻找目录（查）

   ```
   (1)find / -name httpd.conf　　#在根目录下查找文件httpd.conf，表示在整个硬盘查找
   (2)find /etc -name httpd.conf　　#在/etc目录下文件httpd.conf
   (3)find /etc -name '*srm*'　　#使用通配符*(0或者任意多个)。表示在/etc目录下查找文件名中含有字符串‘srm’的文件
   (4)find . -name 'srm*' 　　#表示当前目录下查找文件名开头是字符串‘srm’的文件
   ```

4. `mv` 目录名称 新目录名称 ： 修改目录的名称（改） 注意：mv的语法不仅可以对目录进行重命名而且也可以对各种文件，压缩包等进行 重命名的操作。mv命令用 来对文件或目录重新命名，或者将文件从一个目录移到另一个目录中。后面会介绍到mv命令的另一个用法。

5. `mv` 目录名称 目录的新位置 ： 移动目录的位置---剪切（改） 注意：mv语法不仅可以对目录进行剪切操作，对文件和压缩包等都可执行剪切操作。另外mv与cp的结果不 同，mv好像文件“搬家”，文件个数并未增加。而cp对文件进行复制，文件个数增加了。

6. `cp -r` 目录名称 目录拷贝的目标位置 ： 拷贝目录（改），-r代表递归拷贝 注意：cp命令不仅可以拷贝目录还可以拷贝文件，压缩包等，拷贝文件和压缩包时不 用写-r递归

7. `rm [-rf]` 目录 : 删除目录（删） 注意：rm不仅可以删除目录，也可以删除其他文件或压缩包，为了增强大家的记忆， 无论删除任何目录或文 件，都直接使用 rm -rf 目录/文件/压缩包



### 2.3 文件的操作命令（增删改查）

1. `touch` 文件名称 : 文件的创建（**增**）

   

2. `cat/more/less/tail` 文件名称 文件的查看（**查**） 

   * cat ： 只能显示最后一屏内容 

   * more ： 可以显示百分比，回车可以向下一行， 空格可以向下一页，q可以退出查看 

   * less ： 可以使用键盘上的PgUp和PgDn向上 和向下翻页，q结束查看 

   * tail-10 ： 查看文件的后10行，Ctrl+C结束 

     注意：命令 tail -f 文件 可以对某个文件进行动态监控，例如tomcat的日志文件， 会随着程序的运行，日志会变 化，可以使用tail -f catalina-2016-11-11.log 监控 文 件的变化
     
     

3. `vim` 文件 ： 修改文件的内容（**改**） 

   vim编辑器是Linux中的强大组件，是vi编辑器的加强版，vim编辑器的命令和快捷方式有很多，但此处不一一阐 述，大家也无需研究的很透彻，使用vim编辑修改文件的方式基本会使用就可以了。 

   **在实际开发中，使用vim编辑器主要作用就是修改配置文件，下面是一般步骤： **

   vim 文件------>进入文件----->命令模式------>按i进入编辑模式----->编辑文件 ------->按Esc进入底行模式----->输 入:wq/q! （输入wq代表写入内容并退出，即保存；输入q!代表强制退出不保存。）

   

4. `rm -rf` 文件 ： 删除文件（**删**） 同目录删除：熟记 rm -rf 文件 即可



### 2.4 压缩文件的操作命令

**1）打包并压缩文件：**

 Linux中的打包文件一般是以.tar结尾的，压缩的命令一般是以.gz结尾的。 

而一般情况下打包和压缩是一起进行的，打包并压缩后的文件的后缀名一般.tar.gz。

 命令： `tar -zcvf [打包压缩后的文件名] [要打包压缩的文件]` 

其中： 

调用gzip压缩命令进行压缩 

c：打包文件 

v：显示运行过程 

f：指定文件名 

比如：加入test目录下有三个文件分别是 :aaa.txt bbb.txt ccc.txt,如果我们要打包test目录并指定压缩后的压缩包名 称为test.tar.gz可以使用命令： `tar -zcvf test.tar.gz aaa.txt bbb.txt ccc.txt` 或： `tar -zcvf test.tar.gz /test/`

**2）解压压缩包：**

命令：`tar -zxvf  [压缩文件]` 

其中：x：代表解压 

示例：

1 将/test下的test.tar.gz解压到当前目录下可以使用命令： `tar -zxvf test.tar.gz`

 2 将/test下的test.tar.gz解压到根目录/usr下: `tar -zxvf xxx.tar.gz -C /usr` （- C代表指定解压的位置） 

### 2.5 其他常用命令 

* `history`:  show log of used commands in linux

* `pwd` ： 显示当前所在位置 

  ```
  其他方式：
  1. $pwd是不可以的，因为&表示引用pwd的结果，但是没有对这个结果做任何的处理
  2. echo $(pwd) 可以，引用pwd的命令的输出并打印到屏幕
  3. 或者 echo $PWD 可以，PWD是一个环境变量
  ```

* `grep 要搜索的字符串 要搜索的文件 --color` ： 搜索命令，--color代表高亮显示 

  ```
  grep ‘test’ aa bb cc 　　 #显示在aa，bb，cc文件中包含test的行
  ```

* `ps -ef / ps aux` ： 这两个命令都是查看当前系统正在运行进程，两者的区别是展示格式不同。如果想要查看 特定的进程可以使用这样的格式： `ps aux|grep redis` （查看包括redis字符串的进程） 

  注意：如果直接用ps（（Process Status））命令，会显示所有进程的状态，通常结合grep命令查看某进程的 状态。 


* `kill -9` 进程的pid ： 杀死进程（-9 表示强制终止。） 

  先用ps查找进程，然后用kill杀掉 

* 网络通信命令： 


  * 查看当前系统的网卡信息：ifconﬁg 
  * 查看与某台机器的连接情况：ping  （使用的是**ICMP协议**，是“Internet Control Message Protocol”（Internet控制消息协议）的缩写，是 TCP/IP 协议族的一个子协议，用于在IP主机、路由器之间传递控制消息。）
  * 查看当前系统的端口使用：netstat -an 

* `shutdown` ： `shutdown -h now` ： 指定现在立即关机； shutdown +5 "System will shutdown after 5 minutes" :指定5分钟后关机，同时送出警告信息给登入用户。


* `reboot `： 重开机。 `reboot -w` ： 做个重开机的模拟（只有纪录并不会真的重开机）。

* `nohup`： nohup command & 不挂断地运行命令。

  ```
  nohup /usr/local/node/bin/node /www/im/chat.js >> /usr/local/node/output.log 2>&1 &
  ```

   注：**2>&1**含义解释

  ​		0 ：代表标准输入

  ​		1：代表标准输出

  ​		2：代表标准错误输出

  ​		**含义**：将标准错误输出重定向到标准输出
  ​		**符号>&是一个整体**，不可分开，分开后就不是上述含义了。
  ​		2>1的写法其实是将标准错误输出重定向到名为"1"的文件里去了
  ​		执行2>&1， 实际是2----->1 (2指向1，而1指向屏幕,因此2也指向了屏幕)

* `ip addr show` 查看本机ip

* **Clean** up the line: Ctrl + E Ctrl + U to **wipe** the **current** line in the terminal.

## 3 remote server

tencent cloud 

ssh root@1.117.200.132



## 4 tmux





## 4 git

**how to fix git clone slow**

```
git clone https://github.com/YUANJINSHUAI/learn.git

### add cnpmjs.org after github.com


git clone https://github.com.cnpmjs.org/YUANJINSHUAI/learn.git

Username for 'https://github.com.cnpmjs.org': arthuryuan15@outlook.com # username is email address
Password for 'https://arthuryuan15@outlook.com@github.com.cnpmjs.org':
# same as password in github when you log in


#use another  ghost
git clone https://git.sdut.me/YUANJINSHUAI/learn.git
```



```
fatal: 'origin' does not appear to be a git repository
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```







**Personal access tokens**

1f7890a7cf96294f4ebdf6626b069e0cefb3a2de

| AccessKeyId              | AccessKeySecret                |
| ------------------------ | ------------------------------ |
| LTAI4Fdzfvanjenf5kuMQarT | NydIqf5YnOEOgC25GtEiePkzW7xkCm |

1 **Normal command**

1. normal add/status/commit/push

```bash
git add . # add to cache
git status -sb # check current files in chache b:s how the branch name
git commmit -m "commit" # add to master with commit
git push -u origin master # git to remote respority
git push origin HEAD:refs/for/master # another way to commit
```

Note:Rewriting the most recent commit message

```bash
git commit --amend command and press Enter
```

2 **Git command with branch**

1. git ask for username every time I push

```bash
git config credential.helper store
git push <https://github.com/YUANJINSHUAI/learn.git>
```

1. delete a local and remote git branch

```bash
git branch -d newtest # delete a local branch
git push origin --delete newtest # delete a remote git branch
```

1. create a new local branch

```bash
git branch <new-branch> 
git branch <new-branch> <base-branch>
git checkout <new-branch>
```

1. cancel cached content

```bash
git reset HEAD
```

1. show the diff between in cache and not in cache

```bash
git diff
```

1. delete file and also in cache(stage/index)

```bash
git rm <file>
git reset HEAD^ --soft # save your change
git reset HEAD^ --hard # discard your changes
```

1. how to merge into master

```bash
git checkout master
git merge name_dev
```

If your local changes are bad then just remove them or reset your local master to the state on remote

If your branch is ahead of 'origin/master' by 3 commits like this
`master...origin/master [ahead 3]`

```bash
git reset --hard origin/master
```

![image-20210105120613751](https://tva1.sinaimg.cn/large/0081Kckwly1gmcoub6mn1j316a0u0u0y.jpg)

use the following command to create a new branch and copy the uncommitted changes automatically.
```shell
git switch -c feature_20210519_push_all_course_msg
```

## 8 vim

 **1. Insert mode (Where you can just type like normal text editor. Press i for insert mode)**

 **2. Command mode (Where you give commands to the editor to get things done . Press ESC for command mode)**

Most of them below are in command mode

+ x - to delete the unwanted character
+ u - to undo the last the command and U to undo the whole line
+ CTRL-R to redo
+ A - to append text at the end
+ :wq - to save and exit
+ :q! - to trash all changes
+ dw - move the cursor to the beginning of the word to delete that word
+ 2w - to move the cursor two words forward.
+ 3e - to move the cursor to the end of the third word forward.
+ 0 (zero) to move to the start of the line.
+ d2w - which deletes 2 words .. number can be changed for deleting the number of consecutive words like d3w
+ dd to delete the line and 2dd to delete to line .number can be changed for deleting the number of consecutive words

The format for a change command is: operator [number] motionoperator - is what to do, such as d for delete[number] - is an optional count to repeat the motionmotion - moves over the text to operate on, such as 

w (word)

==$== (to the end of line), etc.

You can use ==^ or 0 (Zero)== in normal mode to move **to the beginning** of a **line**. 

+ p - puts the previously deleted text after the cursor(Type dd to delete the line and store it in a Vim register. and p to put the line)
+ r - to replace the letter e.g press re to replace the letter with e
+ ce - to change until the end of a word (place the cursor on the u in lubw it will delete ubw )
+ ce - deletes the word and places you in Insert mode
+ ==G== - to move you to the bottom of the file.
+ ==gg== - to move you to the start of the file.Type the number of the line you were on and then G
+ % to find a matching ),], or }
+ :s/old/new/g to substitute 'new' for 'old' where g is globally
+ / backward search n to find the next occurrence and N to search in opposite direction
+ ? forward search
+ :! to run the shell commands like :!dir, :!ls
+ :w - TEST (where TEST is the filename you chose.) . Save the file
+ v - starts visual mode for selecting the lines and you can perform operation on that like d delete
+ :r - Filename will insert the content into the current file
+ R - to replace more than one character
+ y - operator to copy text using v visual mode and p to paste it
+ yw - (copy)yanks one word
+ o - opens a line below the cursor and start Insert mode.
+ O - opens a line above the cursor.
+ a - inserts text after the cursor.
+ A - inserts text after the end of the line.
+ e - command moves to the end of a word.
+ y - operator yanks (copies) text, p puts (pastes) it.
+ R - enters Replace mode until <ESC> is pressed.
+ ctrl-w to jump from one window to another

type a command :e and press ctrl+D to list all the command name starts with :e and press tab to complete the command

“VIM跳转到开头、结尾、指定行 VIM打开文件后,按下ESC键,进入VIM命令: 1、跳转到文件开头快捷键:gg 2、跳转到文件结尾快捷键:shift+g

跳转到指定的xx行数: xxgg,如跳转到52行,则执行52gg即可





how to get size of folder

```
du -shc /var/*
du -sh /floder
```





## 8 config

install oh my zsh       https://github.com/ohmyzsh/ohmyzsh



## 9 user

```
adduser [username]
passwd [username]
```

```shell
sudo usermod -aG wheel [username]
```



## 10 make centos beatiful





## 11 rz sz



## 12 nginx

