

## 1 BASIC

Nice! We have a Git project. A Git project can be thought of as having three parts:

1. A *Working Directory*: where you’ll be doing all the work: creating, editing, deleting and organizing files
2. A *Staging Area*: where you’ll list changes you make to the working directory
3. A *Repository*: where Git permanently stores those changes as different *versions* of the project

The Git workflow consists of editing files in the working directory, adding files to the staging area, and saving changes to a Git repository. In Git, we save changes with a *commit*, which we will learn more about in this lesson.

![image-20210224113730155](https://tva1.sinaimg.cn/large/008eGmZEly1gnyt52zshsj31c20n276i.jpg)

Generalizations

You have now been introduced to the fundamental Git workflow. You learned a lot! Let’s take a moment to generalize:

- Git is the industry-standard version control system for web developers
- Use Git commands to help keep track of changes made to a project:
  - `git init` creates a new Git repository
  - `git status` inspects the contents of the working directory and staging area
  - `git add` adds files from the working directory to the staging area
  - `git diff` shows the difference between the working directory and the staging area
  - `git commit` permanently stores file changes from the staging area in the repository
  - `git log` shows a list of all previous commits



## 2 MASTER

### head commit

In Git, the commit you are currently on is known as the `HEAD` commit. In many cases, the most recently made commit is the `HEAD` commit.

To see the `HEAD` commit, enter:

```shell
git show HEAD
```

The output of this command will display everything the [git log command](https://www.codecademy.com/en/courses/learn-git/lessons/git-workflow/exercises/git-log) displays for the `HEAD` commit, plus all the file changes that were committed.

### git checkout

What if you decide to change the ghost’s line in the working directory, but then decide you wanted to discard that change?

You could rewrite the line how it was originally, but what if you forgot the exact wording? The command

```shell
git checkout HEAD filename
```

will restore the file in your working directory to look exactly as it did when you last made a commit.

Here, the `filename` again is the actual name of the file. If the file is named **changes.txt**, the command would be

```shell
git checkout HEAD changes.txt
```



### git reset I

Great! The files you’ve added to the staging area belong in the same commit.

What if, before you commit, you accidentally delete an important line from **scene-2.txt**? Unthinkingly, you add **scene-2.txt** to the staging area. The file change is unrelated to the Larry/Laertes swap and you don’t want to include it in the commit.

We can ==*unstage*== that file from the staging area using

```shell
git reset HEAD filename
```

This command *resets* the file in the staging area to be the same as the `HEAD` commit. It does not discard file changes from the working directory, it just removes them from the staging area.



### git reset II

Creating a project is like hiking in a forest. Sometimes you take a wrong turn and find yourself lost.

Just like retracing your steps on that hike, Git enables you to rewind to the part before you made the wrong turn. You can do this with:

```shell
git reset commit_SHA
```

This command works by using the first 7 characters of the SHA of a previous commit. For example, if the SHA of the previous commit is `5d692065cf51a2f50ea8e7b19b5a7ae512f633ba`, use:

```shell
git reset 5d69206
```

`HEAD` is now set to that previous commit.

How to reset remote as well

```shell
git reset --hard commit_SHA
git push -f origin master
```



### git reset review

To better understand `git reset commit_SHA`, notice the diagram on the right. Each circle represents a commit.

**Before reset**:

- `HEAD` is at the *most recent commit*

**After resetting**:

- `HEAD` goes to a *previously made commit* of your choice
- The gray commits are no longer part of your project
- You have in essence rewound the project’s history



## 3 branch

The diagram to the right illustrates branching. 

- The circles are commits, and together form the Git project’s commit history.

- *New Branch* is a different *version* of the Git project. It contains commits from *Master* but also has committed that *Master* does not have.

  ![image-20210228194748731](https://tva1.sinaimg.cn/large/e6c9d24egy1go3tsahbdkj219s0qm0u4.jpg)



Right now, the Git project has only one branch: `master`. 

To create a new branch, use: 

```shell
git branch new_branch
```

Here `new_branch` would be the name of the new branch you create, like `photos` or `blurb`. Be sure to name your branch something that describes the purpose of the branch. Also, branch names can’t contain whitespaces: `new-branch` and `new_branch` are valid branch names, but `new branch` is not.



### git checkout

Great! You just created a new branch. 

The `master` and `fencing` branches are identical: they share the same commit history. You can switch to the new branch with

```shell
git checkout branch_name
```

Here, `branch_name` is the name of the branch. If the branch’s name is a `skill`

```shell
git checkout skill
```

Once you switch branches, be now able to make commits on the branch that have no impact on `master`. 

You can continue your workflow, while `master` stays intact!



==commit on a new branch==

Congratulations! You have switched to a new branch. All the commands you do on `master`, you can also do on this branch. 

For example, to add files to the staging area, use: 

```
git add filename
```

And to commit, use: 

```
git commit -m "Commit message"
```

In a moment, you will make a commit on the `fencing` branch. On the far right, the diagram shows what will happen to the Git project.

<img src="/Users/yuanjinshuai/Library/Application Support/typora-user-images/image-20210228195001143.png" alt="image-20210228195001143" style="zoom:33%;" />



### git merge

What if you wanted include all the changes made to the `fencing` branch on the `master` branch? We can easily accomplish this by *merging* the branch into master with:

```shell
git merge branch_name
```

For example, if I wanted to merge the `skills` branch to master, I would enter 

```shell
git merge skills
```

In a moment, you’ll merge branches. Keep in mind: 

- Your goal is to update `master` with changes you made to `fencing`. 
- `fencing` is the giver branch, since it provides the changes.
- `master` is the receiver branch, since it accepts those changes.





==merge conflict I==

The merge was successful because `master` had not changed since we made a commit on `fencing`. Git knew to simply update `master` with changes on `fencing`. 

What would happen if you made a commit on `master`*before* you merged the two branches? Furthermore, what if the commit you made on `master` altered the same exact text you worked on in `fencing`? When you switch back to `master` and ask Git to merge the two branches, Git doesn’t know which changes you want to keep. This is called a *merge conflict*.



==delete branch==

In Git, branches are usually a means to an end. You create them to work on a new project feature, but the end goal is to merge that feature into the `master`branch. After the branch has been integrated into `master`, it has served its purpose and can be deleted. 

The command

```
git branch -d branch_name
```

will delete the specified branch from your Git project. 

Now that `master` contains all the file changes that were in `fencing`, let’s delete `fencing`.



==git clone==

Sally has created the remote repository, **science-quizzes** in the directory **curriculum**, which teachers on the school’s shared network have access to. In order to get your own replica of **science-quizzes**, you’ll need to *clone* it with: 

```shell
git clone remote_location clone_name
```


In this command: 

- `remote_location` tells Git where to go to find the remote. This could be a web address, or a filepath, such as:

```shell
/Users/teachers/Documents/some-remote
```

- `clone_name` is the name you give to the directory in which Git will clone the repository.



==git remote -v==

Nice work! We have a clone of Sally’s remote on our computer. One thing that Git does behind the scenes when you clone **science-quizzes** is give the remote address the name *origin*, so that you can refer to it more conveniently. In this case, Sally’s remote is *origin*. 

You can see a list of a Git project’s remotes with the command: 

```shell
git remote -v
```



==git fetch==

After you cloned **science-quizzes**, you had to run off to teach a class. Now that you’re back at your computer, there’s a problem: what if, while you were teaching, Sally changed the **science-quizzes** Git project in some way. If so, your clone will no longer be up-to-date. 

An easy way to see if changes have been made to the remote and bring the changes down to your local copy is with: 

```
git fetch
```

This command will not *merge* changes from the remote into your local repository. It brings those changes onto what’s called a *remote branch*. Learn more about how this works below.



==git merge==

Even though Sally’s new commits have been fetched to your local copy of the Git project, those commits are on the `origin/master` branch. Your *local* `master`branch has not been updated yet, so you can’t view or make changes to any of the work she has added. 

In *Lesson III, Git Branching* we learned how to merge branches. Now we’ll use the `git merge` command to integrate `origin/master` into your local `master`branch. The command: 

```
git merge origin/master
```

will accomplish this for us.



## git push

Now it’s time to share our work with Sally. 

The command: 

```
git push origin your_branch_name
```

will push your branch up to the remote, `origin`. From there, Sally can review your branch and merge your work into the `master` branch, making it part of the definitive project version.



## 4 commit

if you don't want create a new commit, `git add . && git commit -amend --no-edit` or `git reset HEAD^`then commit

**Normal command**


1. some basic command to git 
```bash
git add . # add to cache

git status -sb # check current files in chache b:show the branch name

git commmit -m "commit" # add to master with commit

git push -u origin master # git to remote respority
```



**Git command with branch**



2. git ask for username every time I puah

```bash
git config credential.helper store
git push https://github.com/YUANJINSHUAI/learn.git
```



3. delete a local and remote git branch

```bash
git branch -d newtest # delete a local branch
git push origin --delete newtest # delete a remote git branch
git checkout new_dev # if new_dev doesn't exist will create a new branch 
```



4. cancel cached content

```bash
git reset HEAD
```

5. show the diff between in cache and not in cache
```bash
git diff
```


5. delete file and also in cache(stage/index)
```bash
git rm <file>
```



```shell
git reset HEAD^ --soft # save your change
git reset HEAD^ --hard # discard your changes
```



## changed in wrong branch
==Oops! I Changed Those Files In The Wrong Branch!==

1. To move these changes to a new branch

```shell
git checkout -b mybranch
```

2. Move To An Existing Branch

`git stash` is your friend.

If you have not made the commit yet, just run `git stash`. This will save away all of your changes.

```shell
# work on some code
git stash
git checkout correct-branch
git stash pop
```





## .gitignore

```
.DS_Store
```

```
node_modules/
2logs/
```



## log 

```shell
$ git log
commit 40c1501bb644f99b4e0d9bb75d1523ddf7b6a4a8 (HEAD -> master, origin/master, origin/HEAD)
Author: “arthuryuan15” <arthuryuan15@outlook.com>
Date:   Wed Nov 24 11:07:52 2021 -0600

    update initilizr

commit 40c851a24d54383d05db7ea44e4647cee062e993
Author: “arthuryuan15” <arthuryuan15@outlook.com>
Date:   Wed Nov 24 11:06:29 2021 -0600

    update note
    
$ git log --oneline
40c1501 (HEAD -> master, origin/master, origin/HEAD) update initilizr
40c851a update note
e292c56 update code in SDC
```





## tag

![image-20211126111555793](https://tva1.sinaimg.cn/large/008i3skNgy1gwt228br48j30kc0j1acs.jpg)

```shell
$ git tag

$ git tag -a v1.0 -m "Initial version 1.0"
v1.0
(END)                                #
```



```shell
$ git show v1.0
tag v1.0
Tagger: “arthuryuan15” <arthuryuan15@outlook.com>
Date:   Fri Nov 26 11:19:53 2021 -0600

Initial version 1.0

commit 40c1501bb644f99b4e0d9bb75d1523ddf7b6a4a8 (HEAD -> master, tag: v1.0, origin/master, origin/HEAD)
Author: “arthuryuan15” <arthuryuan15@outlook.com>
Date:   Wed Nov 24 11:07:52 2021 -0600

    update initilizr

diff --git a/code/CWEB603/.DS_Store b/code/CWEB603/.DS_Store
index bbbe63e..a12750a 100644
Binary files a/code/CWEB603/.DS_Store and b/code/CWEB603/.DS_Store differ
diff --git a/code/CWEB603/initializr/.htaccess b/code/CWEB603/initializr/.htaccess
deleted file mode 100644
index 760ccd3..0000000
--- a/code/CWEB603/initializr/.htaccess
+++ /dev/null
@@ -1,935 +0,0 @@                
```





**revert && reset ** 

-   --mixed(默认)：默认的时候，只有暂存区变化
-   --hard参数：如果使用 --hard 参数，那么工作区也会变化
-   --soft：如果使用 --soft 参数，那么暂存区和工作区都不会变化
-   git revert是用一次逆向的commit“中和”之前的提交，因此日后合并老的branch时，之前提交合并的代码仍然存在，导致不能够重新合并
-   但是git reset是之间把某些commit在某个branch上删除，因而和老的branch再次merge时，这些被回滚的commit应该还会被引入





## stage

