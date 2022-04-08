

# 6 Loops

**1 While We're Here**

A `while` loop looks a bit like an `if` statement:

```java
while (silliness > 10) {
  // code to run
}
```

Like an `if` statement, the code inside a `while` loop will only run if the condition is `true`. However, a `while` loop will continue running the code over and over until the condition evaluates to `false`. So the code block will repeat until `silliness` is less than or equal to 10.

```java
// set attempts to 0
int attempts = 0;
 
// enter loop if condition is true
while (passcode != 0524 && attempts < 4) {
 
  System.out.println("Try again.");
  passcode = getNewPasscode();
  attempts += 1;
 
  // is condition still true?
  // if so, repeat code block
}
// exit when condition is not true
```

`while` loops are extremely useful when you want to run some code until a specific change happens. However, if you aren’t certain that change will occur, beware the infinite loop!

*Infinite loops* occur when the condition will never evaluate to `false`. This can cause your entire program to crash.

```java
int hedgehogs = 5;
 
// This will cause an infinite loop:
while (hedgehogs < 6) {
  System.out.println("Not enough hedgehogs!");
}
```

In the example above, `hedgehogs` remains equal to `5`, which is less than `6`. So we would get an infinite loop.



**2 Incrementing While Loops**

When looping through code, it’s common to use a counter variable. A *counter* (also known as an *iterator*) is a variable used in the conditional logic of the loop and (usually) incremented in value during each iteration through the code. For example:

```java
// counter is initialized
int wishes = 0;
 
// conditional logic uses counter
while (wishes < 3) {
 
  System.out.println("Wish granted.");
  // counter is incremented
  wishes++;
 
}
```

In the above example, the counter `wishes` gets initialized before the loop with a value of `0`, then the program will keep printing `"Wish granted."` and adding `1` to `wishes` as long as `wishes` has a value of less than `3`. Once `wishes` reaches a value of `3` or more, the program will exit the loop.

So the output would look like:

```
Wish granted.
Wish granted.
Wish granted.
```

We can also decrement counters like this:

```java
int pushupsToDo = 10;
 
while (pushupsToDo > 0) {
 
  doPushup();
  pushupsToDo--;
 
}
```

In the code above, the counter, `pushupsToDo`, starts at 10, and increments down one at a time. When it hits 0, the loop exits.



**3 Using For Loops**

Even though we can write `while` loops that accomplish the same task, `for` loops are useful because they help us remember to increment our counter — something that is easy to forget when we increment with a `while` loop.

Leaving out that line of code would cause an infinite loop — yikes!

Fortunately, equipped with our new understanding of `for` loops, we can help prevent infinite loops in our own code.

It’s important to be aware that, if we don’t create the correct `for` loop header, we can cause the iteration to loop one too many or one too few times; this occurrence is known as an “off by one” error.

For example, imagine we wanted to find the sum of the first ten numbers and wrote the following code:

```java
int sum = 0;
for (int i = 0; i < 10; i++) {
  sum += i
}
```

This code would produce an incorrect value of `45`. We skipped adding `10` to `sum` because our loop control variable started with a value of `0` and stopped the iteration after it had a value of `9`. We were off by one! We could fix this by changing the condition of our loop to be `i <= 10;` or `i < 11;`.

These errors can be tricky because, while they do not always produce an error in the terminal, they can cause some miscalculations in our code. These are called logical errors — the code runs fine, but it didn’t do what you expected it to do.



**4 Iterating Over Arrays and ArrayLists**

One common pattern we’ll encounter as a programmer is *traversing*, or looping, through a list of data and doing something with each item. In Java, that list would be an array or `ArrayList` and the loop could be a `for` loop. But wait, how does this work?

In order to traverse an array or `ArrayList` using a loop, we must find a way to access each element via its index. We may recall that `for` loops are created with a counter variable. We can use that counter to track the index of the current element as we iterate over the list of data.

Because the first index in an array or `ArrayList` is `0`, the counter would begin with a value of `0` and increment until the end of the list. So we can increment through the array or `ArrayList` using its indices.

For example, if we wanted to add `1` to every `int` item in an array `secretCode`, we could do this:

```java
for (int i = 0; i < secretCode.length; i++) {
  // Increase value of element value by 1
  secretCode[i] += 1;
}
```

Notice that our condition in this example is `i < secretCode.length`. Because array indices start at 0, the length of `secretCode` is 1 larger than its final index. A loop should stop its traversal before its counter variable is equal to the length of the list.

To give a concrete example, if the length of an array is `5`, the last index we want to access is `4`. If we were to try to access index `5`, we would get an `ArrayIndexOutOfBoundsException` error! This is a very common mistake when first starting to traverse arrays.

Traversing an `ArrayList` looks very similar:

```java
for (int i = 0; i < secretCode.size(); i++) {
  // Increase value of element value by 1
  int num = secretCode.get(i);
  secretCode.set(i, num + 1);
}
```

We can also use `while` loops to traverse through arrays and `ArrayList`s. If we use a `while` loop, we need to create our own counter variable to access individual elements. We’ll also set our condition to continue looping until our counter variable equals the list length.

For example, let’s use a `while` loop to traverse through an array:

```java
int i = 0; // initialize counter
 
while (i < secretCode.size()) {
  secretCode[i] += 1;
  i++; // increment the while loop
}
```

Traversing through an `ArrayList` with a `while` loop would look like this:

```java
int i = 0; // initialize counter
 
while (i < secretCode.size()) {
  int num = secretCode.get(i);
  secretCode.set(i, num + i);
  i++; // increment the while loop
}
```



**5 break and continue**

If we ever want to exit a loop before it finishes all its iterations or want to skip one of the iterations, we can use the `break` and `continue` keywords.

The `break` keyword is used to exit, or break, a loop. Once `break` is executed, the loop will stop iterating. For example:

```java
for (int i = 0; i < 10; i++) {
  System.out.println(i);
  if (i == 4) {
    break;
  }
}
```

Even though the loop was set to iterate until the condition `i < 10` is `false`, the above code will output the following because we used `break`:

```
0
1
2
3
4
```

The `continue` keyword can be placed inside of a loop if we want to skip an iteration. If `continue` is executed, the current loop iteration will immediately end, and the next iteration will begin. We can use the `continue` keyword to skip any even valued iteration:

```java
int[] numbers = {1, 2, 3, 4, 5};
 
for (int i = 0; i < numbers.length; i++) {
  if (numbers[i] % 2 == 0) {
    continue;
  }
  System.out.println(numbers[i]);
}
```

This program would output the following:

```
1
3
5
```

In this case, if a number is even, we hit a `continue` statement, which skips the rest of that iteration, so the print statement is skipped. As a result, we only see odd numbers print.

**Keep Reading: AP Computer Science A Students**

Loops can exist all throughout our code - including inside a method. If the `return` keyword was executed inside a loop contained in a method, then the loop iteration would be stopped and the method/constructor would be exited.

For example, we have a method called `checkForJacket()` that takes in an array of `String`s. If any of the elements are equivalent to the `String` value `"jacket"`, the method will return `true`:

```java
public static boolean checkForJacket(String[] lst) {
  for (int i = 0; i < lst.length; i++) {
    System.out.println(lst[i]);
    if (lst[i] == "jacket") {
      return true;
    }
  }
  return false;
} 
 
public static void main(String[] args) {
  String[] suitcase = {"shirt", "jacket", "pants", "socks"};   
  System.out.println(checkForJacket(suitcase));
}
```

As soon as an element equals `"jacket"`, `return true;` is executed. This causes the loop to stop and the compiler to exit `checkForJacket()`. Running this code would output the following:

```
shirt
jacket
true
```



**6 For-Each Loops**

Sometimes we need access to the elements’ indices or we only want to iterate through a portion of a list. If that’s the case, a regular `for` loop or `while` loop is a great choice.

For example, we can use a `for` loop to print out each element in an array called `inventoryItems`:

```java
for (int inventoryItem = 0; inventoryItem < inventoryItems.length; inventoryItem++) {
  // Print element at current index
  System.out.println(inventoryItems[inventoryItem]);
}
```

But sometimes we couldn’t care less about the indices; we only care about the element itself.

At times like this, for-each loops come in handy.

*For-each loops*, which are also referred to as *enhanced loops*, allow us to directly loop through each item in a list of items (like an array or `ArrayList`) and perform some action with each item.

If we want to use a for-each loop to rewrite our program above, the syntax looks like this:

```java
for (String inventoryItem : inventoryItems) {
  // Print element value
  System.out.println(inventoryItem);
 
}
```

Our enhanced loop contains two items: an enhanced `for` loop variable (`inventoryItem`) and a list to traverse through (`inventoryItems`).

We can read the `:` as “in” like this: for each `inventoryItem` (which should be a `String`) in `inventoryItems`, print `inventoryItem`.

If we try to assign a new value to the enhanced `for` loop variable, the value stored in the array or `ArrayList` will not change. This is because, for every iteration in the enhanced loop, the loop variable is assigned a copy of the list element.

**Note:** We can name the enhanced `for` loop variable whatever we want; using the singular of a plural is just a convention. We may also encounter conventions like `String word : sentence`.



**7 Removing Elements During Traversal**

If we want to remove elements from an `ArrayList` while traversing through one, we can easily run into an error if we aren’t careful.

When an element is removed from an `ArrayList`, all the items that appear after the removed element will have their index value shift by negative one — it’s like all elements shifted to the left! We’ll have to be very careful with how we use our counter variable to avoid skipping elements.

Removing An Element Using `while`

When using a `while` loop and removing elements from an `ArrayList`, we should **not** increment the `while` loop’s counter whenever we remove an element. We don’t need to increase the counter because all of the other elements have now shifted to the left.

For example, if we removed the element at index `3`, then the element that was at index `4` will be moved to index `3`. If we increase our counter to `4`, we’ll skip that element!

Take a look at this block of code that will remove all odd numbers from an `ArrayList`. Think about what the value of `i` is, when we’re increasing the value of `i`, and when `i < lst.size()` becomes `False`.

```java
int i = 0; // initialize counter
 
while (i < lst.size()) {
  // if value is odd, remove value
  if (lst.get(i) % 2 != 0){
    lst.remove(i);
  } else {
    // if value is even, increment counter
    i++;
  }
}
```

Removing An Element Using `for`

We can use a similar strategy when removing elements using a `for` loop. When using a `while` loop, we decided to not increase our loop control variable whenever we removed an element. This ensured that we would not skip an element when all of the other elements shifted to the left.

When using a `for` loop, we, unfortunately, *must* increase our loop control variable — the loop control variable will always change when we reach the end of the loop (and it will usually change by `1` because we often use something like `i++`.) Since we can’t avoid increasing our loop control variable, we can take matters into our own hands and decrease the loop control variable whenever we remove an item.

