# 1 Hello World

**1 Introduction to Java**

Welcome to the world of Java programming!

Programming languages enable humans to write instructions that a computer can perform. With precise instructions, computers coordinate applications and systems that run the modern world.

[Sun Microsystems](https://en.wikipedia.org/wiki/Sun_Microsystems) released the Java programming language in 1995. Java is known for being simple, portable, secure, and robust. Though it was released over twenty years ago, Java remains one of the most popular programming languages today.

One reason people love Java is the Java Virtual Machine, which ensures the same Java code can be run on different operating systems and platforms. Sun Microsystems’ slogan for Java was “write once, run everywhere”.

![Java Virtual Machine running Java on three different platforms](https://content.codecademy.com/courses/learn-java/revised-2019/Java%20Module%201-%20Lesson%201-JVM%20-ART%20408.png)

Programming languages are composed of *syntax*, the specific instructions which Java understands. We write syntax in files to create *programs*, which are executed by the computer to perform the desired task.

Let’s start with the universal greeting for a programming language. We’ll explore the syntax in the next exercise.



**2 Hello Java File!**

Java runs on different platforms, but programmers write it the same way. Let’s explore some rules for writing Java.

In the last exercise, we saw the file **HelloWorld.java**. Java files have a **.java** extension. Some programs are one file, others are hundreds of files!

Inside **HelloWorld.java**, we had a *class*:

```java
public class HelloWorld {
 
}
```

We’ll talk about classes more in the future, but for now think of them as a **single** concept.

The `HelloWorld` concept is: Hello World Printer. Other class concepts could be: Bicycle, or: Savings Account.

We marked the domain of this concept using curly braces: `{}`. Syntax inside the curly braces is part of the class.

Each file has one primary class named after the file. Our class name: `HelloWorld` and our file name: **HelloWorld**. Every word is capitalized.

Inside the class we had a `main()` *method* which lists our program tasks:

```java
public static void main(String[] args) {
 
}
```

Like classes, we used curly braces to mark the beginning and end of a method.

`public`, `static`, and `void` are syntax we’ll learn about in future lessons. `String[] args` is a placeholder for information we want to pass into our program. This syntax is necessary for the program to run but more advanced than we need to explore at the moment.

Our program also displayed the text `"Hello World"` on the screen. This was accomplished using a print statement:

```java
System.out.println("Hello World");
```

We’ll learn more about print statements in the next exercise!



**3 Print Statements**

Let’s take a closer look at this instruction from our previous program:

```java
System.out.println("Hello World");
```

Print statements output information to the screen (also referred to as the output terminal). Let’s break this line of code down a little more. Don’t worry if some of the terms here are new to you. We’ll dive into what all of these are in much more detail later on!

- `System` is a built-in Java class that contains useful tools for our programs.
- `out` is short for “output”.
- `println` is short for “print line”.

We can use `System.out.println()` whenever we want the program to create a new line on the screen after outputting a value:

```java
System.out.println("Hello World");
System.out.println("Today is a great day to code!");
```

After `"Hello World"` is printed, the output terminal creates a new line for the next statement to be outputted. This program will print each statement on a new line like so:

```
Hello World
Today is a great day to code!
```

We also can output information using `System.out.print()`. Notice that we’re using `print()`, not `println()`. Unlike `System.out.println()`, this type of print statement outputs everything on the same line. For example:

```java
System.out.print("Hello ");
System.out.print("World");
```

The above code will have the following output:

```
Hello World
```

In this example, if you were to use `print()` or `println()` again, the new text will print immediately after `World` on the same line. It’s important to remember where you left your program’s “cursor”. If you use `println()` the cursor is moved to the next line. If you use `print()` the cursor stays on the same line.

**Note:** Going forward, all exercises will use `System.out.println()` to output values.



**4 Commenting Code**

Writing code is an exciting process of instructing the computer to complete fantastic tasks.

Code is also read by people, and we want our intentions to be clear to humans just like we want our instructions to be clear to the computer.

Fortunately, we’re not limited to writing syntax that performs a task. We can also write *comments*, notes to human readers of our code. These comments are not executed, so there’s no need for valid syntax within a comment.

When comments are short we use the single-line syntax: `//`.

```java
// calculate customer satisfaction rating
```

When comments are long we use the multi-line syntax: `/*` and `*/`.

```java
/*
We chose to store information across multiple databases to
minimize the possibility of data loss. We'll need to be careful
to make sure it does not go out of sync!
*/
```

Another type of commenting option is the Javadoc comment which is represented by `/**` and `*/`. Javadoc comments are used to create documentation for APIs (Application Programming Interfaces). When writing Javadoc comments, remember that they will eventually be used in the documentation that your users might read, so make sure to be especially thoughtful when writing these comments.

Javadoc comments are typically written before the declaration of fields, methods, and classes (which we’ll cover later in this course):

```java
/**
* The following class accomplishes the following task...
*/
```

Here’s how a comment would look in a complete program:

```java
/**
* The following class shows what a comment would look like in a program.
*/
public class CommentExample {
  // I'm a comment inside the class
  public static void main(String[] args) {
    // I'm a comment inside a method
    System.out.println("This program has comments!");
  }
}
```

Comments are different from printing to the screen, when we use `System.out.println()`. These comments **won’t** show up in our terminal, they’re only for people who read our code in the text editor.



**4 Semicolons and Whitespace**

As we saw with comments, reading code is just as important as writing code.

We should write code that is easy for other people to read. Those people can be co-workers, friends, or even yourself!

Java does not interpret *whitespace*, the areas of the code without syntax, but humans use whitespace to read code without difficulty.

Functionally, these two code samples are identical:

```java
System.out.println("Java");System.out.println("Lava");System.out.println("Guava");
System.out.println("Java");
 
System.out.println("Lava");
 
System.out.println("Guava");
```

They will print the same text to the screen, but which would you prefer to read? Imagine if it was hundreds of instructions! Whitespace would be essential.

Java **does** interpret semicolons. Semicolons are used to mark the end of a *statement*, one line of code that performs a single task.

The only statements we’ve seen so far are `System.out.println("My message!");`.

Let’s contrast statements with the curly brace, `{}`. Curly braces mark the scope of our classes and methods. There are no semicolons at the end of a curly brace.



**5 Compilation: Catching Errors**

Java is a *compiled* programming language, meaning the code we write in a **.java** file is transformed into *byte code* by a compiler before it is executed by the Java Virtual Machine on your computer.

A compiler is a program that translates human-friendly programming languages into other programming languages that computers can execute.

![Steps of Java Compilation](https://content.codecademy.com/courses/learn-java/revised-2019/Java%20M1L1-%20Compilation%20Process%20ART%20409.png)

Previous exercises have automatically compiled and run the files for you. Off-platform development environments can also compile and run files for you, but it’s important to understand this aspect of Java development so we’ll do it ourselves.

The compiling process catches mistakes **before** the computer runs our code.

The Java compiler runs a series of checks while it transforms the code. Code that does not pass these checks will not be compiled.

This exercise will use an interactive terminal. Codecademy has a [lesson on the command line](https://www.codecademy.com/learn/learn-the-command-line) if you’d like to learn more.

For example, with a file called **Plankton.java**, we could compile it with the terminal command:

```java
javac Plankton.java
```

A successful compilation produces a **.class** file: **Plankton.class**, that we execute with the terminal command:

```
java Plankton
```

An unsuccessful compilation produces a list of errors. No **.class** file is made until the errors are corrected and the compile command is run again.



**6 Compilation: Creating Executables**

Compilation helped us catch an error. Now that we’ve corrected the file, let’s walk through a successful compilation.

As a reminder, we can compile a **.java** file from the terminal with the command:

```shell
javac Whales.java
```

If the file compiles successfully, this command produces an *executable* class: **FileName.class**. Executable means we can run this program from the terminal.

We run the executable with the command:

```shell
java Whales
```

Note that we leave off the **.class** part of the filename.

Here’s a full compilation cycle as an example:

```java
// within the file: Welcome.java
public class Welcome {
  public static void main(String[] args) {
    System.out.println("Welcome to Codecademy's Java course!");
  }
}
```

We have one file: **Welcome.java**. We compile with the command:

```shell
javac Welcome.java
```

The terminal shows no errors, which indicates a successful compilation.

We now have two files:

1. **Welcome.java**, our original file with Java syntax.
2. **Welcome.class**, our compiled file with Java bytecode, ready to be executed by the Java Virtual Machine.

We can execute the compiled class with the command:

```shell
java Welcome
```

The following is printed to the screen:

```shell
Welcome to Codecademy's Java course!
```



**7 Java Review: Putting It All Together**

In this lesson, we’ve started writing our first programs in Java.

We’ve also learned rules and guidelines for how to write Java programs:

- Java programs have at least one class and one`main()`method.

  - Each class represents one real-world idea.
  - The `main()` method runs the tasks of the program.

- Java comments add helpful context to human readers.

- Java has whitespace, curly braces, and semicolons.

  - Whitespace is for humans to read code easily.
  - Curly braces mark the scope of a class and method.
  - Semicolons mark the end of a statement.

- Java is a compiled language.

  - Compiling catches mistakes in our code.
  - Compilers transform code into an executable class.

# 2 Variables

## 2.1 Learn Java: Variables

**1 Introduction**

Let’s say we need a program that connects a user with new jobs. We need the user’s name, their salary, and their employment status. All of these pieces of information are stored in our program.

We store information in *variables*, named locations in memory.

Naming a piece of information allows us to use that name later, accessing the information we stored.

Variables also give context and meaning to the data we’re storing. The value `42` could be someone’s age, a weight in pounds, or the number of orders placed. With a name, we **know** the value `42` is `age`, `weightInPounds`, or `numOrdersPlaced`.

In Java, we specify the type of information we’re storing. *Primitive datatypes* are types of data built-in to the Java system. The three main primitive types we’ll cover are `int`, `double`, and `boolean`; this lesson will introduce these built-in types and more.

We must *declare* a variable to reference it within our program. Declaring a variable requires that we specify the type and name:

```java
// datatype variableName
int age;
double salaryRequirement;
boolean isEmployed;
```

The names of the variables above are `age`, `salaryRequirement`, and `isEmployed`.

These variables don’t have any associated value. To assign a value to a variable, we use the assignment operator `=`:

```java
age = 85;
```

Now, `age` has a value of `85`. When code is used to represent a fixed value, like `85`, it is referred to as a *literal*.

It’s also common to declare a variable and assign it a value in one line!

For example, to assign `2011` to a variable named `yearCodecademyWasFounded` of type `int`, we write:

```java
int yearCodecademyWasFounded = 2011;
```



**2 ints**

The first type of data we will store is the whole number. Whole numbers are very common in programming. You often see them used to store ages, or maximum sizes, or the number of times some code has been run, among many other uses.

In Java, whole numbers are stored in the *int* primitive data type.

`int`s hold positive numbers, negative numbers, and zero. They do not store fractions or numbers with decimals in them.

The `int` data type allows values between -2,147,483,648 and 2,147,483,647, inclusive.

To declare a variable of type `int`, we use the `int` keyword before the variable name:

```java
// int variable declaration
int yearJavaWasCreated;
// assignment
yearJavaWasCreated = 1996;
// declaration and assignment
int numberOfPrimitiveTypes = 8;
```



**3 doubles**

Whole numbers don’t accomplish what we need for every program. What if we wanted to store the price of something? We need a decimal point. What if we wanted to store the world’s population? That number would be larger than the `int` type can hold.

The `double` primitive data type can help. `double` can hold decimals as well as very large and very small numbers. The maximum value is 1.797,693,134,862,315,7 E+308, which is approximately 17 followed by 307 zeros. The minimum value is 4.9 E-324, which is 324 decimal places!

To declare a variable of type `double`, we use the `double` keyword in the declaration:

```java
// doubles can have decimal places:
double price = 8.99;
// doubles can have values bigger than what an int could hold:
double gdp = 12237700000;
```



**4 booleans**

Often our programs face questions that can only be answered with yes or no.

Is the oven on? Is the light green? Did I eat breakfast?

These questions are answered with a *boolean*, a type that references one of two values: `true` or `false`.

We declare boolean variables by using the keyword `boolean` before the variable name.

```java
boolean javaIsACompiledLanguage = true;
boolean javaIsACupOfCoffee = false;
```

In future lessons, we’ll see how `boolean` values help navigate decisions in our programs.



**5 String**

So far, we have learned primitive data types, which are the simplest types of data with no built-in behavior. Our programs will also use `String`s, which are *objects*, instead of primitives. Objects have built-in behavior.

`String`s hold sequences of characters. We’ve already seen instances of a `String`, for example, when we printed out `"Hello World"`. There are two ways to create a `String` object: using a `String` literal or calling the `String` class to create a new `String` object.

A *String literal* is any sequence of characters enclosed in double-quotes (`""`). Like primitive-type variables, we declare a `String` variable like by specifying the type first:

```java
String greeting = "Hello World";
```

We could also create a *new String object* by calling the `String` class when declaring a `String` like so:

```java
String salutations = new String("Hello World");
```

There are subtle differences in behavior depending on whether you create a `String` using a `String` literal or a new `String` object. We’ll dive into those later, but for now, we’ll almost always be using `String` literals.

**Keep Reading: AP Computer Science A Students**

Certain symbols, known as escape sequences, have an alternative use in Java print statements. Escape sequences are interpreted differently by the compiler than other characters. Escape characters begin with the character `\`.

There are three escape sequences to be aware of for the AP exam.

The `\"` escape sequence allows us to add quotation marks `"` to a `String` value. :

```java
System.out.println("\"Hello World\"");
// Prints: "Hello World"
```

If we didn’t use an escape sequence, then Java would think we’re using `"` to end the String!

Using the `\\` escape sequence allows us to place backslashes in our `String` text:

```java
System.out.println("This is the backslash symbol: \\");
// Prints: This is the backslash symbol: \
```

This is similar to the last example - just like `"`, `\` usually has a special meaning. In this case, `\` is used to start an escape sequence. Well, if we don’t want to start an escape sequence and just want a `\` in our String, then we’ll use `\\` — we’re using an escape sequence to say that we don’t want `\` to be interpreted as the start of an escape sequence. It’s a little mind-bending!

Finally, if we place a `\n` escape sequence in a `String`, the compiler will output a new line of text:

```java
System.out.println("Hello\nGoodbye");
/*
Prints:
Hello
Goodbye
*/
```

You can think of `\n` as the escape sequence for “newline”.



**6 Static Checking**

The Java programming language has *static typing*. Java programs will not compile if a variable is assigned a value of an incorrect type. This is a *bug*, specifically a type declaration bug.

Bugs are dangerous! They cause our code to crash, or produce incorrect results. Static typing helps because bugs are caught during programming rather than during execution of the code.

The program will not compile if the declared type of the variable does not match the type of the assigned value:

```java
int greeting = "Hello World";
```

The String `"Hello World"` cannot be held in a variable of type `int`.

For the example above, we see an error in the console at compilation:

```java
error: incompatible types: String cannot be converted to int
    int greeting = "Hello World";
```

When bugs are not caught at compilation, they interrupt execution of the code by causing *runtime errors*. The program will crash.

Java’s static typing helps programmers avoid runtime errors, and thus have much safer code that is free from bugs.



**7 Naming**

Let’s imagine we’re storing a user’s name for their profile. Which code example do you think is better?

```java
String data = "Delilah";
```

or

```java
String nameOfUser = "Delilah";
```

While both of these will compile, the second example is way more easy to understand. Readers of the code will know the purpose of the value: `"Delilah"`.

Naming variables according to convention leads to clear, readable, and maintainable code. When someone else, or our future self, reads the code, there is no confusion about the purpose of a variable.

In Java, variable names are case-sensitive. `myHeight` is a different variable from `myheight`. The length of a variable name is unlimited, but we should keep it concise while keeping the meaning clear.

A variable starts with a valid letter, or a `$`, or a `_`. No other symbols or numbers can begin a variable name. `1stPlace` and `*Gazer` are not valid variable names.

Variable names of only one word are spelled in all lowercase letters. Variable names of more than one word have the first letter lowercase while the beginning letter of each subsequent word is capitalized. This style of capitalization is called *camelCase*.

```java
// good style
boolean isHuman;
 
// bad styles
// no capitalization for new word
boolean ishuman;
// first word should be lowercase
boolean IsHuman;
// underscores don't separate words
boolean is_human;
```



Review

Creating and filling variables is a powerful concept that allows us to keep track of all kinds of data in our program.

In this lesson, we learned how to create and print several different data types in Java, which you’ll use as you create bigger and more complex programs.

We covered:

- `int`, which stores whole numbers.
- `double`, which stores bigger whole numbers and decimal numbers.
- `boolean`, which stores `true` and `false`.
- `char`, which stores single characters using single quotes.
- `String`, which stores multiple characters using double quotes.
- *Static typing*, which is one of the safety features of Java.
- Variable naming conventions.

Practice declaring variables and assigning values to make sure you have a solid foundation for learning more complicated and exciting Java concepts!



##2.2 Learn Java: Manipulating Variables

**1 Introduction**

Let’s say we are writing a program that represents a user’s bank account. With variables, we know how to store a balance! We’d use a `double`, the primitive type that can hold big decimal numbers. But how would we deposit and withdraw from the account?

Lucky for us, we have the ability to manipulate the value of our variables. We can use expressions, arithmetic operators, and more in order to change our variables’ values.

For example, Java has built-in arithmetic operations that perform calculations on numeric values:

```java
// declare initial balance
double balance = 20000.99;
// declare deposit amount
double depositAmount = 1000.00;
// store result of calculation in our original variable
balance = balance + depositAmount;
```

In the final line of the code above, we used the expression `balance + depositAmount` to determine the new value of the `balance` variable. When an expression is executed, it produces a single value.

The data type of a variable plays a large role in the operations we can use to manipulate it. We can think of a data type as a combination of a set of values, and a set of operations on those values. For example, the `double` data type is comprised of values like `4.8` and operations like addition (`+`). For now, we’ll mainly focus on the set of operations that can be used on numbers and booleans.

The data type of an expression is determined by the resulting value. For example, an expression that uses two `int` values will evaluate to an `int` value. If an expression contains a `double` value, then the resulting value will also be type `double`.

Throughout this lesson, we will learn how to manipulate variables of different data types.

**2 Addition and Subtraction**

In our bank account example from the last exercise, we used the `+` operator to add the values `balance` and `depositAmount`:

```java
double balance = 20000.99;
double depositAmount = 1000.0;
balance = balance + depositAmount;
// balance now holds 21000.99
```

If we wanted to withdraw from the balance, we would use the `-` operator:

```java
double withdrawAmount = 500;
balance = balance - withdrawAmount;
// balance now holds 19500.99
```

Addition and subtraction work with `int` type values as well! If we had `60` pictures of cats on our phone, and we took `24` more, we could use the following line of code to store `84` in `numPicturesOfCats`.

```java
int numPicturesOfCats = 60 + 24;
```

What if we took one additional picture of our cat? We can reflect this change using an increment operator `++`. When we append `++` to a number-based variable, it increases the value by `1`. We also have the decrement operator, `--`, which decreases the value by `1`.

```java
// Take a picture
numPicturesOfCats++ // Value is now 85
 
// Delete a picture
numPicturesOfCats-- // Value is now 84
```



**3Multiplication and Division**

Let’s say that our employer is calculating our paycheck and depositing it to our bank account. We worked 40 hours last week, at a rate of $15.50 an hour. Java can calculate this with the multiplication operator `*`:

```java
double paycheckAmount = 40 * 15.50;
//paycheckAmount now holds 620.0
```

If we want to see how many hours our total balance represents, we use the division operator `/`:

```java
double balance = 20010.5;
double hourlyRate = 15.5;
double hoursWorked = balance / hourlyRate;
//hoursWorked now holds 1291.0
```

Division has different results with integers. The `/` operator does *integer division*, which means that any remainder is lost.

```java
int evenlyDivided = 10 / 5;
//evenlyDivided holds 2, because 10 divided by 5 is 2
int unevenlyDivided = 10 / 4;
//unevenlyDivided holds 2, because 10 divided by 4 is 2.5
```

`evenlyDivided` stores what you expect, but `unevenlyDivided` holds `2` because `int`s cannot store decimals! It’s important to note that the `int` doesn’t round the decimal, but floors it. Java removes the `0.5` to fit the result into an `int` type!

It’s important to note that if we try to divide any number by `0`, we will get an `ArithmeticException` error as a result.

**4 Modulo**

If we baked 10 cookies and gave them out in batches of 3, how many would we have leftover after giving out all the full batches we could?

The modulo operator `%`, gives us the **remainder** after two numbers are divided.

```java
int cookiesBaked = 10;
int cookiesLeftover = 10 % 3;
//cookiesLeftover holds 1
```

You have 1 cookie left after giving out all the batches of 3 you could!

Modulo can be a tricky concept, so let’s try another example.

Imagine we need to know whether a number is even or odd. An even number is divisible by 2.

Modulo can help! Dividing an even number by 2 will have a **remainder** of 0. Dividing an odd number by 2 will have a **remainder** of 1.

```java
7 % 2
// 1, odd!
8 % 2
// 0, even!
9 % 2
// 1, odd!
```

**5 Compound Assignment Operators**

Sometimes, we need to adjust the value of a variable.

Imagine we’re working at a bake sale and want to keep track of how many cupcakes we have by creating a variable called `numCupcakes`:

```java
int numCupcakes = 12;
```

If we baked `8` more cupcakes, we know that we could update our variable using the `+` operator:

```java
numCupcakes = numCupcakes + 8; // Value is now 20
```

While this method works just fine, we had to write our variable `numCupcakes` twice. We can shorten this syntax by using a *compound assignment operator*.

Compound assignment operators perform an arithmetic operation on a variable and then reassigns its value. Using the `+=` compound assignment operator, we can rewrite our previous code like so:

```
numCupcakes += 8; // Value is now 20
```

Now we only need to reference `numCupcakes` once.

We can use compound assignment operators for all of the arithmetic operators we’ve covered:

- Addition (`+=`)
- Subtraction (`-=`)
- Multiplication (`*=`)
- Division (`/=`)
- Modulo (`%=`)



**6 Order of Operations**

If we were to place multiple operators in a single expression, what operation would the compiler evaluate first?

```java
int num = 5 * (10 - 4) + 4 / 2;
```

The order of operations dictates the order in which an expression (like the one above) is evaluated.

The order is as follows:

1. Parentheses
2. Multiplication
3. Division
4. Modulo
5. Addition
6. Subtraction

With this new information in mind, let’s dissect the expression from above so that we can find the value of `num`:

```java
5 * (10 - 4) + 4 / 2
```

`10 - 4` would be evaluated first because it is wrapped in parentheses. This value would become `6` making our expression look like this:

```java
5 * 6 + 4 / 2 
```

Next, `5 * 6` will be evaluated because of the `*` operator. This value is `30`. Our expression now looks like this:

```java
30 + 4 / 2
```

Following the order of operations, `4 / 2` will be evaluated next because the division operator `/` has higher precedence than the addition operator `+`. Our expression now resembles the following:

```java
30 + 2
```

`30 + 2` is `32`. This means that the value of `num` is `32`.



**7 Greater Than and Less Than**

Now, we’re withdrawing money from our bank account program, and we want to see if we’re withdrawing less money than what we have available.

Java has *relational operators* for numeric datatypes that make `boolean` comparisons. These include less than (`<`) and greater than (`>`), which help us solve our withdrawal problem.

```java
double balance = 20000.01;
double amountToWithdraw = 5000.01;
System.out.print(amountToWithdraw < balance);
//this will print true, since amountToWithdraw is less than balance
```

You can save the result of a comparison as a `boolean`, which you learned about in the last lesson.

```java
double myBalance = 200.05;
double costOfBuyingNewLaptop = 1000.05;
boolean canBuyLaptop = myBalance > costOfBuyingNewLaptop;
//canBuyLaptop is false, since 200.05 is not more than 1000.05
```



**8 Equals and Not Equals**

So how would we validate our paycheck to see if we got paid the right amount?

We can use another relational operator to do this. `==` will tell us if two variables are equal:

```java
double paycheckAmount = 620;
double calculatedPaycheck = 15.50 * 40;
System.out.print(paycheckAmount == calculatedPaycheck);
//this will print true, since paycheckAmount equals calculatedPaycheck
```

Notice that the equality check is **two** equal signs, instead of one. One equal sign, `=`, is how we assign values to variables! It’s easy to mix these up, so make sure to check your code for the right number of equal signs.

To check if two variables are **not** equal, we can use `!=`:

```java
double balance = 20000.0;
double amountToDeposit = 620;
double updatedBalance = balance + amountToDeposit;
boolean balanceHasChanged = balance != updatedBalance;
//depositWorked holds true, since balance does not equal updatedBalance
```



**9 .equals()**

So far, we’ve only been using operations on primitive types. It doesn’t make much sense to multiply `String`s, or see if one `String` is less than the other. But what if we had two users logging into a site, and we wanted to see if their usernames were the same?

With objects, such as `String`s, we can’t use the primitive equality operator. To test equality with objects, we use a built-in method called `.equals()`. When comparing objects, make sure to always use `.equals()`. `==` will work occasionally, but the reason why it sometimes works has to do with how objects are stored in memory.

For the purposes of this lesson (as well as good practice) remember to use `.equals()` instead of `==` when comparing objects.

To use it, we call it on one `String`, by using `.`, and pass in the `String` to compare against in parentheses:

```java
String person1 = "Paul";
String person2 = "John";
String person3 = "Paul";
 
System.out.println(person1.equals(person2));
// Prints false, since "Paul" is not "John"
 
System.out.println(person1.equals(person3));
// Prints true, since "Paul" is "Paul"
```



**10 String Concatenation**

We have covered a lot of built-in functionality in Java throughout this lesson. We’ve seen `+`, `-`, `<`, `==`, and many other operators. Most of these only work on primitives, but some work on `String`s too!

Let’s say we want to print out a variable, and we want to describe it as we print it out. For our bank account example, imagine we want to tell the user:

```
Your username is: <username>
```

With the value of the variable `username` displayed.

The `+` operator, which we used for adding numbers together, can be used to *concatenate* `String`s. In other words, we can use it to join two `String`s together!

```java
String username = "PrinceNelson";
System.out.println("Your username is: " + username);
```

This code will print:

```
Your username is: PrinceNelson
```

We can even use a primitive datatype as the second variable to concatenate, and Java will intelligently make it a `String` first:

```
int balance = 10000;
String message = "Your balance is: " + balance;
System.out.println(message);
```

This code will print:

```
Your balance is: 10000
```



**11 final Keyword**

Throughout this lesson, we’ve discussed the different ways we can manipulate a variable; however, what do we do with a variable that should never change its value?

For example, the year we were born will always stay the same. There’s no way we can change that information. A value like this in our code should be unchangeable.

To declare a variable with a value that cannot be manipulated, we need to use the `final` keyword. To use the `final` keyword, prepend `final` to a variable declaration like so:

```java
final int yearBorn = 1968;
```

When we declare a variable using `final`, the value cannot be changed; any attempts at doing so will cause an error to occur:

```error
error: cannot assign a value to final variable yearBorn
```



# 3 Object-oriented Java

##3.1 Introduction to Classes

Introduction to Classes

All programs require one or more classes that act as a model for the world.

For example, a program to track student test scores might have `Student`, `Course`, and `Grade` classes. Our real-world concerns, students and their grades, are inside the program as classes.

We represent each student as an *instance*, or *object*, of the `Student` class.

This is *object-oriented programming* because programs are built around objects and their interactions. An object contains state and behavior.

![Diagram of a generic software object](https://content.codecademy.com/courses/learn-java/revised-2019/diagram%20of%20an%20object-01.png)

Classes are a blueprint for objects. Blueprints detail the general structure. For example, all students have an ID, all courses can enroll a student, etc.

An instance is the thing itself. *This* student has an ID of `42`, *this* course enrolled *that* student, etc.

Let’s review with another example, a savings account at a bank.

What should a savings account know?

- The balance of money available.

What should a savings account do?

- Deposit money.
- Withdraw money.

![Diagram of a Savings Account as software object](https://content.codecademy.com/courses/learn-java/revised-2019/diagram%20of%20an%20object-02.png)

Imagine two people have accounts that are instances of the `SavingsAccount` class. They share behavior (how they deposit and withdraw) but have individual state (their balances), and even with the same balance amount these accounts are separate entities.



**1 Classes: Syntax**

The fundamental concept of object-oriented programming is the class.

A *class* is the set of instructions that describe how an instance can behave and what information it contains.

Java has pre-defined classes such as `System`, which we’ve used in logging text to our screen, but we also need to write our own classes for the custom needs of a program.

Here’s a definition of a Java class:

```java
public class Car {
// scope of Car class starts after curly brace
 
  public static void main(String[] args) {
    // scope of main() starts after curly brace
 
    // program tasks
 
  }
  // scope of main() ends after curly brace
 
}
// scope of Car class ends after curly brace
```

This example defines a `class` named `Car`. `public` is an *access level modifier* that allows **other** classes to interact with this class. For now, all classes will be `public`.

This class has a `main()` method, which lists the tasks performed by the program. `main()` runs when we execute the compiled **Car.class** file.



**2 Classes: Constructors**

In order to create an object (an instance of a class), we need a constructor method. The constructor is defined within the class.

Let’s take a look at the `Car` class with a constructor. The constructor, `Car()`, shares the same name as the class:

```java
public class Car {
  // Constructor method
  public Car() {
    // instructions for creating a Car instance
  }  
 
  public static void main(String[] args) {
    // body of main method
  }
}
```

To create an instance, we need to *call* or *invoke* the constructor within `main()`. The following example assigns a `Car` instance to the variable `ferrari`:

```java
public class Car {
 
  public Car() {
    // instructions for creating a Car instance
  }
 
  public static void main(String[] args) {
    // Invoke the constructor
    Car ferrari = new Car(); 
  }
}
```

In this example, instead of being declared with a primitive data type like `int` or `boolean`, our variable `ferrari` is declared as a *reference data type*. This means that the value of our variable is a reference to an instance’s memory address. During its declaration, the class name is used as the variable’s type. In this case, the type is `Car`.

After the assignment operator, (`=`), we invoke the constructor method: `Car()`, and use the keyword `new` to indicate that we’re creating an instance. **Omitting `new` causes an error.**

If we were to output the value of `ferrari` we would see its memory address:

```
Car@76ed5528
```

**Keep Reading: AP Computer Science A Students**

We can initialize a reference-type variable without assigning it a reference if we utilize the special value `null`. Something that is `null` has no value; if we were to assign `null` to an object, it would have a void reference.

For example, in the following code snippet, we’ll create an instance of `Car`, assign it a reference, and then change its value to `null`:

```java
Car thunderBird = new Car();
System.out.println(thunderBird); // Prints: Car@76ed5528
 
thunderBird = null; // change value to null
System.out.println(thunderBird); // Prints: null
```

It’s important to note that if we use a `null` reference to call a method or access an instance variable, we will receive a `NullPointerException` error.



**3 Classes: Instance Fields**

Our last exercise ended with printing an instance of `Store`, which looked something like `Store@6bc7c054`. The first part, `Store`, refers to the class, and the second part `@6bc7c054` refers to the instance’s location in the computer’s memory.

We don’t care about memory location, but our instances have no other characteristics! When an object is created, the constructor sets the initial state of the object. The *state* is made up of associated data that represents the characteristics of an object.

We’ll add data to an object by introducing *instance variables*, or *instance fields*.

We want `Car` instances of different colors, so we declare a `String color` instance field. Often times, instance variables are described as a “has-a” relationship with the object. For example, a `Car` “has-a” `color`. Another way to think of this is that instance variables are the nouns and adjectives associated with an object. What qualities other than `color` might a car *have*?

```java
public class Car {
  /*
  declare fields inside the class
  by specifying the type and name
  */
  String color;
 
  public Car() {
    /* 
    instance fields available in
    scope of constructor method
    */
  }
 
  public static void main(String[] args) {
    // body of main method
  }
}
```

The declaration is **within** the class and the instance variable will be available for assignment inside the constructor.

Fields are a type of state each instance will possess. One instance may have `"red"` as its `color`, another `"blue"`, etc. It’s the job of the constructor to give these instance fields initial value. We’ll learn how to this in the next exercise.



**4 Classes: Constructor Parameters**

To create objects with dynamic, individual states, we’ll use a combination of the constructor method and instance fields.

In order to assign a value to an instance variable, we need to alter our constructor method to include parameters so that it can access the data we want to assign to an instance.

We’ve already seen a parameter in the `main()` method: `String[] args`, but this is the first time we’re using the parameter value within a method body.

The `Car` constructor now has a parameter: `String carColor`:

```java
public class Car {
  String color;
  // constructor method with a parameter
  public Car(String carColor) {
    // parameter value assigned to the field
    color = carColor;
  }
  public static void main(String[] args) {
    // program tasks
  }
}
```

When a String value gets passed into `Car()`, it is assigned to the parameter `carColor`. Then, inside the constructor, `carColor` will be assigned as the value to the instance variable `color`.

Our method also has a *signature* which defines the name and parameters of the method. In the above example, the signature is `Car(String carColor)`.

In the next exercise, we’ll learn how to pass values into a method!

**Keep Reading: AP Computer Science A Students**

There are two types of parameters: formal and actual. A *formal parameter* specifies the type and name of data that can be passed into a method. In our example above, `String carColor` is a formal parameter; `carColor` will represent whatever `String` value is passed into the constructor. We’ll learn about actual parameters in the next exercise.

In Java, because of *constructor overloading*, a class can have multiple constructors as long as they have different parameter values. The signature is useful in that it helps the compiler differentiate between the different methods. For example:

```java
public class Car {
  String color;
  int mpg;
  boolean isElectric;
 
  // constructor 1
  public Car(String carColor, int milesPerGallon) {
    color = carColor;
    mpg = milesPerGallon;
  }
  // constructor 2
  public Car(boolean electricCar, int milesPerGallon) {
    isElectric = electricCar;
    mpg = milesPerGallon;
  }
}
```

In the example above, there are two constructors. When we initialize an object, the compiler will know which constructor to use because of the values we pass into it. For example, `Car myCar = new Car(true, 40)` will be created by the second constructor because the arguments match the type and order of the second constructor’s signature.

If we do not define a constructor, the Java compiler will generate a default constructor that contains no arguments and assigns the object default values. Default values can be created by assigning values to the instance fields during their declaration:

```java
public class Car {
  String color = "red";
  boolean isElectric = false;
  int cupHolders = 4;
 
  public static void main(String[] args) {
    Car myCar = new Car();
    System.out.println(myCar.color); // Prints: red
  }
}
```





**5 Classes: Assigning Values to Instance Fields**

Now that our constructor has a parameter, we must pass values into the method call. These values are referred to as *arguments*; once they are passed in, they will be used to give the instance fields initial value.

Here we create an instance, `ferrari`, in the `main()` method with `"red"` as its `color` field:

```java
public class Car {
  String color;
 
  public Car(String carColor) {
    // assign parameter value to instance field
    color = carColor;
  }
 
  public static void main(String[] args) {
    // parameter value supplied when calling constructor
    Car ferrari = new Car("red");
  }
}
```

We pass the String value `"red"` to our constructor method call: `new Car("red");`.

The type of the value given to the invocation **must match** the type declared by the parameter.

Inside the constructor, the parameter `carColor` refers to the value passed in during the invocation: `"red"`. This value is assigned to the instance field `color`.

`color` has already been declared, so we don’t specify the type during assignment.

The object, `ferrari`, holds the state of `color` as an instance field referencing the value `"red"`.

We access the value of this field with the *dot operator* (`.`):

```java
/*
accessing a field:
objectName.fieldName
*/
 
ferrari.color;
// "red"
```

**Keep Reading: AP Computer Science A Students**

An *actual parameter*, or argument, refers to the value being passed during a method call.

*Call by value* is the process of calling a method with an argument value. When an argument is passed, the formal parameter is initialized with a copy of the argument value. For example, when we declared the `ferrari` object, the `String` value `"red"` is passed as an argument; then, the formal parameter `carColor` is assigned a copy of that value.



**6 Classes: Multiple Fields**

Objects are not limited to a single instance field. We can declare as many fields as are necessary for the requirements of our program.

Let’s change `Car` instances so they have multiple fields.

We’ll add a `boolean isRunning`, that indicates the car engine is on and an `int velocity`, that indicates the speed at which the car is traveling.

```java
public class Car {
  String color;
  // new fields!
  boolean isRunning;
  int velocity;
 
  // new parameters that correspond to the new fields
  public Car(String carColor, boolean carRunning, int milesPerHour) {
    color = carColor;
    // assign new parameters to the new fields
    isRunning = carRunning;
    velocity = milesPerHour;
  }
 
  public static void main(String[] args) {
    // new values passed into the method call
    Car ferrari = new Car("red", true, 27);
    Car renault = new Car("blue", false, 70);
 
    System.out.println(renault.isRunning);
    // false
    System.out.println(ferrari.velocity);
    // 27
  }
}
```

The constructor now has multiple parameters to receive values for the new fields. We still specify the type as well as the name for each parameter.

Ordering matters! We must pass values into the constructor invocation in the same order that they’re listed in the parameters.

```java
// values match types, no error
Car honda = new Car("green", false, 0);
 
// values do not match types, error!
Car junker = new Car(true, 42, "brown");
 
```



## 3.2 Learn Java: Methods

**1 Introduction**

In the last lesson, we learned that objects have state and behavior. We have seen how to give objects state through instance fields. Now, we’re going to learn how to create object *behavior* using methods. Remember our example of a Savings Account.

![A diagram of a software object with fields and behavior](https://content.codecademy.com/courses/learn-java/revised-2019/diagram%20of%20an%20object-02.png)

The state tells us what a savings account should know:

- The balance of money available

The behavior tells us what tasks a savings account should be able to perform:

- Depositing - increasing the amount available
- Withdrawing - decreasing the amount available
- Checking the balance - displaying the amount available.

Methods are repeatable, modular blocks of code used to accomplish specific tasks. We have the ability to define our own methods that will take input, do something with it, and return the kind of output we want.

Looking at the example above, recreating a savings account is no easy task. How can one program tackle such a large problem? This is where methods and their ability to accomplish smaller, specific tasks comes in handy. Through *method decomposition*, we can use methods to break down a large problem into smaller, more manageable problems.

Methods are so reusable. Imagine we wrote a sandwich-making program that used 20 lines of code to make a single sandwich. Our program would become very long very quickly if we were making multiple sandwiches. By creating a `makeSandwich()` method, we can make a sandwich anytime simply by calling it.

![makeSandwich() adds ingredients together to make a sandwich](https://content.codecademy.com/courses/learn-java/revised-2019/methods-conceptual.gif)

In this lesson, we’ll learn how to create and call our very own methods inside of our programs.

**Keep Reading: AP Computer Science A Students**

If we were to share this sandwich-making program with another person, they wouldn’t have to understand *how* `makeSandwich()` worked. If we wrote our program well, all they would need to know is that if they called `makeSandwich()`, they would receive a sandwich. This concept is known as *procedural abstraction*: knowing what a method does, but not how it accomplishes it.



**2 Defining Methods**

If we were to define a `checkBalance()` method for the Savings Account example we talked about earlier, it would look like the following:

```java
public void checkBalance(){
  System.out.println("Hello!");
  System.out.println("Your balance is " + balance);
}
```

The first line, `public void checkBalance()`, is the method declaration. It gives the program some information about the method:

- `public` means that other classes can access this method. We will learn more about that later in the course.
- The `void` keyword means that there is no specific output from the method. We will see methods that are not `void` later in this lesson, but for now, all of our methods will be `void`.
- `checkBalance()` is the name of the method.

Every method has its own unique *method signature* which is comprised of the method’s name and its parameter type. In this example, the method signature is `checkBalance()`.

The two print statements are inside the *body* of the method, which is defined by the curly braces: `{` and `}`.

Anything we can do in our `main()` method, we can do in other methods! All of the Java tools you know, like the math and comparison operators, can be used to make interesting and useful methods.

**Keep Reading: AP Computer Science A Students**

`checkBalance()` is considered a non-static method because its signature does not include the keyword `static` like the `main()` method does. We’ll learn more about non-static methods later in this course.



**3 Calling Methods**

When we add a non-static method to a class, it becomes available to use on an object of that class. In order to have our methods get executed, we must *call* the method on the object we created.

Let’s add a non-static `startEngine()` method to our `Car` class from the previous lesson. Inside the `main()` method, we’ll call `startEngine()` on the `myFastCar` object:

```java
class Car {
 
  String color;
 
  public Car(String carColor) {
    color = carColor;
  }
 
  public void startEngine() {
    System.out.println("Starting the car!");
    System.out.println("Vroom!");
  }
 
  public static void main(String[] args){
    Car myFastCar = new Car("red");
    // Call a method on an object 
    myFastCar.startEngine();
    System.out.println("That was one fast car!");
  }
}
```

Let’s take a closer look at the method call:

```java
myFastCar.startEngine();
```

First, we reference our object `myFastCar`. Then, we use the *dot operator* (`.`) to call the method `startEngine()`. Note that we must include parentheses `()` after our method name in order to call it.

If we run the above program, we will get the following output.

```
Starting the car!
Vroom!
That was one fast car!
```

Code generally runs in a top-down order where code execution starts at the top of a program and ends at the bottom of a program; however, methods are ignored by the compiler unless they are being called.

When a method is called, the compiler executes every statement contained within the method. Once all method instructions are executed, the top-down order of execution continues. This is why `Starting the car!` and `Vroom!` are outputted before `That was one fast car!`.



**4 Scope**

A method is a task that an object of a class performs.

We mark the domain of this task using curly braces: `{`, and `}`. Everything inside the curly braces is part of the task. This domain is called the *scope* of a method.

We can’t access variables that are declared inside a method in code that is outside the scope of that method.

Looking at the `Car` class again:

```java
class Car {
  String color;
  int milesDriven;
 
  public Car(String carColor) {
    color = carColor;
    milesDriven = 0;         
  }
 
  public void drive() {
     String message = "Miles driven: " + milesDriven;
     System.out.println(message);
  }
 
  public static void main(String[] args){
     Car myFastCar = new Car("red");
     myFastCar.drive();
  }
}
```

The variable `message`, which is declared and initialized inside of `drive`, cannot be used inside of `main()`! It only exists within the *scope* of the `drive()` method.

However, `milesDriven`, which is declared at the top of the class, can be used inside all methods in the class, since it is in the scope of the whole class.



**5 Adding Parameters**

We saw how a method’s scope prevents us from using variables declared in one method in another method. What if we had some information in one method that we needed to pass into another method?

Similar to how we added parameters to *constructors*, we can customize all other methods to accept parameters. For example, in the following code, we create a `startRadio()` method that accepts a `Double` parameter, `stationNum`, and a `String` parameter called `stationName`:

```java
class Car {
 
  String color;
 
  public Car(String carColor) {
    color = carColor;         
  }
 
  public void startRadio(double stationNum, String stationName) {
    System.out.println("Turning on the radio to " + stationNum + ", " + station + "!");
    System.out.println("Enjoy!");
  }
 
  public static void main(String[] args){
    Car myCar = new Car("red");
    myCar.startRadio(103.7, "Meditation Station");
  }
}
```

Adding parameter values impacts our method’s signature. Like constructor signatures, the method signature includes the method name as well as the parameter types of the method. The signature of the above method is `startRadio(double, String)`.

In the `main()` method, we call the `startRadio()` method on the `myCar` object and provide a `double` argument of `103.7` and `String` argument of `"Meditation Station"`, resulting in the following output:

```
Turning on the radio to 103.7, Meditation Station!
Enjoy!
```

Note that when we call on a method with multiple parameters, the arguments given in the call must be placed in the same order as the parameters appear in the signature. If the argument types do not match the parameter types, we’ll receive an error.

**Keep Reading: AP Computer Science A Students**

Through method overloading, our Java programs can contain multiple methods with the same name as long as each method’s parameter list is unique. For example, we can recreate our above program to contain two `startRadio()` methods:

```java
// Method 1
public void startRadio(double stationNum, String stationName) {
  System.out.println("Turning on the radio to " + stationNum + ", " + station + "!");
  System.out.println("Enjoy!");
}
 
// Method 2
public void startRadio(double stationNum) {
  System.out.println("Turning on the radio to " + stationNum + "!");
}
 
public static void main(String[] args){
  Car myCar = new Car("red");
  // Calls the first startRadio() method
  myCar.startRadio(103.7, "Meditation Station");
 
  // Calls the second startRadio() method
  myCar.startRadio(98.2);
}
 
```



**6 Reassigning Instance Fields**

Earlier, we thought about a Savings Account as a type of object we could represent in Java.

Two of the methods we need are depositing and withdrawing:

```java
public SavingsAccount{
  double balance;
  public SavingsAccount(double startingBalance){
    balance = startingBalance;
  }
 
  public void deposit(double amountToDeposit){
     //Add amountToDeposit to the balance
  }
 
  public void withdraw(double amountToWithdraw){
     //Subtract amountToWithdraw from the balance
  }
 
  public static void main(String[] args){
 
  }
}
```

These methods would change the value of the variable `balance`. We can *reassign* balance to be a new value by using our assignment operator, `=`, again.

```java
public void deposit(double amountToDeposit){
  double updatedBalance = balance + amountToDeposit;
  balance = updatedBalance;
}
```

Now, when we call `deposit()`, it should change the value of the instance field `balance`:

```java
public static void main(String[] args){
  SavingsAccount myAccount = new SavingsAccount(2000);
  System.out.println(myAccount.balance);
  myAccount.deposit(100);
  System.out.println(myAccount.balance);
}
```

This code first prints `2000`, the initial value of `myAccount.balance`, and then prints `2100`, which is the value of `myAccount.balance` after the `deposit()` method has run.

Changing instance fields is how we change the state of an object and make our objects more flexible and realistic.



**7 Returns**

Remember, variables can only exist in the *scope* that they were declared in. We can use a value outside of the method it was created in if we *return* it from the method.

We return a value by using the keyword `return`:

```java
public int numberOfTires() {
   int tires = 4;
   // return statement
   return tires;
}
```

This method, called `numberOfTires()`, returns `4`. Once the return statement is executed, the compiler exits the function. Any code that exists after the return statement in a function is ignored.

In past exercises, when creating new methods, we used the keyword `void`. Here, we are replacing `void` with `int`, to signify that the *return type* is an `int`.

The void keyword (which means “completely empty”) indicates that no value is returned after calling that method.

A non-void method, like `numberOfTires()` returns a value when it is called. We can use datatype keywords (such as `int`, `char`, etc.) to specify the type of value the method should return. The return value’s type must match the return type of the method. If the return expression is compatible with the return type, a copy of that value gets returned in a process known as *return by value*.

Unlike void methods, non-void methods can be used as either a variable value or as part of an expression like so:

```java
public static void main(String[] args){
    Car myCar = new Car("red");
    int numTires = myCar.numberOfTires();
}
```

Within `main()`, we called the `numberOfTires()` method on `myCar`. Since the method returns an `int` value of `4`, we store the value in an integer variable called `numTires`. If we printed `numTires`, we would see `4`.

**Keep Reading: AP Computer Science A Students**

We learned how to return primitive values from a method, but what if we wanted our method to return an object? Returning an object works a little differently than returning a primitive value. When we return a primitive value, a copy of the value is returned; however, when we return an object, we return a reference to the object instead of a copy of it.

Let’s create a second class, `carLot`, that takes in a `Car` as a parameter and contains a method which returns a `Car` object.

```java
class CarLot {
    Car carInLot;
    public CarLot(Car givenCar) {
        carInLot = givenCar;
    }
 
    public Car returnACar() {
        // return Car object
        return carInLot;
    }
 
    public static void main(String[] argos) {
        Car myCar = new Car("red", 70);
        System.out.println(myCar); 
        CarLot myCarLot = new CarLot(myCar);
        System.out.println(myCarLot.returnACar());
    }
}
```

This code outputs the same memory address because `myCar` and `carInLot` have the same reference value:

```
Car@2f333739
Car@2f333739
```



**8 The toString() Method**

When we print out Objects, we often see a String that is not very helpful in determining what the Object represents. In the last lesson, we saw that when we printed our `Store` objects, we would see output like:

```
Store@6bc7c054
```

where `Store` is the name of the object and `6bc7c054` is its position in memory.

This doesn’t tell us anything about what the `Store` sells, the price, or the other instance fields we’ve defined. We can add a method to our classes that makes this printout more descriptive.

When we define a *toString()* method for a class, we can return a `String` that will print when we print the object:

```java
class Car {
 
    String color;
 
    public Car(String carColor) {
        color = carColor;
    }
 
    public static void main(String[] args){
        Car myCar = new Car("red");
        System.out.println(myCar);
    }
 
   public String toString(){
       return "This is a " + color + " car!";
   }
}
```

When this runs, the command `System.out.println(myCar)` will print `This is a red car!`, which tells us about the Object `myCar`.





# 4 Conditionals and control flow

## 4.1 Conditionals and Control Flow

Introduction to Control Flow

Imagine we’re writing a program that enrolls students in courses.

- *If* a student has completed the prerequisites, *then* they can enroll in a course.
- *Else*, they need to take the prerequisite courses.

They can’t take Physics II without finishing Physics I.

We represent this kind of decision-making in our program using *conditional* or *control flow* statements. Before this point, our code runs line-by-line from the top down, but conditional statements allow us to be selective in which portions will run.

Conditional statements check a `boolean` condition and run a *block* of code depending on the condition. Curly braces mark the scope of a conditional block similar to a method or class.

Here’s a complete conditional statement:

```java
if (true) {
  System.out.println("Hello World!");
}
```

If the condition is `true`, then the block is run. So `Hello World!` is printed.

But suppose the condition is different:

```java
if (false) {
  System.out.println("Hello World!");
}
```

If the condition is `false`, then the block does not run.

This code is also called *if-then* statements: “If `(condition)` is `true`, then do something”.

**1 If-Then Statement**

The *if-then* statement is the most simple control flow we can write. It tests an expression for truth and executes some code based on it.

```java
if (flip == 1) {
  System.out.println("Heads!");
}
```

- The `if` keyword marks the beginning of the conditional statement, followed by parentheses `()`.
- The parentheses hold a `boolean` datatype.

For the condition in parentheses we can also use variables that reference a boolean, or comparisons that evaluate to a boolean.

The boolean condition is followed by opening and closing curly braces that mark a block of code. This block runs if, and only if, the boolean is `true`.

```java
boolean isValidPassword = true;
if (isValidPassword) { 
  System.out.println("Password accepted!");
}
 
// Prints "Password accepted!"
int numberOfItemsInCart = 9;
if (numberOfItemsInCart > 12) {
  System.out.println("Express checkout not available");
}
 
// Nothing is printed.
```

If a conditional is brief we can omit the curly braces entirely:

```java
if (true) System.out.println("Brevity is the soul of wit");
```

**Note:** Conditional statements do not end in a semicolon.



**2 If-Then-Else**

We’ve seen how to conditionally execute one block of code, but what if there are two possible blocks of code we’d like to execute?

Let’s say *if* a student has the required prerequisite, *then* they enroll in the selected course, *else* they’re enrolled in the prerequisite course instead.

We create an alternate conditional branch with the `else` keyword:

```java
if (hasPrerequisite) {
  // Enroll in course
} else {
  // Enroll in prerequisite
}
```

This conditional statement ensures that exactly one code block will be run. If the condition, `hasPrerequisite`, is `false`, the block after `else` runs.

There are now two separate code blocks in our conditional statement. The first block runs if the condition evaluates to `true`, the second block runs if the condition evaluates to `false`.

This code is also called an *if-then-else* statement:

- If *condition* is true, then do something.
- Else, do a different thing.



**3 If-Then-Else-If**

The conditional structure we’ve learned can be chained together to check as many conditions as are required by our program.

Imagine our program is now selecting the appropriate course for a student. We’ll check their submission to find the correct course enrollment.

The conditional statement now has multiple conditions that are evaluated from the top down:

```java
String course = "Theatre";
 
if (course.equals("Biology")) {
  // Enroll in Biology course
} else if (course.equals("Algebra")) {
  // Enroll in Algebra course
} else if (course.equals("Theatre")) {
  // Enroll in Theatre course
} else {
  System.out.println("Course not found!");
}
```

**The first** condition to evaluate to `true` will have that code block run. Here’s an example demonstrating the order:

```java
int testScore = 72;
if (testScore >= 90) {
  System.out.println("A");
} else if (testScore >= 80) {
  System.out.println("B");
} else if (testScore >= 70) {
  System.out.println("C");
} else if (testScore >= 60) {
  System.out.println("D");
} else {
  System.out.println("F");
}
// prints: C
```

This chained conditional statement has two conditions that evaluate `true`. Because `testScore >= 70` comes before `testScore >= 60`, only the earlier code block is run.

**Note:** Only one of the code blocks will run.



**4 Nested Conditional Statements**

We can create more complex conditional structures by creating *nested conditional statements*, which is created by placing conditional statements inside other conditional statements:

```pseudo
if (outer condition) {
  if (nested condition) {
    Instruction to execute if both conditions are true
  }
}
```

When we implement nested conditional statements, the outer statement is evaluated first. If the outer condition is `true`, then the inner, nested statement is evaluated.

Let’s create a program that helps us decide what to wear based on the weather:

```java
int temp = 45;
boolean raining = true;
 
if (temp < 60) {
  System.out.println("Wear a jacket!");
  if (raining == true) {
    System.out.println("Bring your umbrella.");
  } else {
    System.out.println("Leave your umbrella home.");
  }
}
```

In the code snippet above, our compiler will check the condition in the first `if-then` statement: `temp < 60`. Since `temp` has a value of `45`, this condition is `true`; therefore, our program will print `Wear a jacket!`.

Then, we’ll evaluate the condition of the nested `if-then` statement: `raining == true`. This condition is also `true`, so `Bring your umbrella` is also printed to the screen.

Note that, if the first condition was `false`, the nested condition would not be evaluated.



**5 Switch Statement**

An alternative to chaining if-then-else conditions together is to use the `switch` statement. This conditional will check a given value against any number of conditions and run the code block where there is a match.

Here’s an example of our course selection conditional as a `switch` statement instead:

```java
String course = "History";
 
switch (course) {
  case "Algebra": 
    // Enroll in Algebra
    break; 
  case "Biology": 
    // Enroll in Biology
    break;
  case "History": 
    // Enroll in History
    break;
  case "Theatre":
    // Enroll in Theatre
    break;
  default:
    System.out.println("Course not found");
}
```

This example enrolls the student in History class by checking the value contained in the parentheses, `course`, against each of the `case` labels. If the value after the case label matches the value within the parentheses, the *switch block* is run.

In the above example, `course` references the string `"History"`, which matches `case "History":`.

When no value matches, the `default` block runs. Think of this as the `else` equivalent.

Switch blocks are different than other code blocks because they are not marked by curly braces and we use the `break` keyword to exit the switch statement.

Without `break`, code below the matching `case` label is run, *including code under other case labels*, which is rarely the desired behavior.

```java
String course = "Biology";
 
switch (course) {
  case "Algebra": 
    // Enroll in Algebra
  case "Biology": 
    // Enroll in Biology
  case "History": 
    // Enroll in History
  case "Theatre":
    // Enroll in Theatre
  default:
    System.out.println("Course not found");
}
 
// enrolls student in Biology... AND History and Theatre!
```



## 4.2 Conditional Operators

### The Arithmetic Operators

Arithmetic operators are used in mathematical expressions in the same way that they are used in algebra. The following table lists the arithmetic operators −

Assume integer variable A holds 10 and variable B holds 20, then −

[Show Examples](https://www.tutorialspoint.com/java/java_arithmatic_operators_examples.htm)

|      Operator      |                         Description                          |       Example       |
| :----------------: | :----------------------------------------------------------: | :-----------------: |
|    + (Addition)    |         Adds values on either side of the operator.          | A + B will give 30  |
|  - (Subtraction)   |     Subtracts right-hand operand from left-hand operand.     | A - B will give -10 |
| * (Multiplication) |      Multiplies values on either side of the operator.       | A * B will give 200 |
|    / (Division)    |       Divides left-hand operand by right-hand operand.       |  B / A will give 2  |
|    % (Modulus)     | Divides left-hand operand by right-hand operand and returns remainder. |  B % A will give 0  |
|   ++ (Increment)   |             Increases the value of operand by 1.             |    B++ gives 21     |
|   -- (Decrement)   |             Decreases the value of operand by 1.             |    B-- gives 19     |

```java
// /:Division： %：Modulus
System.out.println(10/3); // 3
System.out.println(10%3); // 1
System.out.println(10/3.0); // 3.3333 
System.out.println(10%3.0); // 1.0
```



### The Relational Operators

There are following relational operators supported by Java language.

Assume variable A holds 10 and variable B holds 20, then −

[Show Examples](https://www.tutorialspoint.com/java/java_relational_operators_examples.htm)

|           Operator            |                         Description                          |        Example        |
| :---------------------------: | :----------------------------------------------------------: | :-------------------: |
|         == (equal to)         | Checks if the values of two operands are equal or not, if yes then condition becomes true. | (A == B) is not true. |
|       != (not equal to)       | Checks if the values of two operands are equal or not, if values are not equal then condition becomes true. |   (A != B) is true.   |
|       > (greater than)        | Checks if the value of left operand is greater than the value of right operand, if yes then condition becomes true. | (A > B) is not true.  |
|         < (less than)         | Checks if the value of left operand is less than the value of right operand, if yes then condition becomes true. |   (A < B) is true.    |
| >= (greater than or equal to) | Checks if the value of left operand is greater than or equal to the value of right operand, if yes then condition becomes true. | (A >= B) is not true. |
|  <= (less than or equal to)   | Checks if the value of left operand is less than or equal to the value of right operand, if yes then condition becomes true. |   (A <= B) is true.   |

### The Bitwise Operators

Java defines several bitwise operators, which can be applied to the integer types, long, int, short, char, and byte.

Bitwise operator works on bits and performs bit-by-bit operation. Assume if a = 60 and b = 13; now in binary format they will be as follows −

a = 0011 1100

b = 0000 1101

\-----------------

a&b = 0000 1100

a|b = 0011 1101

a^b = 0011 0001

~a = 1100 0011

The following table lists the bitwise operators −

Assume integer variable A holds 60 and variable B holds 13 then −

[Show Examples](https://www.tutorialspoint.com/java/java_bitwise_operators_examples.htm)

|          Operator           |                         Description                          |                           Example                            |
| :-------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
|       & (bitwise and)       | Binary AND Operator copies a bit to the result if it exists in both operands. |           (A & B) will give 12 which is 0000 1100            |
|       \| (bitwise or)       | Binary OR Operator copies a bit if it exists in either operand. |           (A \| B) will give 61 which is 0011 1101           |
|       ^ (bitwise XOR)       | Binary XOR Operator copies the bit if it is set in one operand but not both. |           (A ^ B) will give 49 which is 0011 0001            |
|   ~ (bitwise compliment)    | Binary Ones Complement Operator is unary and has the effect of 'flipping' bits. | (~A ) will give -61 which is 1100 0011 in 2's complement form due to a signed binary number. |
|       << (left shift)       | Binary Left Shift Operator. The left operands value is moved left by the number of bits specified by the right operand. |           A << 2 will give 240 which is 1111 0000            |
|      >> (right shift)       | Binary Right Shift Operator. The left operands value is moved right by the number of bits specified by the right operand. |              A >> 2 will give 15 which is 1111               |
| >>> (zero fill right shift) | Shift right zero fill operator. The left operands value is moved right by the number of bits specified by the right operand and shifted values are filled up with zeros. |            A >>>2 will give 15 which is 0000 1111            |

### The Logical Operators

The following table lists the logical operators −

Assume Boolean variables A holds true and variable B holds false, then −

[Show Examples](https://www.tutorialspoint.com/java/java_logical_operators_examples.htm)

|     Operator      |                         Description                          |      Example       |
| :---------------: | :----------------------------------------------------------: | :----------------: |
| && (logical and)  | Called Logical AND operator. If both the operands are non-zero, then the condition becomes true. | (A && B) is false  |
| \|\| (logical or) | Called Logical OR Operator. If any of the two operands are non-zero, then the condition becomes true. | (A \|\| B) is true |
|  ! (logical not)  | Called Logical NOT Operator. Use to reverses the logical state of its operand. If a condition is true then Logical NOT operator will make false. | !(A && B) is true  |

### The Assignment Operators

Following are the assignment operators supported by Java language −

[Show Examples](https://www.tutorialspoint.com/java/java_assignment_operators_examples.htm)

| Operator |                         Description                          |                   Example                   |
| :------: | :----------------------------------------------------------: | :-----------------------------------------: |
|    =     | Simple assignment operator. Assigns values from right side operands to left side operand. | C = A + B will assign value of A + B into C |
|    +=    | Add AND assignment operator. It adds right operand to the left operand and assign the result to left operand. |      C += A is equivalent to C = C + A      |
|    -=    | Subtract AND assignment operator. It subtracts right operand from the left operand and assign the result to left operand. |      C -= A is equivalent to C = C – A      |
|    *=    | Multiply AND assignment operator. It multiplies right operand with the left operand and assign the result to left operand. |      C *= A is equivalent to C = C * A      |
|    /=    | Divide AND assignment operator. It divides left operand with the right operand and assign the result to left operand. |      C /= A is equivalent to C = C / A      |
|    %=    | Modulus AND assignment operator. It takes modulus using two operands and assign the result to left operand. |      C %= A is equivalent to C = C % A      |
|   <<=    |             Left shift AND assignment operator.              |        C <<= 2 is same as C = C << 2        |
|   >>=    |             Right shift AND assignment operator.             |        C >>= 2 is same as C = C >> 2        |
|    &=    |               Bitwise AND assignment operator.               |         C &= 2 is same as C = C & 2         |
|    ^=    |        bitwise exclusive OR and assignment operator.         |         C ^= 2 is same as C = C ^ 2         |
|   \|=    |        bitwise inclusive OR and assignment operator.         |        C \|= 2 is same as C = C \| 2        |

### Miscellaneous Operators

There are few other operators supported by Java Language.

#### Conditional Operator ( ? : )

Conditional operator is also known as the **ternary operator**. This operator consists of three operands and is used to evaluate Boolean expressions. The goal of the operator is to decide, which value should be assigned to the variable. The operator is written as −

```java
variable x = (expression) ? value if true : value if false
```



# 5 Arrays and ArrayLists

## 5.1 Learn Java: Arrays

Introduction

We have seen how to store single pieces of data in variables. What happens when we need to store a group of data? What if we have a list of students in a classroom? Or a ranking of the top 10 horses finishing a horse race?

If we were storing 5 lottery ticket numbers, for example, we could create a different variable for each value:

```java
int firstNumber = 4;
int secondNumber = 8;
int thirdNumber = 15;
int fourthNumber = 16;
int fifthNumber = 23;
```

That is a lot of ungainly repeated code. What if we had a hundred lottery numbers? It is more clean and convenient to use a Java *array* to store the data as a list.

An array holds a fixed number of values of one type. Arrays hold `double`s, `int`s, `boolean`s, or any other primitives. Arrays can also contain `String`s as well as object references!

Each index of an array corresponds with a different value. Here is a diagram of an array filled with integer values:

![A diagram of an example int array](https://content.codecademy.com/courses/learn-java/revised-2019/array-introduction.png)


Notice that the indexes start at 0! The element at index 0 is `4`, while the element at index 1 is `8`. This array has a length of 5, since it holds five elements, but the highest index of the array is 4.

Let’s explore how to create and use arrays in Java, so that we can store all of our Java data types.



**1 Creating an Array Explicitly**

Imagine that we’re using a program to keep track of the prices of different clothing items we want to buy. We would want a list of the prices and a list of the items they correspond to. To create an array, we first declare the type of data it holds:

```java
double[] prices;
```

Then, we can explicitly initialize the array to contain the data we want to store:

```java
 prices = {13.15, 15.87, 14.22, 16.66};
```

Just like with simple variables, we can declare and initialize in the same line:

```java
double[] prices = {13.15, 15.87, 14.22, 16.66};
```

We can use arrays to hold `String`s and other objects as well as primitives:

```java
String[] clothingItems = {"Tank Top", "Beanie", "Funny Socks", "Corduroys"};
```



**2 Importing Arrays**

When we printed out the array we created in the last exercise, we saw a memory address that did not help us understand what was contained in the array.

If we want to have a more descriptive printout of the array itself, we need a `toString()` method that is provided by the `Arrays` *package* in Java.

```java
import java.util.Arrays;
```

We put this at the top of the file, before we even define the class!

When we import a package in Java, we are making all of the methods of that package available in our code.

The `Arrays` package has many useful methods, including `Arrays.toString()`. When we pass an array into `Arrays.toString()`, we can see the contents of the array printed out:

```java
import java.util.Arrays;
 
public class Lottery(){
 
  public static void main(String[] args){
    int[] lotteryNumbers = {4, 8, 15, 16, 23, 42};
    String betterPrintout = Arrays.toString(lotteryNumbers);
    System.out.println(betterPrintout);
  }
 
}
```

This code will print:

```java
[4, 8, 15, 16, 23, 42]
```



**3 Get Element By Index**

Now that we have an array declared and initialized, we want to be able to get values out of it.

We use square brackets, `[` and `]`, to access data at a certain index:

```java
double[] prices = {13.1, 15.87, 14.22, 16.66};
 
System.out.println(prices[1]);
```

This command would print:

```
15.87
```

This happens because `15.87` is the item at the `1` index of the array. Remember, the index of an array starts at `0` and ends at an index of one less than the number of elements in the array.

If we try to access an element outside of its appropriate index range, we will receive an `ArrayIndexOutOfBoundsException` error.

For example, if we were to run the command `System.out.println(prices[5])`, we’d get the following output:

```error
java.lang.ArrayIndexOutOfBoundsException: 5
```



**4 Creating an Empty Array**

We can also create empty arrays and then fill the items one by one. Empty arrays have to be initialized with a fixed size:

```java
String[] menuItems = new String[5];
```

Once you declare this size, it cannot be changed! This array will always be of size `5`.

After declaring and initializing, we can set each index of the array to be a different item:

```java
menuItems[0] = "Veggie hot dog";
menuItems[1] = "Potato salad";
menuItems[2] = "Cornbread";
menuItems[3] = "Roasted broccoli";
menuItems[4] = "Coffee ice cream";
```

This group of commands has the same effect as assigning the entire array at once:

```java
String[] menuItems = {"Veggie hot dog", "Potato salad", "Cornbread", "Roasted broccoli", "Coffee ice cream"};
```

We can also change an item after it has been assigned! Let’s say this restaurant is changing its broccoli dish to a cauliflower one:

```java
menuItems[3] = "Baked cauliflower";
```

Now, the array looks like:

```java
["Veggie hot dog", "Potato salad", "Cornbread", "Baked cauliflower", "Coffee ice cream"]
```

**Keep Reading: AP Computer Science A Students**

When we use `new` to create an empty array, each element of the array is initialized with a specific value depending on what type the element is:

| Data Type | Initialized Value |
| --------- | ----------------- |
| int       | `0`               |
| double    | `0.0`             |
| boolean   | `false`           |
| Reference | `null`            |

For example, consider the following arrays:

```java
String[] my_names = new String[5];
int[] my_ages = new int[5];
```

Because a String is a reference to an Object, `my_ages` will contain five `null`s. `my_ages` will contain five `0`s to begin with.



**5 Length**

What if we have an array storing all the usernames for our program, and we want to quickly see how many users we have? To get the length of an array, we can access the `length` field of the array object:

```java
String[] menuItems = new String[5];
System.out.println(menuItems.length);
```

This command would print `5`, since the `menuItems` array has `5` slots, even though they are all empty.

If we print out the length of the `prices` array:

```java
double[] prices = {13.1, 15.87, 14.22, 16.66};
 
System.out.println(prices.length);
```

We would see `4`, since there are four items in the `prices` array!



**6 String[] args**

When we write `main()` methods for our programs, we use the parameter `String[] args`. Now that we know about array syntax, we can start to parse what this means.

A `String[]` is an array made up of `String`s. Examples of `String` arrays:

```java
String[] humans = {"Talesha", "Gareth", "Cassie", "Alex"};
String[] robots = {"R2D2", "Marvin", "Bender", "Ava"};
```

The `args` parameter is another example of a `String` array. In this case, the array `args` contains the arguments that we pass in from the terminal when we run the class file. (So far, `args` has been empty.)

So how can you pass arguments to `main()`? Let’s say we have this class `HelloYou`:

```java
public class HelloYou {
  public static void main(String[] args) {
    System.out.println("Hello " + args[0]);  
  }
}
```

When we run the file `HelloYou` in the terminal with an argument of `"Laura"`:

```shell
java HelloYou Laura
```

We get the output:

```shell
Hello Laura
```

The `String[] args` would be interpreted as an array with one element, `"Laura"`.

When we use `args[0]` in the main method, we can access that element like we did in `HelloYou`.



**7 Review**

We have now seen how to store a list of values in arrays. We can use this knowledge to make organized programs with more complex variables.

Throughout the lesson, we have learned about:

- Creating arrays explicitly, using `{` and `}`.
- Accessing an index of an array using `[` and `]`.
- Creating empty arrays of a certain size, and filling the indices one by one.
- Getting the length of an array using `length`.
- Using the argument array `args` that is passed into the `main()` method of a class.





## 5.2 Learn Java: ArrayLists



Introduction

When we work with arrays in Java, we’ve been limited by the fact that once an array is created, it has a fixed size. We can’t add or remove elements.

But what if we needed to add to the book lists, newsfeeds, and other structures we were using arrays to represent?

To create mutable and dynamic lists, we can use Java’s `ArrayList`s. `ArrayList`s allow us to:

- Store object references as elements
- Store elements of the same type (just like arrays)
- Access elements by index (just like arrays)
- Add elements
- Remove elements

Remember how we had to import `java.util.Arrays` in order to use additional array methods? To use an `ArrayList` at all, we need to import them from Java’s `util` package as well:

```java
import java.util.ArrayList;
```

Let’s learn how to make use of this powerful object…



**1 Creating ArrayLists**

To create an `ArrayList`, we need to declare the type of objects it will hold, just as we do with arrays:

```java
ArrayList<String> babyNames;
```

We use angle brackets `<` and `>` to declare the type of the `ArrayList`. These symbols are used for *generics*. Generics are a Java construct that allows us to define classes and objects as parameters of an `ArrayList`. For this reason, we can’t use primitive types in an `ArrayList`:

```java
// This code won't compile:
ArrayList<int> ages;
 
// This code will compile:
ArrayList<Integer> ages;
```

The `<Integer>` generic has to be used in an `ArrayList` instead. You can also use `<Double>` and `<Char>` for types you would normally declare as `double`s or `char`s.

We can initialize to an empty `ArrayList` using the `new` keyword:

```java
// Declaring:
ArrayList<Integer> ages;
// Initializing:
ages = new ArrayList<Integer>();
 
// Declaring and initializing in one line:
ArrayList<String> babyNames = new ArrayList<String>();
```



**2 Adding an Item**

Now we have an empty `ArrayList`, but how do we get it to store values?

`ArrayList` comes with an `add()` method which inserts an element into the structure. There are two ways we can use `add()`.

If we want to add an element to the end of the `ArrayList`, we’ll call `add()` using only one argument that represents the value we are inserting. In this example, we’ll add objects from the `Car` class to an `ArrayList` called `carShow`:

```java
ArrayList<Car> carShow = new ArrayList<Car>();
 
carShow.add(ferrari);
// carShow now holds [ferrari]
carShow.add(thunderbird);
// carShow now holds [ferrari, thunderbird]
carShow.add(volkswagon);
// carShow now holds [ferrari, thunderbird, volkswagon]
```

If we want to add an element at a specific index of our `ArrayList`, we’ll need two arguments in our method call: the first argument will define the index of the new element while the second argument defines the value of the new element:

```java
// Insert object corvette at index 1
carShow.add(1, corvette);
// carShow now holds [ferrari, corvette, thunderbird, volkswagon]
 
// Insert object porsche at index 2
carShow.add(2, porsche);
// carShow now holds [ferrari, corvette, porsche, thunderbird, volkswagon]
```

By inserting a value at a specified index, any elements that appear after this new element will have their index value shift over by 1.

Also, note that an error will occur if we try to insert a value at an index that does not exist.

**Keep Reading: AP Computer Science A Students**

When using `ArrayList` methods (like `add()`), the reference parameters and return type of a method must match the declared element type of the `ArrayList`. For example, we cannot add an `Integer` type value to an `ArrayList` of `String` elements.

We’ve discussed how to specify the element type of an `ArrayList`; however, it is possible to create an `ArrayList` that holds values of different types.

In the following snippet, `assortment` is an `ArrayList` that can store different values because we do not specify its type during initialization.

```java
ArrayList assortment = new ArrayList<>();
assortment.add("Hello"); // String
assortment.add(12); // Integer
assortment.add(ferrari); // reference to Car
// assortment holds ["Hello", 12, ferrari]
```

In this case, the items stored in this `ArrayList` will be considered `Objects`. As a result, they won’t have access to some of their methods without doing some fancy casting. Although this type of `ArrayList` is allowed, using an `ArrayList` that specifies its type is preferred.



**3 ArrayList Size**

Let’s say we have an `ArrayList` that stores items in a user’s online shopping cart. As the user navigates through the site and adds items, their cart grows bigger and bigger.

If we wanted to display the number of items in the cart, we could find the size of it using the `size()` method:

```java
ArrayList<String> shoppingCart = new ArrayList<String>();
 
shoppingCart.add("Trench Coat");
System.out.println(shoppingCart.size());
// 1 is printed
shoppingCart.add("Tweed Houndstooth Hat");
System.out.println(shoppingCart.size());
// 2 is printed
shoppingCart.add("Magnifying Glass");
System.out.println(shoppingCart.size());
// 3 is printed
```

In dynamic objects like `ArrayList`s, it’s important to know how to access the amount of objects we have stored.



**4 Accessing an Index**

With arrays, we can use bracket notation to access a value at a particular index:

```java
double[] ratings = {3.2, 2.5, 1.7};
 
System.out.println(ratings[1]);
```

This code prints `2.5`, the value at index `1` of the array.

For `ArrayList`s, bracket notation won’t work. Instead, we use the method `get()` to access an index:

```java
ArrayList<String> shoppingCart = new ArrayList<shoppingCart>();
 
shoppingCart.add("Trench Coat");
shoppingCart.add("Tweed Houndstooth Hat");
shoppingCart.add("Magnifying Glass");
 
System.out.println(shoppingCart.get(2));
```

This code prints `"Magnifying Glass"`, which is the value at index 2 of the `ArrayList`.



**5 Changing a Value**

When we were using arrays, we could rewrite entries by using bracket notation to reassign values:

```java
String[] shoppingCart = {"Trench Coat", "Tweed Houndstooth Hat", "Magnifying Glass"};
 
shoppingCart[0] = "Tweed Cape";
 
// shoppingCart now holds ["Tweed Cape", "Tweed Houndstooth Hat", "Magnifying Glass"]
```

`ArrayList` has a slightly different way of doing this, using the `set()` method:

```java
ArrayList<String> shoppingCart = new ArrayList<shoppingCart>();
 
shoppingCart.add("Trench Coat");
shoppingCart.add("Tweed Houndstooth Hat");
shoppingCart.add("Magnifying Glass");
 
shoppingCart.set(0, "Tweed Cape");
 
// shoppingCart now holds ["Tweed Cape", "Tweed Houndstooth Hat", "Magnifying Glass"]
```



**6 Removing an Item**

What if we wanted to get rid of an entry altogether? For arrays, we would have to make a completely new array without the value.

Luckily, `ArrayList`s allow us to remove an item by specifying the index to remove:

```java
ArrayList<String> shoppingCart = new ArrayList<String>();
 
shoppingCart.add("Trench Coat");
shoppingCart.add("Tweed Houndstooth Hat");
shoppingCart.add("Magnifying Glass");
 
shoppingCart.remove(1);
// shoppingCart now holds ["Trench Coat", "Magnifying Glass"]
```

We can also remove an item by specifying the value to remove:

```java
ArrayList<String> shoppingCart = new ArrayList<String>();
 
shoppingCart.add("Trench Coat");
shoppingCart.add("Tweed Houndstooth Hat");
shoppingCart.add("Magnifying Glass");
 
shoppingCart.remove("Trench Coat");
// shoppingCart now holds ["Tweed Houndstooth Hat", "Magnifying Glass"]
```

**Note:** This command removes the FIRST instance of the value `"Trench Coat"`.



**7 Getting an Item's Index**

What if we had a really large list and wanted to know the position of a certain element in it? For instance, what if we had an `ArrayList` `detectives` with the names of fictional detectives in chronological order, and we wanted to know what position `"Fletcher"` was.

```java
// detectives holds ["Holmes", "Poirot", "Marple", "Spade", "Fletcher", "Conan", "Ramotswe"];
System.out.println(detectives.indexOf("Fletcher"));
```

This code would print `4`, since `"Fletcher"` is at index `4` of the `detectives` `ArrayList`.

