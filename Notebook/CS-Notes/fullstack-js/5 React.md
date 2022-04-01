# React

React is a declarative, efficient, and flexible JavaScript library for building user interfaces. It lets you compose complex UIs from small and isolated pieces of code called “components”.

**The Virtual DOM**

In React, for every [DOM object](http://eloquentjavascript.net/13_dom.html), there is a corresponding “virtual DOM object.” A virtual DOM object is a *representation* of a DOM object, like a lightweight copy.

## 1 INTRO TO JSX

**1 Why React?**

React.js is a JavaScript library. It was developed by engineers at Facebook.

Here are just a few of the reasons why people choose to program with React:

- React is *fast*. Apps made in React can handle complex updates and still feel quick and responsive. 
- React is *modular*. Instead of writing large, dense files of code, you can write many smaller, reusable files. React’s modularity can be a beautiful solution to JavaScript’s [maintainability problems](https://en.wikipedia.org/wiki/Spaghetti_code).
- React is *scalable*. Large programs that display a lot of changing data are where React performs best.
- React is *flexible*. You can use React for interesting projects that have nothing to do with making a web app. People are still figuring out React’s potential. [There’s room to explore.](https://medium.mybridge.co/22-amazing-open-source-react-projects-cb8230ec719f#.o5umedb6v)
- React is *popular*. While this reason has admittedly little to do with React’s quality, the truth is that understanding React will make you more employable.



**2 Hello World**

Take a look at the following line of code:

```javascript
const h1 = <h1>Hello world</h1>;
```

What kind of weird hybrid code is that? Is it JavaScript? HTML? Or something else?

It seems like it must be JavaScript, since it starts with `const` and ends with `;`. If you tried to run that in an HTML file, it wouldn’t work.

However, the code also contains `<h1>Hello world</h1>`, which looks exactly like HTML. *That* part wouldn’t work if you tried to run it in a JavaScript file. 

The part that looks like HTML, `<h1>Hello world</h1>`, is something called *JSX*.



**3 What is JSX?**

*JSX* is a syntax extension for JavaScript. It was written to be used with React. JSX code looks a lot like HTML.

What does “syntax extension” mean?

In this case, it means that JSX is not valid JavaScript. Web browsers can’t read it!

If a JavaScript file contains JSX code, then that file will have to be *compiled*. That means that before the file reaches a web browser, a *JSX compiler* will translate any JSX into regular JavaScript. 

Codecademy’s servers already have a JSX compiler installed, so you don’t have to worry about that for now. Eventually we’ll walk through how to set up a JSX compiler on your personal computer.



**4 JSX Elements**

A basic unit of JSX is called a JSX *element*.

Here’s an example of a JSX element:

```javascript
<h1>Hello world</h1>
```

This JSX element looks exactly like HTML! The only noticeable difference is that you would find it in a JavaScript file, instead of in an HTML file.



**5 JSX Elements And Their Surroundings**

JSX elements are treated as JavaScript *expressions*. They can go anywhere that JavaScript expressions can go. 

That means that a JSX element can be saved in a variable, passed to a function, stored in an object or array…you name it.

Here’s an example of a JSX element being saved in a variable:

```javascript
const navBar = <nav>I am a nav bar</nav>;
```

Here’s an example of several JSX elements being stored in an ==object==:

```javascript
const myTeam = {
  center: <li>Benzo Walli</li>,
  powerForward: <li>Rasha Loa</li>,
  smallForward: <li>Tayshaun Dasmoto</li>,
  shootingGuard: <li>Colmar Cumberbatch</li>,
  pointGuard: <li>Femi Billon</li>
};
```



**6 Attributes In JSX**

JSX elements can have *attributes*, just like HTML elements can.

A JSX attribute is written using HTML-like syntax: a *name*, followed by an equals sign, followed by a *value*. The *value* should be wrapped in quotes, like this:

```javascript
my-attribute-name="my-attribute-value"
```

Here are some JSX elements with *attributes:*

```javascript
<a href='http://www.example.com'>Welcome to the Web</a>;
 
const title = <h1 id='title'>Introduction to React.js: Part I</h1>; 
```

A single JSX element can have many attributes, just like in HTML:

```javascript
const panda = <img src='images/panda.jpg' alt='panda' width='500px' height='500px' />;
```



**7 Nested JSX**

You can *nest* JSX elements inside of other JSX elements, just like in HTML.

Here’s an example of a JSX `<h1>` element, *nested*inside of a JSX `<a>` element:

```javascript
<a href="https://www.example.com"><h1>Click me!</h1></a>
```

To make this more readable, you can use HTML-style line breaks and indentation:

```javascript
<a href="https://www.example.com">
  <h1>
    Click me!
  </h1>
</a>
```

If a JSX expression takes up more than one line, then you must wrap the multi-line JSX expression in parentheses. This looks strange at first, but you get used to it:

```javascript
(
  <a href="https://www.example.com">
    <h1>
      Click me!
    </h1>
  </a>
)
```

*Nested* JSX expressions can be saved as variables, passed to functions, etc., just like non-nested JSX expressions can! Here’s an example of a *nested* JSX expression being saved as a variable: 

```javascript
 const theExample = (
   <a href="https://www.example.com">
     <h1>
       Click me!
     </h1>
   </a>
 );
```



**8 JSX Outer Elements**

There’s a rule that we haven’t mentioned: a JSX expression must have exactly *one* outermost element.

In other words, this code will work:

```javascript
const paragraphs = (
  <div id="i-am-the-outermost-element">
    <p>I am a paragraph.</p>
    <p>I, too, am a paragraph.</p>
  </div>
);
```

But this code will not work:

```javascript
const paragraphs = (
  <p>I am a paragraph.</p> 
  <p>I, too, am a paragraph.</p>
);
```

The *first opening tag* and the *final closing tag* of a JSX expression must belong to the same JSX element!

It’s easy to forget about this rule, and end up with errors that are tough to diagnose.

If you notice that a JSX expression has multiple outer elements, the solution is usually simple: wrap the JSX expression in a `<div></div>`.



**9 Rendering JSX**

You’ve learned how to write JSX elements! Now it’s time to learn how to *render* them. 

To *render* a JSX expression means to make it appear onscreen.



**10 ReactDOM.render() I**

Let’s examine the code that you just wrote. Start in **previous.js**, on line 5, all the way to the left.

You can see something called `ReactDOM`. What’s that?

`ReactDOM` is the name of a JavaScript library. This library contains several React-specific methods, all of which deal with [the DOM](http://www.w3schools.com/js/js_htmldom.asp) in some way or another.

We’ll talk more later about how `ReactDOM` got into your file. For now, just understand that it’s yours to use.

Move slightly to the right, and you can see one of `ReactDOM`‘s methods: `ReactDOM.render()`. 

`ReactDOM.render()` is the most common way to *render*JSX. It takes a JSX expression, creates a corresponding tree of DOM nodes, and adds that tree to the DOM. ==That is the way to make a JSX expression appear onscreen.==

Move to the right a little more, and you come to this expression: 

```html
<h1>Hello world</h1>
```

This is the first *argument* being passed to `ReactDOM.render()`. `ReactDOM.render()`‘s first argument should be a JSX expression, and it will be rendered to the screen.

We’ll discuss the second argument in the next exercise!



**11ReactDOM.render() II**

Move to the right a little more, and you will see this expression:

```javascript
document.getElementById('app')
```

You just learned that `ReactDOM.render()` makes its *first*argument appear onscreen. But *where* on the screen should that first argument appear?

The first argument is *appended* to whatever element is selected by the *second* argument.

In the code editor, select **index.html**. See if you can find an element that would be selected by `document.getElementById('app')`.

That element acted as a *container* for `ReactDOM.render()`‘s first argument! At the end of the previous exercise, this appeared on the screen: 

```html
<main id="app">
  <h1>Render me!</h1>
</main>
```



**12 Passing a Variable to ReactDOM.render()**

`ReactDOM.render()`‘s first argument should *evaluate* to a JSX expression, it doesn’t have to literally *be* a JSX expression. 

The first argument could also be a variable, so long as that variable evaluates to a JSX expression.

In this example, we save a JSX expression as a *variable*named `toDoList`. We then pass `toDoList` as the first argument to `ReactDOM.render()`:

```javascript
const toDoList = (
  <ol>
    <li>Learn React</li>
    <li>Become a Developer</li>
  </ol>
);
 
ReactDOM.render(
  toDoList, 
  document.getElementById('app')
);
```



## 2 ADVANCE JSX

###1 class vs className

This lesson will cover more advanced JSX. You’ll learn some powerful tricks, and some common errors to avoid.

Grammar in JSX is mostly the same as in HTML, but there are subtle differences to watch out for. Probably the most frequent of these involves the word `class`.

In HTML, it’s common to use `class` as an attribute name:

```html
<h1 class="big">Hey</h1>
```

In JSX, you can’t use the word `class`! You have to use `className` instead:

```html
<h1 className="big">Hey</h1>
```

This is because JSX gets translated into JavaScript, and `class` is a reserved word in JavaScript.

When JSX is *rendered*, JSX `className` attributes are automatically rendered as `class` attributes.



### 2  Self-Closing Tags

Another JSX ‘gotcha’ involves *self-closing tags*.

What’s a self-closing tag?

Most HTML elements use two tags: an *opening tag*(`<div>`), and a *closing tag* (`</div>`). However, some HTML elements such as `<img>` and `<input>` use only one tag. The tag that belongs to a single-tag element isn’t an opening tag nor a closing tag; it’s a *self-closing tag.*

When you write a self-closing tag in HTML, it is *optional* to include a forward-slash immediately before the final angle-bracket:

```html
Fine in HTML with a slash:
  <br />
 
Also fine, without the slash:
  <br>
```

But!

In JSX, you *have to* include the slash. If you write a self-closing tag in JSX and forget the slash, you will raise an error:

```html
Fine in JSX:
  <br />
 
NOT FINE AT ALL in JSX:
  <br>
```



###3 Curly Braces in JSX

The code in the last exercise didn’t behave as one might expect. Instead of adding 2 and 3, it printed out “2 + 3” as a string of text. Why?

This happened because `2 + 3` is located in between `<h1>` and `</h1>` tags.

Any code in between the tags of a JSX element will be read as JSX, not as regular JavaScript! JSX doesn’t add numbers - it reads them as text, just like HTML.

You need a way to write code that says, “Even though I am located in between JSX tags, treat me like ordinary JavaScript and not like JSX.”

You can do this by wrapping your code in *curly braces*.



###4 Variables in JSX

When you inject JavaScript into JSX, that JavaScript is part of the same environment as the rest of the JavaScript in your file.

That means that you can access variables while inside of a JSX expression, even if those variables were declared on the outside.

```javascript
// Declare a variable:
const name = 'Gerdo';
 
// Access your variable 
// from inside of a JSX expression:
const greeting = <p>Hello, {name}!</p>;
```



###5 Variable Attributes in JSX

When writing JSX, it’s common to use variables to set *attributes*.

Here’s an example of how that might work:

```javascript
// Use a variable to set the `height` and `width` attributes:
 
const sideLength = "200px";
 
const panda = (
  <img 
    src="images/panda.jpg" 
    alt="panda" 
    height={sideLength} 
    width={sideLength} />
);
```

Notice how in this example, the `<img />`‘s attributes each get their own line. This can make your code more readable if you have a lot of attributes on one element.

*Object properties* are also often used to set attributes: 

```javascript
const pics = {
  panda: "http://bit.ly/1Tqltv5",
  owl: "http://bit.ly/1XGtkM3",
  owlCat: "http://bit.ly/1Upbczi"
}; 
 
const panda = (
  <img 
    src={pics.panda} 
    alt="Lazy Panda" />
);
 
const owl = (
  <img 
    src={pics.owl} 
    alt="Unimpressed Owl" />
);
 
const owlCat = (
  <img 
    src={pics.owlCat} 
    alt="Ghastly Abomination" />
); 
```



###6 Event Listeners in JSX

JSX elements can have *event listeners*, just like HTML elements can. Programming in React means constantly working with event listeners.

You create an event listener by giving a JSX element a special *attribute*. Here’s an example:

```javascript
<img onClick={myFunc} />
```

An event listener attribute’s *name* should be something like `onClick` or `onMouseOver`: the word `on`, plus the type of event that you’re listening for. You can see a list of valid event names [here](http://facebook.github.io/react/docs/events.html#supported-events).

An event listener attribute’s *value* should be a function. The above example would only work if `myFunc` were a valid function that had been defined elsewhere:

```javascript
function myFunc() {
  alert('Make myFunc the pFunc... omg that was horrible i am so sorry');
}
 
<img onClick={myFunc} />
```

Note that in HTML, event listener *names* are written in all lowercase, such as `onclick` or `onmouseover`. In JSX, event listener names are written in camelCase, such as `onClick` or `onMouseOver`.



###7 JSX Conditionals: If Statements That Do Work

How can you write a *conditional*, if you can’t inject an `if` statement into JSX?

Well, one option is to write an `if` statement, and *not*inject it into JSX.

Look at **if.js**. Follow the `if` statement, all the way from line 6 down to line 18. 

**if.js** works, because the words `if` and `else` are *not*injected in between JSX tags. The `if` statement is on the outside, and no JavaScript injection is necessary.

This is a common way to express conditionals in JSX.



###8 JSX Conditionals: The Ternary Operator

There’s a more compact way to write conditionals in JSX: the *ternary operator*.

The ternary operator works the same way in React as it does in regular JavaScript. However, it shows up in React surprisingly often.

Recall how it works: you write `x ? y : z`, where x, y, and z are all JavaScript expressions. When your code is executed, `x` is evaluated as either “truthy” or “falsy.” If `x` is truthy, then the entire ternary operator returns `y`. If `x` is falsy, then the entire ternary operator returns `z`. [Here’s](http://stackoverflow.com/questions/6259982/how-to-use-the-ternary-operator-in-javascript) a nice explanation if you need a refresher.

Here’s how you might use the ternary operator in a JSX expression:

```javascript
const headline = (
  <h1>
    { age >= drinkingAge ? 'Buy Drink' : 'Do Teen Stuff' }
  </h1>
);
```

In the above example, if `age` is greater than or equal to `drinkingAge`, then `headline` will equal `<h1>Buy Drink</h1>`. Otherwise, `headline` will equal `<h1>Do Teen Stuff</h1>`.



###9 JSX Conditionals: &&

We’re going to cover one final way of writing conditionals in React: the `&&` operator.

Like the ternary operator, `&&` is not React-specific, but it shows up in React surprisingly often. 

In the last two lessons, you wrote statements that would sometimes render a kitty and other times render a doggy. `&&` would *not* have been the best choice for those lessons.

`&&` works best in conditionals that will sometimes do an action, but other times do *nothing at all*. 

Here’s an example: 

```javascript
const tasty = (
  <ul>
    <li>Applesauce</li>
    { !baby && <li>Pizza</li> }
    { age > 15 && <li>Brussels Sprouts</li> }
    { age > 20 && <li>Oysters</li> }
    { age > 25 && <li>Grappa</li> }
  </ul>
);
```

If the expression on the left of the `&&` evaluates as true, then the JSX on the right of the `&&` will be rendered. If the first expression is false, however, then the JSX to the right of the `&&` will be ignored and not rendered.

###10 .map in JSX

The array method `.map()` comes up often in React. It’s good to get in the habit of using it alongside JSX.

If you want to create a list of JSX elements, then `.map()` is often your best bet. It can look odd at first:

```javascript
const strings = ['Home', 'Shop', 'About Me'];
 
const listItems = strings.map(string => <li>{string}</li>);
 
<ul>{listItems}</ul>
```

In the above example, we start out with an array of strings. We call `.map()` on this array of strings, and the `.map()` call returns a new array of `<li>`s.

On the last line of the example, note that `{listItems}`will evaluate to an array, because it’s the returned value of `.map()`! JSX `<li>`s don’t have to be in an array like this, but they *can* be.

```javascript
// This is fine in JSX, not in an explicit array:
<ul>
  <li>item 1</li>
  <li>item 2</li>
  <li>item 3</li>
</ul>
 
// This is also fine!
const liArray = [
  <li>item 1</li>, 
  <li>item 2<li>, 
  <li>item 3</li>
];
 
<ul>{liArray}</ul>
```



###11 Keys

When you make a list in JSX, sometimes your list will need to include something called `keys`:

```html
<ul>
  <li key="li-01">Example1</li>
  <li key="li-02">Example2</li>
  <li key="li-03">Example3</li>
</ul>
```

A `key` is a JSX attribute. The attribute’s *name* is `key`. The attribute’s *value* should be something unique, similar to an `id` attribute.

`keys` don’t do anything that you can see! React uses them internally to keep track of lists. If you don’t use keys when you’re supposed to, React might accidentally scramble your list-items into the wrong order.

Not all lists need to have `keys`. A list needs `keys` if either of the following are true:

1. The list-items have *memory* from one render to the next. For instance, when a to-do list renders, each item must “remember” whether it was checked off. The items shouldn’t get amnesia when they render.
2. A list’s order might be shuffled. For instance, a list of search results might be shuffled from one render to the next.

If neither of these conditions are true, then you don’t have to worry about `keys`. If you aren’t sure then it never hurts to use them!

###12 React.createElement

You can write React code without using JSX at all!

The majority of React programmers do use JSX, and we will use it for the remainder of this tutorial, but you should understand that it is possible to write React code without it.

The following JSX expression:

```javascript
const h1 = <h1>Hello world</h1>;
```

can be rewritten without JSX, like this:

```javascript
const h1 = React.createElement(
  "h1",
  null,
  "Hello, world"
);
```

When a JSX element is compiled, the compiler *transforms* the JSX element into the method that you see above: `React.createElement()`. Every JSX element is secretly a call to `React.createElement()`.

We won’t go in-depth into how `React.createElement()` works, but you can start with the [documentation](http://facebook.github.io/react/docs/top-level-api.html#react.createelement) if you’d like to learn more!



## 3 YOUR FIRST REACT COMPONENT

```javascript
import React from 'react';
import ReactDOM from 'react-dom';

class MyComponentClass extends React.Component {
  render() {
    return <h1>Hello world</h1>;
  }
}

ReactDOM.render(
	<MyComponentClass />, 
	document.getElementById('app')
);
```



**1 Import ReactDOM**

Now take a look at the code on line 2:

```java
import ReactDOM from 'react-dom';
```

This line of code is very similar to line 1.

Lines 1 and 2 both import JavaScript objects. In both lines, the imported object contains React-related methods.

However, there is a difference!

The methods imported from `'react-dom'` are meant for interacting with the DOM. You are already familiar with one of them: `ReactDOM.render()`. 

The methods imported from `'react'` don’t deal with the DOM at all. They don’t engage directly with anything that isn’t part of React.

To clarify: the DOM is *used* in React applications, but it isn’t *part* of React. After all, the DOM is also used in countless non-React applications. Methods imported from `'react'` are only for pure React purposes, such as creating components or writing JSX elements.





## 4 Components and advanced JSX

Use Multiline JSX in a Component

In this lesson, you will learn some common ways that JSX and React components work together. You’ll get more comfortable with both JSX and components, while picking up some new tricks. 

Take a look at this HTML:

```javascript
<blockquote>
  <p>
    The world is full of objects, more or less interesting; I do not wish to add any more.
  </p>
  <cite>
    <a target="_blank"
      href="https://en.wikipedia.org/wiki/Douglas_Huebler">
      Douglas Huebler
    </a>
  </cite>
</blockquote>
```

How might you make a React component that renders this HTML?

Select **QuoteMaker.js** to see one way of doing it.

The key thing to notice in `QuoteMaker` is the parentheses in the `return` statement, on lines 6 and 18. Until now, your render function `return` statements have looked like this, without any parentheses:

```html
return <h1>Hello world</h1>;
```

However, a multi-line JSX expression should always be wrapped in parentheses! That is why `QuoteMaker`‘s return statement has parentheses around it.









### 1 props

The term “render *prop*” refers to a technique for sharing code between *React*components using a *prop* whose value is a function.

**1 Components Interact**

A React application can contain dozens, or even hundreds, of components.

Each component might be small and relatively unremarkable on its own. When combined, however, they can form enormous, fantastically complex ecosystems of information.

In other words, React apps are made out of components, but what makes React special isn’t components themselves. What makes React special is the ways in which components *interact*.

This unit is an introduction to *components interacting*.



**2 A Component in a Render Function**

Here is a `.render()` method that returns an HTML-like JSX element:

```javascript
class Example extends React.Component {
  render() {
    return <h1>Hello world</h1>;
  }
}
```

You’ve seen render methods return `<div></div>`s, `<p></p>`s, and `<h1></h1>`s, just like in the above example.

Render methods can also return another kind of JSX: *component instances.*

```javascript
class OMG extends React.Component {
  render() {
    return <h1>Whooaa!</h1>;
  }
}
 
class Crazy extends React.Component {
  render() {
    return <OMG />;
  }
}
```

In the above example, `Crazy`‘s render method `returns` an *instance* of the `OMG` component class. You could say that `Crazy` renders an `<OMG />`.

Apply a Component in a Render Function

This is new territory! You’ve never seen a component rendered by another component before.

You *have* seen a component rendered before, though, but not by another component. Instead, you’ve seen a component rendered by `ReactDOM.render()`.

When a component renders another component, what happens is very similar to what happens when `ReactDOM.render()` renders a component.



**3 Require A File**

When you use React.js, every JavaScript file in your application is invisible to every other JavaScript file by default. **ProfilePage.js** and **NavBar.js** can’t see each other.

This is a problem! 

On line 9, you just added an instance of the `NavBar`component class. But since you’re in **ProfilePage.js**, JavaScript has no idea what `NavBar` means.

If you want to use a variable that’s declared in a different file, such as `NavBar`, then you have to *import*the variable that you want. To import a variable, you can use an `import` statement:

```javascript
import { NavBar } from './NavBar.js';
```

We’ve used `import` before, but not like this! Notice the differences between the above line of code and this familiar line:

```javascript
import React from 'react';
```

The first important difference is the curly braces around `NavBar`. We’ll get to those soon!

The second important difference involves the contents of the string at the end of the statement: `'react'` vs `'./NavBar.js'`.

If you use an `import` statement, and the string at the end begins with either a dot or a slash, then `import`will treat that string as a *filepath*. `import` will follow that filepath, and import the file that it finds.

If your filepath doesn’t have a file extension, then “.js” is assumed. So the above example could be shortened:

```javascript
import { NavBar } from './NavBar';
```

**One final, important note:**
None of this behavior is specific to React! [Module systems](http://eloquentjavascript.net/10_modules.html) of independent, importable files are a very popular way to organize code. [React’s specific module system comes from ES6](https://hacks.mozilla.org/2015/08/es6-in-depth-modules/). More on all of that later.



**4 export**

Alright! You’ve learned how to use `import` to grab a variable from a file *other than* the file that is currently executing.

When you import a variable from a file that is not the current file, then an `import` statement isn’t quite enough. You also need an `export` statement, written in the *other* file, exporting the variable that you hope to grab. 

`export` comes from [ES6’s module system,](http://exploringjs.com/es6/ch_modules.html) just like `import` does. `export` and `import` are meant to be used together, and you rarely see one without the other.

There are a few different ways to use `export`. In this course, we will be using a style called “named exports.” Here’s how named exports works:

In one file, place the keyword `export` immediately before something that you want to export. That something can be any top-level `var`, `let`, `const`, `function`, or `class`:

```javascript
// Manifestos.js:
 
export const faveManifestos = {
  futurist: 'http://www.artype.de/Sammlung/pdf/russolo_noise.pdf',
  agile: 'https://agilemanifesto.org/iso/en/manifesto.html',
  cyborg:   'http://faculty.georgetown.edu/irvinem/theory/Haraway-CyborgManifesto-1.pdf'
};
```

You can export multiple things from the same file:

```javascript
// Manifestos.js:
 
export const faveManifestos = {
  futurist: 'http://www.artype.de/Sammlung/pdf/russolo_noise.pdf',
  agile:  'https://agilemanifesto.org/iso/en/manifesto.html',
  cyborg:   'http://faculty.georgetown.edu/irvinem/theory/Haraway-CyborgManifesto-1.pdf'
};
 
export const alsoRan = 'TimeCube';
```

In a different file, `import` the name of the `var`, `let`, `const`, `function`, or `class` from the first file:

```javascript
// App.js:
 
// Import faveManifestos and alsoRan from ./Manifestos.js:
import { faveManifestos, alsoRan } from './Manifestos';
 
// Use faveManifestos:
console.log(`A Cyborg Manifesto:  ${faveManifestos.cyborg}`); 
```

This style of importing and exporting in JavaScript is known as “named exports.” When you use named exports, you always need to wrap your imported names in curly braces, such as:

```javascript
import { faveManifestos, alsoRan } from './Manifestos';`
```

[JavaScript’s ES6 module system](http://exploringjs.com/es6/ch_modules.html) goes beyond named exports and has several advanced syntax features.



**5 Component Rendering In Action**

Now you’re ready for `<ProfilePage />` to render `<NavBar />`!

All that’s left to do is render `<ProfilePage />`.



### 2 THIS.STATE

**1 Setting Initial State**

A React component can access dynamic information in two ways: `props` and `state`.

Unlike `props`, a component’s `state` is *not* passed in from the outside. A component decides its own `state`. 

To make a component have `state`, give the component a `state` property. This property should be declared inside of a ==constructor== method, like this:

```javascript
class Example extends React.Component {
  constructor(props) {
    super(props);
    this.state = { mood: 'decent' };
  }
 
  render() {
    return <div></div>;
  }
}
 
<Example />
```

Whoa, a constructor method? `super(props)`? What’s going on here? Let’s look more closely at this potentially unfamiliar code:

```javascript
constructor(props) {
  super(props);
  this.state = { mood: 'decent' };
}
```

`this.state` should be equal to an object, like in the example above. This object represents the initial “state” of any component instance. We’ll explain that more soon!

How about the rest of the code? `constructor` and `super` are both features of ES6, not unique to React. There is nothing particularly React-y about their usage here. A full explanation of their functionality is outside of the scope of this course, but we’d recommend [familiarizing](https://hacks.mozilla.org/2015/07/es6-in-depth-classes/) [yourself](http://exploringjs.com/es6/ch_classes.html). It is important to note that React components *always* have to call `super` in their constructors to be set up properly.

Look at the bottom of the highest code example in this column. `<Example />` has a `state`, and its `state` is equal to `{ mood: 'decent' }`.



**2 Access a Component's state**

To *read* a component’s `state`, use the expression `this.state.name-of-property`: 

```javascript
class TodayImFeeling extends React.Component {
  constructor(props) {
    super(props);
    this.state = { mood: 'decent' };
  }
 
  render() {
    return (
      <h1>
        I'm feeling {this.state.mood}!
      </h1>
    );
  }
}
```

The above component class reads a property in its `state` from inside of its `render` function.

Just like `this.props`, you can use `this.state` from any property defined inside of a component class’s body.



##5 stateless components from stateful components



```javascript
import React from 'react'; // import the react.js libaray
import ReactDOM from 'react-dom';


class Parent extends React.Component { // declare a new component named Parent
  constructor(props) {
    super(props);
    this.state = { name: 'Frarthur' };
  }

  render() {
    return <div></div>;
  }
}
```





**1 One Sibling to Display, Another to Change**

One of the very first things that you learned about components is that they should only have one job.

In the last lesson, `Child` had two jobs:

1 - `Child` displayed a name.

2 - `Child` offered a way to *change* that name.

You should divide `Child` in two: one component for displaying the name, and a different component for allowing a user to *change* the name. 

In the code editor, select **Child.js**. Notice that these lines have vanished:

```html
<h1>
  Hey, my name is {this.props.name}! 
</h1>
```

The new version of `Child` renders a dropdown menu for *changing* the name, and *that’s it.*

Select **Sibling.js** in the code editor.

Read through the render function’s `return` statement.

*Here*, the name is displayed! Or at least it will be displayed, once you’ve done a little editing. 

That brings us to the essential new concept for this lesson: you will have one stateless component *display*information, and a different stateless component offer the ability to *change* that information.



**2 Pass the Right props to the Right Siblings**

Look at **Parent.js** in the code editor.

Three things have changed in this file since the last Lesson:

1. `Sibling` has been required on line 4.
2. A `<Sibling />` instance has been added to the render function on line 27.
3. `<Sibling />` and `<Child />` have been wrapped in a `<div></div>`, since JSX expressions must have only one outer element.



## 6 The Component Lifecycle

**1 The Component Lifecycle**

We’ve seen that React components can be highly dynamic. They get created, rendered, added to the DOM, updated, and removed. All of these steps are part of a component’s *lifecycle*.

The component lifecycle has three high-level parts:

1. *Mounting*, when the component is being initialized and put into the DOM for the first time
2. *Updating*, when the component updates as a result of changed state or changed props
3. *Unmounting*, when the component is being removed from the DOM

Every React component you’ve ever interacted with does the first step at a minimum. If a component never mounted, you’d never see it!

Most interesting components are *updated* at some point. A purely static component—like, for example, a logo—might not ever update. But if a component’s state changes, it updates. Or if different props are passed to a component, it updates.

Finally, a component is *unmounted* when it’s removed from the DOM. For example, if you have a button that hides a component, chances are that component will be unmounted. If your app has multiple screens, it’s likely that each screen (and all of its child components) will be unmounted. If a component is “alive” for the entire lifetime of your app (say, a top-level `<App />`component or a persistent navigation bar), it won’t be unmounted. But most components can get unmounted one way or another!

It’s worth noting that each component instance has its own lifecycle. For example, if you have 3 buttons on a page, then there are 3 component instances, each with its own lifecycle. However, once a component instance is unmounted, that’s it—it will never be re-mounted, or updated again, or unmounted.

![image-20210228191622174](https://tva1.sinaimg.cn/large/e6c9d24egy1go3svl2n5mj21cc0u0dlt.jpg)



clock.js

```javascript
import React from 'react';
import ReactDOM from 'react-dom';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = { date: new Date() };
  }
  render() {
    return <div>{this.state.date.toLocaleTimeString()}</div>;
  }
}

ReactDOM.render(<Clock />, document.getElementById('app'));
```



**2 componentDidMount**

We’ve made a clock component, but it’s static. Wouldn’t it be nice if it updated?

At a high level, we’d like to update `this.state.date`with a new date once per second.

JavaScript has a helpful function, [`setInterval()`](https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/setInterval), that will help us do just this. It lets us run a function on a set interval. In our case, we’ll make a function that updates `this.state.date`, and call it every second.

We’ll want to run some code that looks like this:

```javascript
// NOTE: This code doesn't clean itself up properly.
// We'll explore that in the next exercise.
const oneSecond = 1000;
setInterval(() => {
  this.setState({ date: new Date() });
}, oneSecond);
```

We have the code we want to run—that’s great. But where should we put this code? In other words, where in the component’s lifecycle should it go?

Remember, the component lifecycle has three high-level parts:

1. *Mounting*, when the component is being initialized and put into the DOM for the first time
2. *Updating*, when the component updates as a result of changed state or changed props
3. *Unmounting*, when the component is being removed from the DOM

It’s certainly not in the unmounting phase—we don’t want to start our interval when the clock disappears from the screen! It’s also probably not useful during the updating phase—we want the interval to start as soon as the clock appears, and we don’t want to wait for an update. It probably makes sense to stick this code somewhere in the mounting phase.

We’ve seen two functions: the `render()` and the constructor. Can we put this code in either of those places?

- `render()` isn’t a good candidate. For one, it executes during the mounting phase and the updating phase—too often for us. It’s also generally a bad idea to set up any kind of side-effect like this in `render()`, as it can create subtle bugs in the future.
- `constructor()` is also not great. It does only execute during the mounting phase, so that’s good, but you should generally avoid side-effects like this in constructors because it violates something called the Single Responsibility Principle. In short, it’s not a constructor’s responsibility to start side-effects. ([You can read more about the principle on Wikipedia.](https://en.wikipedia.org/wiki/Single-responsibility_principle))

If it’s not `render()` or the constructor, then where? Enter a new lifecycle method, `componentDidMount()`.

`componentDidMount()` is the final method called during the mounting phase. The order is:

1. The constructor
2. `render()`
3. `componentDidMount()`

In other words, it’s called after the component is rendered. This is where we’ll want to start our timer.

(Another method, [`getDerivedStateFromProps()`](https://reactjs.org/docs/react-component.html#static-getderivedstatefromprops), is called between the constructor and `render()`, but it is very rarely used and usually isn’t the best way to achieve your goals. We won’t be talking about it in this lesson.)



**3 componentWillUnmount**

Our clock is working, but it has an important problem. We never told the interval to stop, so it’ll keep running that function forever (or at least, until the user leaves/refreshes the page).

When the component is unmounted (in other words, removed from the page), that timer will keep on ticking, trying to update the state of a component that’s effectively gone. This means your users will have some JavaScript code running unnecessarily, which will hurt the performance of your app.

React will log a warning that looks something like this:

```
Warning: Can't perform a React state update on an unmounted component. This is a no-op, but it indicates a memory leak in your application. To fix, cancel all subscriptions and asynchronous tasks in the componentWillUnmount method.
```

Imagine if the clock gets mounted and unmounted hundreds of times—eventually, this will cause your page to become sluggish because of all of the unnecessary work. You’ll also see warnings in your browser console. Even worse, this can lead to subtle, annoying bugs.

All this bad stuff can happen if we fail to clean up a side-effect of a component. In our case this is a call to `setInterval()`, but components can have lots of other side-effects: loading external data with AJAX, doing manual tweaking of the DOM, setting a global value, and more. We try to limit our side-effects, but it’s difficult to build an interesting app with truly zero side-effects.

*In general, when a component produces a side-effect, you should remember to clean it up.*

JavaScript gives us the [`clearInterval()`](https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/clearInterval) function. `setInterval()` can return an ID, which you can then pass into `clearInterval()` to clear it. Here’s the code we’ll want to use:

```javascript
const oneSecond = 1000;
this.intervalID = setInterval(() => {
  this.setState({ date: new Date() });
}, oneSecond);
 
// Some time later...
clearInterval(this.intervalID);
```

At a high level, we want to continue to set up our `setInterval()` in `componentDidMount()`, but then we want to clear that interval when the clock is unmounted.

Let’s introduce a new lifecycle method: `componentWillUnmount()`. `componentWillUnmount()` is called in the unmounting phase, right before the component is completely destroyed. It’s a useful time to clean up any of your component’s mess.

In our case, we’ll use it to clean up the clock’s interval.



**4 componentDidUpdate**

Remember the three parts of a component’s lifecycle:

1. *Mounting*, when the component is being initialized and put into the DOM for the first time
2. *Updating*, when the component updates as a result of changed state or changed props
3. *Unmounting*, when the component is being removed from the DOM

We’ve looked at mounting (`constructor()`, `render()`, and `componentDidMount()`). We’ve looked at unmounting (`componentWillUnmount()`). Let’s finish by looking at the updating phase.

An update is caused by changes to props or state. You’ve already seen this happen a bunch of times. Every time you’ve called `setState()` with new data, you’ve triggered an update. Every time you change the props passed to a component, you’ve caused it to update.

When a component updates, it calls [several methods](https://reactjs.org/docs/react-component.html#updating), but only two are commonly used.

The first is `render()`, which we’ve seen in every React component. When a component’s props or state changes, `render()` is called.

The second, which we haven’t seen yet, is `componentDidUpdate()`. Just like `componentDidMount()`is a good place for mount-phase setup, `componentDidUpdate()` is a good place for update-phase work.





