# learn JavaScript
https://www.codecademy.com/learn/introduction-to-javascript

https://learning.oreilly.com/library/view/javascript-novice-to/9781492023623/Text/ch1.html#programming

## 1 Introduction
## 2 Conditionals

Review

Way to go! Here are some of the major concepts for conditionals:

- An `if` statement checks a condition and will execute a task if that condition evaluates to `true`.

- `if...else` statements make binary decisions and execute different code blocks based on a provided condition.

- We can add more conditions using `else if` statements.

- Comparison operators, including `<`, `>`, `<=`, `>=`, `===`, and `!==` can compare two values.

  * `==` in JavaScript is used for comparing two variables, but it ignores the datatype of variable

  *  `===` is used for comparing two variables, but this operator also **checks datatype** and compares two values.

  https://bit.ly/3uppRqJ

  

  

- The logical and operator, `&&`, or “and”, checks if both provided expressions are truthy.

- The logical operator `||`, or “or”, checks if either provided expression is truthy.

- The bang operator, `!`, switches the truthiness and falsiness of a value.

- The ternary operator is shorthand to simplify concise `if...else` statements.

- A `switch` statement can be used to simplify the process of writing multiple `else if` statements. The `break` keyword stops the remaining `case`s from being checked and executed in a `switch` statement.



## 3 functions

- A *function declaration* :

  ```javascript
  function greetWorld(){
    	console.log('Hello, World!');
  }
  ```

- A parameter is a named variable inside a function’s block which will be assigned the value of the argument passed in when the function is invoked:

  ```javascript
  function calculateArea(width, height) {
    	console.log(width * height);
  }
  ```

- To *call* a function in your code:

  ```javascript
  greetWorld();
  ```

- To return a value from a function, we use a *return statement*.

- To define a function using *function expressions*:

  ```java
  const calculateArea = function(width, height) {
    	const area = width * height;
    	return area;
  }
  ```

- To define a function using *arrow function notation*:

  ```javascript
  const calculateArea = (width, height) => {
    	const area = width * height;
    	return area;
  }
  ```

## 4 Scope

Always use let instead of var , Because let used **only in the block it’s defined in**



```java
for(let i = 1; i <= 3; i++){
    console.log(i);
}
i++; // i is not define
console.log(i);

for(var i = 1; i <= 3; i++){
    console.log(i);// 1\n 2\n 3\n
}
console.log(i); // 4
```





## 5 String

```js
const name = 'Alexa';
<< 'Alexa'

name.length;
<< 5

name.toUpperCase();
<< 'ALEXA'

name.toLowerCase();
<< 'alexa'

name.charAt(1);
<< 'l'

name.indexOf('A');
<< 0
```



##5 Arrays 

Review Arrays

Nice work! In this lesson, we learned these concepts regarding arrays:

- Arrays are lists that store data in JavaScript.

- Arrays are created with brackets `[]`.

  ```js
  const myArray = [];
  ```

- Each item inside of an array is at a numbered position, or index, starting at `0`.

- We can access one item in an array using its index, with syntax like: `myArray[0]`.

- We can also change an item in aarray using its index, with syntax like

  ```js
  myArray[0] = 'new string';
  ```

- Arrays have a `length` property, which allows you to see how many items are in an array.

  ```js
  const avengers = ['Captain America', 'Iron Man', 'Thor', 'Hulk', 'Hawkeye', 'Black Widow'];
  avengers.length;
  << 6
  ```

- Arrays have their own methods, including `.push()` and `.pop()`, which add and remove items from an array, respectively.

  ```js
  avengers.push('Thor');
  << 2
  ```

  ```js
  avengers.pop();
  << 'Thor'
  ```

- Arrays have many methods that perform different tasks, such as `.slice()` and `.shift()`, you can find documentation at the [Mozilla Developer Network](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) website.

- Some built-in methods are mutating, meaning the method will change the array, while others are not mutating. You can always check the documentation.

- Variables that contain arrays can be declared with `let` or `const`. Even when declared with `const`, arrays are still mutable. However, a variable declared with `const` cannot be reassigned.

- Arrays mutated inside of a function will keep that change even outside the function.

- Arrays can be nested inside other arrays.

- To access elements in nested arrays chain indices using bracket notation.

Learning how to work with and manipulate arrays will help you work with chunks of data!



## 6 Loops

- Loops perform repetitive actions so we don’t have to code that process manually every time.
- How to write `for` loops with an iterator variable that increments or decrements
- How to use a `for` loop to iterate through an array
- A nested `for` loop is a loop inside another loop
- `while` loops allow for different types of stopping conditions
- Stopping conditions are crucial for avoiding infinite loops.
- `do...while` loops run code at least once— only checking the stopping condition after the first execution
- The `break` keyword allows programs to leave a loop during the execution of its block



## 7 Iterators 

### 1 higher-order functions

**Functions as Data**

JavaScript functions behave like any other data type in the language; we can assign functions to variables, and we can reassign them to new variables.

Below, we have an annoyingly long function name that hurts the readability of any code in which it’s used. Let’s pretend this function does important work and needs to be called repeatedly!

```javascript
const announceThatIAmDoingImportantWork = () => {
    console.log("I’m doing very important work!");
};
```

What if we wanted to rename this function without sacrificing the source code? We can re-assign the function to a variable with a suitably short name:

```javascript
const busy = announceThatIAmDoingImportantWork;
 
busy(); // This function call barely takes any space!
```

`busy` is a variable that holds a *reference* to our original function. If we could look up the address in memory of `busy` and the address in memory of `announceThatIAmDoingImportantWork` they would point to the same place. Our new `busy()` function can be invoked with parentheses as if that was the name we originally gave our function.

Notice how we assign `announceThatIAmDoingImportantWork` without parentheses as the value to the `busy` variable. We want to assign the value of the function itself, not the value it returns when invoked.

In JavaScript, functions are *first class objects*. This means that, like other objects you’ve encountered, JavaScript functions can have properties and methods.

Since functions are a type of object, they have properties such as `.length` and `.name` and methods such as `.toString()`. You can see more about the methods and properties of functions [in the documentation](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function).

Functions are special because we can invoke them, but we can still treat them like any other type of data. Let’s get some practice doing that!



**Functions as Parameters**

Since functions can behave like any other type of data in JavaScript, it might not surprise you to learn that we can also pass functions (into other functions) as parameters. A *higher-order function* is a function that either accepts functions as parameters, returns a function, or both! We call the functions that get passed in as parameters and invoked *callback functions* because they get called during the execution of the higher-order function.

When we pass a function in as an argument to another function, we don’t invoke it. Invoking the function would evaluate to the return value of that function call. With callbacks, we pass in the function itself by typing the function name *without* the parentheses (that would evaluate to the result of calling the function):

```javascript
const timeFuncRuntime = funcParameter => {
   let t1 = Date.now();
   funcParameter();
   let t2 = Date.now();
   return t2 - t1;
}
 
const addOneToOne = () => 1 + 1;
 
timeFuncRuntime(addOneToOne);
```

We wrote a higher-order function, `timeFuncRuntime()`. It takes in a function as an argument, saves a starting time, invokes the callback function, records the time after the function was called, and returns the time the function took to run by subtracting the starting time from the ending time.

