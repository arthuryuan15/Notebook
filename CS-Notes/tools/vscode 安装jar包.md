# vscode 安装jar包

- 因为vscode运行java项目需要它所需的四个配置文件：.setting, .vscode, .project, .classpath，而其它项目创建的java项目肯定没有为vscode设置它需要的配置。所以，为了方便，使用vscode的工具先创建一个空的java项目，以自己的项目名创建(也可以不用)。
- 快捷键`ctrl + shift + p`打开命令输入`Java: Create Java Project`，再输入项目名，即可得到一个空项目所需的配置文件，删除多余的主类即可。
- 往自己的项目中，放入.setting, .vscode, .project, .classpath文件。
- 打开`.classpath`文件，添加行``，将所需的依赖库jar文件名都添加。

注：对`.classpath`的修改如果不能即刻生效，重启一下vscode即可。