# Building Interactive Websites with JavaScript

## 3 javascript and the dom

**1 The document keyword**

The *Document Object Model*, abbreviated DOM, is a powerful tree-like structure that organizes the elements on a web page and allows scripting languages to access them. This lesson will focus on some of the most useful methods and properties of the [DOM Interface](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model) in JavaScript. This interface is implemented by every modern browser.

First things first! ==The `document` object in JavaScript is the door to the DOM structure.== The `document` allows you to access the root node of the DOM tree. Before you can access a specific element in the page, first you must access the document structure itself. The `document` allows scripts to access children of the DOM as properties.

For example, if you wanted to access the `<body>` element in your script, you could access it as a property of the `document` by typing `document.body`. This property will return the body element of that DOM.

Similarly, you could access the `<title>` element with the `.title` property. See a [comprehensive list](https://developer.mozilla.org/en-US/docs/Web/API/Document) of all `document` properties.

<img src="https://tva1.sinaimg.cn/large/008eGmZEgy1go0dcg1lpzj317l0u0n0f.jpg" alt="image-20210225200207315" style="zoom: 33%;" />



**2 Tweak an Element**

When using the DOM in your script to access an HTML element, you also have access to all of that element’s properties.

This includes the ability to modify the contents of the element as well as its attributes and properties— that can range from modifying the text inside a `p` element to assigning a new background color to a `div`.

==You can access and set the contents of an element with the `.innerHTML` property.==

For example, the following code reassigns the inner HTML of the body element to the text ‘The cat loves the dog’:

```javascript
document.body.innerHTML = 'The cat loves the dog.';
```

The `.innerHTML` property can also add any valid HTML, including properly formatted elements. The following example assigns an `h2` element as a child inside the `<body>` element:

```javascript
document.body.innerHTML = '<h2>This is a heading</h2>'; 
```



**3 Select and Modify Elements**

In the previous exercise, we accessed the webpage elements with the `document` keyword!

What if we wanted to select a specific element? The DOM interface allows us to access a specific element with CSS selectors. *CSS selectors* define the elements to which a set of CSS rules apply, but we can also use these same selectors to access DOM elements with our script! Selectors can include the name of the tag, a class, or an ID.

The `.querySelector()` method allows us to specify a CSS selector and then returns the ==first== element that matches that selector. The following code would return the first paragraph in the document.

```javascript
document.querySelector('p');
```

You can also use other CSS selectors such as an element’s `.` class or its `#` ID.

Another option, if you want to access elements directly by their `id`, you can use the aptly named `.getElementByID()` function:

```javascript
document.getElementById('bio').innerHTML = 'The description';
```

The example chains so that it selects the element with an ID of ‘bio’ and set its `.innerHTML` to the text ‘The description’.



**4 Style an element**

Another way to modify an element is by changing its CSS style. The `.style` property of a DOM element provides access to the inline style of that HTML tag.

The syntax follows an `element.style.property` format, with the `property` representing a CSS property.

For example, the following code selects the first element with a `class` of `blue` and assigns blue as the `background-color`:

```javascript
let blueElement = document.querySelector('.blue');
blueElement.style.backgroundColor = 'blue';
```

Unlike CSS, the DOM style property does not implement a hyphen such as `background-color`, but rather camel case notation `backgroundColor`. Check out this [MDN reference page](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Properties_Reference) to see a list of how CSS properties are converted into JavaScript.

The following *chaining* syntax would also work:

```javascript
document.querySelector('.blue').style.fontFamily = 'Roboto';
```



**5 Create and Insert Elements**

Just as the DOM allows scripts to modify existing elements, it also allows for the creation of new ones.

The `.createElement(tagName)` method creates a new element based on the specified tag name passed into it as an argument. However, it does not append it to the document. It creates an empty element with no inner HTML.

In order to create an element and add it to the web page, you must assign it to be the child of an element that already exists on the DOM. We call this process appending. The `.appendChild()` method will add a child element as the last child node.

The following code creates a new paragraph element, gives it an `id`, adds text to the new element’s `.innerHTML`, and appends it to the body of the document:

```javascript
let paragraph = document.createElement('p');
 
paragraph.id = 'info'; 
 
paragraph.innerHTML = 'The text inside the paragraph';
 
document.body.appendChild(paragraph);
```

Unlike the `.innerHTML` property, the `.appendChild()` method does not replace the content inside of the parent, in this case `body`. Rather, ==it appends the element as the last child of that parent.==



**6 Remove an Element**

In addition to modifying or creating an element from scratch, the DOM also allows for the removal of an element. The `.removeChild()` method removes a specified child from a parent.

Because the `.querySelector()` method returns the first paragraph, the following code would remove the first paragraph in the document:

```javascript
let paragraph = document.querySelector('p');
document.body.removeChild(paragraph);
```

It’s possible to also specify a different parent with the `.querySelector()` method, as long as you remove an element nested within that parent element.

If you want to hide an element because it does not need to be loaded initially, the `.hidden` property allows you to hide it by assigning it as true or false:

```javascript
document.getElementById('sign').hidden = true;
```

The code above did not remove the element from the DOM, but rather hid it. This is not the same as setting the CSS visibility property to hidden. For a list of the best use cases for this property, read a list in the [MDN documentation](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/hidden).



**7 Interactivity with onclick**

You can add interactivity to DOM elements by assigning a function to run based on an [event](https://developer.mozilla.org/en-US/docs/Web/Events).

Events can include anything from a click to a user mousing over an element.

The `.onclick` property allows you to assign a function to run on a click event on an element:

```javascript
let element = document.getElementById('interact');
element.onclick = function() { element.style.backgroundColor = 'blue' };
```



**8 Traversing the DOM**

In the DOM hierarchy, parent and children relationships are defined in relation to the position of the root node.

A *parent node* is the closest connected node to another node in the direction towards the root.

A *child node* is the closest connected node to another node in the direction away from the root.

These relationships follow the nesting structure present in HTML code. Elements nested within one HTML tag are children of that parent element.

Each DOM element node has a `.parentNode` and `.children` property. The property will return a list of the element’s children and return `null` if the element has no children.

The `.firstChild` property will grant access to the first child of that parent element.



## 4 dom events with javasrtcipt

**1 Event Handler Registration**

You’re doing great! Now it’s time to dive into using event handler functions to create interactivity.

Using the `.addEventListener()` method, we can have a DOM element listen for a specific event and execute a block of code when the event is detected. The DOM element that listens for an event is called the *event target* and the block of code that runs when the event happens is called the *event handler*.

Let’s take a look at the code below:

```javascript
let eventTarget = document.getElementById('targetElement');
 
eventTarget.addEventListener('click', function() {
  // this block of code will run when click event happens on eventTarget element
});
```

Let’s break this down!

- We selected our event target from the DOM using `document.getElementById('targetElement')`.
- We used the `.addEventListener()` method on the `eventTarget` DOM element.
- The `.addEventListener()` method takes two arguments: an event name in *string* format and an event handler function. We will learn about different values we can use as event names in a later lesson.
- In this example, we used the `'click'` event, which fires when the user clicks on `eventTarget`.
- The code block in the event handler function will execute when the `'click'` event is detected.

Instead of using an anonymous function as the event handler, it’s best practice to create a named event handler function. Your code will remain organized and reusable this way, even if your code gets complex. Check out the syntax:

```javascript
function eventHandlerFunction() {
  // this block of code will run when click event happens
}
 
eventTarget.addEventListener('click', eventHandlerFunction);
```

The named function `eventHandlerFunction` is passed as the second argument of the `.addEventListener()` method instead of defining an anonymous function within the method!



**2 Adding Event Handlers**

We looked at registering event handlers using the `.addEventListener()` method, but there is also another way!

Event Handlers can also be registered by setting an `.onevent` property on a DOM element (event target). The pattern for registering a specific event is to append an element with `.on` followed by the lowercased event type name. For instance, if we want to register a click event with this pattern, we would write:

```javascript
eventTarget.onclick = eventHandlerFunction;
```

Here, we give the DOM element `eventTarget` the [`.onclick` property](https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers/onclick) and set its value as the event handler function `eventHandlerFunction`.

It’s important to know that this==`.onevent` property and `.addEventListener()` will both register event listeners.== With `.onevent`, it allows for one event handler function to be attached to the event target. However, with the `.addEventListener()` method , we can add multiple event handler functions. In the later exercises, we’ll be using the `.addEventListener()` syntax, but we wanted to also introduce the `.onevent` syntax because both are widely used.



**3 Removing Event Handlers**

The `.removeEventListener()` method is used to reverse the `.addEventListener()` method. This method stops the event target from “listening” for an event to fire when it no longer needs to. `.removeEventListener()` also takes two arguments:

1. The event type as a string
2. The event handler function

Check out the syntax of a `.removeEventListener()` method with a click event:

```javascript
eventTarget.removeEventListener('click', eventHandlerFunction);
```

Because there can be multiple event handler functions associated with a particular event, `.removeEventListener()` needs both the exact event type name and the name of the event handler you want to remove. If `.addEventListener()` was provided an anonymous function, then that event listener cannot be removed.



**4 Event Object Properties**

JavaScript stores events as [`Event` objects](https://developer.mozilla.org/en-US/docs/Web/API/Event) with their related data and functionalities as properties and methods. When an event is triggered, the event object can be passed as an argument to the event handler function.

```javascript
function eventHandlerFunction(event){
   console.log(event.timeStamp);
}
 
eventTarget.addEventListener('click', eventHandlerFunction);
```

In the example above, when the `'click'` event is triggered on the `eventTarget`, the `eventHandlerFunction` receives `event`, the Event object, which has information related to the `'click'` event. Then, we log the time it took for the event to be triggered since the document was loaded by accessing the `.timeStamp` property of the `event` object.

There are pre-determined properties associated with event objects. You can call these properties to see information about the event, for example:

- the [`.target` property](https://developer.mozilla.org/en-US/docs/Web/API/Event/target) to reference the element that the event is registered to.
- the [`.type` property](https://developer.mozilla.org/en-US/docs/Web/API/Event/type) to access the name of the event.
- the [`.timeStamp` property](https://developer.mozilla.org/en-US/docs/Web/API/Event/timeStamp) to access the number of milliseconds that passed since the document loaded and the event was triggered.





**5 Event Types**

Beyond the `click` event, there are all types of DOM events that can fire in a browser! It’s important to know *most* events in the DOM take place without being noticed because there are no event handlers connected to them.

It’s also important to know some registered events don’t depend on user interactions to fire. For instance, the `load` event fires after website files completely load in the browser.

Browsers can fire many other events without a user — you can check out a list of events on the [MDN Events Reference](https://developer.mozilla.org/en-US/docs/Web/Events) page.

Many events need user interaction with the DOM to fire. One user interaction event you’ve become familiar with is the `click` event. A `click` event fires when the user presses and releases a mouse button on an element in the DOM.

![Click Event Image](https://content.codecademy.com/courses/javascript-dom-events/click-event.png)

In the rest of this lesson, you’ll explore more user interaction event types like the mouse and keyboard events. To explore more event types, check out the [MDN Events Reference](https://developer.mozilla.org/en-US/docs/Web/Events).



**6 Keyboard Events**

Other popular types of events are keyboard events! *keyboard events* are triggered by user interaction with keyboard keys in the browser.

The `keydown` event is fired while a user presses a key down.<img src="https://content.codecademy.com/courses/javascript-dom-events/keydown.png" alt="Key Down Event Image" style="zoom:25%;" />

The `keyup` event is fired while a user releases a key.<img src="https://content.codecademy.com/courses/javascript-dom-events/keyup.png" alt="Key Up Event Image" style="zoom:25%;" />

The `keypress` event is fired when a user presses a key down and releases it. This is different from using `keydown` and `keyup` events together, because those are two complete events and `keypress` is one complete event.<img src="https://content.codecademy.com/courses/javascript-dom-events/keypress.png" alt="Key P ress Event Image" style="zoom:25%;" />

Keyboard events have unique properties assigned to their event objects like the `.key` property that stores the values of the key pressed by the user. You can program the event handler function to react to a specific key, or react to any interaction with the keyboard.



get value  from events

```javascript
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Get the Value of Text Input Field in JavaScript</title>
</head>
<body>
	<div id="demo">
      <input type="text" placeholder="Type something..." id="myInput">
      <button type="button" onclick="getInputValue();">Get Value</button>
	</div>
    <script>
        function getInputValue(){
            // Selecting the input element and get its value 
            var inputVal = document.getElementById("myInput").value;
            
            // Displaying the value
            alert(inputVal);
          	// document.getElementById("demo").innerHTML = x;
          	document.getElementById("demo").innerHTML = inputVal;
        }
    </script>
</body>
</html>
```







## 5 HTML FORMS

**1 Introduction to HTML Forms**

Forms are a part of everyday life. When we use a physical form in real life, we write down information and give it to someone to process. Think of the times you’ve had to fill out information for various applications like a job, or a bank account, or dropped off a completed suggestion card — each instance is a form!

Just like a physical form, an HTML `<form>` element is responsible for collecting information to send somewhere else. Every time we browse the internet we come into contact with many forms and we might not even realize it. There’s a good chance that if you’re typing into a text field or providing an input, the field that you’re typing into is part of a `<form>`!

In this lesson, we’ll go over the structure and syntax of a `<form>` and the many elements that populate it.

**2 How a Form Works**

We can think of the internet as a network of computers which send and receive information. Computers need an *HTTP request* to know how to communicate. The HTTP request instructs the receiving computer how to handle the incoming information. More information can be found in our article about [HTTP requests](https://www.codecademy.com/articles/http-requests).

The `<form>` element is a great tool for collecting information, but then we need to send that information somewhere else for processing. We need to supply the `<form>` element with both the location of where the `<form>`‘s information goes and what HTTP request to make. Take a look at the sample `<form>` below:

```
<form action="/example.html" method="POST">
</form>
```

In the above example, we’ve created the skeleton for a `<form>` that will send information to **example.html** as a POST request:

- The `action` attribute determines where the information is sent.
- The `method` attribute is assigned a HTTP verb that is included in the HTTP request.

Note: HTTP verbs like POST do not need to be capitalized for the request to work, but it’s done so out of convention. In the example above we could have written `method="post"` and it would still work.

The `<form>` element can also contain child elements. For instance, it would be helpful to provide a header so that users know what this `<form>` is about. We could also add a paragraph to provide even more detail. Let’s see an example of this in code:

```java
<form action="/example.html" method="POST">
  <h1>Creating a form</h1>
  <p>Looks like you want to learn how to create an HTML form. Well, the best way to learn is to play around with it.</p>
</form>
```

The example above doesn’t collect any user input, but we’ll do that in the next exercise. For now, let’s practice making the foundation of an HTML `<form>`!





**3 Text Input**

If we want to create an input field in our `<form>`, we’ll need the help of the `<input>` element.

The `<input>` element has a `type` attribute which determines how it renders on the web page and what kind of data it can accept.

The first value for the `type` attribute we’re going to explore is `"text"`. When we create an `<input>` element with `type="text"`, it renders a text field that users can type into. It’s also important that we include a `name` attribute for the `<input>` — without the `name` attribute, information in the `<input>` won’t be sent when the `<form>` is submitted. We’ll explain more about submissions and the submit button in a later exercise. For now, let’s examine the following code that produces a text input field:

```javascript
<form action="/example.html" method="POST">
  <input type="text" name="first-text-field">
</form>
```

Here’s a screen shot of how the rendered form looks like on a web page for the Chrome browser (different browsers have different default rendering). When initially loaded, it will be an empty box:

![rendered empty text field from input element type='text'](https://content.codecademy.com/courses/learn-html-forms/textInput%20-%20unlabeled%20blank.png)

After users type into the `<input>` element, the value of the `value` attribute becomes what is typed into the text field. The value of the `value` attribute is paired with the value of the `name` attribute and sent as text when the form is submitted. For instance, if a user typed in “important details” in the text field created by our `<input>` element:

![rendered filled text field which reads 'important details' ](https://content.codecademy.com/courses/learn-html-forms/textInput%20-%20unlabeled%20filled.png)

When the form is submitted, the text: `"first-text-field=important details"` is sent to `/example.html` because the value of the `name` attribute is `"first-text-field"` and the value of `value` is `"important details"`.

We could also assign a default value for the `value` attribute so that users have a pre-filled text field when they first see the rendered form like so:

```javascript
<form action="/example.html" method="POST">
  <input type="text" name="first-text-field" value="already pre-filled">
</form>
```

Which renders:

![pre-filled text box due to assigned `value` attribute](https://content.codecademy.com/courses/learn-html-forms/textInput%20-%20unlabeled%20prefilled.png)

Time to put this knowledge into practice!



**4 Adding a Label**

In the previous exercise we created an `<input>` element but we didn’t include anything to explain what the `<input>` is used for. For a user to properly identify an `<input>` we use the appropriately named `<label>` element.

The `<label>` element has an opening and closing tag and displays text that is written between the opening and closing tags. To associate a `<label>` and an `<input>`, the `<input>` needs an `id` attribute. We then assign the `for` attribute of the `<label>` element with the value of the `id` attribute of `<input>`, like so:

```javascript
<form action="/example.html" method="POST">
  <label for="meal">What do you want to eat?</label>
  <br>
  <input type="text" name="food" id="meal">
</form>
```

The code above renders:

![rendered form with labeled text field](https://content.codecademy.com/courses/learn-html-forms/label%20-%20text%20input.png)

Look, now users know what the `<input>` element is for! Another benefit for using the `<label>` element is when this element is clicked, the corresponding `<input>` is highlighted/selected.

Let’s see the `<label>` element in action!



**5 Password Input**

Think about all those times we have to put sensitive information, like a password or PIN, into a `<form>`. We wouldn’t want our information to be seen by anyone peeking over our shoulder! Luckily, we have the `type="password"` attribute for `<input>`!

An `<input type ="password">` element will replace input text with another character like an asterisk (*) or a dot (•). The code below provides an example of how to create a password field:

```javascript
<form>
  <label for="user-password">Password: </label>
  <input type="password" id="user-password" name="user-password">
</form>
```

After a user types into the field, it would look like:

![password field in a form with 6 dots showing text added to the field](https://content.codecademy.com/courses/learn-html-forms/pwInput%20-%20labeled%20filled.png)

Even though the password field obscures the text of the password, when the form is submitted, the value of the text is sent. In other words, if “hunter2” is typed into the password field, “user-password=hunter2” is sent along with the other information on the form





**6 Number Input**

We’ve now gone over two `type` attributes for `<input>` related to text. But, we might want our users to type in a number — in which case we can set the `type` attribute to… (you guessed it)… `"number"`!

By setting `type="number"` for an `<input>` we can restrict what users type into the input field to just numbers (and a few special characters like `-`, `+`, and `.`). We can also provide a `step` attribute which creates arrows inside the input field to increase or decrease by the value of the `step` attribute. Below is the code needed to render an input field for numbers:

```javascript
<form>
  <label for="years"> Years of experience: </label>
  <input id="years" name="years" type="number" step="1">
</form>
```

Which renders:

![rendered number input field with arrows to the right hand side of the field](https://content.codecademy.com/courses/learn-html-forms/numInput%20-%20labeled%20blank%20steps.png)

Now it’s time to apply this knowledge.





**7 Range Input**

Using an `<input type="number">` is great if we want to allow users to type in any number of their choosing. But, if we wanted to limit what numbers our users could type we might consider using a different `type` value. Another option we could use is setting `type` to `"range"` which creates a slider.

To set the minimum and maximum values of the slider we assign values to the `min` and `max` attribute of the `<input>`. We could also control how smooth and fluid the slider works by assigning the `step` attribute a value. Smaller `step` values will make the slider more fluidly, whereas larger `step` values will make the slider move more noticeably. Take a look at the code to create a slider:

```javascript
<form>
  <label for="volume"> Volume Control</label>
  <input id="volume" name="volume" type="range" min="0" max="100" step="1">
</form>
```

The code above renders:![rendered slider for volume control](https://content.codecademy.com/courses/learn-html-forms/rangeInput%20-%20labeled.png)

In the example above, every time the slider moves by one, the value of the `<input>`‘s `value` attribute changes.

This practice has two new elements and an attribute that you may not be familiar with.

- `<section>` - An element used to represent a standalone section for which a more specific element can’t be found. This usually has a heading as a child element. A section should make sense in the outline of a document, whereas `<div>` is used for styling. This is a semantic element you’ll learn more about in a later lesson.
- `class` - A global attribute that has a list of classes pertaining to an element. You’ll see this used with `<section>` in the practice.
- `<hr>` - An element that is used to a break between paragraph-level elements. It is displayed as a horizontal line. This is also a semantic element that you’ll learn more about in a later lesson.



**8 Checkbox Input**

So far the types of inputs we’ve allowed were all single choices. But, what if we presented multiple options to users and allow them to select any number of options? Sounds like we could use checkboxes! In a `<form>` we would use the `<input>` element and set `type="checkbox"`. Examine the code used to create multiple checkboxes:

```javascript
<form>
  <p>Choose your pizza toppings:</p>
  <label for="cheese">Extra cheese</label>
  <input id="cheese" name="topping" type="checkbox" value="cheese">
  <br>
  <label for="pepperoni">Pepperoni</label>
  <input id="pepperoni" name="topping" type="checkbox" value="pepperoni">
  <br>
  <label for="anchovy">Anchovy</label>
  <input id="anchovy" name="topping" type="checkbox" value="anchovy">
</form>
```

Which renders:![HTML form asking user to select pizza toppings and three topping selections as checkboxes](https://content.codecademy.com/courses/learn-html-forms/checkboxInput%20-%20labeled.png)

Notice in the example provided:

- there are assigned values to the `value` attribute of the checkboxes. These values are not visible on the form itself, that’s why it is important that we use an associated `<label>` to identify the checkbox.
- each `<input>` has the same value for the `name` attribute. Using the same `name` for each checkbox groups the `<input>`s together. However, each `<input>` has a unique `id` to pair with a `<label>`.

Alright, time to use checkboxes in our code!





**9 Radio Button Input**

Checkboxes work well if we want to present users with multiple options and let them choose one or more of the options. However, there are cases where we want to present multiple options and only allow for one selection — like asking users if they agree or disagree with the terms and conditions. Let’s look over the code used to create radio buttons:

```javascript
<form>
  <p>What is sum of 1 + 1?</p>
  <input type="radio" id="two" name="answer" value="2">
  <label for="two">2</label>
  <br>
  <input type="radio" id="eleven" name="answer" value="11">
  <label for="eleven">11</label>
</form>
```

Which renders:

![rendered form containing radio buttons](https://content.codecademy.com/courses/learn-html-forms/radioInput%20-%20labeled.png)

Notice from the code snippet, radio buttons (like checkboxes) do not display their value. We have an associated `<label>` to represent the value of the radio button. To group radio buttons together, we assign them the same `name` and only one radio button from that group can be selected.

Let’s see this in action by creating our own radio buttons.



**10 Dropdown list**

Radio buttons are great if we want our users to pick one option out of a few visible options, but imagine if we have a whole list of options! This situation could quickly lead to a lot of radio buttons to keep track of.

An alternative solution is to use a dropdown list to allow our users to choose one option from an organized list. Here’s the code to create a dropdown menu:

```javascript
<form>
  <label for="lunch">What's for lunch?</label>
  <select id="lunch" name="lunch">
    <option value="pizza">Pizza</option>
    <option value="curry">Curry</option>
    <option value="salad">Salad</option>
    <option value="ramen">Ramen</option>
    <option value="tacos">Tacos</option>
  </select>
</form>
```

Which renders:![rendered dropdown list with the first option showing](https://content.codecademy.com/courses/learn-html-forms/dropdown%20list%20-%20concealed.png)

And if we click on the field containing the first option, the list is revealed:![rendered dropdown list with the all options showing](https://content.codecademy.com/courses/learn-html-forms/dropdown%20list%20-%20revealed.png)

Notice in the code that we’re using the element `<select>` to create the dropdown list. To populate the dropdown list, we add multiple `<option>` elements, each with a `value` attribute. By default, only one of these options can be selected.

The text rendered is the text included between the opening and closing `<option>` tags. However, it is the value of the `value` attribute that is used in `<form>` submission (notice the difference in the text and `value` capitalization). When the `<form>` is submitted, the information from this input field will be sent using the `name` of the `<select>` and the `value` of the chosen `<option>`. For instance, if a user selected Pizza from the dropdown list, the information would be sent as `"lunch=pizza"`.





**11 Datalist Input**

Even if we have an organized dropdown list, if the list has a lot of options, it could be tedious for users to scroll through the entire list to locate one option. That’s where using the `<datalist>` element comes in handy.

The `<datalist>` is used with an `<input type="text">` element. The `<input>` creates a text field that users can type into and filter options from the `<datalist>`. Let’s go over a concrete example:

```javascript
<form>
  <label for="city">Ideal city to visit?</label>
  <input type="text" list="cities" id="city" name="city">
 
  <datalist id="cities">
    <option value="New York City"></option>
    <option value="Tokyo"></option>
    <option value="Barcelona"></option>
    <option value="Mexico City"></option>
    <option value="Melbourne"></option>
    <option value="Other"></option>  
  </datalist>
</form>
```

Notice, in the code above, we have an `<input>` that has a `list` attribute. The `<input>` is associated to the `<datalist>` via the `<input>`‘s `list` attribute and the `id` of the `<datalist>`.

From the code provided, the following form is rendered:![input field with a label 'Ideal city to visit?'](https://content.codecademy.com/courses/learn-html-forms/datalist%20-%20concealed.png)

And when field is selected:![clicking on the input field reveals a dropdown  list](https://content.codecademy.com/courses/learn-html-forms/datalist%20-%20revealed.png)

While `<select>` and `<datalist>` share some similarities, there are some major differences. In the associated `<input>` element, users can type in the input field to search for a particular option. If none of the `<option>`s match, the user can still use what they typed in. When the form is submitted, the value of the `<input>`‘s `name` and the `value` of the option selected, or what the user typed in, is sent as a pair.

Now it’s time to make a `<datalist>` of our own!



**12 Textarea element**

An `<input>` element with `type="text"` creates a single row input field for users to type in information. However, there are cases where users need to write in more information, like a blog post. In such cases, instead of using an `<input>`, we could use `<textarea>`.

The `<textarea>` element is used to create a bigger text field for users to write more text. We can add the attributes `rows` and `cols` to determine the amount of rows and columns for the `<textarea>`. Take a look:

```javascript
<form>
  <label for="blog">New Blog Post: </label>
  <br>
  <textarea id="blog" name="blog" rows="5" cols="30">
  </textarea>
</form>
```

In the code above, an empty `<textarea>` that is 5 rows by 30 columns is rendered to the page like so:

![rendered empty textarea element](https://content.codecademy.com/courses/learn-html-forms/textarea%20-%20blank.png)

If we wanted an even bigger text field, we could click and drag on the bottom right corner to expand it.

When we submit the form, the value of `<textarea>` is the text written inside the box. If we want to add a default value to text to `<textarea>` we would include it within the opening and closing tags like so:

```
<textarea>Adding default text</textarea>
```

This code will render a `<textarea>` that contains pre-filled text: “Adding default text”.

But don’t just take our word for it, let’s test it out!



**13 Submit Form**

Remember, the purpose of a form is to collect information that will be submitted. That’s the role of the submit button — users click on it when they are finished with filling out information in the `<form>` and they’re ready to send it off. Now that we’ve gone over how to create various input elements, let’s now go over how to create a submit button!

To make a submit button in a `<form>`, we’re going to use the reliable `<input>` element and set the `type` to `"submit"`. For instance:

```javascript
<form>
  <input type="submit" value="Send">
</form>
```

Which renders:

![rendered submit button](https://content.codecademy.com/courses/learn-html-forms/submit%20button2.png)

Notice in the code snippet that the `value` assigned to the `<input>` shows up as text on the submit button. If there isn’t a `value` attribute, the default text, `Submit` shows up on the button.

Let’s now add this element to make our `<form>`s complete!



## 6 FORM VALIDATION

**1 Requiring an Input**

Sometimes we have fields in our `<form>`s which are not optional, i.e. there must be information provided before we can submit it. To enforce this rule, we can add the `required` attribute to an `<input>` element.

Take for example:

```javascript
<form action="/example.html" method="POST">
  <label for="allergies">Do you have any dietary restrictions?</label>
  <br>
  <input id="allergies" name="allergies" type="text" required>
  <br>
  <input type="submit" value="Submit">
</form>
```

This renders a text box, and if we try to submit the `<form>` without filling it out we get this message:

![message pop up prompting user to fill in the field](https://content.codecademy.com/courses/learn-html-forms/required%20field.png)

The styling of the message varies from browser to browser, the picture above depicts the message in a Chrome browser. We’ll also continue to show these messages as they appear in Chrome in later exercises.

Let’s see how it shows up in your browser!



**2 Set a Minimum and Maximum**

Another built-in validation we can use is to assign a minimum or maximum value for a number field, e.g. `<input type="number">` and `<input type="range">`. To set a minimum acceptable value, we use the `min` attribute and assign a value. On the flip side, to set a maximum acceptable value, we assign the `max` attribute a value. Let’s see this in code:

```javascript
<form action="/example.html" method="POST">
  <label for="guests">Enter # of guests:</label>
  <input id="guests" name="guests" type="number" min="1" max="4">
  <input type="submit" value="Submit">
</form>
```

If a user tries to submit an input that is less than 1 a warning will appear:![prompt on a number field for user to input a value greater than or equal to 1](https://content.codecademy.com/courses/learn-html-forms/min%20max%20attr.png)

A similar message will appear if a user tries to input a number greater than 4. Let’s now see this action



**3 Checking Text Length**

In the previous exercise, we were able to use `min` and `max` to set acceptable minimum and maximum values in a number field. But what about text fields? There are certainly cases where we wouldn’t want our users typing more than a certain number of characters (think about the character cap for messages on Twitter). We might even want to set a minimum number of characters. Conveniently, there are built-in HTML5 validations for these situations.

To set a minimum number of characters for a text field, we add the `minlength` attribute and a value to set a minimum value. Similarly, to set the maximum number of characters for a text field, we use the `maxlength` attribute and set a maximum value. Let’s take a look at these attributes in code:

```javascript
<form action="/example.html" method="POST">
  <label for="summary">Summarize your feelings in less than 250 characters</label>
  <input id="summary" name="summary" type="text" minlength="5" maxlength="250" required>
  <input type="submit" value="Submit">
</form>
```

If a user tries to submit the `<form>` with less than the set minimum, this message appears:

![prompt on a number field for user to length the input](https://content.codecademy.com/courses/learn-html-forms/minlength.png)

And if a user tries to type in more than the maximum allowed number of characters, they don’t get a warning message, but they can’t type it in!

Let’s add this validation to our `<form>`.

**4 Matching a Pattern**

In addition to checking the length of a text, we could also add a validation to check how the text was provided. For cases when we want user input to follow specific guidelines, we use the `pattern` attribute and assign it a *regular expression*, or regex. Regular expressions are a sequence of characters that make up a search pattern. If the input matches the regex, the form can be submitted.

Let’s say we wanted to check for a valid credit card number (a 14 to 16 digit number). We could use the regex: `[0-9]{14,16}` which checks that the user provided only numbers and that they entered at least 14 digits and at most 16 digits.

To add this to a form:

```javascript
<form action="/example.html" method="POST">
  <label for="payment">Credit Card Number (no spaces):</label>
  <br>
  <input id="payment" name="payment" type="text" required pattern="[0-9]{14,16}">
  <input type="submit" value="Submit">
</form>
```

With the `pattern` in place, users can’t submit the `<form>` with a number that doesn’t follow the regex. When they try, they’ll see a validation message like so:

![message prompting user to follow the requested format](https://content.codecademy.com/courses/learn-html-forms/pattern.png)

If you want to find out more about Regex, read more at [MDN’s regex article](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions).

To see it in practice, let’s use the `pattern` attribute in our HTML!





## Making a Website Responsive



### 1 learn responsive desgin

**1 SIZING ELEMENTS**

Em

Incorporating relative sizing starts by using units other than pixels. One unit of measurement you can use in CSS to create relatively-sized content is the *em*, written as `em` in CSS.

Historically, the em represented the width of a capital letter M in the typeface and size being used. That is no longer the case.

Today, ==the em represents the font-size of the current element or the default base font-size set by the browser if none is given.== For example, if the base font of a browser is 16 pixels (which is normally the default size of text in a browser), then 1 em is equal to 16 pixels. 2 ems would equal 32 pixels, and so on.

Let’s take a look at two examples that show how em can be used in CSS.

```css
.heading {
  font-size: 2em;
}
```

In the example above, no base font has been specified, therefore the font size of the `heading` element will be set relative to the default font size of the browser. Assuming the default font size is 16 pixels, then the font size of the `heading` element will be 32 pixels.

```css
.splash-section {
  font-size: 18px;
}
 
.splash-section h1 {
  font-size: 1.5em;
}
```

The example above shows how to use ems without relying on the default font size of the browser. Instead, a base font size (`18px`) is defined for all text within the `splash-section` element. The second CSS rule will set the font size of all `h1` elements inside of `splash-section` relative to the base font of `splash-section` (18 pixels). The resulting font size of `h1` elements will be 27 pixels.





**2 Rem**

The second relative unit of measurement in CSS is the *rem*, coded as `rem`.

Rem stands for *root em*. It acts similar to em, but instead of checking parent elements to size font, it checks the *root element*. The root element is the `<html>` tag.

Most browsers set the font size of `<html>` to 16 pixels, so by default rem measurements will be compared to that value. To set a different font size for the root element, you can add a CSS rule.

```css
html {
  font-size: 20px;
}
 
h1 {
  font-size: 2rem;
}
```

In the example above, the font size of the root element, `<html>`, is set to 20 pixels. All subsequent rem measurements will now be compared to that value and the size of `h1` elements in the example will be 40 pixels.

One advantage of using rems is that all elements are compared to the same font size value, making it easy to predict how large or small font will appear. If you are interested in sizing elements consistently across an entire website, the rem measurement is the best unit for the job. If you’re interested in sizing elements in comparison to other elements nearby, then the em unit would be better suited for the job.





**3 Percentages: Height & Width**

To size non-text HTML elements relative to their ==parent elements== on the page you can use *percentages*.

Percentages are often used to size box-model values, like width and height, padding, border, and margins. They can also be used to set positioning properties (top, bottom, left, right).

To start, let’s size the height and width of an element using percentages.

```css
.main {
  height: 300px;
  width: 500px;
}
 
.main .subsection {
  height: 50%;
  width: 50%;
}
```

In the example above, `.main` and `.subsection` each represent divs. The `.subsection` div is nested within the `.main` div. Note that the dimensions of the parent div (`.main`) have been set to a height of 300 pixels and a width of 500 pixels.

When percentages are used, elements are sized relative to the dimensions of their parent element (also known as a container). Therefore, the dimensions of the `.subsection` div will be 150 pixels tall and 250 pixels wide. Be careful, a child element’s dimensions may be set erroneously if the dimensions of its parent element aren’t set first.

**Note:** Because the box model includes padding, borders, and margins, setting an element’s `width` to `100%` may cause content to overflow its parent container. While tempting, `100%` should only be used when content will not have padding, border, or margin.



**4 Percentages: Padding & Margin**

Percentages can also be used to set the padding and margin of elements.

When height and width are set using percentages, you learned that the dimensions of child elements are calculated based on the dimensions of the parent element.

When percentages are used to set padding and margin, however, they are calculated based only on the *width* of the parent element.

For example, when a property like `margin-left` is set using a percentage (say `50%`), the element will be moved halfway to the right in the parent container (as opposed to the child element receiving a margin half of its parent’s margin).

Vertical padding and margin are also calculated based on the width of the parent. Why? Consider the following scenario:

1. A container div is defined, but its height is not set (meaning it’s flat).
2. The container then has a child element added within. The child element *does* have a set height. This causes the height of its parent container to stretch to that height.
3. The child element requires a change, and its height is modified. This causes the parent container’s height to also stretch to the new height. This cycle occurs endlessly whenever the child element’s height is changed!

In the scenario above, an unset height (the parent’s) results in a constantly changing height due to changes to the child element. This is why vertical padding and margin are based on the width of the parent, and not the height.

**Note:** When using relative sizing, ems and rems should be used to size text and dimensions on the page related to text size (i.e. padding around text). This creates a consistent layout based on text size. Otherwise, percentages should be used.



**5 Width: Minimum & Maximum**

Although relative measurements provide consistent layouts across devices of different screen sizes, elements on a website can lose their integrity when they become too small or large. You can limit how wide an element becomes with the following properties:

1. `min-width` — ensures a minimum width for an element.
2. `max-width` — ensures a maximum width for an element.

```css
p {
  min-width: 300px;
  max-width: 600px;
}
```

In the example above, when the browser is resized, the width of paragraph elements will not fall below 300 pixels, nor will their width exceed 600 pixels.

When a browser window is narrowed or widened, text can become either very compressed or very spread out, making it difficult to read. These two properties ensure that content is legible by limiting the minimum and maximum widths.

**Note**: The unit of pixels is used to ensure hard limits on the dimensions of the element(s).



**6 Height: Minimum & Maximum**

You can also limit the minimum and maximum *height* of an element.

1. `min-height` — ensures a minimum height for an element’s box.
2. `max-height` — ensures a maximum height for an element’s box.

```css
p {
  min-height: 150px;
  max-height: 300px;
}
```

In the example above, the height of all paragraphs will not shrink below 150 pixels and the height will not exceed 300 pixels.

What will happen to the contents of an element if the `max-height` property is set too low for that element? It’s possible that content will overflow outside of the element, resulting in content that is not legible.



**9 Scaling Images and Videos**

Many websites contain a variety of different media, like images and videos. When a website contains such media, it’s important to make sure that it is scaled proportionally so that users can correctly view it.

```css
.container {
  width: 50%;
  height: 200px;
  overflow: hidden;
}
 
.container img {
  max-width: 100%;
  height: auto;
  display: block;
}
```

In the example above, `.container` represents a container div. It is set to a width of `50%` (half of the browser’s width, in this example) and a height of 200 pixels. Setting `overflow` to `hidden` ensures that any content with dimensions larger than the container will be hidden from view.

The second CSS rule ensures that images scale with the width of the container. The `height` property is set to `auto`, meaning an image’s height will *automatically* scale proportionally with the width. Finally, the last line will display images as block level elements (rather than inline-block, their default state). This will prevent images from attempting to align with other content on the page (like text), which can add unintended margin to the images.

It’s worth memorizing the entire example above. It represents a *very common* design pattern used to scale images and videos proportionally.

**Note:** The example above scales the width of an image (or video) to the width of a container. If the image is larger than the container, the vertical portion of the image will overflow and will not display. To swap this behavior, you can set `max-height` to `100%` and `width` to `auto` (essentially swapping the values). This will scale the *height* of the image with the height of the container instead. If the image is larger than the container, the horizontal portion of the image will overflow and not display.



**10 Scaling Background Images**

Background images of HTML elements can also be scaled responsively using CSS properties.

```css
body {
  background-image: url('#');
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
}
```

In the example above, the first CSS declaration sets the background image (`#` is a placeholder for an image URL in this example). The second declaration instructs the CSS compiler to not repeat the image (by default, images will repeat). The third declaration centers the image within the element.

The final declaration, however, is the focus of the example above. It’s what scales the background image. The image will *cover* the entire background of the element, all while keeping the image in proportion. If the dimensions of the image exceed the dimensions of the container then only a portion of the image will display.



### 2 Media queries

**1 Media Queries**

CSS uses *media queries* to adapt a website’s content to different screen sizes. With media queries, CSS can detect the size of the current screen and apply different CSS styles depending on the width of the screen.

```css
@media only screen and (max-width: 480px) {
  body {
    font-size: 12px;
  }
}
```

The example above demonstrates how a media query is applied. The media query defines a rule for screens smaller than 480 pixels (approximately the width of many smartphones in [landscape](https://en.wikipedia.org/wiki/Page_orientation) orientation).

Let’s break this example down into its parts:

1. `@media` — This keyword begins a media query rule and instructs the CSS compiler on how to parse the rest of the rule.
2. `only screen` — Indicates what types of devices should use this rule. In early attempts to target different devices, CSS incorporated different media types (screen, print, handheld). The rationale was that by knowing the media type, the proper CSS rules could be applied. However, “handheld” and “screen” devices began to occupy a much wider range of sizes and having only one CSS rule per media device was not sufficient. `screen` is the media type always used for displaying content, no matter the type of device. The `only` keyword is added to indicate that this rule only applies to one media type (`screen`).
3. `and (max-width : 480px)` — This part of the rule is called a *media feature*, and instructs the CSS compiler to apply the CSS styles to devices with a width of 480 pixels or smaller. Media features are the conditions that must be met in order to render the CSS within a media query.
4. CSS rules are nested inside of the media query’s curly braces. The rules will be applied when the media query is met. In the example above, the text in the `body` element is set to a `font-size` of `12px` when the user’s screen is less than 480px.



**2 Range**

Specific screen sizes can be targeted by setting multiple width and height media features. `min-width` and `min-height` are used to set the minimum width and minimum height, respectively. Conversely, `max-width` and `max-height` set the maximum width and maximum height, respectively.

By using multiple widths and heights, a range can be set for a media query.

```css
@media only screen and (min-width: 320px) and (max-width: 480px) {
    /* ruleset for 320px - 480px */
}
```

The example above would apply its CSS rules only when the screen size is between 320 pixels and 480 pixels. Notice the use of a second `and` keyword after the `min-width` media feature. This allows us to chain two requirements together.

The example above can be written using two separate rules as well:

```css
@media only screen and (min-width: 320px) { 
    /* ruleset for >= 320px */
}
 
 
@media only screen and (min-width: 480px) { 
    /* ruleset for >= 480px */
}
```

The first media query in the example above will apply CSS rules when the size of the screen meets or exceeds 320 pixels. The second media query will then apply CSS rules when the size of the screen meets or exceeds 480 pixels, meaning that it can override CSS rules present in the first media query or apply additional CSS rules that are not already present in the first.

Both examples above are valid, and it is likely that you will see both patterns used when reading another developer’s code.



**3 Dots Per Inch (DPI)**

Another media feature we can target is screen resolution. Many times we will want to supply higher quality media (images, video, etc.) only to users with screens that can support high resolution media. Targeting screen resolution also helps users avoid downloading high resolution (large file size) images that their screen may not be able to properly display.

To target by resolution, we can use the `min-resolution` and `max-resolution` media features. These media features accept a resolution value in either dots per inch (dpi) or dots per centimeter (dpc). Learn more about resolution measurements [here](https://en.wikipedia.org/wiki/Dots_per_inch).

```css
@media only screen and (min-resolution: 300dpi) {
    /* CSS for high resolution screens */
}
```

The media query in the example above targets high resolution screens by making sure the screen resolution is at least 300 dots per inch. If the screen resolution query is met, then we can use CSS to display high resolution images and other media.



**4 And Operator**

In previous exercises, we chained multiple media features of the same type in one media query by using the `and` operator. It allowed us to create a range by using `min-width` and `max-width` in the same media query.

The `and` operator can be used to require multiple media features. Therefore, we can use the `and` operator to require both a `max-width` of `480px` *and* to have a `min-resolution` of `300dpi`.

For example:

```css
@media only screen and (max-width: 480px) and (min-resolution: 300dpi) {
    /* CSS ruleset */
}
```

By placing the `and` operator between the two media features, the browser will require both media features to be true before it renders the CSS within the media query. The `and` operator can be used to chain as many media features as necessary.



**5 Comma Separated List**

If only one of multiple media features in a media query must be met, media features can be separated in a comma separated list.

For example, if we needed to apply a style when only one of the below is true:

- The screen is more than 480 pixels wide
- The screen is in landscape mode

We could write:

```javascript
@media only screen and (min-width: 480px), (orientation: landscape) {
    /* CSS ruleset */
}
```

In the example above, we used a comma (`,`) to separate multiple rules. The example above requires only one of the media features to be true for its CSS to apply.

Note that the second media feature is `orientation`. The `orientation` media feature detects if the page has more width than height. If a page is wider, it’s considered `landscape`, and if a page is taller, it’s considered `portrait`.



**6 reakpoints**

We know how to use media queries to apply CSS rules based on screen size and resolution, but how do we determine what queries to set?

The points at which media queries are set are called *breakpoints*. Breakpoints are the screen sizes at which your web page does not appear properly. For example, if we want to target tablets that are in landscape orientation, we can create the following breakpoint:

```css
@media only screen and (min-width: 768px) and (max-width: 1024px) and (orientation: landscape) {
    /* CSS ruleset */
}
```

The example above creates a screen size range the size of a tablet in landscape mode and also identifies the orientation.

However, setting breakpoints for every device imaginable would be incredibly difficult because there are many devices of differing shapes and sizes. In addition, new devices are released with new screen sizes every year.

Rather than set breakpoints based on specific devices, the best practice is to resize your browser to view where the website naturally breaks based on its content. The dimensions at which the layout breaks or looks odd become your media query breakpoints. Within those breakpoints, we can adjust the CSS to make the page resize and reorganize.

By observing the dimensions at which a website naturally breaks, you can set media query breakpoints that create the best possible user experience on a project by project basis, rather than forcing every project to fit a certain screen size. Different projects have different needs, and creating a responsive design should be no different.

Check out [this](https://content.codecademy.com/courses/freelance-1/unit-5/screen-sizes.png) list of breakpoints by device widths. Use it as a reference of screen widths to test your website to make certain it looks great across a variety of devices.



### 3 layout with flexbox

**1 display: flex**

Any element can be a flex container. Flex containers are helpful tools for creating websites that respond to changes in screen sizes. Child elements of flex containers will change size and location in response to the size and position of their parent container.

For an element to become a flex container, its `display` property must be set to `flex`.

```css
div.container {
  display: flex;
}
```

In the example above, all divs with the class `container` are flex containers. If they have children, the children are flex items. A div with the declaration `display: flex;` will remain block level — no other elements will appear on the same line as it.

However, it will change the behavior of its child elements. Child elements will not begin on new lines. In the exercises that follow, we will cover how the flex `display` property impacts the positioning of child elements.



**2 inline-flex**

In the previous exercise, you might have observed that when we gave a div — a block level element — the `display` value of `flex` that it remained a block level element. What if we want multiple flex containers to display inline with each other?

If we didn’t want div elements to be block-level elements, we would use `display: inline`. Flexbox, however, provides the `inline-flex` value for the `display` attribute, which allows us to create flex containers that are also inline elements.

```html
<div class="container">
  <p>I’m inside of a flex container!</p>
  <p>A flex container’s children are flex items!</p>
</div>
<div class="container">
  <p>I’m also a flex item!</p>
  <p>Me too!</p>
```
```css
</div>
.container {
  width: 200px;
  height: 200px;
  display: inline-flex;
}
```

In the example above, there are two container divs. Without a width, each div would stretch the entire width of the page. The paragraphs within each div would also display on top of each other because paragraphs are block-level elements.

When we change the value of the `display` property to `inline-flex`, the divs will display inline with each other if the page is wide enough. As we progress through this lesson, we will cover in more detail how flex items are displayed.

Notice that in the example above, the size of the flex container is set. Currently, the size of the parent container will override the size of its child elements. If the parent element is too small, the flex items will shrink to accommodate the parent container’s size. We’ll explain why in a later exercise.

```html
<div class="container">
  <div class="child">
    <h1>1</h1>
  </div>
  <div class="child">
    <h1>2</h1>
  </div>
</div>
```
```css
.container {
  width: 200px;
}
 
.child {
  display: inline-flex;
  width: 150px;
  height: auto;
}
```

In the example above, the `.child` divs will take up more width (300 pixels) than the `container` div allows (200 pixels). The `.child` divs will shrink to accommodate the container’s size. In later exercises, we will explore several ways to handle this.



**4 justify-content**

In previous exercises, when we changed the `display` value of parent containers to `flex` or `inline-flex`, all of the child elements (flex items) moved toward the upper left corner of the parent container. This is the default behavior of flex containers and their children. We can specify how flex items spread out from left to right, along the *main axis*. We will learn more about axes in a later exercise.

To position the items from left to right, we use a property called `justify-content`.

```css
.container {
  display: flex;
  justify-content: flex-end;
}
```

In the example above, we set the value of `justify-content` to `flex-end`. This will cause all of the flex items to shift to the right side of the flex container.

There are five values for the `justify-content` property:

1. `flex-start` — all items will be positioned in order, starting from the left of the parent container, with no extra space between or before them.
2. `flex-end` — all items will be positioned in order, with the last item starting on the right side of the parent container, with no extra space between or after them.
3. `center` — all items will be positioned in order, in the center of the parent container with no extra space before, between, or after them.
4. `space-around` — items will be positioned with equal space before and after each item, resulting in double the space between elements.
5. `space-between` — items will be positioned with equal space between them, but no extra space before the first or after the last elements.

In the definitions above, “no extra space” means that margins and borders will be respected, but no more space (than is specified in the style rule for the particular element) will be added between elements. The size of each individual flex item is not changed by this property.



**5 align-items**

In the previous exercise, you learned how to justify the content of a flex container from left to right across the page. It is also possible to align flex items vertically within the container. The `align-items` property makes it possible to space flex items vertically.

```css
.container {
  align-items: baseline;
}
```

In the example above, the `align-items` property is set to `baseline`. This means that the baseline of the content of each item will be aligned.

There are five values we can use for the `align-items` property:

1. `flex-start` — all elements will be positioned at the top of the parent container.
2. `flex-end` — all elements will be positioned at the bottom of the parent container.
3. `center` — the center of all elements will be positioned halfway between the top and bottom of the parent container.
4. `baseline` — the bottom of the content of all items will be aligned with each other.
5. `stretch` — if possible, the items will stretch from top to bottom of the container (this is the default value; elements with a specified height will not stretch; elements with a minimum height or no height specified will stretch).

These five values tell the elements how to behave along the *cross axis* of the parent container. In these examples, the cross axis stretches from top to bottom of the container. We’ll learn more about this in a future exercise.

You might be unfamiliar with the `min-height` and `max-height` properties, but you have used `height` and `width` before. `min-height`, `max-height`, `min-width`, and `max-width` are properties that ensure an element is at least a certain size or at most a certain size. You’ll see how these become useful as you move throughout this lesson.

Now you’re going to see each of the five values above in action!





**6 flex-grow**

In Exercise 3, we learned that all flex items shrink proportionally when the flex container is too small. However, if the parent container is larger than necessary then the flex items will not stretch by default. The `flex-grow` property allows us to specify if items should grow to fill a container and also which items should grow proportionally more or less than others.

```html
<div class="container">
  <div class="side">
    <h1>I’m on the side of the flex container!</h1>
  </div>
  <div class="center">
    <h1>I'm in the center of the flex container!</h1>
  </div>
  <div class="side">
    <h1>I'm on the other side of the flex container!</h1>
  </div>
</div>
.container {
  display: flex;
}
```
```css
.side {
  width: 100px;
  flex-grow: 1;
}

.center {
  width: 100px;
  flex-grow: 2;
}
```

In the example above, the `.container` div has a `display` value of `flex`, so its three child divs will be positioned next to each other. If there is additional space in the `.container` div (in this case, if it is wider than 300 pixels), the flex items will grow to fill it. The `.center` div will stretch twice as much as the `.side` divs. For example, if there were 60 additional pixels of space, the `center` div would absorb 30 pixels and the `side` divs would absorb 15 pixels each.

If a `max-width` is set for an element, it will not grow larger than that even if there is more space for it to absorb.

All of the previous properties we have learned are declared on flex containers, or the parent elements. This property — `flex-grow` — is the first we have learned that is declared on flex items.





**7 flex-shrink**

Just as the `flex-grow` property proportionally stretches flex items, the `flex-shrink` property can be used to specify which elements will shrink and in what proportions.

You may have noticed in earlier exercises that flex items shrank when the flex container was too small, even though we had not declared the property. This is because the default value of `flex-shrink` is `1`. However, flex items do not grow unless the `flex-grow` property is declared because the default value of `flex-grow` is `0`.

```html
<div class="container">
  <div class="side">
    <h1>I'm on the side of the flex container!</h1>
  </div>
  <div class="center">
    <h1>I'm in the center of the flex container!</h1>
  </div>
  <div class="side">
    <h1>I'm on the other side of the flex container!</h1>
  </div>
</div>
```
```css
.container {
  display: flex;
}
 
.side {
  width: 100px;
  flex-shrink: 1;
}
 
.center {
  width: 100px;
  flex-shrink: 2;
}
```

In the example above, the `.center` div will shrink twice as much as the `.side` divs if the `.container` div is too small to fit the elements within it. If the content is 60 pixels too large for the flex container that surrounds it, the `.center` div will shrink by 30 pixels and the outer divs will shrink by 15 pixels each. Margins are unaffected by `flex-grow` and `flex-shrink`.

Keep in mind, minimum and maximum widths will take precedence over `flex-grow` and `flex-shrink`. As with `flex-grow`, `flex-shrink` will only be employed if the parent container is too small or the browser is adjusted.



**8 flex-basis**

In the previous two exercises, the dimensions of the divs were determined by heights and widths set with CSS. Another way of specifying the width of a flex item is with the `flex-basis` property. `flex-basis` allows us to specify the width of an item before it stretches or shrinks.

```html
<div class="container">
  <div class=”side”>
    <h1>Left side!</h1>
  </div>
  <div class="center">
    <h1>Center!</h1>
  </div>
  <div class="side">
    <h1>Right side!</h1>
  </div>
</div>
```
```css
.container {
  display: flex;
}
 
.side {
  flex-grow: 1;
  flex-basis: 100px;
}
 
.center {
  flex-grow: 2;
  flex-basis: 150px;
}
```

In the example above, the `.side` divs will be 100 pixels wide and the `.center` div will be 150 pixels wide if the `.container` div has just the right amount of space (350 pixels, plus a little extra for margins and borders). If the `.container` div is larger, the `.center` div will absorb twice as much space as the `.side` divs.

The same would hold true if we assigned `flex-shrink` values to the divs above as well.



**9 flex**

The `flex` property provides a convenient way for specifying how elements stretch and shrink, while simplifying the CSS required. The `flex` property allows you to declare `flex-grow`, `flex-shrink`, and `flex-basis` all in one line.

**Note:** The `flex` *property* is different from the `flex` *value* used for the `display` property.

```css
.big {
  flex-grow: 2;
  flex-shrink: 1;
  flex-basis: 150px;
}
 
.small {
  flex-grow: 1;
  flex-shrink: 2;
  flex-basis: 100px;
}
```

In the example above, all elements with class `big` will grow twice as much as elements with class `small`. Keep in mind, this doesn’t mean `big` items will be twice as big as `small` items, they’ll just take up more of the extra space.

The CSS below declares these three properties in one line.

```css
.big {
  flex: 2 1 150px;
}
 
.small {
  flex: 1 2 100px;
}
```

In the example above, we use the `flex` property to declare the values for `flex-grow`, `flex-shrink`, and `flex-basis` (in that order) all in one line.

```css
.big {
 flex: 2 1;
}
```

In the example above, we use the `flex` property to declare `flex-grow` and `flex-shrink`, but not `flex-basis`.

```css
.small {
  flex: 1 20px;
}
```

In the example above, we use the `flex` property to declare `flex-grow` and `flex-basis`. Note that there is no way to set only `flex-shrink` and `flex-basis` using 2 values.

The browser to the right has two flex containers, each with three flex items. In **style.css**, examine the values for each of these items. Notice that the `flex-grow` and `flex-basis` values are set for the blue divs.

Stretch the browser window to increase its width. Observe that once the top outer `div`s reach 100 pixels wide, they begin to grow faster than the top center `div`. Also notice that once the bottom center `div` reaches 100 pixels wide, it begins to grow faster than the outer `div`s.

Now, shrink the browser window and notice that once the top center `div` reaches 50 pixels wide it begins to shrink faster than the outer `div`s and when the bottom outer `div`s reach 75 pixels, they begin to shrink faster than the center `div`.



**10 flex-wrap**

Sometimes, we don’t want our content to shrink to fit its container. Instead, we might want flex items to move to the next line when necessary. This can be declared with the `flex-wrap` property. The `flex-wrap` property can accept three values:

1. `wrap` — child elements of a flex container that don’t fit into a row will move down to the next line
2. `wrap-reverse` — the same functionality as `wrap`, but the order of rows within a flex container is reversed (for example, in a 2-row flexbox, the first row from a `wrap` container will become the second in `wrap-reverse` and the second row from the `wrap` container will become the first in `wrap-reverse`)
3. `nowrap` — prevents items from wrapping; this is the default value and is only necessary to override a wrap value set by a different CSS rule.

```html
<div class="container">
  <div class="item">
    <h1>We're going to wrap!</h1>
  </div>
  <div class="item">
    <h1>We're going to wrap!</h1>
  </div>
  <div class="item">
    <h1>We're going to wrap!</h1>
  </div>
</div>
```
```css
.container {
  display: inline-flex;
  flex-wrap: wrap;
  width: 250px;
}
 
.item {
  width: 100px;
  height: 100px;
}
```

In the example above, three flex items are contained by a parent flex container. The flex container is only 250 pixels wide so the three 100 pixel wide flex items cannot fit inline. The `flex-wrap: wrap;` setting causes the third, overflowing item to appear on a new line, below the other two item.

**Note:** The `flex-wrap` property is declared on flex *containers*.



**11 Align-content**

Now that elements can wrap to the next line, we might have multiple rows of flex items within the same container. In a previous exercise, we used the `align-items` property to space flex items from the top to the bottom of a flex container.==`align-items` is for aligning elements within a single row. If a flex container has multiple rows of content, we can use `align-content` to space the rows from top to bottom.==

`align-content` accepts six values:

1. `flex-start` — all rows of elements will be positioned at the top of the parent container with no extra space between.
2. `flex-end` — all rows of elements will be positioned at the bottom of the parent container with no extra space between.
3. `center` — all rows of elements will be positioned at the center of the parent element with no extra space between.
4. `space-between` — all rows of elements will be spaced evenly from the top to the bottom of the container with no space above the first or below the last.
5. `space-around` — all rows of elements will be spaced evenly from the top to the bottom of the container with the same amount of space at the top and bottom and between each element.
6. `stretch` — if a minimum height or no height is specified, the rows of elements will stretch to fill the parent container from top to bottom (default value).

```html
<div class="container">
  <div class=”child”>
    <h1>1</h1>
  </div>
  <div class="child">
    <h1>2</h1>
  </div>
  <div class="child">
    <h1>3</h1>
  </div>
  <div class="child">
    <h1>4</h1>
  </div>
</div>
```
```css
.container {
  display: flex;
  width: 400px;
  height: 400px;
  flex-wrap: wrap;
  align-content: space-around;
}
 
.child {
  width: 150px;
  height: 150px;
}
```

In the example above, there are four flex items inside of a flex container. The flex items are set to be 150 pixels wide each, but the parent container is only 400 pixels wide. This means that no more than two elements can be displayed inline. The other two elements will wrap to the next line and there will be two rows of `div`s inside of the flex container. The `align-content` property is set to the value of `space-around`, which means the two rows of divs will be evenly spaced from top to bottom of the parent container with equal space before the first row and after the second, with double space between the rows.

Below, we will see each of the properties in action!

**Note:** The `align-content` property is declared on flex containers.





**12 lex-direction**

Up to this point, we’ve only covered flex items that stretch and shrink horizontally and wrap vertically. As previously stated, flex containers have two axes: a *main axis* and a *cross axis*. By default, the main axis is horizontal and the cross axis is vertical.

The main axis is used to position flex items with the following properties:

1. `justify-content`
2. `flex-wrap`
3. `flex-grow`
4. `flex-shrink`

The cross axis is used to position flex items with the following properties:

1. `align-items`
2. `align-content`

The main axis and cross axis are interchangeable. We can switch them using the `flex-direction` property. If we add the `flex-direction` property and give it a value of `column`, the flex items will be ordered vertically, not horizontally.

```html
<div class="container">
  <div class="item">
    <h1>1</h1>
  </div>
  <div class="item">
    <h1>2</h1>
  </div>
  <div class="item">
    <h1>3</h1>
  </div>
  <div class="item">
    <h1>4</h1>
  </div>
  <div class="item">
    <h1>5</h1>
  </div>
</div>
```
```css
.container {
  display: flex;
  flex-direction: column;
  width: 1000px;
}
.item {
  height: 100px;
  width: 100px;
}
```

In the example above, the five divs will be positioned in a vertical column. All of these divs could fit in one horizontal row. However, the `column` value tells the browser to stack the divs one on top of the other. As explained above, properties like `justify-content` will not behave the way they did in previous examples.

The `flex-direction` property can accept four values:

1. `row` — elements will be positioned from left to right across the parent element starting from the top left corner (default).
2. `row-reverse` — elements will be positioned from right to left across the parent element starting from the top right corner.
3. `column` — elements will be positioned from top to bottom of the parent element starting from the top left corner.
4. `column-reverse` — elements will be positioned from the bottom to the top of the parent element starting from the bottom left corner.

Below, we’ll investigate how these work.

**Note:** The `flex-direction` property is declared on flex containers.



**13 flex-flow**

Like the `flex` property, the `flex-flow` property is used to declare both the `flex-wrap` and `flex-direction` properties in one line.

```css
.container {
  display: flex;
  flex-wrap: wrap;
  flex-direction: column;
}
```

In the example above, we take two lines to accomplish what can be done with one.

```css
.container {
  display: flex;
  flex-flow: column wrap;
}
```

In the example above, the first value in the `flex-flow` declaration is a `flex-direction` value and the second is a `flex-wrap` value. All values for `flex-direction` and `flex-wrap` are accepted.

**Note:** The `flex-flow` property is declared on flex containers.



**14 Nested Flexboxes**

So far, we’ve had multiple flex containers on the same page to explore flex item positioning. It is also possible to position flex containers inside of one another.

```html
<div class="container">
  <div class="left">
    <img class="small" src="#"/>
    <img class="small" src="#"/>
    <img class="small" src="#" />
  </div>
  <div class="right">
    <img class="large" src="#" />
  </div>
</div>
```
```css
.container {
  display: flex;
  justify-content: center;
  align-items: center;
}
 
.left {
  display: inline-flex;
  flex: 2 1 200px;
  flex-direction: column;
}
 
.right {
  display: inline-flex;
  flex: 1 2 400px;
  align-items: center;
}
 
.small {
  height: 200px;
  width: auto;
}
 
.large {
  height: 600px; 
  width: auto;
}
```

In the example above, a div with three smaller images will display from top to bottom on the left of the page (`.left`). There is also a div with one large image that will display on the right side of the page (`.right`). The left div has a smaller `flex-basis` but stretches to fill more extra space; the right div has a larger `flex-basis` but stretches to fill less extra space. Both divs are flex items *and* flex containers. The items have properties that dictate how they will be positioned in the parent container and how their flex item children will be positioned in them.

We’ll use the same formatting above to layout the simple page to the right.



### 5 girds and spacing

Congratulations! You should have an understanding of grid structure, the components that make up a grid, and how to use them to properly space elements within your design.

Remember, the reasons we design using grids are:

- Promote consistency within our designs
- Properly align elements on our page
- Provide ample spacing between content

Remember a grid is made up of:

*Columns *Gutters *Margins

Spacing is incredibly important within a design to ensure:

- Elements have ample room to breath
- Denote emphasis on certain parts of a page
- Promote harmonious patterns and rhythms within your designs

By following these guidelines, it will allow you to create elegant and usable sites!



### 6 css grid essentials

**1 Creating a Grid**

To set up a grid, you need to have both a *grid container* and *grid items*. The grid container will be a parent element that contains grid items as children and applies overarching styling and positioning to them.

To turn an HTML element into a grid container, you must set the element’s `display` property to `grid` (for a block-level grid) or `inline-grid` (for an inline grid). Then, you can assign other properties to lay out the grid.



**2 Creating Columns**

By default, grids contain only one column. If you were to start adding items, each item would be put on a new row; that’s not much of a grid! To change this, we need to explicitly define the number of rows and columns in our grid.

We can define the columns of our grid by using the CSS property `grid-template-columns`. Below is an example of this property in action:

```css
.grid {
  display: grid;
  width: 500px;
  grid-template-columns: 100px 200px;
}
```

This property creates two changes. First, it defines the number of columns in the grid; in this case, there are two. Second, it sets the width of each column. The first column will be 100 pixels wide and the second column will be 200 pixels wide.

We can also define the size of our columns as a percentage of the entire grid’s width.

```css
.grid {
  display: grid;
  width: 1000px;
  grid-template-columns: 20% 50%;
}
```

In this example, the grid is 1000 pixels wide. Therefore, the first column will be 200 pixels wide because it is set to be 20% of the grid’s width. The second column will be 500 pixels wide.

We can also mix and match these two units. In the example below, there are three columns of width 20 pixels, 40 pixels, and 60 pixels:

```css
.grid {
  display: grid;
  width: 100px;
  grid-template-columns: 20px 40% 60px;
}
```

Notice that in this example, the total width of our columns (120 pixels) exceeds the width of the grid (100 pixels). This might make our grid cover other elements on the page! In a later exercise we will discuss how to avoid overflow.



**3 Creating Rows**

We’ve learned how to define the number of columns in our grid explicitly. To specify the number and size of the rows, we are going to use the property `grid-template-rows`.

This property is almost identical to `grid-template-columns`. Take a look at the code below to see both properties in action.

```css
.grid {
  display: grid;
  width: 1000px;
  height: 500px;
  grid-template-columns: 100px 200px;
  grid-template-rows: 10% 20% 600px;
}
```

This grid has two columns and three rows. `grid-template-rows` defines the number of rows and sets each row’s height. In this example, the first row is 50 pixels tall (10% of 500), the second row is 100 pixels tall (20% of 500), and the third row is 600 pixels tall.

When using percentages in these two properties, remember that rows are defined as a percentage of the grid’s height, and columns are defined as a percentage of its width.



**4 Grid Template**

The property `grid-template` can replace the previous two CSS properties. Both `grid-template-rows` and `grid-template-columns` are nowhere to be found in the following code!

```css
.grid {
  display: grid;
  width: 1000px;
  height: 500px;
  grid-template: 200px 300px / 20% 10% 70%; // rows / columns 
}
```

When using `grid-template`, the values before the slash will determine the size of each row. The values after the slash determine the size of each column. In this example, we’ve made two rows and three columns of varying sizes.

The same rules from before apply; when using percentages to set rows, each row will be a percentage of the grid’s total height. Columns are still a percentage of the total width.



**5 Fraction**

You may already be familiar with several types of responsive units such as percentages (`%`), `em`s and `rem`s. CSS Grid introduced a new relative sizing unit — `fr`, like fraction.

By using the `fr` unit, we can define the size of columns and rows as a fraction of the grid’s length and width. This unit was specifically created for use in CSS Grid. Using `fr` makes it easier to prevent grid items from overflowing the boundaries of the grid. Consider the code below:

```css
.grid {
  display: grid;
  width: 1000px;
  height: 400px;
  grid-template: 2fr 1fr 1fr / 1fr 3fr 1fr;
}
```

In this example, the grid will have three rows and three columns. The rows are splitting up the available 400 pixels of height into four parts. The first row gets two of those parts, the second row gets one, and the third row gets one. Therefore the first row is 200 pixels tall, and the second and third rows are 100 pixels tall.

Each column’s width is a fraction of the available space. In this case, the available space is split into five parts. The first column gets one-fifth of the space, the second column gets three-fifths, and the last column gets one-fifth. Since the total width is 1000 pixels, this means that the columns will have widths of 200 pixels, 600 pixels, and 200 pixels respectively.

It is possible to use `fr` with other units as well. When this happens, each `fr` represents a fraction of the *available* space.

```css
.grid {
  display: grid;
  width: 100px;
  grid-template-columns: 1fr 60px 1fr;
}
```

In this example, 60 pixels are taken up by the second column. Therefore the first and third columns have 40 available to split between them. Since each gets one fraction of the total, they both end up being 20 pixels wide.



**6 Repeat**

The properties that define the number of rows and columns in a grid can take a function as a value. `repeat()` is one of these functions. The `repeat()` function was created specifically for CSS Grid.

```css
.grid {
  display: grid;
  width: 300px;
  grid-template-columns: repeat(3, 100px);
}
```

The repeat function will duplicate the specifications for rows or columns a given number of times. In the example above, using the repeat function will make the grid have three columns that are each 100 pixels wide. It is the same as writing:

```css
grid-template-columns: 100px 100px 100px;
```

Repeat is particularly useful with `fr`. For example, `repeat(5, 1fr)` would split your table into five equal rows or columns.

Finally, the second parameter of `repeat()` can have multiple values.

```css
grid-template-columns: repeat(2, 20px 50px)
```

This code will create four columns where the first and third columns will be 20 pixels wide and the second and fourth will be 50 pixels wide.



**7 minmax**

So far, all of the grids that we have worked with have been a fixed size. The grid in our example has been 400 pixels wide and 500 pixels tall. But sometimes you might want a grid to resize based on the size of your web browser.

In these situations, you might want to prevent a row or column from getting too big or too small. For example, if you have a 100-pixel wide image in your grid, you probably don’t want its column to get thinner than 100 pixels! The `minmax()` function can help us solve this problem.

```css
.grid {
  display: grid;
  grid-template-columns: 100px minmax(100px, 500px) 100px;
}
```

In this example, the first and third columns will always be 100 pixels wide, no matter the size of the grid. The second column, however, will vary in size as the overall grid resizes. The second column will always be between 100 and 500 pixels wide.



**8 Grid Gap**

In all of our grids so far, there hasn’t been any space between the items in our grid. The CSS properties `grid-row-gap` and `grid-column-gap` will put blank space between every row and column in the grid.

```css
.grid {
  display: grid;
  width: 320px;
  grid-template-columns: repeat(3, 1fr);
  grid-column-gap: 10px;
}
```

It is important to note that `grid-gap` does not add space at the beginning or end of the grid. In the example code, our grid will have three columns with two ten-pixel gaps between them.

Let’s quickly calculate how wide these columns are. Remember that using `fr` considers all of the *available* space. The grid is 320 pixels wide and 20 of those pixels are taken up by the two grid gaps. Therefore each column takes a piece of the 300 available pixels. Each column gets `1fr`, so the columns are evenly divided into thirds (or 100 pixels each).

Finally, there is a CSS property `grid-gap` that can set the row and column gap at the same time. `grid-gap: 20px 10px;` will set the distance between rows to 20 pixels and the distance between columns to 10 pixels. Unlike other CSS grid properties, this shorthand does not take a `/` between values! If only one value is given, it will set the column gap and the row gap to that value.



**9 Grid Items**

In this lesson, we have learned how to define a grid container. When explicitly defining a grid, you have to declare the quantity of rows and columns and their respective sizes.

In all of our examples, the items placed in the grid have always taken up exactly one square. This does not always need to be the case; we can drastically change the look of our grid by making grid items take up more than one row and one column. You can see this in the diagram to the right. Items A, B, C, and E span more than one row!

In the following exercises, you will learn CSS properties that will affect the size of the *grid items* and where they are displayed on the page. By manipulating both the parent and the child elements, we can create beautiful layouts with ease.

Let’s start exploring grid items!

![image-20210226143953691](https://tva1.sinaimg.cn/large/008eGmZEgy1go19neob3sj318f0u0q58.jpg)



**10 Multiple Row Items**

Using the CSS properties `grid-row-start` and `grid-row-end`, we can make single grid items take up multiple rows. Remember, we are no longer applying CSS to the outer grid container; we’re adding CSS to the elements sitting inside the grid!

```css
.item {
  grid-row-start: 1;
  grid-row-end: 3;
}
```

In this example, the HTML element of class `item` will take up two rows in the grid, rows 1 and 2. The values that `grid-row-start` and `grid-row-end` accept are *grid lines*.

Row grid lines and column grid lines start at 1 and end at a value that is 1 greater than the number of rows or columns the grid has. For example, if a grid has 5 rows, the grid row lines range from 1 to 6. If a grid has 8 rows, the grid row lines range from 1 to 9.

The value for `grid-row-start` should be the row at which you want the grid item to begin. The value for `grid-row-end` should be one greater than the row at which you want the grid item to end. An element that covers rows 2, 3, and 4 should have these declarations: `grid-row-start: 2` and `grid-row-end: 5`.

It is possible for the value of `grid-row-start` to be greater than that of `grid-row-end`. Both properties can also each have negative values. Consult the [documentation](https://developer.mozilla.org/en-US/docs/Web/CSS/grid-row-start) to learn more about how to use these features.



**11 Grid Row**

We can use the property `grid-row` as shorthand for `grid-row-start` and `grid-row-end`. The following two code blocks will produce the same output:

```css
.item {
  grid-row-start: 4;
  grid-row-end: 6;
}
.item {
  grid-row: 4 / 6;
}
```

This code should look similar to the way `grid-template` is shorthand for `grid-template-rows`and `grid-template-columns`. In this case, the starting row goes before the “/“ and the ending row goes after it. Again, the ending row is exclusive; this grid item will occupy rows four and five.

When an item spans multiple rows or columns using these properties, it will also include the `grid-gap` if any exists. For example, if an item spans two rows of height 100 pixels and there is a ten-pixel grid-gap, then the item will have a total height of 210 pixels.



**12 Grid Column**

The previous three properties also exist for columns. `grid-column-start`, `grid-column-end` and `grid-column` work identically to the row properties. These properties allow a grid item to span multiple columns.

When using these properties, we can use the keyword `span` to start or end a column or row relative to its other end. Look at how `span` is used in the code below:

```css
.item {
  grid-column: 4 / span 2;
}
```

This is telling the `item` element to begin in column four and take up two columns of space. So `item` would occupy columns four and five. It produces the same result as the following code blocks:

```css
.item {
  grid-column: 4 / 6;
}
.item {
  grid-column-start: 4;
  grid-column-end: span 2;
}
.item {
  grid-column-start: span 2;
  grid-column-end: 6;
}
```

`span` is a useful keyword, because it avoids off-by-one errors (miscalculating the ending grid line) you might make when determining the ending grid line of an element. If you know where you want your grid item to start and how long it should be, use `span`!



**13 Grid Area**

We’ve already been able to use `grid-row` and `grid-column` as shorthand for properties like `grid-row-start` and `grid-row-end`. We can refactor even more using the property `grid-area`. This property will set the starting and ending positions for both the rows and columns of an item.

```css
.item {
  grid-area: 2 / 3 / 4 / span 5;
}
```

`grid-area` takes four values separated by slashes. The order is important! This is how `grid-area` will interpret those values.

1. `grid-row-start`
2. `grid-column-start`
3. `grid-row-end`
4. `grid-column-end`


In the above example, the item will occupy rows two and three and columns three through eight.

Using `grid-area` is an easy way to place items exactly where you want them in a grid.



**14 Grid Template Areas**

The `grid-template-areas` property allows you to name sections of your web page to use as values in the `grid-row-start`, `grid-row-end`, `grid-col-start`,`grid-col-end`, and `grid-area` properties.

```html
<div class="container">
  <header>Welcome!</header>
  <nav>Links!</nav>
  <section class="info">Info!</section>
  <section class="services">Services!</section>
  <footer>Contact us!</footer>
</div>
```
```css
.container {
  display: grid;
  max-width: 900px;
  position: relative;
  margin: auto;
  grid-template-areas: "head head"
                       "nav nav" 
                       "info services"
                       "footer footer";
  grid-template-rows: 300px 120px 800px 120px;
  grid-template-columns: 1fr 3fr; 
}
 
header {
  grid-area: head;
} 
 
nav {
  grid-area: nav;
} 
 
.info {
  grid-area: info;
} 
 
.services {
  grid-area: services;
}
 
footer {
  grid-area: footer;
} 
```

You may want to expand this section of the website to view the code above more clearly.

1. In the example above, the HTML creates a web page with five distinct parts.
2. The `grid-template-areas` declaration in the `.container` rule set creates a 2-column, 4-row layout.
3. The `grid-template-rows` declaration specifies the height of each of the four rows from top to bottom: 300 pixels, 120 pixels, 800 pixels, and 120 pixels.
4. The `grid-template-columns` declaration uses the `fr` value to cause the left column to use one fourth of the available space on the page and the right column to use three-fourths of the available space on the page.
5. In each rule set below `.container`, we use the `grid-area` property to tell that section to cover the portion of the page specified. The `header` element spans the first row and both columns. The `nav` element spans the second row and both columns. The element with class `.info` spans the third row and left column. The element with class `.services` spans the third row and right column. The `footer` element spans the bottom row and both columns.
6. That’s it! An entire page laid out in 40 lines of code.

This property is declared on grid containers.

You can see what you’ll be building in this exercise [here](https://content.codecademy.com/courses/learn-css-grid/lesson-ii/grid-template-areas/index.html).



**15 Overlapping Elements**

Another powerful feature of CSS Grid Layout is the ability to easily overlap elements.

When overlapping elements, it is generally easiest to use grid line names and the `grid-area` property.

```html
<div class="container">
  <div class="info">Info!</div> 
  <img src="#" />
  <div class="services">Services!</div>
</div>
```
```css
.container {
  display: grid;
  grid-template: repeat(8, 200px) / repeat(6, 100px);
}
.info {
  grid-area: 1 / 1 / 9 / 4;
}
 
.services {
  grid-area: 1 / 4 / 9 / 7;
}
 
img {
  grid-area: 2 / 3 / 5 / 5;
  z-index: 5;
}
```

In the example above, there is a grid container with eight rows and six columns. There are three grid items within the container — a `<div>` with the class `info`, a `<div>` with the class `services`, and an image.

The `info` section covers all eight rows and the first three columns. The `services` section covers all eight rows and the last three columns.

The image spans the 2nd, 3rd, and 4th rows and the 3rd and 4th columns.

The z-index property tells the browser to render the image element on top of the `services` and `info` sections so that it is visible.



**16 Justify Items**

We have referred to “two-dimensional grid-based layout” several times throughout this course.

There are two axes in a grid layout — the *column* (or block) axis and the *row* (or inline) axis.

The column axis stretches from top to bottom across the web page.

The row axis stretches from left to right across the web page.

In the following four exercises, we will learn and use properties that rely on an understanding of grid axes.

`justify-items` is a property that positions grid items along the inline, or row, axis. This means that it positions items from left to right across the web page.

`justify-items` accepts these values:

- `start` — aligns grid items to the left side of the grid area
- `end` — aligns grid items to the right side of the grid area
- `center` — aligns grid items to the center of the grid area
- `stretch` — stretches all items to fill the grid area

There are several other values that `justify-items` accepts, which you can read about on the [Mozilla Developer Network](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout/Box_Alignment_in_CSS_Grid_Layout#Justifying_Items_on_the_Inline_or_Row_Axis). The definitions for these values can also be found in the [documentation](https://developer.mozilla.org/en-US/docs/Web/CSS/justify-items#Values). It is important to note that the page with the definitions includes some values that are not accepted in CSS Grid layout.

```html
<main>
  <div class="card">Card 1</div>
  <div class="card">Card 2</div>
  <div class="card">Card 3</div>
</main>
```
```css
main {
  display: grid;
  grid-template-columns: repeat(3, 400px);
  justify-items: center;
}
```

In the example above, we use `justify-items` to adjust the positioning of some elements on this web page.

1. There is a grid container with three columns that are each 400 pixels wide.
2. The container has three grid items that do not have a specified width.
3. Without setting the `justify-items` property, these elements will span the width of the column they are in (400 pixels).
4. By setting the `justify-items` property to `center`, the `.card` `<div>`s will be centered inside of their columns. They will only be as wide as necessary to contain their content (the words Card 1, etc).
5. If we specify a width for the `.card` elements, they will not stretch the width of their column.

This property is declared on grid containers.



**17 Justify Content**

In the previous exercise, we learned how to position elements within their columns. In this exercise, we will learn how to position a grid within its parent element.

We can use `justify-content` to position the entire grid along the row axis.

It accepts these values:

- `start` — aligns the grid to the left side of the grid container
- `end` — aligns the grid to the right side of the grid container
- `center` — centers the grid horizontally in the grid container
- `stretch` — stretches the grid items to increase the size of the grid to expand horizontally across the container
- `space-around` — includes an equal amount of space on each side of a grid element, resulting in double the amount of space between elements as there is before the first and after the last element
- `space-between` — includes an equal amount of space between grid items and no space at either end
- `space-evenly` — places an even amount of space between grid items and at either end

There are several other values that `justify-content` accepts, which you can read about on the [Mozilla Developer Network](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout/Box_Alignment_in_CSS_Grid_Layout#Aligning_the_grid_tracks_on_the_block_or_column_axis). The definitions for these values can also be found in the [documentation](https://developer.mozilla.org/en-US/docs/Web/CSS/justify-content#Values). It is important to note that the page with the definitions includes some values that are not accepted in CSS Grid layout.

```html
<main>
  <div class="left">Left</div>
  <div class="right">Right</div>
</main>
```
```css
main {
  display: grid;
  width: 1000px;
  grid-template-columns: 300px 300px;
  grid-template-areas: "left right"; 
  justify-content: center;
}
```

1. In the example above, the grid container is 1000 pixels wide, but we only specified two columns that are 300 pixels each. This will leave 400 pixels of unused space in the grid container.
2. `justify-content: center;` positions the columns in the center of the grid, leaving 200 pixels on the right and 200 pixels on the left of the grid.

This property is declared on grid containers.



**18 Align Items**

In the previous two exercises, we learned how to position grid items and grid columns from left to right across the page. Below, we’ll learn how to position grid items from top to bottom!

`align-items` is a property that positions grid items along the block, or column axis. This means that it positions items from top to bottom.

`align-items` accepts these values:

- `start` — aligns grid items to the top side of the grid area
- `end` — aligns grid items to the bottom side of the grid area
- `center` — aligns grid items to the center of the grid area
- `stretch` — stretches all items to fill the grid area

There are several other values that `align-items` accepts, which you can read about on the [Mozilla Developer Network](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout/Box_Alignment_in_CSS_Grid_Layout#Aligning_items_on_the_block_or_column_Axis). The definitions for these values can also be found in the [documentation](https://developer.mozilla.org/en-US/docs/Web/CSS/justify-items#Values). It is important to note that the page with the definitions includes some values that are not accepted in CSS Grid layout.

```html
<main>
  <div class="card">Card 1</div>
  <div class="card">Card 2</div>
  <div class="card">Card 3</div>
</main>
```
```css
main {
  display: grid;
  grid-template-rows: repeat(3, 400px);
  align-items: center;
}
```

In the example above, we use `align-items` to adjust the positioning of some elements on this web page.

1. There is a grid container with three rows that are 400 pixels tall.
2. The container has three grid items that do not have a specified width.
3. Without setting the `align-items` property, these elements will span the height of the row they are in (400 pixels).
4. By setting the `align-items` property to `center`, the `.card` `<div>`s will be centered vertically inside of their rows. They will only be as tall as necessary to contain their content (the words Card 1, etc).
5. If we specify a height for the `.card` elements, they will not stretch the height of their row even if `align-items: stretch;` is set.

This property is declared on grid containers.



**19 Align Content**

In the previous exercise, we positioned grid items within their rows. `align-content` positions the rows along the column axis, or from top to bottom.

It accepts these positional values:

- `start` — aligns the grid to the top of the grid container
- `end` — aligns the grid to the bottom of the grid container
- `center` — centers the grid vertically in the grid container
- `stretch` — stretches the grid items to increase the size of the grid to expand vertically across the container
- `space-around` — includes an equal amount of space on each side of a grid element, resulting in double the amount of space between elements as there is before the first and after the last element
- `space-between` — includes an equal amount of space between grid items and no space at either end
- `space-evenly` — places an even amount of space between grid items and at either end

There are several other values that `align-content` accepts, which you can read about on the [Mozilla Developer Network](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout/Box_Alignment_in_CSS_Grid_Layout#Aligning_the_grid_tracks_on_the_block_or_column_axis). The definitions for these values can also be found in the [documentation](https://developer.mozilla.org/en-US/docs/Web/CSS/align-content#Values). It is important to note that the page with the definitions includes some values that are not accepted in CSS Grid layout.

```html
<main>
  <div class="top">Top</div>
  <div class="bottom">Bottom</div>
</main>
```
```css
main {
  display: grid;
  height: 600px;
  rows: 200px 200px;
  grid-template-areas: "top"
                       "bottom"; 
  align-content: center;
}
```

1. In the example above, the grid container is 600 pixels tall, but we only specified two rows that are 200 pixels each. This will leave 200 pixels of unused space in the grid container.
2. `align-content: center;` positions the rows in the center of the grid, leaving 100 pixels at the top and 100 pixels at the bottom of the grid.

This property is declared on grid containers.



**20 Justify Self and Align Self**

The `justify-items` and `align-items` properties specify how all grid items contained within a single container will position themselves along the row and column axes, respectively.

`justify-self` specifies how an individual element should position itself with respect to the row axis. This property will override `justify-items` for any item on which it is declared.

`align-self` specifies how an individual element should position itself with respect to the column axis. This property will override `align-items` for any item on which it is declared.

They both accept these four properties: 

- `start` — positions grid items on the left side/top of the grid area
- `end` — positions grid items on the right side/bottom of the grid area
- `center` — positions grid items on the center of the grid area
- `stretch` — positions grid items to fill the grid area (default)

`align-self` and `justify-self` accept the same values as `align-items` and `justify-items`. You can read about these values on the [Mozilla Developer Network](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout/Box_Alignment_in_CSS_Grid_Layout#Aligning_the_grid_tracks_on_the_block_or_column_axis). The definitions for these values can also be found in the [documentation](https://developer.mozilla.org/en-US/docs/Web/CSS/align-self#Values). It is important to note that the page with the definitions includes some values that are not accepted in CSS Grid layout.

These properties are declared on grid items.



**21 Grid Auto Rows and Grid Auto Columns**

CSS Grid provides two properties to specify the size of grid tracks added implicitly: `grid-auto-rows` and `grid-auto-columns`.

`grid-auto-rows` specifies the height of implicitly added grid rows. `grid-auto-columns` specifies the width of implicitly added grid columns.

`grid-auto-rows` and `grid-auto-columns` accept the same values as their explicit counterparts, `grid-template-rows` and `grid-template-columns`:

- pixels (`px`)
- percentages (`%`)
- fractions (`fr`)
- the `repeat()` function

```html
<body>
  <div>Part 1</div>   
  <div>Part 2</div>
  <div>Part 3</div>
  <div>Part 4</div>
  <div>Part 5</div>
</body>
```
```css
body {
  display: grid;
  grid: repeat(2, 100px) / repeat(2, 150px); 
  grid-auto-rows: 50px;
}
```

In the example above, there are 5 `<div>`s. However, in the `section` rule set, we only specify a 2-row, 2-column grid — four grid cells.

The fifth `<div>` will be added to an implicit row that will be 50 pixels tall.

If we did not specify `grid-auto-rows`, the rows would be auto-adjusted to the height of the content of the grid items.

These properties are declared on grid containers.



**22 Grid Auto Flow**

In addition to setting the dimensions of implicitly-added rows and columns, we can specify the order in which they are rendered.

`grid-auto-flow` specifies whether new elements should be added to rows or columns.

`grid-auto-flow` accepts these values:

- `row` — specifies the new elements should fill rows from left to right and create new rows when there are too many elements (default)
- `column` — specifies the new elements should fill columns from top to bottom and create new columns when there are too many elements
- `dense` — this keyword invokes an algorithm that attempts to fill holes earlier in the grid layout if smaller elements are added

You can pair `row` and `column` with `dense`, like this: `grid-auto-flow: row dense;`.

This property is declared on grid containers.