This higher-order function could be used with any callback function which makes it a potentially powerful piece of code.

We then invoked `timeFuncRuntime()` first with the `addOneToOne()` function - note how we passed in `addOneToOne` and did not invoke it.

```javascript
timeFuncRuntime(() => {
  for (let i = 10; i>0; i--){
    console.log(i);
  }
});
```

In this example, we invoked `timeFuncRuntime()` with an anonymous function that counts backwards from 10. Anonymous functions can be arguments too!

Let’s get some practice using functions and writing higher-order functions.



### 2 Iterators

Review

Awesome job on clearing the iterators lesson! You have learned a number of useful methods in this lesson as well as how to use the JavaScript documentation from the Mozilla Developer Network to discover and understand additional methods. Let’s review!

- `.forEach()` is used to execute the same code on every element in an array but does not change the array and returns `undefined`.

  ```javascript
  const array1 = ['a', 'b', 'c'];
  
  array1.forEach(element => console.log(element));
  
  // expected output: "a"
  // expected output: "b"
  // expected output: "c"
  ```

  ```javascript
  const politelyDecline = (veg) => {
        console.log('No ' + veg + ' please. I will have pizza with extra cheese.');
  }
  
  // Write your code here:
  function declineEverything(arr){
    arr.forEach(politelyDecline);
  };
  ```

- `.map()` executes the same code on every element in an array and returns a new array with the updated elements.

  ```javascript
  const array1 = [1, 4, 9, 16];
  
  // pass a function to map
  const map1 = array1.map(x => x * 2);
  
  console.log(map1);
  // expected output: Array [2, 8, 18, 32]
  ```

  

- `.filter()` checks every element in an array to see if it meets certain criteria and returns a new array with the elements that return truthy for the criteria.

  ```javascript
  const words = ['spray', 'limit', 'elite', 'exuberant', 'destruction', 'present'];
  
  const result = words.filter(word => word.length > 6);
  
  console.log(result);
  // expected output: Array ["exuberant", "destruction", "present"]
  ```

  

- `.findIndex()` returns the index of the first element of an array which satisfies a condition in the callback function. It returns `-1` if none of the elements in the array satisfies the condition.

  ```javascript
  const array1 = [5, 12, 8, 130, 44];
  
  const isLargeNumber = (element) => element > 13;
  
  console.log(array1.findIndex(isLargeNumber));
  // expected output: 3
  ```

  

- `.reduce()` iterates through an array and takes the values of the elements and returns a single value.

- All iterator methods takes a callback function that can be pre-defined, or a function expression, or an arrow function.

- You can visit the [Mozilla Developer Network](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) to learn more about iterator methods (and all other parts of JavaScript!).



```javascript
const sortSpeciesByTeeth = arr => arr.sort((speciesObj1, speciesObj2) => speciesObj1.numTeeth > speciesObj2.numTeeth)
```



## 8 Objects

### 1 Advanced Objects Introduction

ADVANCED OBJECTS

Advanced Objects Introduction

Remember, objects in JavaScript are containers that store data and functionality. In this lesson, we will build upon the fundamentals of creating objects and explore some advanced concepts.

So if there are no objections, let’s learn more about objects!

In this lesson we will cover these topics:

- how to use the `this` keyword.
- conveying privacy in JavaScript methods.
- defining getters and setters in objects.
- creating factory functions.
- using destructuring techniques.



### 2 The this Keyword

Objects are ==collections== of related ==data== and ==functionality==. We store that functionality in methods on our objects:

```javascript
const goat = {
  dietType: 'herbivore',
  makeSound() {
    console.log('baaa');
  }
};
```

In our `goat` object we have a `.makeSound()` method. We can invoke the `.makeSound()` method on `goat`.

```javascript
goat.makeSound(); // Prints baaa
```

Nice, we have a `goat` object that can print `baaa` to the console. Everything seems to be working fine. What if we wanted to add a new method to our `goat` object called `.diet()` that prints the `goat`‘s `dietType`?

```javascript
const goat = {
  dietType: 'herbivore',
  makeSound() {
    console.log('baaa');
  },
  diet() {
    console.log(dietType);
  }
};
goat.diet(); 
// Output will be "ReferenceError: dietType is not defined"
```

That’s strange, why is `dietType` not defined even though it’s a property of `goat`? ==That’s because inside the scope of the `.diet()` method, we don’t automatically have access to other properties of the `goat` object.==

Here’s where the `this` keyword comes to the rescue. If we change the `.diet()` method to use the `this`, the `.diet()` works! :

```javascript
const goat = {
  dietType: 'herbivore',
  makeSound() {
    console.log('baaa');
  },
  diet() {
    console.log(this.dietType);
  }
};
 
goat.diet(); 
// Output: herbivore
```

==The `this` keyword references the *calling object* which provides access to the calling object’s properties==. In the example above, the calling object is `goat` and by using `this` we’re accessing the `goat` object itself, and then the `dietType` property of `goat` by using property dot notation.

Let’s get comfortable using the `this` keyword in a method.

### 3 Arrow Functions and this

We saw in the previous exercise that for a method, the calling object is the object the method belongs to. If we use the `this` keyword in a method then the value of `this` is the calling object. However, it becomes a bit more complicated when we start using arrow functions for methods. Take a look at the example below:

```javascript
const goat = {
  dietType: 'herbivore',
  makeSound() {
    console.log('baaa');
  },
  diet: () => {
    console.log(this.dietType);
  }
};
 
goat.diet(); // Prints undefined
```

In the comment, you can see that `goat.diet()` would log `undefined`. So what happened? Notice that in the `.diet()` is defined using an arrow function.

Arrow functions inherently *bind*, or tie, an already defined `this` value to the function itself that is NOT the calling object. In the code snippet above, the value of `this` is the *global object*, or an object that exists in the global scope, which doesn’t have a `dietType` property and therefore returns `undefined`.