For example:

```java
for (int i = 0; i < lst.size(); i++) {
  if (lst.get(i) == "value to remove"){
    // remove value from ArrayList
    lst.remove(lst.get(i));
    // Decrease loop control variable by 1
    i--;    
  }
}
```

Now whenever we remove an item, we’ll decrease `i` by `1`. Then when we reach the end of the loop, `i` will increase by `1`. It will be like `i` never changed!

**Note:** Avoid manipulating the size of an `ArrayList` when using an enhanced `for` loop. Actions like adding or removing elements from an `ArrayList` when using a `for each` loop can cause a `ConcurrentModifcationException` error.





# 7 String Methods

Introduction to String Methods

As you may recall, a `String`, which is widely used in Java, is an object that represents a sequence of characters. It is a great way to store information.

Because character strings are so vital to programming, Java dedicated an entire class to them. This is great news for us because the `String` class has a lot of useful methods to help us perform operations on `Strings` and data manipulation. We don’t have to import anything to use the `String` class because it’s apart of the `java.lang` package which is available by default.

In this lesson, we will go over several `String` methods:

- `length()`
- `concat()`
- `equals()`
- `indexOf()`
- `charAt()`
- `substring()`
- `toUpperCase()` / `toLowerCase()`

Let’s get started!



**1 length()**

In Java, the `length()` string method returns the length ⁠— total number of characters ⁠— of a `String`.

Suppose we have a `String` called `str`, `str.length()` would return its length.

Take a look at this code for example:

```java
String str = "Hello World!";  
 
System.out.println(str.length());
```

`12` would be printed because `str` has 12 characters:

```
H` `e` `l` `l` `o` `_` `W` `o` `r` `l` `d` `!
```