To read more about either arrow functions or the global object check out the MDN documentation of [the global object](https://developer.mozilla.org/en-US/docs/Glossary/Global_object) and [arrow functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions).

The key takeaway from the example above is to *avoid* using arrow functions when using `this` in a method!



### 4 Privacy

Accessing and updating properties is fundamental in working with objects. However, there are cases in which we don’t want other code simply accessing and updating an object’s properties. When discussing *privacy* in objects, we define it as the idea that only certain properties should be mutable or able to change in value.

Certain languages have privacy built-in for objects, but JavaScript does not have this feature. Rather, JavaScript developers follow naming conventions that signal to other developers how to interact with a property. ==One common convention is to place an underscore `_` before the name of a property to mean that the property should not be altered.==Here’s an example of using `_` to prepend a property.

```javascript
const bankAccount = {
  _amount: 1000
}
```

In the example above, the `_amount` is not intended to be directly manipulated.

Even so, it is still possible to reassign `_amount`:

```javascript
bankAccount._amount = 1000000;
```

In later exercises, we’ll cover the use of methods called *getters* and *setters*. Both methods are used to respect the intention of properties prepended, or began, with `_`. Getters can return the value of internal properties and setters can safely reassign property values. For now, let’s see what happens if we can change properties that don’t have setters or getters.





### 5 Getters

*Getters* are methods that get and return the internal properties of an object. But they can do more than just retrieve the value of a property! Let’s take a look at a getter method:

```javascript
const person = {
  _firstName: 'John',
  _lastName: 'Doe',
  get fullName() {
    if (this._firstName && this._lastName){
      return `${this._firstName} ${this._lastName}`;
    } else {
      return 'Missing a first name or a last name.';
    }
  }
}
 
// To call the getter method: 
person.fullName; // 'John Doe'
```

Notice that in the getter method above:

- We use the `get` keyword followed by a function.
- We use an `if...else` conditional to check if both `_firstName` and `_lastName` exist (by making sure they both return truthy values) and then return a different value depending on the result.
- We can access the calling object’s internal properties using `this`. In `fullName`, we’re accessing both `this._firstName` and `this._lastName`.
- In the last line we call `fullName` on `person`. In general, getter methods do not need to be called with a set of parentheses. Syntactically, it looks like we’re accessing a property.

Now that we’ve gone over syntax, let’s discuss some notable advantages of using getter methods:

- Getters can perform an action on the data when getting a property.
- Getters can return different values using conditionals.
- In a getter, we can access the properties of the calling object using `this`.
- The functionality of our code is easier for other developers to understand.

Another thing to keep in mind when using getter (and setter) methods is that properties cannot share the same name as the getter/setter function. If we do so, then calling the method will result in an infinite call stack error. One workaround is to add an underscore before the property name like we did in the example above.

Great, let’s go getter!





### 6 Setters

Along with getter methods, we can also create *setter* methods which reassign values of existing properties within an object. Let’s see an example of a setter method:

```javascript
const person = {
  _age: 37,
  set age(newAge){
    if (typeof newAge === 'number'){
      this._age = newAge;
    } else {
      console.log('You must assign a number to age');
    }
  }
};
```

Notice that in the example above:

- We can perform a check for what value is being assigned to `this._age`.
- When we use the setter method, only values that are numbers will reassign `this._age`
- There are different outputs depending on what values are used to reassign `this._age`.

Then to use the setter method:

```javascript
person.age = 40;
console.log(person._age); // Logs: 40
person.age = '40'; // Logs: You must assign a number to age
```

Setter methods like `age` do not need to be called with a set of parentheses. Syntactically, it looks like we’re reassigning the value of a property.

Like getter methods, there are similar advantages to using setter methods that include checking input, performing actions on properties, and displaying a clear intention for how the object is supposed to be used. Nonetheless, even with a setter method, it is still possible to directly reassign properties. For example, in the example above, ==we can still set `._age` directly:==

```javascript
person._age = 'forty-five'
console.log(person._age); // Prints forty-five
```



### 7 Factory Functions

So far we’ve been creating objects individually, but there are times where we want to ==create many instances of an object== quickly. Here’s where *factory functions* come in. A real world factory manufactures multiple copies of an item quickly and on a massive scale. A factory function is a function that returns an object and can be reused to make multiple object instances. Factory functions can also have parameters allowing us to customize the object that gets returned.

Let’s say we wanted to create an object to represent monsters in JavaScript. There are many different types of monsters and we could go about making each monster individually but we can also use a factory function to make our lives easier. To achieve this diabolical plan of creating multiple monsters objects, we can use a factory function that has parameters:

```javascript
const monsterFactory = (name, age, energySource, catchPhrase) => {
  return { 
    name: name,
    age: age, 
    energySource: energySource,
    scare() {
      console.log(catchPhrase);
    } 
  }
};
```

In the `monsterFactory` function above, it has four parameters and returns an object that has the properties: `name`, `age`, `energySource`, and `scare()`. To make an object that represents a specific monster like a ghost, we can call `monsterFactory` with the necessary arguments and assign the return value to a variable:

```javascript
const ghost = monsterFactory('Ghouly', 251, 'ectoplasm', 'BOO!');
ghost.scare(); // 'BOO!'
```

Now we have a `ghost` object as a result of calling `monsterFactory()` with the needed arguments. With `monsterFactory` in place, we don’t have to create an object literal every time we need a new monster. Instead, we can invoke the `monsterFactory` function with the necessary arguments to ~~take over the world~~ make a monster for us!





### 8 Property Value Shorthand

ES6 introduced some new shortcuts for assigning properties to variables known as *destructuring*.

In the previous exercise, we created a factory function that helped us create objects. We had to assign each property a key and value even though the key name was the same as the parameter name we assigned to it. To remind ourselves, here’s a truncated version of the factory function:

```javascript
const monsterFactory = (name, age) => {
  return { 
    name: name,
    age: age
  }
};
```

Imagine if we had to include more properties, that process would quickly become tedious! But we can use a destructuring technique, called *property value shorthand*, to save ourselves some keystrokes. The example below works exactly like the example above:

```javascript
const monsterFactory = (name, age) => {
  return { 
    name,
    age 
  }
};
```

Notice that we don’t have to repeat ourselves for property assignments!





### 9 Destructured Assignment

We often want to extract key-value pairs from objects and save them as variables. Take for example the following object:

```javascript
const vampire = {
  name: 'Dracula',
  residence: 'Transylvania',
  preferences: {
    day: 'stay inside',
    night: 'satisfy appetite'
  }
};
```

If we wanted to extract the `residence` property as a variable, we could using the following code:

```javascript
const residence = vampire.residence; 
console.log(residence); // Prints 'Transylvania' 
```

However, we can also take advantage of a destructuring technique called *destructured assignment* to save ourselves some keystrokes. ==In destructured assignment we create a variable with the name of an object’s key that is wrapped in curly braces `{ }` and assign to it the object.== Take a look at the example below:

```javascript
const { residence } = vampire; 
console.log(residence); // Prints 'Transylvania'
```

Look back at the `vampire` object’s properties in the first code example. Then, in the example above, we declare a new variable `residence` that extracts the value of the `residence` property of `vampire`. When we log the value of `residence` to the console, `'Transylvania'` is printed.

We can even use destructured assignment to grab nested properties of an object:

```javascript
const { day } = vampire.preferences; 
console.log(day); // Prints 'stay inside'
```



### 10 Built-in Object Methods

In the previous exercises we’ve been creating instances of objects that have their own methods. But, we can also take advantage of built-in methods for Objects!

For example, we have access to object instance methods like: `.hasOwnProperty()`, `.valueOf()`, and many more! Practice your documentation reading skills and check out: [MDN’s object instance documentation](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#Methods).

There are also useful Object class methods such as `Object.assign()`, `Object.entries()`, and `Object.keys()` just to name a few. For a comprehensive list, browse: [MDN’s object instance documentation](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#Methods_of_the_Object_constructor).

Let’s get acquainted with some of these methods and their documentation.

Note: You will see errors as you work through this exercise, but by the end the errors will be fixed!



## 9 Classes

### 1 Introduction to Classes

JavaScript is an *object-oriented programming* (OOP) language we can use to model real-world items. In this lesson, you will learn how to make *classes*. Classes are a tool that developers use to quickly produce similar objects.

Take, for example, an object representing a dog named `halley`. This dog’s `name` (a key) is `"Halley"` (a value) and has an `age` (another key) of `3` (another value). We create the `halley` object below:

```javascript
let halley = {
  _name: 'Halley',
  _behavior: 0,
 
  get name() {
    return this._name;
  },
 
  get behavior() {
    return this._behavior;
  },
 
  incrementBehavior() {
    this._behavior++;
  }
}
```



Now, imagine you own a dog daycare and want to create a catalog of all the dogs who belong to the daycare. Instead of using the syntax above for every dog that joins the daycare, we can create a `Dog` class that serves as a template for creating new `Dog` objects. For each new dog, you can provide a value for their name.

As you can see, classes are a great way to reduce duplicate code and debugging time.

After we lay the foundation for classes in the first few exercises, we will introduce inheritance and static methods — two features that will make your code more efficient and meaningful.



### 3 Constructor

In the last exercise, you created a class called `Dog`, and used it to produce a `Dog` object.

Although you may see similarities between class and object syntax, there is one important method that sets them apart. It’s called the *constructor* method. JavaScript calls the `constructor()` method every time it creates a new *instance* of a class.

```javascript
class Dog {
  constructor(name) {
    this.name = name;
    this.behavior = 0;
  }
}
```

- `Dog` is the name of our class. By convention, we capitalize and CamelCase class names.
- JavaScript will invoke the `constructor()` method every time we create a new instance of our `Dog` class.
- This `constructor()` method accepts one argument, `name`.
- Inside of the `constructor()` method, we use the `this` keyword. In the context of a class, `this` refers to an instance of that class. In the `Dog` class, we use `this` to set the value of the Dog instance’s `name` property to the `name` argument.
- Under `this.name`, we create a property called `behavior`, which will keep track of the number of times a dog misbehaves. The `behavior` property is always initialized to zero.

In the next exercise, you will learn how to create `Dog` instances.



### 4 Instance

Now, we’re ready to create class instances. An *instance* is an object that contains the property names and methods of a class, but with unique property values. Let’s look at our `Dog` class example.

```javascript
class Dog {
  constructor(name) {
    this.name = name;
    this.behavior = 0;
  } 
}
 
const halley = new Dog('Halley'); // Create new Dog instance
console.log(halley.name); // Log the name value saved to halley
// Output: 'Halley'
```

Below our `Dog` class, we use the `new` keyword to create an instance of our `Dog` class. Let’s consider the line of code step-by-step.

- We create a new variable named `halley` that will store an instance of our `Dog` class.
- We use the `new` keyword to generate a new instance of the `Dog` class. The `new` keyword calls the `constructor()`, runs the code inside of it, and then returns the new instance.
- We pass the `'Halley'` string to the `Dog` constructor, which sets the `name` property to `'Halley'`.
- Finally, we log the value saved to the `name` key in our `halley` object, which logs `'Halley'` to the console.

Now you know how to create instances. In the next exercise, you will learn how to add getters, setters, and methods.



### 5 Methods

At this point, we have a `Dog` class that spins up objects with `name` and `behavior` properties. Below, we will add getters and a method to bring our class to life.

Class method and getter syntax is the same as it is for objects **except you can not include commas between methods**.

```javascript
class Dog {
  constructor(name) {
    this._name = name;
    this._behavior = 0;
  }
 
  get name() {
    return this._name;
  }
 
  get behavior() {
    return this._behavior;
  }
 
  incrementBehavior() {
    this._behavior++;
  }
}
```

In the example above, we add getter methods for `name` and `behavior`. Notice, we also prepended our property names with underscores (`_name` and `_behavior`), which indicate these properties should not be accessed directly. Under the getters, we add a method named `.incrementBehavior()`. When you call `.incrementBehavior()` on a Dog instance, it adds `1` to the `_behavior` property. Between each of our methods, we did *not* include commas.

### 6 Method Calls

Finally, let’s use our new methods to access and manipulate data from `Dog` instances.

```javascript
class Dog {
  constructor(name) {
    this._name = name;
    this._behavior = 0;
  }
 
  get name() {
    return this._name;
  }
 
  get behavior() {
    return this._behavior;
  }   
 
  incrementBehavior() {
    this._behavior++;
  }
}
 
const halley = new Dog('Halley');
```

In the example above, we create the `Dog` class, then create an instance, and save it to a variable named `halley`.

The syntax for calling methods and getters on an instance is the same as calling them on an object — append the instance with a period, then the property or method name. For methods, you must also include opening and closing parentheses.

Let’s take a moment to create two `Dog` instances and call our `.incrementBehavior()` method on one of them.

```javascript
let nikko = new Dog('Nikko'); // Create dog named Nikko
nikko.incrementBehavior(); // Add 1 to nikko instance's behavior
let bradford = new Dog('Bradford'); // Create dog name Bradford
console.log(nikko.behavior); // Logs 1 to the console
console.log(bradford.behavior); // Logs 0 to the console
```

In the example above, we create two new `Dog` instances, `nikko` and `bradford`. Because we increment the behavior of our `nikko` instance, but not `bradford`, accessing `nikko.behavior` returns `1` and accessing `bradford.behavior` returns `0`.



### 7 Inheritance I

Imagine our doggy daycare is so successful that we decide to expand the business and open a kitty daycare. Before the daycare opens, we need to create a `Cat` class so we can quickly generate `Cat` instances. We know that the properties in our `Cat` class (`name`, behavior) are similar to the properties in our `Dog`class, though, there will be some differences, because of course, cats are not dogs. 

Let’s say that our `Cat` class looks like this:

```javascript
class Cat {
  constructor(name, usesLitter) {
    this._name = name;
    this._usesLitter = usesLitter;
    this._behavior = 0;
  }
 
  get name() {
    return this._name;
  }
 
  get usesLitter() {
    return this._usesLitter;
  }
 
  get behavior() {
    return this._behavior;
  }  
 
  incrementBehavior() {
    this._behavior++;
  }
}
```

In the example above, we create a `Cat` class. It shares a couple of properties (`_name` and `_behavior`) and a method (`.incrementBehavior()`) with the `Dog` class from earlier exercises. The `Cat` class also contains one additional property (`_usesLitter`), that holds a boolean value to indicate whether a cat can use their litter box.

When multiple classes share properties or methods, they become candidates for *inheritance* — a tool developers use to decrease the amount of code they need to write. 

With inheritance, you can create a *parent* class (also known as a superclass) with properties and methods that multiple *child* classes (also known as subclasses) share. The child classes inherit the properties and methods from their parent class. 

Let’s abstract the shared properties and methods from our `Cat` and `Dog` classes into a parent class called `Animal`. 

```javascript
class Animal {
  constructor(name) {
    this._name = name;
    this._behavior = 0;
  }
 
  get name() {
    return this._name;
  }
 
  get behavior() {
    return this._behavior;
  }   
 
  incrementBehavior() {
    this._behavior++;
  }
} 
```

In the example above, the `Animal` class contains the properties and methods that the `Cat` and `Dog` classes share (`name`, `behavior`, `.incrementBehavior()`). 

The diagram to the right shows the relationships we want to create between the Animal, Cat, and Dog classes.



###8 Inheritance II

In the last exercise, we created a parent class named `Animal` for two child classes named `Cat` and `Dog`. 

The `Animal` class below contains the shared properties and methods of `Cat` and `Dog`.

```javascript
class Animal {
  constructor(name) {
    this._name = name;
    this._behavior = 0;
  }
 
  get name() {
    return this._name;
  }
 
  get behavior() {
    return this._behavior;
  }   
 
  incrementBehavior() {
    this._behavior++;
  }
} 
```

The code below shows the `Cat` class that will inherit information from the `Animal` class.

```javascript
class Cat {
  constructor(name, usesLitter) {
    this._name = name;
    this._usesLitter = usesLitter;
    this._behavior = 0;
  }
 
  get name() {
    return this._name;
  }
 
  get behavior() {
    return this._behavior;
  }
 
  get usesLitter() {
    return this._usesLitter;
  }
 
  incrementBehavior() {
    this._behavior++;
  }
}
```

To the right, in **main.js**, you will put what you learned to practice by creating a parent class named `HospitalEmployee`.



### 9 Inheritance III -property

We’ve abstracted the shared properties and methods of our `Cat` and `Dog` classes into a parent class called `Animal` (See below). 

```javascript
class Animal {
  constructor(name) {
    this._name = name;
    this._behavior = 0;
  }
 
  get name() {
    return this._name;
  }
 
  get behavior() {
    return this._behavior;
  }
 
  incrementBehavior() {
    this._behavior++;
  }
} 
```

Now that we have these shared properties and methods in the parent `Animal` class, we can extend them to the subclass, `Cat`.

```javascript
class Cat extends Animal {
  constructor(name, usesLitter) {
    super(name);
    this._usesLitter = usesLitter;
  }
}
```

In the example above, we create a new class named `Cat` that extends the `Animal` class. Let’s pay special attention to our new keywords: `extends` and `super`.

- ==The `extends` keyword makes the methods of the animal class available inside the cat class.==
- The constructor, called when you create a new `Cat` object, accepts two arguments, `name` and `usesLitter`. 
- ==The `super` keyword calls the constructor of the parent class.==In this case, `super(name)` passes the name argument of the `Cat` class to the constructor of the `Animal` class. When the `Animal` constructor runs, it sets `this._name = name;` for new `Cat` instances.
- `_usesLitter` is a new property that is unique to the `Cat` class, so we set it in the `Cat` constructor.

Notice, we call `super` on the first line of our `constructor()`, then set the `usesLitter` property on the second line. In a `constructor()`, you must always call the `super` method before you can use the `this`keyword — if you do not, JavaScript will throw a reference error. To avoid reference errors, it is best practice to call `super` on the first line of subclass constructors.

Below, we create a new `Cat` instance and call its name with the same syntax as we did with the `Dog` class:

```javascript
const bryceCat = new Cat('Bryce', false); 
console.log(bryceCat._name); // output: Bryce
```

In the example above, we create a new instance the `Cat` class, named `bryceCat`. We pass it `'Bryce'` and `false` for our `name` and `usesLitter` arguments. When we call `console.log(bryceCat._name)` our program prints, `Bryce`.

In the example above, we abandoned best practices by calling our `_name` property directly. In the next exercise, we’ll address this by calling an inherited getter method for our `name` property.



###10 Inheritance IV -method

Now that we know how to create an object that inherits properties from a parent class let’s turn our attention to methods.

When we call `extends` in a class declaration, all of the parent methods are available to the child class. 

Below, we extend our `Animal` class to a `Cat` subclass.

```javascript
class Animal {
  constructor(name) {
    this._name = name;
    this._behavior = 0;
  }
 
  get name() {
    return this._name;
  }
 
  get behavior() {
    return this._behavior;
  }
 
  incrementBehavior() {
    this._behavior++;
  }
} 
 
 
class Cat extends Animal {
  constructor(name, usesLitter) {
    super(name);
    this._usesLitter = usesLitter;
  }
}
 
const bryceCat = new Cat('Bryce', false);
```

In the example above, our `Cat` class extends `Animal`. As a result, the `Cat` class has access to the `Animal`getters and the `.incrementBehavior()` method. 

Also in the code above, we create a `Cat` instance named `bryceCat`. Because `bryceCat` has access to the `name` getter, the code below logs `'Bryce'` to the console. 

```javascript
console.log(bryceCat.name);
```

Since the `extends` keyword brings all of the parent’s getters and methods into the child class, `bryceCat.name` accesses the `name` getter and returns the value saved to the `name` property.

Now consider a more involved example and try to answer the following question: What will the code below log to the console?

```javascript
bryceCat.incrementBehavior(); // Call .incrementBehavior() on Cat instance 
console.log(bryceCat.behavior); // Log value saved to behavior
```

The correct answer is `1`. But why?

- The `Cat` class inherits the `_behavior` property, `behavior` getter, and the `.incrementBehavior()`method from the `Animal` class. 
- When we created the `bryceCat` instance, the `Animal` constructor set the `_behavior` property to zero. 
- The first line of code calls the inherited `.incrementBehavior()` method, which increases the `bryceCat` `_behavior` value from zero to one.
- The second line of code calls the `behavior` getter and logs the value saved to `_behavior` (`1`).



### 11 Inheritance V

In addition to the inherited features, child classes can contain their own properties, getters, setters, and methods. 

Below, we will add a `usesLitter` getter. The syntax for creating getters, setters, and methods is the same as it is in any other class.

```javascript
class Cat extends Animal {
  constructor(name, usesLitter) {
    super(name);
    this._usesLitter = usesLitter;
  }
 
  get usesLitter() {
    return this._usesLitter;
  }
}
```

In the example above, we create a `usesLitter` getter in the `Cat` class that returns the value saved to `_usesLitter`.

Compare the `Cat` class above to the one we created without inheritance:

```javascript
class Cat {
  constructor(name, usesLitter) {
    this._name = name;
    this._usesLitter = usesLitter;
    this._behavior = 0;
  }
 
  get name() {
    return this._name;
  }
 
  get usesLitter() {
    return this._usesLitter;
  }
 
  get behavior() {
    return this._behavior;
  }   
 
  incrementBehavior() {
    this._behavior++;
  }
}
```

We decreased the number of lines required to create the `Cat` class by about half. Yes, it did require an extra class (`Animal`), making the reduction in the size of our `Cat` class seem moot. However, the benefits (time saved, readability, efficiency) of inheritance grow as the number and size of your subclasses increase. 

One benefit is that when you need to change a method or property that multiple classes share, you can change the parent class, instead of each subclass. 

Before we move past inheritance, take a moment to see how we would create an additional subclass, called `Dog`. 

```javascript
class Dog extends Animal {
  constructor(name) {
    super(name);
  }
}
```

This `Dog` class has access to the same properties, getters, setters, and methods as the `Dog` class we made without inheritance, and is a quarter the size.

Now that we’ve abstracted animal daycare features, it’s easy to see how you can extend `Animal` to support other classes, like `Rabbit`, `Bird` or even `Snake`.



###12 Static Methods

Sometimes you will want a class to have methods that aren’t available in individual instances, but that you can call directly from the class. 

Take the `Date` class, for example — you can both create `Date` instances to represent whatever date you want, and call *static* methods, like `Date.now()` which returns the current date, directly from the class. The `.now()` method is static, so you can call it directly from the class, but not from an instance of the class. 

Let’s see how to use the `static` keyword to create a static method called `generateName` method in our `Animal` class:

```javascript
class Animal {
  constructor(name) {
    this._name = name;
    this._behavior = 0;
  }
 
  static generateName() {
    const names = ['Angel', 'Spike', 'Buffy', 'Willow', 'Tara'];
    const randomNumber = Math.floor(Math.random()*5);
    return names[randomNumber];
  }
} 
```

In the example above, we create a `static` method called `.generateName()` that returns a random name when it’s called. Because of the `static` keyword, we can only access `.generateName()` by appending it to the `Animal` class.

We call the `.generateName()` method with the following syntax:

```javascript
console.log(Animal.generateName()); // returns a name
```

You cannot access the `.generateName()` method from instances of the `Animal` class or instances of its subclasses (See below).

```javascript
const tyson = new Animal('Tyson'); 
tyson.generateName(); // TypeError
```

The example above will result in an error, because you cannot call static methods (`.generateName()`) on an instance (`tyson`).



## 10 DOM

The Document Object Model

**Get elements by their tag name**

```js
const listItems = document.getElementsByTagName('li');
```

```js
listItems[0];
<< <li class='hero'>Superman</li>

listItems[1];
<< <li class='vigilante hero' id='bats'>Batman</li>

listItems[2];
<< <li class='hero'>Wonder Woman</li>
```

**Summary**

- The Document Object Model is a way of representing a page of HTML as a tree of nodes.
- The `document.getElementById()`, `document.getElementsByClassName()`, `document.getElementsByTagNames()` and `document.querySelector()` can be used to access elements on a page.
- The `parentNode()`, `previousSibling()`, `nextSibling()`, `childNodes()` and `children()` methods can be used to navigate around the DOM tree.
- An element’s attributes can be accessed using the `getAttribute()` method, and updated using the `setAttribute()` method.
- The `createElement()` and `createTextNode()` methods can be used to create dynamic markup on the fly.
- Markup can be added to the page using the `appendChild()` and `insertBefore()` methods.
- Elements can be replaced using the `replaceChild()` method, and removed using the `removeChild()` method.
- The `innerHTML` property can be used to insert raw HTML directly into the DOM.
- The CSS properties of an element can be changed by accessing the `style` property.



## 11 Form

### 1 Radio Button Input Fields

Allow to check an option as true.

```html
<input type='radio' name='type' value='Villain' checked>
```

```js
input.checked = true;
```



## 11 Modules

### 1 module.exports

We can get started with modules by defining a module in one file and making the module available for use in another file with Node.js `module.exports` syntax. Every JavaScript file run in Node has a local `module` object with an `exports` property used to define what should be exported from the file.

Below is an example of how to define a module and how to export it using the statement `module.exports`.

In **menu.js** we write:

```javascript
let Menu = {};
Menu.specialty = "Roasted Beet Burger with Mint Sauce";
 
module.exports = Menu; 
```

Let’s consider what this code means. 

1. `let Menu = {};` creates the object that represents the module `Menu`. The statement contains an uppercase variable named `Menu`which is set equal to an empty object. 
2. `Menu.specialty` is defined as a property of the `Menu` module. We add data to the `Menu` object by setting properties on that object and giving the properties a value.
3. `"Roasted Beet Burger with Mint Sauce";` is the value stored in the `Menu.specialty` property. 
4. `module.exports = Menu;` exports the `Menu` object as a module. `module` is a variable that represents the module, and `exports` exposes the module as an object.

The pattern we use to export modules is thus: 

1. Create an object to represent the module. 
2. Add properties or methods to the module object.
3. Export the module with `module.exports`.

Let’s create our first module.



### 2 require()

To make use of the exported module and the behavior we define within it, we import the module into another file. In Node.js, use the `require()` function to import modules.

For instance, say we want the module to control the menu’s data and behavior, and we want a separate file to handle placing an order. We would create a separate file **order.js** and import the `Menu` module from **menu.js** to **order.js** using `require()`. `require()`takes a file path argument pointing to the original module file.

In **order.js** we would write:

```javascript
const Menu = require('./menu.js');
 
function placeOrder() {
  console.log('My order is: ' + Menu.specialty);
}
 
placeOrder();
```

We now have the entire behavior of `Menu` available in **order.js**. Here, we notice:

1. In **order.js** we import the module by creating a `const` variable called `Menu` and setting it equal to the value of the `require()` function. We can set the name of this variable to anything we like, such as `menuItems`. 
2. `require()` is a JavaScript function that loads a module. It’s argument is the file path of the module: `./menu.js`. With `require()`, the `.js`extension is optional and will be assumed if it is not included.
3. The `placeOrder()` function then uses the `Menu`module. By calling `Menu.specialty`, we access the property `specialty` defined in the `Menu` module. 

Taking a closer look, the pattern to import a module is:

1. Import the module with `require()` and assign it to a local variable.
2. Use the module and its properties within a program.



### 3 module.exports II

We can also wrap any collection of data and functions in an object, and export the object using `module.exports`. In **menu.js**, we could write:

```javascript
module.exports = {
  specialty: "Roasted Beet Burger with Mint Sauce",
  getSpecialty: function() {
    return this.specialty;
  } 
}; 
```

In the above code, notice:

1. `module.exports` exposes the current module as an object. 
2. `specialty` and `getSpecialty` are properties on the object.

Then in **order.js**, we write:

```javascript
const Menu = require('./menu.js');
 
console.log(Menu.getSpecialty());
```

Here we can still access the behavior in the `Menu`module.



###4 export default

Node.js supports `require()`/`module.exports`, but as of ES6, JavaScript supports a new more readable and flexible syntax for exporting modules. These are usually broken down into one of two techniques, *default export* and *named exports*. 

We’ll begin with the first syntax, default export. The default export syntax works similarly to the `module.exports` syntax, allowing us to export one module per file. 

Let’s look at an example in **menu.js**. 

```javascript
let Menu = {};
 
export default Menu;
```

1. `export default` uses the JavaScript `export`statement to export JavaScript objects, functions, and primitive data types. 
2. `Menu` refers to the name of the `Menu` object, the object that we are setting the properties on within our modules.

When using ES6 syntax, we use `export default` in place of `module.exports`. Node.js doesn’t support `export default` by default, so `module.exports` is usually used for Node.js development and ES6 syntax is used for front-end development. As with most ES6 features, it is common to transpile code since ES6 is [not supported by all browsers](https://caniuse.com/#feat=es6).



### 5 import

ES6 module syntax also introduces the `import`keyword for importing objects. In our **order.js**example, we import an object like this:

```javascript
import Menu from './menu';
```

1. The `import` keyword begins the statement.
2. The keyword `Menu` here specifies the name of the variable to store the default export in.
3. `from` specifies where to load the module from. 
4. `'./menu'` is the name of the module to load. When dealing with local files, it specifically refers to the name of the file without the extension of the file.

We can then continue using the `Menu` module in the **order.js** file.



###6 Named Exports

ES6 introduced a second common approach to export modules. In addition to `export default`, *named exports* allow us to export data through the use of variables.

Let’s see how this works. In **menu.js** we would be sure to give each piece of data a distinct variable name:

```javascript
let specialty = '';
function isVegetarian() {
}; 
function isLowSodium() {
}; 
 
export { specialty, isVegetarian };
```

1. Notice that, when we use named exports, we are not setting the properties on an object. Each export is stored in its own variable.
2. `specialty` is a string object, while `isVegetarian`and `isLowSodium` are objects in the form of functions. Recall that in JavaScript, every function is in fact a function object. 
3. `export { specialty, isVegetarian };` exports objects by their variable names. Notice the keyword `export` is the prefix. 
4. `specialty` and `isVegetarian` are exported, while `isLowSodium` is not exported, since it is not specified in the export syntax.



###7 Named Imports

To import objects stored in a variable, we use the `import` keyword and include the variables in a set of `{}`.

In the **order.js** file, for example, we would write:

```javascript
import { specialty, isVegetarian } from './menu';
 
console.log(specialty);
```

1. Here `specialty` and `isVegetarian` are imported.
2. If we did not want to import either of these variables, we could omit them from the `import`statement.
3. We can then use these objects as in within our code. For example, we would use `specialty`instead of `Menu.specialty`.



###8 Export Named Exports

Named exports are also distinct in that they can be exported as soon as they are declared, by placing the keyword `export` in front of variable declarations. 

In **menu.js**

```javascript
export let specialty = '';
export function isVegetarian() {
}; 
function isLowSodium() {
}; 
```

1. The `export` keyword allows us to export objects upon declaration, as shown in `export let specialty` and `export function isVegetarian() {}`. 
2. We no longer need an `export` statement at the bottom of our file, since this behavior is handled above.



###9 Import Named Imports

To import variables that are declared, we simply use the original syntax that describes the variable name. In other words, exporting upon declaration does not have an impact on how we import the variables. 

```javascript
import { specialty, isVegetarian } from 'menu';
```



###10 Export as

Named exports also conveniently offer a way to change the name of variables when we export or import them. We can do this with the `as` keyword. 

Let’s see how this works. In our **menu.js** example

```javascript
let specialty = '';
let isVegetarian = function() {
}; 
let isLowSodium = function() {
}; 
 
export { specialty as chefsSpecial, isVegetarian as isVeg, isLowSodium };
```

In the above example, take a look at the `export`statement at the bottom of the file.

1. The `as` keyword allows us to give a variable name an alias as demonstrated in `specialty as chefsSpecial` and `isVegetarian as isVeg`. 
2. Since we did not give `isLowSodium` an alias, it will maintain its original name.



###11 Import as

To import named export aliases with the `as` keyword, we add the aliased variable in our import statement. 

```javascript
import { chefsSpecial, isVeg } from './menu';
```

In **orders.js**

1. We import `chefsSpecial` and `isVeg` from the `Menu` object. 
2. Here, note that we have an option to alias an object that was not previously aliased when exported. For example, the `isLowSodium` object that we exported could be aliased with the `as`keyword when imported: `import {isLowSodium as saltFree} from 'Menu';`

Another way of using aliases is to import the entire module as an alias:

```javascript
import * as Carte from './menu';
 
Carte.chefsSpecial;
Carte.isVeg();
Carte.isLowSodium(); 
```

1. This allows us to import an entire module from **menu.js** as an alias `Carte`. 
2. In this example, whatever name we exported would be available to us as properties of that module. For example, if we exported the aliases `chefsSpecial` and `isVeg`, these would be available to us. If we did not give an alias to `isLowSodium`, we would call it as defined on the `Carte` module.



### 12 Combining Export Statements

We can also use named exports and default exports together. In **menu.js**:

```javascript
let specialty = '';
function isVegetarian() {
}; 
function isLowSodium() {
}; 
function isGlutenFree() {
};
 
export { specialty as chefsSpecial, isVegetarian as isVeg };
export default isGlutenFree;
```

Here we use the keyword `export` to export the named exports at the bottom of the file. Meanwhile, we export the `isGlutenFree` variable using the `export default` syntax.

This would also work if we exported most of the variables as declared and exported others with the `export default` syntax. 

```javascript
export let Menu = {};
 
export let specialty = '';
export let isVegetarian = function() {
}; 
export let isLowSodium = function() {
}; 
let isGlutenFree = function() {
};
 
export default isGlutenFree;
```

Here we use the `export` keyword to export the variables upon declaration, and again export the `isGlutenFree` variable using the `export default syntax`

While it’s better to avoid combining two methods of exporting, it is useful on occasion. For example, if you suspect developers may only be interested in importing a specific function and won’t need to import the entire default export.

###13 Combining Import Statements

We can import the collection of objects and functions with the same data. 

We can use an `import` keyword to import both types of variables as such:

```javascript
import { specialty, isVegetarian, isLowSodium } from './menu';
 
import GlutenFree from './menu';
```





## 12 Promises

###1 Constructing a Promise Object

Let’s construct a promise! To create a new `Promise`object, we use the `new` keyword and the `Promise`constructor method:

```javascript
const executorFunction = (resolve, reject) => { };
const myFirstPromise = new Promise(executorFunction);
```

The `Promise` constructor method takes a function parameter called the *executor function* which runs automatically when the constructor is called. ==The executor function generally starts an asynchronous operation and dictates how the promise should be settled.==

The executor function has two function parameters, usually referred to as the `resolve()` and `reject()`functions. The `resolve()` and `reject()` functions aren’t defined by the programmer. When the `Promise`constructor runs, JavaScript will pass **its own**`resolve()` and `reject()` functions into the executor function.

- `resolve` is a function with one argument. Under the hood, if invoked, `resolve()` will change the promise’s status from `pending` to `fulfilled`, and the promise’s resolved value will be set to the argument passed into `resolve()`.
- `reject` is a function that takes a reason or error as an argument. Under the hood, if invoked, `reject()` will change the promise’s status from `pending` to `rejected`, and the promise’s rejection reason will be set to the argument passed into `reject()`.

Let’s look at an example executor function in a `Promise` constructor:

```javascript
const executorFunction = (resolve, reject) => {
  if (someCondition) {
      resolve('I resolved!');
  } else {
      reject('I rejected!'); 
  }
}
const myFirstPromise = new Promise(executorFunction);
```

Let’s break down what’s happening above:

- We declare a variable `myFirstPromise`
- `myFirstPromise` is constructed using `new Promise()` which is the `Promise` constructor method.
- `executorFunction()` is passed to the constructor and has two functions as parameters: `resolve` and `reject`. 
- If `someCondition` evaluates to `true`, we invoke `resolve()` with the string `'I resolved!'`
- If not, we invoke `reject()` with the string `'I rejected!'`

In our example, `myFirstPromise` resolves or rejects based on a simple condition, but, in practice, promises settle based on the results of asynchronous operations. For example, a database request may fulfill with the data from a query or reject with an error thrown. In this exercise, we’ll construct promises which resolve synchronously to more easily understand how they work.



###2 The Node setTimeout() Function

Knowing how to construct a promise is useful, but most of the time, knowing how to *consume*, or use, promises will be key. Rather than constructing promises, you’ll be handling `Promise` objects returned to you as the result of an asynchronous operation. These promises will start off pending but settle eventually.

Moving forward, we’ll be simulating this by providing you with functions that return promises which settle after some time. To accomplish this, we’ll be using `setTimeout()`. `setTimeout()` is a Node API (a comparable API is provided by web browsers) that uses callback functions to schedule tasks to be performed after a delay. `setTimeout()` has two parameters: a callback function and a delay in milliseconds. 

```javascript
const delayedHello = () => {
  console.log('Hi! This is an asynchronous greeting!');
};
 
setTimeout(delayedHello, 2000);
```

Here, we invoke `setTimeout()` with the callback function `delayedHello()` and `2000`. In at least two seconds `delayedHello()` will be invoked. But why is it “at least” two seconds and not exactly two seconds? 

This delay is performed asynchronously—the rest of our program won’t stop executing during the delay. Asynchronous JavaScript uses something called *the event-loop*. After two seconds, `delayedHello()` is added to a line of code waiting to be run. Before it can run, any synchronous code from the program will run. Next, any code in front of it in the line will run. This means it might be more than two seconds before `delayedHello()` is actually executed. 

Let’s look at how we’ll be using `setTimeout()` to construct asynchronous promises:

```javascript
const returnPromiseFunction = () => {
  return new Promise((resolve, reject) => {
    setTimeout(( ) => {resolve('I resolved!')}, 1000);
  });
};
 
const prom = returnPromiseFunction();
```

In the example code, we invoked `returnPromiseFunction()` which returned a promise. We assigned that promise to the variable `prom`. Similar to the asynchronous promises you may encounter in production, `prom` will initially have a status of pending.

Let’s explore `setTimeout()` a bit more.



##13 Async-await



##14 Requests

### 1 XHR GET Requests I

Asynchronous JavaScript and XML (AJAX), enables requests to be made after the initial page load. Initially, AJAX was used only for XML formatted data, now it can be used to make requests that have many different formats. 

[MDN Documentation: Extensible Markup Language (XML)](https://developer.mozilla.org/en-US/docs/XML_introduction). 

Similarly, the XMLHttpRequest (XHR) API, named for XML, can be used to make many kinds of requests and supports other forms of data. 

Remember, we use GET to retrieve data from a source. Take a look at the boilerplate code in the diagram to see how to make an XHR GET request.

We’ll construct this template from scratch in a different exercise and walk through what each step does.

<img src="https://tva1.sinaimg.cn/large/008eGmZEgy1go2uba1s7jj311b0u0jvs.jpg" alt="image-20210227232029416" style="zoom: 50%;" />



### 2 XHR POST Requests I

Reminder: If you haven’t already signed up for an API Key from Rebrandly, please read this Rebrandly sign up guide.

- [Codecademy Articles: Rebrandly URL Shortener API](https://www.codecademy.com/articles/rebrandly-signup) .

Great! By this point, you’ve signed up for an API key and you know the essence of making a GET request. 

The major difference between a GET request and POST request is that a POST request requires additional information to be sent through the request. This additional information is sent in the *body* of the post request. 

Review the code from the diagram to construct your own POST request in the next lesson.

<img src="https://tva1.sinaimg.cn/large/008eGmZEgy1go2ujwax8qj312z0u0q7y.jpg" alt="image-20210227232847532" style="zoom:50%;" />

```javascript
  var x = document.getElementById('queryInput');
  var queryResult = document.getElementById('queryResult');

  const xhr = new XMLHttpRequest();
  const url = 'http://127.0.0.1:8080/sqlTools/api/query';
  const data = JSON.stringify({sqlCommand: x.value});

  
  xhr.responseType = 'json';

  xhr.onload = () =>{
    if(xhr.readyState == XMLHttpRequest.DONE){
      console.log(xhr.response);
      var obj = JSON.parse(xhr.response);
      console.log(xhr.response.get('data'));
      var val = "";
      res1 = JSON.parse();
      // res = xhr.response.json().get('data');
      // status = res.get('conmmandStatus');
      // affectedRow = res.get('affectedRowNum');
      // time = res.get('measuredTime');
      // console.log(res);
      // console.log(affectedRow);
      // console.log(time);
    }
  } 
  try{
    xhr.open('POST', url);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(data);
  } catch(e) {
    console.log(e);
    alert(e);
    
}
```

### 3 fetch() GET Requests I

The first type of requests we’re going to tackle are GET requests using `fetch()`

- [MDN: Fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API). 

The `fetch()` function:

- Creates a request object that contains relevant information that an API needs.
- Sends that request object to the API endpoint provided.
- Returns a promise that ultimately resolves to a response object, which contains the status of the promise with information the API sent back.

In the next exercise we’ll go over the boilerplate code for using `fetch()` and walk through what each step does!

<img src="/Users/yuanjinshuai/Library/Application Support/typora-user-images/image-20210227233043757.png" alt="image-20210227233043757" style="zoom: 33%;" />

### 4 fetch() POST Requests I

In the previous exercise, you successfully wrote a GET request using the fetch API and handled Promises to get word suggestions from Datamuse. Give yourself a pat on the back (or two to treat yourself)! 

Now, you’re going to learn how to use `fetch()` to construct POST requests! 

Take a look at the diagram to the right. It has the boilerplate code for a POST request using `fetch()`. 

Notice that the initial call takes two arguments: an endpoint and an object that contains information needed for the POST request. The rest of the request is identical to the GET request.

<img src="/Users/yuanjinshuai/Library/Application Support/typora-user-images/image-20210228095700187.png" alt="image-20210228095700187" style="zoom:50%;" />



```
  fetch('http://127.0.0.1:8080/sqlTools/api/query,{
    method:'POST',
    body: JSON.stringify({sqlCommand: x.value})
    })
    .then(response => response.json())
    .then(data => console.log(data));
    
```



### 5 async GET Requests I

Let’s take a minute to appreciate what you’ve accomplished so far: 

- used `fetch()` to make GET and POST requests.
- check the status of the responses coming back
- catch errors that might possibly arise
- taking successful responses and rendering it on the webpage 

That is fantastic! It’s the basis of how the internet works! 

In the following exercises, we’re going to take what you’ve learned about chaining Promises and make it simpler using functionality introduced in ES8: `async`and `await`. You read that right, you did the hard part already, now it’s time to make it easier. 

The structure for this request will also be slightly different. Notice the new keywords `async` and `await`, as well as the `try` and `catch` statements. 

We’ll be going over how to write the boilerplate code for `async` GET requests in the next lesson.

<img src="/Users/yuanjinshuai/Library/Application Support/typora-user-images/image-20210228101744190.png" alt="image-20210228101744190" style="zoom: 50%;" />



### 6 async POST Requests I

Now that you’ve made an `async` GET request, let’s start on getting you familiar the `async` POST request. 

As with the other GET and POST requests that you’ve been making, an `async` POST request requires more information. Take a look at the diagram.

We still have the same structure of using `try` and `catch` as before. But, in the `fetch()` call, we now have to include an additional argument that contains more information like `method` and `body`. 

We’ll be explaining the why’s and how’s of the boilerplate code for `async` POST requests in the next lesson.

<img src="/Users/yuanjinshuai/Library/Application Support/typora-user-images/image-20210228102912306.png" alt="image-20210228102912306" style="zoom:50%;" />