In theory, the length of a `String` is the same as the [Unicode](https://en.wikipedia.org/wiki/Unicode) units of the `String`. For example, escape sequences such as `\n` count as only one character.



**2 concat()**

The `concat()` method concatenates one string to the end of another string. Concatenation is the operation of joining two strings together.

Suppose we have a `String` called `str1` and another `String` called `str2`, using `str1.concat(str2)` would return `str1` with `str2` appended to the end of it.

For example:

```java
String name = new String("Code");
 
name = name.concat("cademy");
 
System.out.println(name);
```

`Codecademy` would be printed.

`String`s are immutable objects which means that `String` methods, like `concat()` do not actually change a `String` object.

Our variable, `name` holds a reference to the `String` object, `"Code"`. When we use `concat()` on `name`, we changed its value so that it references a new object — `"Code"`, combined with the String literal, `"cademy"`.

Suppose we do something slightly different. We’ll use `concat()` on `name` without reassigning its value:

```java
String name = "Code";
 
name.concat("cademy");
 
System.out.println(name);
```

`Code` would be printed instead. The value of the `String` can’t change! Instead, we create a new object and need to assign that new object to some variable.

**Keep Reading: AP Computer Science A Students**

When we first discussed Objects we learned that if we tried printing an Object, we’d get an output of the class name and the Object’s memory address. If we wanted to get a more useful printout, we’d have to call the Object’s `toString()` method.

This `toString()` method comes into play with `concat()`. If we concatenate a String with another Object, we’re really adding the result of that Object’s `toString()` method to our original String. We can even see this when we concatenate two Strings together (remember a String is an Object). When we use `concat()` on another String, we don’t concatenate its memory address to the original String. Instead, we combine the result of its `toString()` method to the original String.

You can refresh yourself on the `toString()` method in [this exercise](https://www.codecademy.com/courses/learn-java/lessons/learn-java-methods/exercises/the-tostring-method).



**3 equals()**

With objects, such as `String`s, we can’t use the primitive equality operator `==` to check for equality between two strings. To test equality with strings, we use a built-in method called `equals()`.

For example:

```java
String flavor1 = "Mango";
String flavor2 = "Peach";
 
System.out.println(flavor1.equals("Mango"));
// prints true
 
System.out.println(flavor2.equals("Mango"));
// prints false
```

Side note, there’s also an `equalsIgnoreCase()` method that compares two strings without considering upper/lower cases.

**Keep Reading: AP Computer Science A Students**

We can also compare `String` values lexicographically (think dictionary order) using the `.compareTo()` method. When we call the `.compareTo()` method, each character is in the `String` is converted to Unicode; then the Unicode character from each `String` is compared.

The method will return an `int` that represents the difference between the two Strings.

For example:

```java
String flavor1 = "Mango";
String flavor2 = "Peach";
 
System.out.println(flavor1.compareTo(flavor2)); 
```

Our program above will output `-3`.

When we use `.compareTo()`, we must pay attention to the return value:

- If the method returns `0`, the two `String`s are equal.
- If the value is less than `0`, then the `String` object is lexicographically less than the `String` object argument.
- If the value is greater than `0`, then the `String` object is lexicographically greater than the `String` object argument.

In the example above, `"Mango"` comes before `"Peach"`, so we get a negative number (we specifically get `-3` because the Unicode values of `"M"` and `"P"` differ by 3). If we did `flavor2.compareTo(flavor1)`, we would get `3`, signifying that `"Peach"` is greater than `"Mango"`.

**Note:** Make sure to pay attention to capitalization when using `.compareTo()`. Upper case and lower case letters have different Unicode values. For example, when comparing `"Mango"` and `"Peach"`, we got `-3`, meaning that `"Mango"` was smaller. But if we compare `"mango"` and `"Peach"` we get `29`. The Unicode value for lower case `"m"` is actually larger than upper case `"P"`. Using `.compareToIgnoreCase()` will perform the same task, but will not consider upper/lower case.





**4 indexOf()**

If we want to know the index of the first occurence of a character in a string, we can use the `indexOf()` method on a string.

Remember that the indices in Java start with 0:

```java
String letters = "ABCDEFGHIJKLMN";
 
System.out.println(letters.indexOf("C"));
```

This would output `2`.

Although `C` is the third letter in the English alphabet, it is located in the second index of the string.

Suppose we want to know the index of the first occurrence of an entire substring. The `indexOf()` instance method can also return where the substring begins (the index of the first character in the substring):

```java
String letters = "ABCDEFGHIJKLMN";
 
System.out.println(letters.indexOf("EFG"));
```

This would output `4`, because `EFG` starts at index 4.

If the `indexOf()` doesn’t find what it’s looking for, it’ll return a `-1`.



**5 charAt()**

The `charAt()` method returns the character located at a `String`‘s specified index.

For example:

```java
String str = "qwer";
 
System.out.println(str.charAt(2));
```

It would output `e` because that’s what’s at index 2. (Once again, indices start with 0.)

Suppose we try to return the character located at index 4. It would produce an `IndexOutOfBoundsException` error because index 4 is out of `str`‘s range:

```error
java.lang.StringIndexOutOfBoundsException: String index out of range: 4
```



**6 substring()**

There may be times when we only want a part of a string. In such cases, we may want to extract a *substring* from a string.

The `substring()` method does exactly that. For example:

```java
String line = "The Heav'ns and all the Constellations rung";
 
System.out.println(line.substring(24));
```

It would output `Constellations rung` because that’s what begins at index 24 and ends at the end of `line`. The substring begins with the character at the specified index and extends to the end of the string.

But suppose we want a substring from the middle of the string. We can include two arguments with this string method. For example:

```java
String line = "The Heav'ns and all the Constellations rung";
 
System.out.println(line.substring(24, 38));
```

It would output `Constellations` because that’s the substring that begins at index 24 and ends at index 38.

We can use this method to return a single-element substring at a specific index by calling `substring()` with the wanted index value as the first argument and then the index value plus one as the second argument.

For example, we can use this method to output just `C`:

```java
String line = "The Heav'ns and all the Constellations rung";
 
System.out.println(line.substring(24, 25));
// Prints: C
```



**7 toUpperCase() / toLowerCase()**

There will be times when we have a word in a case other than what we need it in. Luckily, Java has a couple `String` methods to help us out:

- `toUpperCase()`: returns the string value converted to uppercase
- `toLowerCase()`: returns the string value converted to lowercase

For example:

```java
String input = "Cricket!";
 
String upper = input.toUpperCase();
// stores "CRICKET!"
 
String lower = input.toLowerCase();
// stores "cricket!"
```

A good use of this functionality is to ensure consistency of the data you store in a database. Making sure all of the data you get from a user is lowercase before you store it in your database will make your database easier to search through later.







# 8 Access, Encapsulation, and Static Methods

## 8.1 Access, Encapsulation, and Scope

What are Access and Scope?

As our Java programs begin to get bigger and we begin to have multiple Objects and Classes that interact with each other, the concepts of *access* and *scope* come into play. To oversimplify things, the concepts of access and scope both center around what parts of your programs can interact with specific variables or methods from other parts of your program. Let’s take a brief look at some of the concepts we’ll cover:

**Access**

- The `public` and `private` keywords and how they relate to Classes, variables, constructors, and methods
- The concept of encapsulation
- Accessor methods, sometimes known as “getters”
- Mutator methods, sometimes known as “setters”

**Scope**

- Local variables vs. instance variables
- The `this` keyword

**1 The public Keyword**

After running the code in the last exercise, you should be developing an intuition on what the `public` and `private` keywords are doing. These keywords are defining what parts of your code have *access* to other parts of your code.

We can define the access of many different parts of our code including instance variables, methods, constructors, and even a class itself. If we choose to declare these as `public` this means that any part of our code can interact with them - even if that code is in a different class!

The way we declare something to be `public` is to use the `public` keyword in the declaration statement. In the code block below, we have a public class, constructor, instance variables, and method. Notice the five different uses of `public`.

```java
public class Dog{
  public String name;
  public int age;
 
  public Dog(String input_name, int input_age){
    name = input_name;
    age = input_age;
  }
 
  public void speak() {
    System.out.println("Arf Arf! My name is " + name + " and I am a good dog!");
  }
}
```

Since everything about a `Dog` is public, any other class can access anything about a `Dog`. For example, let’s say there was a `DogSchool` class. Any method of the `DogSchool` class could make a new `Dog` using the `public` `Dog` constructor, directly access that `Dog`’s instance variables, and directly use that `Dog`’s methods:

```java
public class DogSchool{
  public void makeADog(){
    Dog cujo = new Dog("Cujo", 7);
    System.out.println(cujo.age);
    cujo.speak();
  }
}
```

Notice that the `DogSchool` class and the `makeADog()` method are also public. This means that if some other class created a `DogSchool`, they would have access to these methods as well! We have public methods calling public methods!

One final thing to note is that for the purposes of this lesson, we’ll almost always make our classes and constructors `public`. While you can set them to `private`, it’s fairly uncommon to do so. Instead, we’ll focus on why you might make your instance variables and methods `private`. We’ll start looking into the `private` keyword in the next exercise.



**2 The private Keyword and Encapsulation**

By now you’re probably catching onto what the `private` keyword does. When a Class’ instance variable or method is marked as `private`, that means that you can only access those structures from elsewhere inside that same class. Let’s look back at our `DogSchool` example:

```java
public class DogSchool{
 
  public void makeADog(){
    Dog cujo = new Dog("Cujo", 7);
    System.out.println(cujo.age);
    cujo.speak();
  }
}
```

`makeADog` is trying to directly access `Dog`‘s `.age` variable. It’s also trying to use the `.speak()` method. If those are marked as `private` in the `Dog` class, the `DogSchool` class won’t be able to do that. Other methods within the `Dog` class would be able to use `.age` or `.speak()` (for example, we could use `cujo.age` within the `Dog` class), but other classes won’t have access.

**Keep Reading: AP Computer Science A Students**

At this point, you might be thinking to yourself “Why even bother with any of this? In the last exercise, my code was broken until I flipped some variables and methods to `public`. Why don’t I just make everything `public`?”

While those are valid points, sometimes restricting our code is actually useful from a design perspective. This is one of the core ideas behind *encapsulation*. By making our instance variables (and some methods) `private`, we encapsulate our code into nice little bundles of logic.

For example, a `Bank` object doesn’t necessarily need to know the inner workings of a `CheckingAccount` object. It doesn’t need to know that the money is stored in a field named `money`, or that interest is added to an account by using a method named `.addInterest()`. In fact, if it had access to those fields or methods, it’s possible that someone using a `Bank` object could change things in a `CheckingAccount` without realizing it. By limiting access by using the `private` keyword, we are able to segment, or encapsulate, our code into individual units.

Note that we don’t necessarily want to completely block everything from other classes. In the next exercise, we’ll get into when you might want to make methods public — we’ll take a look at getter and setter methods.



**3 Accessor and Mutator Methods**

When writing classes, we often make all of our instance variables `private`. However, we still might want some other classes to have access to them, we just don’t want those classes to know the *exact* variable name. To give other classes access to a private instance variable, we would write an *accessor method* (sometimes also known as a “getter” method).

```java
public class Dog{
  private String name;
 
  //Other methods and constructors
 
  public String getName() {
    return name;
  }
}
```

Even though the instance variable `name` is `private`, other classes could call the `public` method `getName()` which returns the value of that instance variable. Accessor methods will always be `public`, and will have a return type that matches the type of the instance variable they’re accessing.

Similarly, `private` instance variables often have mutator methods (sometimes known as “setters”). These methods allow other classes to reset the value stored in `private` instance variables.

```java
public class Dog{
  private String name;
 
  //Other methods and constructors
 
  public void setName(String newName) {
    name = newName;
  }
 
  public static void main(String[] args){
    Dog myDog = new Dog("Cujo");
    myDog.setName("Lassie");
  }
}
```

Mutator methods, or “setters”, often are `void` methods — they don’t return anything, they just reset the value of an existing variable. Similarly, they often have one parameter that is the same type as the variable they’re trying to change.



**4 Scope: Local Variables**

In addition to access modifiers like `public` and `private`, the *scope* of the variable also determines what parts of your code can access that variable.

The *scope* of a variable is determined by where the variable is declared. For example, because instance variables are declared inside a class but outside any methods or constructors, all methods and constructors are within the scope of that variable. For example, in the code block below, constructors and methods of the `Dog` class are using the `Dog` instance variables like `name` and `age`:

```java
class Dog{
  public String name;
  public int age;
  public int weight;
 
  public Dog(){
    name = "Winston";
    age = 8;
    weight = 30;
  }
 
  public void speak(){
    System.out.println("My name is " + name);
  }
}
```

However, if we have a variable declared inside a method, that variable can only be used inside that method. The same is true for parameters. The scope of those parameters is only the method they’re associated with. If you try to use a parameter outside the function it’s defined in, you’ll get an error. These variables are often called local variables. Note that we don’t use `public` or `private` when declaring local variables.

This idea of scope extends to conditionals and loops as well. If you declare a variable inside the body of a conditional or in a loop, that variable can only be used inside that structure. This also includes the variable you’re using as your looping variable. For example, consider the following block of code:

```java
for(int i = 0; i < 10; i++){
  // You can use i here
}
// i is out of scope here
```

You can only use `i` between the curly braces of the for loop. In general, whenever you see curly braces, be aware of scope. If a variable is defined inside curly braces, and you try to use that variable outside of those curly braces, you will likely see an error!



**5 Scope: The this Keyword**

Often times when creating classes, programmers will create local variables with the same name as instance variables. For example, consider the code block below:

```java
public class Dog{
  public String name;
 
  public Dog(String inputName){
    name = inputName;
  }
 
  public void speakNewName(String name){
    System.out.println("Hello, my new name is" + name);
  }
 
  public static void main(String[] args){
    Dog myDog = new Dog("Winston");
    myDog.speakNewName("Darla"); // Prints "Darla" - "Winston" ignored
 
  }
}
```

We have an instance variable named `name`, but the method `speakNewName` has a parameter named `name`. So when the method tries to print `name`, which variable will be printed? By default, Java refers to the local variable name. So in this case, the value passed to the parameter will be printed and not the instance variable.

If we wanted to access the instance variable and not the local variable, we could use the `this` keyword.

```java
public class Dog{
  public String name;
 
  public Dog(String inputName){
    name = inputName;
  }
 
  public void speakNewName(String name){
    System.out.println("Hello, my new name is" + this.name);
  }
 
  public static void main(String[] args){
    Dog a = new Dog("Fido");
    Dog b = new Dog("Odie");
 
    a.speakNewName("Winston");
    // "Fido", the instance variable of Dog a is printed. "Winston" is ignored
 
    b.speakNewName("Darla");
    // "Odie", the instance variable of Dog b is printed. "Darla" is ignored.
  }
}
```

The `this` keyword is a reference to the current object. We used `this.name` in our `speakNewName()` method. This caused the method to print out the value stored in the instance variable `name` of whatever `Dog` Object called `speakNewName()`. (Note that in this somewhat contrived example, the local variable `name` used as a parameter gets completely ignored).

Oftentimes, you’ll see constructors have parameters with the same name as the instance variable. For example, you might see something like:

```java
public Dog(String name){
  this.name = name;
}
```

You can read this as “set `this` `Dog`‘s instance variable `name` equal to the variable passed into the constructor”. While this naming is a common convention, it can also be confusing. There’s nothing wrong with naming your parameters something else to be more clear. Sometimes you will see something like:

```java
public Dog(String inputName){
  this.name = inputName;
}
```

This is now a little clearer — we’re setting the `Dog`‘s instance variable `name` equal to the name we give the constructor.

Finally, mutator methods also usually follow this pattern:

```java
public void setName(String name){
  this.name = name;
}
```

We reset the instance variable to the value passed into the parameter.

Throughout the rest of this lesson, we’ll use `this.` when referring to an instance variable. This isn’t always explicitly necessary — if there’s no local variable with the same name, Java will know to use the instance variable with that name. That being said, it is a good habit to use `this.` when working with your instance variables to avoid potential confusion.



**6 Using this With Methods**

We’ve seen how the `this` works with variables, but we can also use the `this` with methods.

Recall how we’ve been calling methods up to this point:

```java
public static void main(String[] args){
  Dog myDog = new Dog("Odie");
  myDog.speak();
}
```

Here we’re creating an instance of a `Dog` and using that `Dog` to call the `speak()` method. However, when defining methods, we can also use the `this` keyword to call other methods. Consider the code block below:

```java
public class Computer{
  public int brightness;
  public int volume;
 
  public void setBrightness(int inputBrightness){
    this.brightness = inputBrightness;
  }
 
  public void setVolume(int inputVolume){
    this.volume = inputvolume;
  }
 
  public void resetSettings(){
    this.setBrightness(0);
    this.setVolume(0);
  }
}
```

Take a look at the `resetSettings()` method in particular. This method calls other methods from the class. But it needs an object to call those methods! Rather than create a new object (like we did with the `Dog` named `myDog` earlier), we use `this` as the object. What this means is that the object that calls `resetSettings()` will be used to call `setBrightness(0)` and `setVolume(0)`.

```java
public static void main(String[] args){
  Computer myComputer = new Computer();
  myComputer.resetSettings();
}
```

In this example, calling `myComputer.resetSettings()` is as if we called `myComputer.setBrightness(0)` and `myComputer.setVolume(0)`. `this` serves as a placeholder for whatever object was used to call the original method.

**Keep Reading: AP Computer Science A Students**

Finally, `this` can be used as a value for a parameter. Let’s say a method exists that takes a `Computer` as a parameter (that method’s signature might be something like `public void pairWithOtherComputer(Computer other)`. If you’re writing another method of the `Computer`, and want to call the `pairWithOtherComputer()` method, you could use `this` as the parameter. That call might look something like `this.pairWithOtherComputer(this)`. You’re using the current object to call the method *and* are passing that object as that method’s parameter.

```java
public void pairWithOtherComputer(Computer other){
  // Code for method that uses the parameter other
}
 
public void setUpConnection(){
  // We use "this" to call the method and also pass "this" to the method so it can be used in that method
  this.pairWithOtherComputer(this);
}
```



**7 Other Private Methods**

Now that we’ve seen how methods can call other methods using `this.`, let’s look at a situation where you might want to use `private` methods. Oftentimes, `private` methods are helper methods — that is to say that they’re methods that other, bigger methods use.

For example, for our `CheckingAccount` example, we might want a public method like `getAccountInformation()` that prints information like the name of the account owner, the amount of money in the account, and the amount of interest the account will make in a month. That way, another class, like a `Bank`, could call that public method to get all of that information quickly.

Well, in order to get that information, we might want to break that larger method into several helper methods. For example, inside `getAccountInformation()`, we might want to call a function called `calculateNextMonthInterst()`. That helper method should probably be `private`. There’s no need for a `Bank` to call these smaller helper methods — instead, a `Bank` can call the one `public` method, and rely on that method to do all of the complicated work by calling smaller `private` methods.



## 8.2 Static Variables and Methods

Static Methods Refresher

In this lesson, we’re going to dive into how to create classes with your own static methods and static variables. To begin, let’s take a quick refresher on static methods.

Static methods are methods that belong to an entire class, not a specific object of the class. Static methods are called using the class name and the `.` operator. We’ve seen a couple of static methods already!

```java
double randomNumber = Math.random();
// Stores a random decimal between 0 and 1 in randomNumber
 
double number = String.valueOf("2.5");
// Transforms the String "2.5" into a double
```

In the first example, `random()` is a static method that belongs to the `Math` class. We didn’t need to create a `Math` object (like `Math myMathObject = new Math()`) in order to use that method. We could just call it using the class name.

Similarly, `valueOf()` is a static method of the `String` class. Given a `String` as an input, this method will turn that `String` into a `double`. Again, we don’t need to create a `String` object in order to call this method — we use the class itself to call it.

Finally, notice that our `main()` methods have been `static` this whole time. When Java runs your program, it calls that the main method of your class — `YourClassName.main()`.



**1 Static Variables**

We’ll begin writing our own static methods soon, but before we do, let’s take a look at static variables. Much like static methods, you can think of *static variables* as belonging to the class itself instead of belonging to a particular object of the class.

Just like with static methods, we can access static variables by using the name of the class and the `.` operator. Finally, we declare static variables by using the `static` keyword during declaration. This keyword usually comes after the variable’s access modifier (`public` or `private`).

When we put this all together, we might end up with a class that looks something like this:

```java
public class Dog{
 
  // Static variables
  public static String genus = "Canis";
 
  //Instance variables
  public int age;
  public String name;
 
  public Dog(int inputAge, String inputName){
    this.age = inputAge;
    this.name = inputName;
  }
}
```

Since all dogs share the same genus, we could use a static variable to store that information for the entire class. However, we want each dog to have it’s own unique `name` and `age`, so those aren’t `static`. We could now access this static variable in a `main()` function like so:

```java
public class Dog{
  //Variables, constructors and methods defined here
 
  public static void main(String[] args){
    System.out.println(Dog.genus); // Prints Canis
  }
}
```

Unlike static methods, you can still access static variables from a specific object of the class. However, no matter what object you use to access the variable, the value will always be the same. You can think of it as all objects of the class sharing the same variable

```java
public static void main(String[] args){
  Dog snoopy = new Dog(3, "Snoopy");
  Dog ringo = new Dog(5, "Ringo");
 
  System.out.println(Dog.genus); // Prints Canis
  System.out.println(snoopy.genus); // Prints Canis
  System.out.println(ringo.genus); // Prints Canis
}
```

Finally, you might have seen a few static variables before. If you want easy access to the largest possible integer, you can get it by using `Integer.MAX_VALUE`. If you look at the [official documentation](https://docs.oracle.com/javase/8/docs/api/java/lang/Integer.html#MAX_VALUE) you’ll see that this variable is `public`, `static`, *and* `final`. (`final` means that you can’t change the variable’s value after creating it.) We’re starting to know a lot of Java keywords!



**2 Modifying Static Variables**

Now that we’ve created a couple of static variables, let’s start to edit them. The good news is that editing static variables is similar to editing any other variable. Whether you’re writing code in a constructor, a non-static method, or a static method, you have access to static variables.

Before we jump into the checkpoints, let’s think about times when you might want to edit static variables. Often times, you’ll see static variables used to keep track of information about all objects of a class. For example, our variable `numATMs` is keeping track of the total number of `ATM`s in the system. Therefore, every time an `ATM` is created (using the constructor), we should increase that variable by `1`. If we could somehow destroy an `ATM`, the method that destroys it should decrease `numATMs` static variable by `1`.

Similarly, we have a variable named `totalMoney`. This variable is keeping track of all money across all ATMs. Whenever we remove money from an ATM using the non-static `withdrawMoney()` method, we should modify the `money` instance variable for that particular ATM as well as the `totalMoney` variable. In doing so, all ATMs will know how much money is in the system.



**3 Writing Your Own Static Methods**

Nice work! Now that we’ve seen how static variables work, let’s look into how to write our own static methods.

Let’s get the syntax out of the way first — just like with variables, to create a static method, use the `static` keyword in the method’s definition. Just like with variables, this keyword usually comes after `public` or `private`.

```java
public static void myFirstStaticMethod(){
  // Some code here
}
```

Often times, you’ll see static methods that are accessors or mutators for static variables.

```java
public static int getMyStaticVariable(){
  return myStaticVariable;
}
 
public static void setMyStaticVariable(int newValue){
  myStaticVariable = newValue;
}
```

One important rule to note is that static methods can’t interact with non-static instance variables.

To wrap your mind around this, consider why we use `this` when working with non-static instance variables. Let’s say we have a `Dog` class with a non-static instance variable named `age`. If we have a line of code like `this.age = 5;`, that means we’re setting the `age` of a specific `Dog` equal to `5`. However, if `age` were static, that would mean that the variable belongs to the entire class, not a specific object.

The `this` keyword can’t be used by a static method since static methods are associated with an entire class, not a specific object of that class. If you try to mix `this` with a static method, you’ll see the error message `non-static variable this cannot be referenced from a static context`.





# 9 Inheritance and Polymorophism

Introducing Inheritance

When you hear the word “inheritance”, code may not be the first thing that springs to mind; you’re probably more likely to think of inheriting genetic traits, like eye color from your mother or a smile from your grandfather. But inheritance is also an important feature of object-oriented programming in Java.

Suppose we are building a `Shape` class in Java. We might give it some points in 2D, a method for calculating the area, and another method for displaying the shape. But what happens if we want a class for a triangle that has some triangle-specific methods? Do we need to redefine all of the same methods that we created for `Shape`?

No! (Phew.) Lucky for us, a Java class can also *inherit* traits from another class. Because a `Triangle` is a `Shape`, we can define `Triangle` so that it inherits fields and methods directly from `Shape`. A reference of type `Shape` can refer to an object of `Shape` or an object of `Triangle`. The object-oriented principle of inheritance saves us the headache of redefining the same class members all over again.

Our `Triangle` class will inherit all the traits of `Shape`, but `Triangle` can also contain its own unique methods and variables. For example, we could have an instance variable called `hypotenuse` and a method called `findHypotenuse()` that can only be accessed by `Triangle` class references. Objects of `Triangle` can call any method contained in `Triangle` or `Shape`. This gives us a bunch of possibilities!

There are several terms you’ll encounter frequently:

- *Parent class*, *superclass*, and *base class* refer to the class that another class inherits from (like `Shape`).
- *Child class*, *subclass*, and *derived class* refer to a class that inherits from another class (like `Triangle`).

**1 Inheritance in Practice**

So how do we define a child class so that it inherits from a parent class? We use the keyword `extends` like this:

```java
class Shape {
  // Shape class members
}
 
class Triangle extends Shape {
  // additional Triangle class members
}
```

Now `Triangle` has inherited traits from `Shape`, meaning it copied over class members from `Shape`. When we use inheritance to extend a subclass from a superclass, we create an “is-a” relationship from the subclass to the superclass. For example, an object of `Triangle` *is a* member of the `Shape` class; however, an object of `Shape` is not necessarily an object of `Triangle`.

Until now, we’ve only been working with one class and one file. However, most Java programs utilize multiple classes, each of which requires its own file. Only one file needs a `main()` method — this is the file we will run.

Note: the various classes in our Java package — even though they are in different files — will have access to each other, so we can instantiate one class inside of another.

**2 Inheriting the Constructor**

Hang on, you might be thinking, if the child class inherits its parent’s fields and methods, does it also inherit the constructor? Let’s take a look at the `super()` constructor works!

Let’s say `Shape` has a `numSides` field that is set by passing an integer into the constructor. If we’re instantiating a `Triangle`, we would want that number to always be `3`, so we’d want to modify the constructor to automatically assign `numSides` with a value of `3`.

Can we do that?

As it happens, Java has a trick up its sleeve for just this occasion: using the `super()` method which acts like the parent constructor inside the child class constructor:

```java
class Triangle extends Shape {
 
  Triangle() {
    super(3);
  }
 
  // additional Triangle class members
 
}
```

By passing `3` to `super()`, we are making it possible to instantiate a `Triangle` without passing in a value for `numSides`.

Meanwhile, `super(3)` (behaving as `Shape(3)`) will shoulder the responsibility of setting `numSides` to `3` for our `Triangle` object. It’s like we called `Shape(3)`.

It is also possible to write a constructor without making a call to any `super()` constructor:

```java
class Triangle extends Shape {
 
  Triangle() {
    this.numSides = 3;
  }
 
  // additional Triangle class methods
 
}
```

In this situation, Java secretly calls the parent class’ no-argument constructor (`super()`). So in this specific example, the `Triangle()` constructor first calls the `Shape()` constructor. That `Shape()` takes care of whatever business it needs to take care of. And then after that is complete, we go in and set `this.numSides` to `3`.

If you’re writing a constructor of a child class, and don’t explicitly make a call to a constructor from a parent class using `super`, it’s important to remember that Java will automatically (and secretly) call `super()` as the first line of your child class constructor.



**3 Parent Class Aspect Modifiers**

You may recall that Java class members use `private` and `public` access modifiers to determine whether they can be accessed from outside the class. So does a child class inherit its parent’s `private` members?

Well, no. But there is another access modifier we can use to keep a parent class member accessible to its child classes and to files in the package it’s contained in — and otherwise private: `protected`.![public is visible everywhere; protected is visible in the class, the package, and child classes; a member with no modifier is visible in the class and package; private is visible only in the class itself](https://content.codecademy.com/courses/learn-java/revised-2019/access-modifiers-chart.png)Here’s what `protected` looks like in use:

```java
class Shape {
  protected double perimeter;
}
// any child class of Shape can access perimeter
```

In addition to access modifiers, there’s another way to establish how child classes can interact with inherited parent class members: using the `final` keyword. If we add `final` before a parent class method’s access modifier, we disallow any child classes from changing that method. This is helpful in limiting bugs that might occur from modifying a particular method.



**4 Method Overriding**

One common use of polymorphism with Java classes is something we mentioned earlier — *overriding* parent class methods in a child class. Like the `+` operator, we can give a single method slightly different meanings for different classes. This is useful when we want our child class method to have the same name as a parent class method but behave a bit differently in some way.

Let’s say we have a `BankAccount` class that allows us to print the current balance. We want to build a `CheckingAccount` class that inherits the functionality of a `BankAccount` but with a modified `printBalance()` method. We can do the following:

```java
class BankAccount {
  protected double balance;
  public void printBalance() {
    System.out.println("Your account balance is $" + balance);
  }
 
}
 
class CheckingAccount extends BankAccount {
  @Override
  public void printBalance() {
    System.out.println("Your checking account balance is $" + balance);
  }
}
```

Notice that in order to properly override `printBalance()`, in `CheckingAccount` the method has the following in common with the corresponding method in `BankAccount`:

- Method name
- Return type
- Number and type of parameters

You may have also noticed the `@Override` keyword above `printBalance()` in `CheckingAccount`. This annotation informs the compiler that we want to override a method in the parent class. If the method doesn’t exist in the parent class, we’ll get a helpful error when we compile the program.

**Keep Reading: AP Computer Science A Students**

In a previous exercise, we learned that the `super` keyword can be used to call the constructor of a superclass. That’s not the only use of `super`; we can also use this keyword to call the methods of a parent class. While we now have the ability to override methods from a superclass, we may find ourselves in a unique situation where we want to use the superclass method instead of the subclass’ overridden method.

If that’s the case, we can call the parent class method by prepending `super` followed by the dot operator (`.`) to the method call. Note that this only works if we pass in the proper method parameters. Let’s see this in action by adding a `checkBalances()` method to `CheckingAccount` that calls both versions of `printBalance()`:

```java
class CheckingAccount extends BankAccount {
  @Override
  public void printBalance() {
    System.out.println("Your checking account balance is $" + balance);
  }
 
  public void checkBalances() {
    // calls method from CheckingAccount
    printBalance();
    // calls method from BankAccount
    super.printBalance();
  }
 
  public static void main(String[] argos) {
    CheckingAccount myCheckings = new CheckingAccount(5000);
    myCheckings.checkBalances();
  }
}
```

This program will output:

```
Your checking account balance is $5000
Your account balance is $5000
```



**5 Using a Child Class as its Parent Class**

An important facet of polymorphism is the ability to use a child class object where an object of its parent class is expected.

One way to do this explicitly is to instantiate a child class object as a member of the parent class. We can instantiate a `CheckingAcount` object as a `BankAccount` like this:

```java
BankAccount kaylasAccount = new CheckingAcount(600.00);
```

We can use `kaylasAccount` as if it were an instance of `BankAccount`, in any situation where a `BankAccount` object would be expected. (This would be true even if `kaylasAccount` were instantiated as a `CheckingAccount`, but using the explicit child as parent syntax is most helpful when we want to declare objects in bulk.)

It is important to note here that the compiler just considers `kaylasAccount` to be any old `BankAccount`. But because method overriding is handled at runtime, if we call `printBalance()`, we’ll see something `CheckingAccount` specific:

```
Your checking account balance is $600.00
```

This is because at runtime, `kaylasAccount` is recognized as the `CheckingAccount` it is. So, what if `CheckingAccount` has a method `transferToSavings()` that `BankAccount` does not have? Can `kaylasAccount` still use that method?

Well, no. The compiler believes that `kaylasAccount` is just a `BankAccount` that doesn’t have some fancy child class `transferToSavings()` method, so it would throw an error.



**6 Child Classes in Arrays and ArrayLists**

Usually, when we create an array or an `ArrayList`, the list items all need to be the same type. But polymorphism puts a new spin on what is considered the same type…

In fact, we can put instances of different classes that share a parent class together in an array or `ArrayList`! For example, let’s say we have a `Monster` parent class with a few child classes: `Vampire`, `Werewolf`, and `Zombie`. We can set up an array with instances of each:

```java
Monster dracula, wolfman, zombie1;
 
dracula = new Vampire();
wolfman = new Werewolf();
zombie1 = new Zombie();
 
Monster[] monsters = {dracula, wolfman, zombie1};
```

We can even iterate through the list of items — regardless of subclass — and perform the same action with each item:

```java
for (Monster monster : monsters) {
  monster.attack();
}
```

In the code above, we were able to call `attack()` on each monster in `monsters` despite the fact that, in the for-each loop, `monster` is declared as the parent class type `Monster`.



**7 Child Classes in Method Parameters**

When we call a method that contains parameters, the arguments we place in our method call must match the parameter type. Similar to the previous exercise, polymorphism gives us a little more flexibility with the arguments we can use.

If we use a superclass reference as a method parameter, we can call the method using subclass reference arguments!

For example, imagine the class `ScaryStory`, whose constructor takes in a reference to the `Monster` class:

```java
class ScaryStory {
  Monster monster;
  String setting;
 
  public ScaryStory(Monster antagonist, String place) {
    monster = antagonist;
    setting = place;
  }
 
  public static void tellStory(){
    System.out.println("Once upon a time, " + monster.name + " was at " + setting + " looking to scare some mortals.");
  }
 
  public static void main(String[] args) {
    Monster dracula;
    dracula = new Vampire("Dracula");
    ScaryStory countDracula = new ScaryStory(dracula, "Dracula Castle");
    countDracula.tellStory();
  }
}
```

In the `main()` method, we used a reference of the class `Vampire` as our argument even though the constructor requested an object of class `Monster`. This is allowed because `Vampire` is a subclass of the `Monster` class.







# 10 Debugging

**1 Syntax Errors**

When we are writing Java programs, the compiler is our first line of defense against errors. It can catch syntax errors.

*Syntax errors* represent grammar errors in the use of the programming language. They are the easiest to find and correct. The compiler will tell you where it got into trouble, and its best guess as to what you did wrong.

Some common syntax errors are:

- Misspelled variable and method names
- Omitting semicolons `;`
- Omitting closing parenthesis `)`, square bracket `]`, or curly brace `}`

Here’s an example of a syntax error message:

```error
Debug.java:5: error: ';' expected
  int year = 2019
                  ^
1 error
```

Usually the error is on the exact line indicated by the compiler, or the line just before it; however, if the problem is incorrectly nested braces, the actual error may be at the beginning of the nested block.



**2 Run-time Errors**

If our program has no compile-time errors, it’ll run. This is where the fun really starts.

Errors which happen during program execution (run-time) after successful compilation are called run-time errors. *Run-time errors* occur when a program with no compile-time errors asks the computer to do something that the computer is unable to reliably do.

Some common run-time errors:

- Division by zero also known as division error
- Trying to open a file that doesn’t exist

There is no way for the compiler to know about these kinds of errors when the program is compiled.

Here’s an example of a run-time error message:

![Exception in thread "main" java.lang.ArithmeticException: / by zero at Debug.main(Debug.java:8)](https://content.codecademy.com/courses/learn-java/debugging/java-run-time-error.png)



**3 Exception Handling**

Exception handling is an essential feature of Java programming that allows us to use run-time error exceptions to make our debugging process a little easier.

One way to handle exceptions is using the `try`/`catch`:

- The `try` statement allows you to define a block of code to be tested for errors while it is being executed.
- The `catch` statement allows you to define a block of code to be executed if an error occurs in the try block.

The `try` and `catch` keywords come in pairs, though you can also catch several types of exceptions in a single block:

```java
try {
  //  Block of code to try
} catch (NullPointerException e) {
  // Print the error message like this:
  System.err.println("NullPointerException: " + e.getMessage());
  // Or handle the error another way here
}
```

Notice how we used `System.err.println()` here instead of `System.out.println()`. `System.err.println()` will print to the standard error and the text will be in red.

You can also chain exceptions together:

```java
try {
  //  Block of code to try
} catch (NullPointerException e) {
  //  Code to handle a NullPointerException
} catch (ArithmeticException e) {
  //  Code to handle an ArithmeticException
}
```

You can learn more about exceptions and handling them [here](https://docs.oracle.com/javase/tutorial/essential/exceptions/index.html).



**4 Logic Errors**

Once we have removed the syntax errors and run-time errors, the program runs successfully. But sometimes, the program still doesn’t do what we want it to do or no output is produced. Hmmm…

These types of errors which provide incorrect output, but appears to be error-free, are called *logic errors*. Logic errors occur when there is a design flaw in your program. These are some of the most common errors that happen to beginners and also usually the most difficult to find and eliminate.

Because logical errors solely depend on the logical thinking of the programmer, your job now is to figure out why the program didn’t do what you wanted it to do.

Some common logic errors:

- Program logic is flawed
- Some “silly” mistake in an `if` statement or a `for`/`while` loop

**Note:** Logic errors don’t have error messages. Sometimes, programmers use a process called [test-driven development (TDD)](https://en.wikipedia.org/wiki/Test-driven_development), a way to give logic errors error messages and save yourself a lot of headaches!





# 11 Two-dimensional Arrays



Introduction to 2D Arrays

As we have learned previously, an array is a group of data consisting of the same type. This means that we can have an array of primitive data types (such as integers):

```
[1, 2, 3, 4, 5]
```

We can even have an array of Objects. For example, the following example shows an array of String Objects:

```
["hello", "world", "how", "are", "you"]
```

In Java, arrays are considered Objects; therefore, we can also have an array of arrays:

```
[[1, 2, 3], [4, 5, 6], [7, 8, 9]]
```

These are called 2D arrays since we can logically view them as a two-dimensional matrix of values containing both rows and columns.

![Example of visualizing a 2D array](https://static-assets.codecademy.com/Paths/ap-computer-science/TwoDArrays/simpleTwoD.png)

Additionally, we can have 2D arrays which are not rectangular in shape. These are called jagged arrays:

```
[['a', 'b', 'c', 'd'], ['e', 'f'], ['g', 'h', 'i', 'j'], ['k']]
```

![Example of visualizing a jagged array](https://static-assets.codecademy.com/Paths/ap-computer-science/TwoDArrays/jagged.png)

We won’t be covering jagged arrays in this lesson, but be aware that 2D arrays don’t always have to have the same number of subarrays in each array. This would cause the shape of the 2D array to not be rectangular.

Why use 2D arrays?

- It is useful to use 2D arrays for situations where you need to store and organize data by rows and columns. For example, exporting data to be used in a spreadsheet.
- You can condense multiple arrays down to a single variable using 2D arrays. For example, if you have 10 students who each have 10 different quiz grades, you can represent the overall class quiz grades as a 10x10 2D array by having each row represent a student and each column represent one of the quizzes they have taken.
- 2D arrays can be used to map out data. For example, if you want to create a game of tic-tac-toe, you can represent the game state by using a 3x3 2D array.

There are many other ways to use 2D arrays depending on the application. The only downside is that once initialized, no new rows or columns can be added or removed without copying the data to a newly initialized 2D array. This is because the length of arrays in Java are immutable (unable to be changed after creation).



**1 Declaration, Initialization, and Assignment**

When declaring 2D arrays, the format is similar to normal, one-dimensional arrays, except that you include an extra set of brackets after the data type. In this example, `int` represents the data type, the first set of brackets `[]` represent an array, and the second set of brackets `[]` represent that we are declaring an array of arrays.

```
int[][] intTwoDArray;
```

You can think of this as creating an array (`[]`) of int arrays (`int[]`). So we end up with `int[][]`.

Now that we’ve declared a 2D array, let’s look at how to initialize it with starting values. When initializing arrays, we define their size. Initializing a 2D array is different because, instead of only including the number of elements in the array, you also indicate how many elements are going to be in the sub-arrays. This can also be thought of as the number of rows and columns in the 2D matrix.

```
int[][] intArray1;
intArray1 = new int[row][column];
```

Here is an example of initializing an empty 2D array with 3 rows and 5 columns.

```
int[][] intArray2;
intArray2 = new int[3][5];
```

This results in a matrix which looks like this:

![A 3 by 5 array of zeroes](https://static-assets.codecademy.com/Paths/ap-computer-science/TwoDArrays/empty.png)

If you already know what values are going to be in the 2D array, you can initialize it and write all of the values into it at once. We can accomplish this through initializer lists

- In Java, initializer lists are a way of initializing arrays and assigning values to them at the same time
- We can use this for 2D arrays as well by creating an initializer list of initializer lists

An example of an initializer list for a regular array would be:

```
char[] charArray = {'a', 'b', 'c', 'd'};
```

Similar to how a regular initializer list defines the size and values of the array, nested initializer lists will define the number of rows, columns, and the values for a 2D array.

There are three situations in which we can use initializer lists for 2D arrays:

1. In the case where the variable has not yet been declared, we can provide an abbreviated form since Java will infer the data type of the values in the initializer lists:

   ```
   double[][] doubleValues = {{1.5, 2.6, 3.7}, {7.5, 6.4, 5.3}, {9.8,  8.7, 7.6}, {3.6, 5.7, 7.8}};
   ```

2. If the variable has already been declared, you can initialize it by creating a

    

   ```
   new
   ```

    

   2D array object with the initializer list values:

   ```
   String[][] stringValues;
   stringValues = new String[][] {{"working", "with"}, {"2D", "arrays"}, {"is", "fun"}};
   ```

3. The previous method also applies to assigning a new 2D array to an existing 2D array stored in a variable.

In the next exercise, we’ll look at how to assign values of individual elements.



**2 Accessing Elements in a 2D Array**

Let’s first review how to access elements in regular arrays.

For a normal array, all we need to provide is an index (starting at `0`) which represents the position of the element we want to access. Let’s look at an example!

Given an array of five Strings:

```java
String[] words = {"cat", "dog", "apple", "bear", "eagle"};
```

We can access the first element using index `0`, the last element using the length of the array minus one (in this case, `4`), and any of the elements in between. We provide the index of the element we want to access inside a set of brackets. Let’s see those examples in code:

```java
// Store the first element from the String array
String firstWord = words[0]; 
 
// Store the last element of the String array
String lastWord = words[words.length-1];
 
// Store an element from a different position in the array
String middleWord = words[2];
```

Now for 2D arrays, the syntax is slightly different. This is because instead of only providing a single index, we provide two indices. Take a look at this example:

```java
// Given a 2D array of integer data
int[][] data = {{2,4,6}, {8,10,12}, {14,16,18}};
 
// Access and store a desired element 
int stored = data[0][2];
```

There are two ways of thinking when accessing a specific element in a 2D array.

- The first way of thinking is that the first value represents a row and the second value represents a column in the matrix
- The second way of thinking is that the first value represents which subarray to access from the main array and the second value represents which element of the subarray is accessed

The above example of the 2D array called `data` can be visualized like so. The indices are labeled outside of the matrix:

![Row and column indexes start at 0 in the top left corner and increase going to the right and down](https://static-assets.codecademy.com/Paths/ap-computer-science/TwoDArrays/indexes.png)

Using this knowledge, we now know that the result of `int stored = data[0][2];` would store the integer `6`. This is because the value `6` is located on the first row (index `0`) and the third column (index `2`). Here is a template which can be used for accessing elements in 2D arrays:

```java
datatype variableName = existing2DArray[row][column];
```

Here is another way to visualize the indexing system for our example integer array seen above. We can see what row and column values are used to access the element at each position.

![Accessing the item in the top left corner would be data[0][0]](https://static-assets.codecademy.com/Paths/ap-computer-science/TwoDArrays/accessing.png)

When accessing these elements, if either the row or column value is out of bounds, then an `ArrayIndexOutOfBoundsException` will be thrown by the application.



**3 Modifying Elements in a 2D Array**

Now let’s review how to modify elements in a normal array.

For a one dimensional array, you provide the index of the element which you want to modify within a set of brackets next to the variable name and set it equal to an acceptable value:

```java
storedArray[5] = 10;
```

For 2D arrays, the format is similar, but we will provide the outer array index in the first set of brackets and the subarray index in the second set of brackets. We can also think of it as providing the row in the first set of brackets and the column index in the second set of brackets if we were to visualize the 2D array as a rectangular matrix:

```java
twoDArray[1][3] = 150;
```

To assign a new value to a certain element, make sure that the new value you are using is either of the same type or is castable to the type already in the 2D array.

Let’s say we wanted to replace four values from a new 2D array called `intTwoD`. Look at this example code to see how to pick individual elements and assign new values to them.

```java
int[][] intTwoD = new int[4][3];
 
intTwoD[3][2] = 16;
intTwoD[0][0] = 4;
intTwoD[2][1] = 12;
intTwoD[1][1] = 8;
```

Here is a before and after image showing when the 2D array was first initialized compared to when the four elements were accessed and modified.

![The array now looks like {{4,0,0},{0,8,0},{0,12,0},{0,0,16}}](https://static-assets.codecademy.com/Paths/ap-computer-science/TwoDArrays/modifying.png)



**4 Review of Nested Loops**

We’re about to look at how we can use loops to make our lives easier when working with 2D arrays. But before we do that, let’s take a moment to refresh ourselves on how nested loops work.

Nested loops consist of two or more loops placed within each other. We will be looking at one loop nested within another for 2D traversal.

The way it works is that, for every iteration of the outer loop, the inner loop finishes all of its iterations.

Here is an example using **for** loops:

```java
for(int outer = 0; outer < 3; outer++){
    System.out.println("The outer index is: " + outer);
    for(int inner = 0; inner < 4; inner++){
        System.out.println("\tThe inner index is: " + inner);
    }
}
```

The output of the above nested loops looks like so:

```
The outer index is: 0
    The inner index is: 0
    The inner index is: 1
    The inner index is: 2
    The inner index is: 3
The outer index is: 1
    The inner index is: 0
    The inner index is: 1
    The inner index is: 2
    The inner index is: 3
The outer index is: 2
    The inner index is: 0
    The inner index is: 1
    The inner index is: 2
    The inner index is: 3
```

From this example we can see how every time the outer loop iterates one time, the inner loop iterates fully.

This is an important concept for 2D array traversal, because for every row in a two dimensional matrix, we want to iterate through every column. We will look more at this in the next exercise.

Nested loops can consist of any type of loop and with any combination of loops. Let’s take a look at a few more interesting examples.

Here is an example of nested while loops:

```java
int outerCounter = 0;
int innerCounter = 0; 
while(outerCounter<5){
    outerCounter++;
    innerCounter = 0;
    while(innerCounter<7){
        innerCounter++;
    }
}
```

We can even have some interesting combinations. Here is an enhanced **for** loop inside of a while loop:

```java
int outerCounter = 0;
int[] innerArray = {1,2,3,4,5};
 
while(outerCounter<7){
    System.out.println();
    for(int number : innerArray){
        System.out.print(number * outerCounter + " ");
    }
    outerCounter++;
}
```

The output of the above example creates a multiplication table:

```
0 0 0 0 0 
1 2 3 4 5 
2 4 6 8 10 
3 6 9 12 15 
4 8 12 16 20 
5 10 15 20 25 
6 12 18 24 30 
```

This is an interesting example, because for every iteration of the while loop, we iterate through every element of an array using an enhanced **for** loop. This is similar to the iteration pattern we use for 2D array traversal. We will be going over that in the next exercise.

Let’s practice using nested loops!

You are in charge of controlling the amount of people who reserve seats for the world famous programming contest. You have two long arrays of integers which represent the contestant’s IDs for two days of the competition. The index of the array represents their seat number. You need to use nested **for** loops to find if a contestant tried to register for both days. Print out the ID of the contestants who tried to register twice as well as their seat numbers for both days.



**5 Traversing 2D Arrays: Introduction**

In the last exercise, we reviewed how to use nested loops as well as how to iterate through regular arrays using loops. In this exercise, we will apply that knowledge in order to learn how to traverse 2D arrays.

Traversing 2D arrays using loops is important because it allows us to access many elements quickly, access elements in very large 2D arrays, and even access elements in 2D arrays of unknown sizes.

Let’s remember the structure of 2D arrays in Java:

```java
char[][] letterBlock = {{'a','b','c'},{'d','e','f'},{'g','h','i'},{'j', 'k', 'l'}};
```

In Java, 2D arrays are like normal arrays, but each element is another array. This is shown by the initialized 2D array above. The outer array consists of four elements, where each element consists of a three element subarray.

Let’s see what happens when we access elements of the outer array

```java
System.out.println(Arrays.toString(letterBlock[0]) + "\n");
System.out.println(Arrays.toString(letterBlock[1]) + "\n");
System.out.println(Arrays.toString(letterBlock[2]) + "\n");
System.out.println(Arrays.toString(letterBlock[3]) + "\n");
```

Here is the output of the above code:

```
[a, b, c]
 
[d, e, f]
 
[g, h, i]
 
[j, k, l]
 
```

As you can see, we can retrieve the entire subarray from each of the outer array elements. If you look at how we are accessing these subarrays, we are just increasing the index. This means we can access each sub-array in the 2D array using a loop!

Let’s take a look at an example which produces the same output, but can handle any sized 2D array.

```java
for(int index = 0; index < letterBlock.length; index++){
    System.out.println(Arrays.toString(letterBlock[index]) + "\n");
}
```

Here is the result:

```
[a, b, c]
 
[d, e, f]
 
[g, h, i]
 
[j, k, l]
 
```

Now let’s remember how to access a value from the subarray. Previously, we learned that we can use the double brackets `[][]`, where the first set of brackets contains the index of the element of the outer array and the second set of brackets contains the index of the element in the subarray. If we wanted to retrieve the letter `'f'` we would use:

```
char storedLetter = letterBlock[1][2];
```

Since we know we can use a loop to retrieve each of the subarrays stored in the outer array, we can then use a nested loop to access each of the elements from the sub-array.

You might be wondering how we can figure out the number of iterations needed in order to fully traverse the 2D array.

- In order to find the number of elements in the outer array, we just need to get the length of the 2D array.
  - `int lengthOfOuterArray = letterBlock.length;`
  - When thinking about the 2D array in matrix form, this is the height of the matrix (the number of rows)
- In order to find the number of elements in the subarray, we can get the length of the subarray after it has been retrieved from the outer array.
  - Remember that we retrieved the sub array earlier using this format:
    - `char[] subArray = letterBlock[0];`
  - Therefore, we can use this to get the length of the first subarray in the 2D array
    - `int lengthOfSubArray = letterBlock[0].length;`
    - When thinking about the 2D array in matrix form, this is the width of the matrix (the number of columns)
  - In most cases, getting the length of the first subarray in the 2D array will apply to the rest of the subarrays (if it is rectangular in shape), but there are rare occasions where the length of the subarrays could be different. This occurs if the 2D array is a jagged array. We won’t be working with 2D arrays in this lesson, but it’s something to keep in mind.

Let’s look at an example!

```java
for(int a = 0; a < letterBlock.length; a++) {
    for(int b = 0; b < letterBlock[a].length; b++) {
        System.out.print("Accessed: " + letterBlock[a][b] + "\t");
    }
    System.out.println();
}
```

You can think of the variable `a` as being the outer loop index, and the variable `b` as being the inner loop index.

Here is the output:

```
Accessed: a    Accessed: b    Accessed: c    
Accessed: d    Accessed: e    Accessed: f    
Accessed: g    Accessed: h    Accessed: i    
```

Within the nested **for** loop, we can see that each of the subarray elements are being accessed by using the outer loop index for the outer array, and the inner loop index for the subarray.

Here is a diagram to help visualize how the 2D array is traversed using nested loops:

![The outer loop controls what row we're in while the inner loop controls which element of that row we're looking at](https://static-assets.codecademy.com/Paths/ap-computer-science/TwoDArrays/traversal.png)

We don’t have to only use regular **for** loops for traversing 2D arrays. We can use enhanced **for** loops if we do not need to keep track of the indices. Since enhanced **for** loops only use the element of the arrays, it is a bit more cumbersome to keep track of which index we are at. This same idea applies to while and do-while loops as well. This is why we usually use regular **for** loops except for when we want to do something simple like printing.

We have gone over how to think about 2D array traversal in terms of arrays of arrays, but there are two main ways of thinking about traversal in terms of rows and columns. These are called row-major order and column-major order.



**6 Traversing 2D Arrays: Practice with Loops**

We have seen how to traverse 2D arrays using standard **for** loops, but in this exercise, we will practice traversing them using some other loop types. For example, you may want to only retrieve elements without keeping track of the indices using enhanced **for** loops, or you could continuously update the 2D array until a condition is met using **while** loops.

In enhanced **for** loops, each element is iterated through until the end of the array. When we think about the structure of 2D arrays in Java (arrays of array objects) then we know that the outer enhanced **for** loop elements are going to be arrays.

Let’s take a look at an example:

Given this 2D array of character data:

```java
char[][] charData = {{'a', 'b', 'c', 'd', 'e', 'f'},{'g', 'h', 'i', 'j', 'k', 'l'}};
```

Print out every character using enhanced **for** loops:

```java
for(char[] charRow : charData) {
    for(char c : charRow) {
        System.out.print(c + " ");
    }
    System.out.println();
}
```

Remember that the syntax for enhanced **for** loops looks like so: `for( datatype elementName : arrayName){`. Since 2D arrays in Java are arrays of arrays, each element in the outer enhanced **for** loop is an entire row of the 2D array. The nested enhanced **for** loop is then used to iterate through each element in the extracted row. Here is the output of the above code:

```
a b c d e f 
g h i j k l
```

Here is an example which accomplishes the same thing, but using **while** loops:

```java
int i = 0, j=0;
while(i<charData.length) {
    j = 0;
    while(j<charData[i].length) {
        System.out.print(charData[i][j] + " ");
        j++;
    }
    System.out.println();
    i++;
}
```

Here is the output of the above code:

```
a b c d e f 
g h i j k l
```

Notice how we can use different loop types for traversal, but still receive the same result.

Let’s work some example problems using different loop types!



**7 Traversing 2D Arrays: Row-Major Order**

Row-major order for 2D arrays refers to a traversal path which moves horizontally through each row starting at the first row and ending with the last.

Although we have already looked at how 2D array objects are stored in Java, this ordering system conceptualizes the 2D array into a rectangular matrix and starts the traversal at the top left element and ends at the bottom right element.

Here is a diagram which shows the path through the 2D array:

![Traversing across each row](https://static-assets.codecademy.com/Paths/ap-computer-science/TwoDArrays/row_major.png)

This path is created by the way we set up our nested loops. In the previous exercise, we looked at how we can traverse the 2D array by having nested loops in a variety of formats, but if we want to control the indices, we typically use standard **for** loops.

Let’s take a closer look at the structure of the nested **for** loops when traversing a 2D array:

Given this 2D array of strings describing the element positions:

```java
String[][] matrix = {{"[0][0]", "[0][1]", "[0][2]"}, 
                     {"[1][0]", "[1][1]", "[1][2]"},
                     {"[2][0]", "[2][1]", "[2][2]"},
                     {"[3][0]", "[3][1]", "[3][2]"}};
```

Lets keep track of the total number of iterations as we traverse the 2D array:

```java
int stepCount = 0;
 
for(int a = 0; a < matrix.length; a++) {
    for(int b = 0; b < matrix[a].length; b++) {
        System.out.print("Step: " + stepCount);
        System.out.print(", Element: " + matrix[a][b]);
        System.out.println();
        stepCount++;
    }
}
```

Here is the output of the above code:

```
Step: 0, Element: [0][0]
Step: 1, Element: [0][1]
Step: 2, Element: [0][2]
Step: 3, Element: [1][0]
Step: 4, Element: [1][1]
Step: 5, Element: [1][2]
Step: 6, Element: [2][0]
Step: 7, Element: [2][1]
Step: 8, Element: [2][2]
Step: 9, Element: [3][0]
Step: 10, Element: [3][1]
Step: 11, Element: [3][2]
 
```

The step value increases with every iteration within the inner **for** loop. Because of this, we can see the order in which each element is accessed. If we follow the step value in the output shows us that the elements are accessed in the same order as the row-major diagram above. Now why is that?

This is because in our **for** loop, we are using the number of rows as the termination condition within the outer **for** loop header `a < matrix.length;` Additionally, we are using the number of columns `b < matrix[a].length` as the termination condition for our inner loop. Logically we are saying: “For every row in our matrix, iterate through every single column before moving to the next row”. This is why our above example is traversing the 2D array using row-major order.

Here is a diagram showing which loop accesses which part of the 2D array for row-major order:

![Starting at the first row, looping through each column in that row. When the end of the row is reached, we move on to the next row](https://static-assets.codecademy.com/Paths/ap-computer-science/TwoDArrays/row_major_loop.png)

**Why Use Row-Major Order?**

Row-major order is important when we need to process data in our 2D array by row. You can be provided data in a variety of formats and you may need to perform calculations of rows of data at a time instead of individual elements. Let’s take one of our previous checkpoint exercises as an example. You were asked to calculate the sum of the entire 2D array of integers by traversing and accessing each element. Now, if we wanted to calculate the sum of each row, or take the average of each row, we can use row-major order to access the data in the order that we need. Let’s look at an example!

Given a 6X3 2D array of doubles:

```java
double[][] data = {{0.51,0.99,0.12},
                   {0.28,0.99,0.89},
                   {0.05,0.94,0.05},
                   {0.32,0.22,0.61},
                   {1.00,0.95,0.09},
                   {0.67,0.22,0.17}};
```

Calculate the sum of each row using row-major order:

```java
double rowSum = 0.0;
for(int o = 0; o < data.length; o++) {
    rowSum = 0.0;
    for(int i = 0; i < data[o].length; i++) {
        rowSum += data[o][i];
    }
    System.out.println("Row: " + o +", Sum: " + rowSum);
}
```

The output of the above code is:

```
Row: 0, Sum: 1.62
Row: 1, Sum: 2.16
Row: 2, Sum: 1.04
Row: 3, Sum: 1.15
Row: 4, Sum: 2.04
Row: 5, Sum: 1.06
```

An interesting thing to note is that, due to the way 2D arrays are structured in Java, enhanced **for** loops are always in row-major order. This is because an enhanced **for** loop iterates through the elements of the outer array which causes the terminating condition to be the length of the 2D array which is the number of rows.



**8 Traversing 2D Arrays: Column-Major Order**

Column-major order for 2D arrays refers to a traversal path which moves vertically down each column starting at the first column and ending with the last.

This ordering system also conceptualizes the 2D array into a rectangular matrix and starts the traversal at the top left element and ends at the bottom right element. Column-major order has the same starting and finishing point as row-major order, but it’s traversal is completely different

Here is a diagram which shows the path through the 2D array:

![Showing column-major ordering - walking down one column at a time](https://static-assets.codecademy.com/Paths/ap-computer-science/TwoDArrays/column_major.png)

In order to perform column-major traversal, we need to set up our nested loops in a different way. We need to change the outer loop from depending on the number of rows, to depending on the number of columns. Likewise we need the inner loop to depend on the number of rows in its termination condition.

Let’s look at our example 2D array from the last exercise and see what needs to be changed.

Given this 2D array of strings describing the element positions:

```java
String[][] matrix = {{"[0][0]", "[0][1]", "[0][2]"}, 
                     {"[1][0]", "[1][1]", "[1][2]"},
                     {"[2][0]", "[2][1]", "[2][2]"},
                     {"[3][0]", "[3][1]", "[3][2]"}};
```

Let’s keep track of the total number of iterations as we traverse the 2D array. We also need to change the termination condition (middle section) within the outer and inner **for** loop.

```java
int stepCount = 0;
 
for(int a = 0; a < matrix[0].length; a++) {
    for(int b = 0; b < matrix.length; b++) {
        System.out.print("Step: " + stepCount);
        System.out.print(", Element: " + matrix[b][a]);
        System.out.println();
        stepCount++;
    }
}    
```

Here is the output of the above code:

```
Step: 0, Element: [0][0]
Step: 1, Element: [1][0]
Step: 2, Element: [2][0]
Step: 3, Element: [3][0]
Step: 4, Element: [0][1]
Step: 5, Element: [1][1]
Step: 6, Element: [2][1]
Step: 7, Element: [3][1]
Step: 8, Element: [0][2]
Step: 9, Element: [1][2]
Step: 10, Element: [2][2]
Step: 11, Element: [3][2]
```

As you can see in the code above, the way we accessed the elements from our 2D array of strings called `matrix` is different from the way we accessed them when using row-major order. Let’s remember that the way we get the number of columns is by using `matrix[0].length` and the way we get the number of rows is by using `matrix.length`. Because of these changes to our **for** loops, our iterator `a` now iterates through every column while our iterator `b` iterates through every row. Since our iterators now represent the opposite values, whenever we access an element from our 2D array, we need to keep in mind what indices we are passing to our accessor. Remember the format we use for accessing the elements `matrix[row][column]`? Since `a` now iterates through our column indices, we place it in the right set of brackets, and the `b` is now placed in the left set of brackets.

Here is a diagram showing which loop accesses which part of the 2D array for column-major order:

![The outer loop controls the column while the inner loop controls the row in that column.](https://static-assets.codecademy.com/Paths/ap-computer-science/TwoDArrays/column_major_loops.png)

**Why Use Column-Major Order?**

Column major order is important because there are a lot of cases when you need to process data vertically. Let’s say that we have a chart of information which includes temperature data about each day. The top of each column is labeled with a day, and each row represents an hour. In order to find the average temperature per day, we would need to traverse the data vertically since each column represents a day. As mentioned in the last exercise, data can be provided in many different formats and shapes and you will need to know how to traverse it accordingly.

Let’s look at our sum example from the last exercise, but now using column-major order.

Given a 6X3 2D array of doubles:

```java
double[][] data = {{0.51,0.99,0.12},
                   {0.28,0.99,0.89},
                   {0.05,0.94,0.05},
                   {0.32,0.22,0.61},
                   {1.00,0.95,0.09},
                   {0.67,0.22,0.17}};
```

Calculate the sum of each column using column-major order:

```java
double colSum = 0.0;
for(int o = 0; o < data[0].length; o++) {
    colSum = 0.0;
    for(int i = 0; i < data.length; i++) {
        colSum += data[i][o];
    }
    System.out.println("Column: " + o +", Sum: " + colSum);
}
```

The output of the above code is:

```
Column: 0, Sum: 2.83
Column: 1, Sum: 4.31
Column: 2, Sum: 1.93
```

Let’s try an example!

We will be using the same runner data from the last exercise, but this time we are going to take the average times per lap rather than per runner. This requires that we use column-major traversal.



**9 Combining Traversal and Conditional Logic**

When working with 2D arrays, it is important to be able to combine traversal logic with conditional logic in order to effectively navigate and process the data. Here are a few ways in how conditional logic can affect 2D array traversal:

- Skipping or selecting certain rows and columns
- Modifying elements only if they meet certain conditions
- Complex calculations using the 2D array data
- Formatting the 2D array
- Avoiding exceptions / smart processing

Let’s go over a few examples which use these ideas:

First, let’s think about a situation where you have some string data inside a 2D array. We have an application which allows users to input events on a calendar. This is represented by a 5x7 2D array of strings. Due to the fact that the number of days in each month is slightly different and that there are less than 35 days in a month, we know that some of our elements are going to be empty. We want our application to do a few things:

- Detect which days of which weeks have something planned and alert us about the event.
- Count the number of events for each week
- Count the number of events for each day

Here is a visualization of what our calendar data looks like after a user has entered in some event information:

![A calendar](https://static-assets.codecademy.com/Paths/ap-computer-science/TwoDArrays/calendar.png)

Here’s what our calendar data looks like in our application

```java
String[][] calendar = {{"volunteer", "delivery", null, null, "doctor", null, "soccer"}, {null, "exam 1", null, "mechanic", null, null, "soccer"}, {"volunteer", "off work", null, "birthday", null, "concert", null}, {null, "exam 2", null, null, "doctor", null, "soccer"}, {"visit family", null, null, null, null, null, null}};
```

Let’s look at some code which accomplishes the requirements above. Carefully look through each line of code and read all of the comments.

There are a few things to note:

- Row-major or column-major order can be used to access the individual events
- Row-major order must be used to count the number of events per week since each row represents a week

Let’s take care of the first 2 requirements in one set of nested row-major loops

```java
for(int i = 0; i < calendar.length; i++) {
    numberOfEventsPerWeek = 0;
    for(int j = 0; j < calendar[i].length; j++) {
        // We need conditional logic to ensure that we do not count the empty days
        String event = calendar[i][j];
        if(event!=null && !event.equals("")) {
            // If the day does not have a null value or empty string for an event, then we print it and count it
            System.out.println("Week: " + (i+1) + ", Day: " + (j+1) + ", Event: " + event);
            numberOfEventsPerWeek++;
        }
    }
    System.out.println("Total number of events for week "+ (i+1) +": " + numberOfEventsPerWeek + "\n");
}
```

The above code produces this output:

```
Week: 1, Day: 1, Event: volunteer
Week: 1, Day: 2, Event: delivery
Week: 1, Day: 5, Event: doctor
Week: 1, Day: 7, Event: soccer
Total number of events for week 1: 4
 
Week: 2, Day: 2, Event: exam 1
Week: 2, Day: 4, Event: mechanic
Week: 2, Day: 7, Event: soccer
Total number of events for week 2: 3
 
Week: 3, Day: 1, Event: volunteer
Week: 3, Day: 2, Event: off work
Week: 3, Day: 4, Event: birthday
Week: 3, Day: 6, Event: concert
Total number of events for week 3: 4
 
Week: 4, Day: 2, Event: exam 2
Week: 4, Day: 5, Event: doctor
Week: 4, Day: 7, Event: soccer
Total number of events for week 4: 3
 
Week: 5, Day: 1, Event: visit family
Total number of events for week 5: 1
```

Now let’s complete the third requirement. Since we need to count all of the events for each of the weekdays, we will need to traverse the calendar vertically.

```java
int numberOfEventsPerWeekday = 0;
// We will use this array of day strings for our output later on so we don't have (day: 1)
String[] days = {"Sundays", "Mondays", "Tuesdays", "Wednesdays", "Thursdays", "Fridays", "Saturdays"};
for(int i = 0; i < calendar[0].length; i++) {
    numberOfEventsPerWeekday = 0;
    for(int j = 0; j < calendar.length; j++) {
        // Don't forget to flip the iterators in the accessor since we are flipping the direction we are navigating.
        // Remember, i now controls columns and j now controls rows
        String event = calendar[j][i];
        if(event!=null && !event.equals("")) {
            // Make sure we have an event for the day before counting it
            numberOfEventsPerWeekday++;
        }
    }
    // Use the days string array from earlier to convert the day index to a real weekday string
    System.out.println("Number of events on " + days[i] + ": " + numberOfEventsPerWeekday);
}
```

The output is:

```
Number of events on Sundays: 3
Number of events on Mondays: 4
Number of events on Tuesdays: 0
Number of events on Wednesdays: 2
Number of events on Thursdays: 2
Number of events on Fridays: 1
Number of events on Saturdays: 3
```

This example uses many of the concepts we have learned before. We use row-major order, column-major order, as well as including conditional logic to ensure that we have data for the elements we are accessing.

Additionally, we can use conditional logic to skip portions of the 2D array. For example, let’s say we wanted to print the events for weekdays only and skip the weekends.

We could use a conditional statement such as `if(j!=0 && j!=6)` in order to skip Sunday (`0`) and Saturday (`6`).

These modifications to our 2D array traversal are very common when processing data in applications. We need to know which cells to look at (skipping column titles for example), which cells to ignore (empty data, invalid data, outliers, etc.), and which cells to convert (converting string input from a file to numbers).

Let’s try an example!

We are making a simple grayscale image editor program and we want to apply some modifications to the image. We have a 4x8 pixel image that is stored as a 2D array of integers. The integer value represents the brightness of the pixel, where the acceptable values are between `0` and `255`, inclusive.



**10 2D Array Review**

Let’s review the concepts we have learned throughout this lesson.

Arrays are objects in Java, we can have arrays of objects, therefore we can also have arrays of arrays. This is the way 2D arrays are structured in Java.

We can declare and initialize 2D arrays in a few different ways depending on the situation:

```java
// Declaring without initializing
int[][] intTwoD;
 
// Initializing an empty 2D array which has already been declared
intTwoD = new int[5][5];
 
// Declaring and initializing an empty 2D array at once
String[][] stringData = new String[3][6];
 
// Declaring and initializing a 2D array using initializer lists
double[][] doubleValues = {{1.5, 2.6, 3.7}, {7.5, 6.4, 5.3}, {9.8,  8.7, 7.6}, {3.6, 5.7, 7.8}};
 
// Initializing a 2D array using initializer lists after it has already been declared, or already contains data;
char[][] letters = new char[100][250];
letters = new char[][]{{'a', 'b', 'c'}, {'d', 'e', 'f'}};
```

We retrieve elements in a 2D array by providing a row and column index `char c = letters[0][1];`

- We can also think of them as the index of the outer array and the index of the subarray
- We can modify elements the same way `letters[1][2] = 'z';`

We traverse 2D arrays using nested loops.

- We can use loops of any type, but we typically use nested **for** loops to keep track of the indices
- Row-major order traverses through each row moving horizontally to the right through each row
- Column-major order traverses through each column moving vertically down through each column
- Row-major order and column-major order start and end on the same elements, but the paths are different.
- In order to convert row-major to column-major, we need to make the outer loop terminating condition depend on the number of columns, make the inner loop terminating condition depend on the number of rows, and flip the variables in our accessor within the inner loop to ensure that we don’t try to access outside of the 2D array since we flipped the direction of traversal.

Here are examples of row-major and column-major order:

```java
// Row-major order
for(int o = 0; o < letters.length; o++) {
    for(int i = 0; i < letters[o].length; i++) {
        char c = letters[o][i];
    }
}
 
// Column-major order
for(int o = 0; o < letters[0].length; o++) {
    for(int i = 0; i < letters.length; i++) {
        char c = letters[i][o];
    }
}
```

Conditional logic in our 2D array traversal allows us to use the data in a meaningful way. We can control which rows and columns we look at, ensure that the data we are looking at is what we want, perform calculations on specific elements, avoid throwing exceptions, and more.

Here is an example of traversal with conditional logic.

Given this 2D array of Strings:

```java
String[][] words = {{"championship", "QUANTITY", "month"},{"EMPLOYEE", "queen", "understanding"},{"method", "writer", "MOVIE"}};
```

We are going to flip the capitalization of the words:

```java
System.out.println("Before...");
System.out.println(Arrays.deepToString(words).replace("],", "],\n") + "\n");
 
for(int i=0; i<words.length; i++) {
    for(int j = 0; j<words[i].length; j++) {
        if(words[i][j]!=null) {
 
            // Check the capitalization
            boolean allCaps = true;
            for(char c : words[i][j].toCharArray()) 
                if(!Character.isUpperCase(c)) 
                    allCaps = false;
 
            // Flip the capitalization
            if(allCaps)
                words[i][j] = words[i][j].toLowerCase();
            else
                words[i][j] = words[i][j].toUpperCase();
        }
    }
}
 
System.out.println("After...");
System.out.println(Arrays.deepToString(words).replace("],", "],\n") + "\n");
```

Here is the output of the above code:

```java
Before...
[[championship, QUANTITY, month],
 [EMPLOYEE, queen, understanding],
 [method, writer, MOVIE]]
 
After...
[[CHAMPIONSHIP, quantity, MONTH],
 [employee, QUEEN, UNDERSTANDING],
 [METHOD, WRITER, movie]]
```

Time to work some review problems!

After learning about 2D arrays, you have decided to become a CS professor and you are now teaching your class about 2D arrays. You are making an application which will keep track of their exam grades and show you statistics about their performance. You will be using 2D arrays to keep track of their exam grades

