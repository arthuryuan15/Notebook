# Back-End

## 1 What is a Back-End?

**1 Front and Back**

In this lesson, we’ll explain what makes up the back-end of a web application or website. The back-end can feel very abstract, but it becomes clearer when we explain it in terms of the front-end! To oversimplify a bit, the front-end is the parts of a webpage that a visitor can interact with and see. 

Various tools and frameworks can be used to make a webpage, but, at its core, the front-end is composed of JavaScript, CSS, HTML, and other *static assets*, such as images or videos. Static assets are files that don’t change. When a visitor navigates to a webpage, these assets are sent to their browser. 

Visiting a simple website is like ordering delivery from a restaurant: we place an order for our meal, and, once it’s delivered to us, we have it entirely in our possession. In this analogy, we can think of the front-end as everything that’s dropped off with the delivery: the containers, the utensils, and the food itself. 

You’ll sometimes hear front-end development referred to as *client-side* development. Our instinct might be to think of the client as the human visitor or user of a website, but when referring to the client in web development, we’re usually referring to the non-human requester of content. In the case of visiting a website, the client is the browser, but in other circumstances, a client might be another application, a mobile device, or even a “smart” appliance! 

While the front-end is the part of the website that makes it to the browser, the back-end consists of all the behind-the-scenes processes and data that make a website function and send resources to clients.



**2 So What is the Back-end?**

When a user navigates to google.com, their request specifies the URL but not the filename for today’s [Google Doodle](https://en.wikipedia.org/wiki/Google_Doodle). The web application’s back-end will need to hold the logic for deciding which assets to send. Moreover, modern web applications often cater to the specific user rather than sending the same files to every visitor of a webpage. This is known as *dynamic content*. 

When we eat at a restaurant, we’ll order to our tastes, make substitutions, etc; the result is a dining experience unique to us. Aside from that, there’s a lot happening behind the scenes to make a restaurant work: ingredients are ordered from suppliers, new menus are designed, and employees’ schedules are created. Similarly, to make a web application that runs smoothly, the back-end is doing a lot more than simply sending assets to browsers.

The collection of programming logic required to deliver dynamic content to a client, manage security, process payments, and myriad other tasks is sometimes known as the “application” or *application server*. The application server can be responsible for anything from sending an email confirmation after a purchase to running the complicated algorithms a search engine uses to give us meaningful results.



**3 Storing Data**

You’ve probably heard that data is a big deal. By some measures, 90% of the world’s data has been generated in just the past two years! From a stored credit card number on an e-commerce site to the timestamp when you hit pause on Netflix, modern web applications collect a lot of data. For that data to be useful, it has to be organized and stored somewhere. 

The back-ends of modern web applications include some sort of *database*, often more than one. Databases are collections of information. There are many different databases, but we can divide them into two types: [relational databases](https://www.codecademy.com/articles/what-is-rdbms-sql) and [non-relational databases (also known as NoSQL databases)](https://en.wikipedia.org/wiki/NoSQL). Whereas relational databases store information in tables with columns and rows, non-relational databases might use other systems such as key-value pairs or a document storage model. *SQL*, **S**tructured **Q**uery **L**anguage, is a programming language for accessing and changing data stored in relational databases. Popular relational databases include [MySQL](https://www.mysql.com/) and [PostgreSQL](https://www.postgresql.org/) while popular NoSQL databases include [MongoDB](https://www.mongodb.com/) and [Redis](https://redis.io/). 

In addition to the database itself, the back-end needs a way to programmatically access, change, and analyze the data stored there.

![image-20210301113306369](https://p.ipic.vip/ldzqd9.jpg)



**4 What is an API?**

When a user navigates to a specific item for sale on an e-commerce site, the price listed for that item is stored in a database, and when they purchase it, the database will need to be updated with the correct inventory for that item type. In fact, much of what the back-end entails is reading, updating, or deleting information stored in a database. 

In order to have consistent ways of interacting with data, a back-end will often include a *web API*. API stands for **A**pplication **P**rogram **I**nterface and can mean a lot of different things, but a *web API* is a collection of predefined ways of, or rules for, interacting with a web application’s data, often through an HTTP request-response cycle. Unlike the HTTP requests a client makes when a user navigates to a website’s URL, this type of request indicates how it would like to interact with a web application’s data (create new data, read existing data, update existing data, or delete existing data), and it receives some data back as a response.

Let’s walk through the example of making an online purchase again, but this time, we’ll imagine how the application’s web API might be used. When a user presses the button to submit an order, that will trigger a request to send them to a different view of the website, an order confirmation page, but an additional request will be triggered from the front-end, unseen by the user, to the web API so that the database can be updated with the information from the order.

Some web APIs are open to the public. [Instagram](https://www.instagram.com/developer/), for example, has an API that other developers can use to access some of the data Instagram stores. Others are only used by the web application internally— Codecademy, for example, has a web API that employees use to accomplish internal tasks.



**5 Authorization and Authentication**

Two other concepts we’ll want our server-side logic to handle are *authentication* and *authorization*. 

*Authentication* is the process of validating the identity of a user. One technique for authentication is to use logins with usernames and passwords. These credentials need to be securely stored in the back-end on a database and checked upon each visit. Web applications can also use external resources for authentication. You’ve likely logged into a website or application using your Facebook, Google, or Github credentials; that’s also an authentication process.

*Authorization* controls which users have access to which resources and actions. Certain application views, like the page to edit a social media personal profile, are only accessible to that user. Other activities, like deleting a post, are often similarly restricted.

When building a robust web application back-end, we need to incorporate both authentication (Who is this user? Are they who they claim to be?) and authorization (Who is allowed to do and see what?) into our server-side logic to make sure we’re creating secure, personalized, and dynamic content.



**6 Different Back-end Stacks**

Unlike the front-end, which must be built using HTML, CSS, and JavaScript, there’s a lot of flexibility in which technologies can be used in order to create the back-end of a web application. Developers can construct back-ends in many different languages like PHP, Java, JavaScript, Python, and more. 

You don’t need to reinvent the wheel to create a robust back-end. Instead, most developers make use of *frameworks* which are collections of tools that shape the organization of your back-end and provide efficient ways of accomplishing otherwise difficult tasks.

There are numerous [back-end frameworks](https://developer.mozilla.org/en-US/docs/Learn/Server-side/First_steps/Web_frameworks#A_few_good_web_frameworks) from which developers can choose. Here are a few examples: 

| **Framework**                                                | **Language**                                                 |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [Laravel](https://laravel.com/)                              | [PHP](http://www.php.net/)                                   |
| [Express.js](https://expressjs.com/)                         | [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) (runs in the [Node environment](https://nodejs.org/en/)) |
| [Ruby on Rails](https://rubyonrails.org/)                    | [Ruby](https://www.ruby-lang.org/en/)                        |
| [Spring](https://spring.io/)                                 | [Java](https://www.oracle.com/java/)                         |
| [JSF](https://www.oracle.com/technetwork/java/javaee/javaserverfaces-139869.html) | [Java](https://www.oracle.com/java/)                         |
| [Flask](http://flask.pocoo.org/)                             | [Python](https://www.python.org/)                            |
| [Django](https://www.djangoproject.com/)                     | [Python](https://www.python.org/)                            |
| [ASP.NET](https://dotnet.microsoft.com/learn/aspnet/what-is-aspnet) | [C#](https://dotnet.microsoft.com/learn/csharp)              |



The collection of technologies used to create the front-end and back-end of a web application is referred to as a *stack*. This is where the term *full-stack developer* comes from; rather than working in either the front-end or the back-end exclusively, a full-stack developer works in both. 

For example, [the MEAN stack](https://en.wikipedia.org/wiki/MEAN_(software_bundle)) is a technology stack for building web applications that uses **M**ongoDB, **E**xpress.js, **A**ngularJS, and **N**ode.js: MongoDB is used as the database, Node.js with Express.js for the rest of the back-end, and Angular is used as a front-end framework. While the [LAMP Stack](https://en.wikipedia.org/wiki/LAMP_(software_bundle)), sometimes considered the archetypal stack, uses **L**inux, **A**pache, **M**ySQL, and **P**HP.



## 2 What is REST?

**1 REpresentational State Transfer**

REST, or REpresentational State Transfer, is an architectural style for providing standards between computer systems on the web, making it easier for systems to communicate with each other. REST-compliant systems, often called RESTful systems, are characterized by how they are stateless and separate the concerns of client and server. We will go into what these terms mean and why they are beneficial characteristics for services on the Web. 

**2  Separation of Client and Server**

In the REST architectural style, the implementation of the client and the implementation of the server can be done independently without each knowing about the other. This means that the code on the client side can be changed at any time without affecting the operation of the server, and the code on the server side can be changed without affecting the operation of the client.

As long as each side knows what format of messages to send to the other, they can be kept modular and separate. Separating the user interface concerns from the data storage concerns, we improve the flexibility of the interface across platforms and improve scalability by simplifying the server components. Additionally, the separation allows each component the ability to evolve independently.

By using a REST interface, different clients hit the same REST endpoints, perform the same actions, and receive the same responses. 

**3 Statelessness**

Systems that follow the REST paradigm are stateless, meaning that the server does not need to know anything about what state the client is in and vice versa. In this way, both the server and the client can understand any message received, even without seeing previous messages. This constraint of statelessness is enforced through the use of *resources*, rather than *commands*. Resources are the nouns of the Web - they describe any object, document, or *thing* that you may need to store or send to other services.

Because REST systems interact through standard operations on resources, they do not rely on the implementation of interfaces.

These constraints help RESTful applications achieve reliability, quick performance, and scalability, as components that can be managed, updated, and reused without affecting the system as a whole, even during operation of the system.

Now, we’ll explore how the communication between the client and server actually happens when we are implementing a RESTful interface.

**4 Communication between Client and Server**

In the REST architecture, clients send requests to retrieve or modify resources, and servers send responses to these requests. Let’s take a look at the standard ways to make requests and send responses.

**5 Making Requests**

REST requires that a client make a request to the server in order to retrieve or modify data on the server. A request generally consists of:

- an HTTP verb, which defines what kind of operation to perform
- a *header*, which allows the client to pass along information about the request 
- a path to a resource
- an optional message body containing data

**6 HTTP Verbs**

There are 4 basic HTTP verbs we use in requests to interact with resources in a REST system:

- GET — retrieve a specific resource (by id) or a collection of resources
- POST — create a new resource
- PUT — update a specific resource (by id)
- DELETE — remove a specific resource by id

You can learn more about these HTTP verbs in the following Codecademy article: 

- [What is CRUD?](https://www.codecademy.com/articles/what-is-crud)

**7 Headers and Accept parameters**

In the header of the request, the client sends the type of content that it is able to receive from the server. This is called the `Accept` field, and it ensures that the server does not send data that cannot be understood or processed by the client. The options for types of content are MIME Types (or Multipurpose Internet Mail Extensions, which you can read more about in the [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types).

MIME Types, used to specify the content types in the `Accept` field, consist of a `type` and a `subtype`. They are separated by a slash (/). 

For example, a text file containing HTML would be specified with the type `text/html`. If this text file contained CSS instead, it would be specified as `text/css`. A generic text file would be denoted as `text/plain`. This default value, `text/plain`, is not a catch-all, however. If a client is expecting `text/css` and receives `text/plain`, it will not be able to recognize the content.

Other types and commonly used subtypes:

- `image` — `image/png`, `image/jpeg`, `image/gif`
- `audio` — `audio/wav`, `audio/mpeg`
- `video` — `video/mp4`, `video/ogg`
- `application` — `application/json`, `application/pdf`, `application/xml`, `application/octet-stream`

For example, a client accessing a resource with `id` 23 in an `articles` resource on a server might send a GET request like this:

```
GET /articles/23
Accept: text/html, application/xhtml
```

The `Accept` header field in this case is saying that the client will accept the content in `text/html` or `application/xhtml`.

**8 Paths**

Requests must contain a path to a resource that the operation should be performed on. In RESTful APIs, paths should be designed to help the client know what is going on. 

Conventionally, the first part of the path should be the plural form of the resource. This keeps nested paths simple to read and easy to understand.

A path like `fashionboutique.com/customers/223/orders/12` is clear in what it points to, even if you’ve never seen this specific path before, because it is hierarchical and descriptive. We can see that we are accessing the order with `id` 12 for the customer with `id` 223.

Paths should contain the information necessary to locate a resource with the degree of specificity needed. When referring to a list or collection of resources, it is not always necessary to add an `id`. For example, a POST request to the `fashionboutique.com/customers` path would not need an extra identifier, as the server will generate an `id` for the new object. 

If we are trying to access a single resource, we would need to append an `id` to the path. For example: `GET fashionboutique.com/customers/:id` — retrieves the item in the `customers` resource with the `id` specified. `DELETE fashionboutique.com/customers/:id`— deletes the item in the `customers` resource with the `id` specified.

**9 Sending Responses**

**9.1 Content Types**

In cases where the server is sending a data payload to the client, the server must include a `content-type` in the header of the response. This `content-type` header field alerts the client to the type of data it is sending in the response body. These content types are MIME Types, just as they are in the `accept` field of the request header. The `content-type` that the server sends back in the response should be one of the options that the client specified in the `accept` field of the request. 

For example, when a client is accessing a resource with `id` 23 in an `articles` resource with this GET Request:

```
GET /articles/23 HTTP/1.1
Accept: text/html, application/xhtml
```

The server might send back the content with the response header:

```
HTTP/1.1 200 (OK)
Content-Type: text/html
```

This would signify that the content requested is being returning in the response body with a `content-type` of `text/html`, which the client said it would be able to accept.

**9.2 Response Codes**

Responses from the server contain status codes to alert the client to information about the success of the operation. As a developer, you do not need to know every status code (there are [many](http://www.restapitutorial.com/httpstatuscodes.html) of them), but you should know the most common ones and how they are used:

| Status code                 | Meaning                                                      |
| --------------------------- | ------------------------------------------------------------ |
| 200 (OK)                    | This is the standard response for successful HTTP requests.  |
| 201 (CREATED)               | This is the standard response for an HTTP request that resulted in an item being successfully created. |
| 204 (NO CONTENT)            | This is the standard response for successful HTTP requests, where nothing is being returned in the response body. |
| 400 (BAD REQUEST)           | The request cannot be processed because of bad request syntax, excessive size, or another client error. |
| 403 (FORBIDDEN)             | The client does not have permission to access this resource. |
| 404 (NOT FOUND)             | The resource could not be found at this time. It is possible it was deleted, or does not exist yet. |
| 500 (INTERNAL SERVER ERROR) | The generic answer for an unexpected failure if there is no more specific information available. |

For each HTTP verb, there are expected status codes a server should return upon success:

- GET — return 200 (OK)
- POST — return 201 (CREATED)
- PUT — return 200 (OK)
- DELETE — return 204 (NO CONTENT) If the operation fails, return the most specific status code possible corresponding to the problem that was encountered. 

**9.3 Examples of Requests and Responses**

Let’s say we have an application that allows you to view, create, edit, and delete customers and orders for a small clothing store hosted at `fashionboutique.com`. We could create an HTTP API that allows a client to perform these functions:

If we wanted to view all customers, the request would look like this:

```
GET http://fashionboutique.com/customers
Accept: application/json
```

A possible response header would look like:

```
Status Code: 200 (OK)
Content-type: application/json
```

followed by the `customers` data requested in `application/json` format.

Create a new customer by posting the data:

```
POST http://fashionboutique.com/customers
Body:
{
  “customer”: {
    “name” = “Scylla Buss”,
    “email” = “scylla.buss@codecademy.org”
  }
}
```

The server then generates an `id` for that object and returns it back to the client, with a header like:

```
201 (CREATED)
Content-type: application/json
```

To view a single customer we *GET* it by specifying that customer’s id:

```
GET http://fashionboutique.com/customers/123
Accept: application/json
```

A possible response header would look like:

```
Status Code: 200 (OK)
Content-type: application/json
```

followed by the data for the `customer` resource with `id` 23 in `application/json` format.

We can update that customer by *PUT* ting the new data:

```
PUT http://fashionboutique.com/customers/123
Body:
{
  “customer”: {
    “name” = “Scylla Buss”,
    “email” = “scyllabuss1@codecademy.com”
  }
}
```

A possible response header would have `Status Code: 200 (OK)`, to notify the client that the item with `id` 123 has been modified.

We can also *DELETE* that customer by specifying its `id`:

```
DELETE http://fashionboutique.com/customers/123
```

The response would have a header containing `Status Code: 204 (NO CONTENT)`, notifying the client that the item with `id` 123 has been deleted, and nothing in the body.

**10 Practice with REST**

Let’s imagine we are building a photo-collection site. We want to make an API to keep track of users, venues, and photos of those venues. This site has an `index.html` and a `style.css`. Each user has a username and a password. Each photo has a venue and an owner (i.e. the user who took the picture). Each venue has a name and street address. Can you design a REST system that would accommodate:

- storing users, photos, and venues
- accessing venues and accessing certain photos of a certain venue 

Start by writing out:

- what kinds of requests we would want to make
- what responses the server should return
- what the `content-type` of each response should be



**11 Possible Solution - Models**

```css
{
  “user”: {
    "id": <Integer>,
    “username”: <String>,
    “password”:  <String>
  }
}
{
  “photo”: {
    "id": <Integer>,
    “venue_id”: <Integer>,
    “author_id”: <Integer>
  }
}
{
  “venue”: {
    "id": <Integer>,
    “name”: <String>,
    “address”: <String>
  }
}
```

**12 Possible Solution - Requests/Responses**

**GET Requests**

Request- `GET /index.html` Accept: `text/html` Response- 200 (OK) Content-type: `text/html`

Request- `GET /style.css` Accept: `text/css` Response- 200 (OK) Content-type: `text/css`

Request- `GET /venues` Accept:`application/json` Response- 200 (OK) Content-type: `application/json`

Request- `GET /venues/:id` Accept: `application/json` Response- 200 (OK) Content-type: `application/json`

Request- `GET /venues/:id/photos/:id` Accept: `application/json` Response- 200 (OK) Content-type: `image/png`

**POST Requests**

Request- `POST /users` Response- 201 (CREATED) Content-type: `application/json`

Request- `POST /venues` Response- 201 (CREATED) Content-type: `application/json`

Request- `POST /venues/:id/photos` Response- 201 (CREATED) Content-type: `application/json`

**PUT Requests**

Request- `PUT /users/:id` Response- 200 (OK)

Request- `PUT /venues/:id` Response- 200 (OK)

Request- `PUT /venues/:id/photos/:id` Response- 200 (OK)

**DELETE Requests**

Request- `DELETE /venues/:id` Response- 204 (NO CONTENT)

Request- `DELETE /venues/:id/photos/:id` Response- 204 (NO CONTENT)



## 3 Build a Back-End with Node/Express.js

After this unit, you will be able to:

- Understand Node.js
- Create a server with Express.js
- Design/serve RESTful APIs
- Understand what CORS is
- Explain routing



### 1Introduction

For a long time, the browser was the only place JavaScript code could be executed. Web developers had to use a different programming language on the front-end than the back-end. It also meant that, even as JavaScript evolved into a more robust and powerful language, it remained a front-end only language. 

Though multiple attempts to create off-browser JavaScript environments have been attempted, [Node.js](https://nodejs.org/en/), invented by Ryan Dahl in 2009, found unprecedented popularity and is currently being used by numerous top-tier companies including Netflix, Uber, Paypal, and eBay. Node.js is a JavaScript *runtime*, or an environment that allows us to execute JavaScript code outside of the browser. A “runtime” converts code written in a *high-level*, human-readable, programming language and compiles it down to code the computer can execute.

Though Node was created with the goal of building web servers and web applications in JavaScript, it can also be used for creating command-line applications or desktop applications. In this lesson, we’ll explore some features of Node so you start to feel comfortable with running JavaScript in the Node environment and gain some familiarity with features unique to Node. For more advanced development, Node can be combined with any number of robust frameworks like the [Express.js framework](https://expressjs.com/) for creating effective web application back-ends. 

There’s more to learn about Node than we could ever fit in one lesson. We’ll try to point to great resources like [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript) and the [Node.js documentation](https://nodejs.org/api/). Take your time exploring and use the documentation.

```shell
node -v
```



###2 The Node REPL

[REPL](https://en.wikipedia.org/wiki/Read–eval–print_loop) is an abbreviation for **r**ead–**e**val–**p**rint **l**oop. It’s a program that **l**oops, or repeatedly cycles, through three different states: a **r**ead state where the program **r**eads input from a user, the **e**val state where the program **e**valuates the user’s input, and the **p**rint state where the program **p**rints out its evaluation to a console. Then it **l**oops through these states again. 

When you install Node, it comes with a built-in JavaScript REPL. You can access the REPL by typing the command `node` (with nothing after it) into the terminal and hitting enter. A `>` character will show up in the terminal indicating the REPL is running and prompting your input. The Node REPL will evaluate your input line by line. 

By default, you indicate the input is ready for eval when you hit enter. If you’d like to type multiple lines and then have them evaluated at once you can type `.editor` while in the REPL. Once in “editor” mode, you can type control + d when you’re ready for the input to be evaluated. Each session of the REPL has a single shared memory; you can access any variables or functions you define until you exit the REPL.

A REPL can be extremely useful for performing calculations, learning a language, and developing code. It’s a place where you can explore language features and try things out while receiving immediate feedback. Figuring out how to do this outside of the browser or a website can be really empowering. 

The Node environment contains a number of Node-specific global elements in addition to those [built into the JavaScript language](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects). Every Node-specific global property sits inside the [the Node `global` object](https://nodejs.org/api/globals.html). This object contains a number of useful properties and methods that are available anywhere in the Node environment. 

Let’s try out the Node REPL. This will be a good way for you to explore the Node `global` object!



###3 Running a Program with Node

Node was designed with server-side web development in mind and has a lot of thoughtful functionality towards that end. At its most simple, however, it provides the ability to run JavaScript programs on our own computers instead of just in the browser’s console or embedded in HTML. 

In this lesson, we’ll explore some of the functionality and properties specific to the Node environment, but first, let’s see how we run a program. 

We’ll need to create a file with a `.js` extension. We’ll call ours **myProgram.js**. Next, we’ll open that file with a text editor and add our code:

```shell
// Inside myProgram.js
console.log('Hello World');
```

Our code is complete! Now, we want to execute it. We’ll open our terminal and navigate to the directory that contains **myProgram.js**. Finally, we’ll type the command `node myProgram.js` into our terminal. 

```shell
$ node myProgram.js
```

The results of our program will print to the terminal. 

```
Hello World
```

Let’s write a program and run it in Node.



### 4 Accessing the Process Object

In computer science, a *process* is the instance of a computer program that is being executed. You can open Task Manager if you’re on a Windows machine or Activity Monitor from a Mac to see information about the various processes running on your computer right now. Node has a global `process` object with useful methods and information about the current process.

The `process.env` property is an object which stores and controls information about the environment in which the process is currently running. For example, the `process.env` object contains a `PWD` property which holds a string with the directory in which the current process is located. It can be useful to have some `if/else` logic in a program depending on the current environment— a web application in a development phase might perform different tasks than when it’s live to users. We could store this information on the `process.env`. One convention is to add a property to `process.env` with the key `NODE_ENV` and a value of either `production` or `development`. 

```javascript
if (process.env.NODE_ENV === 'development'){
  console.log('Testing! Testing! Does everything work?');
}
```

The `process.memoryUsage()` returns information on the CPU demands of the current process. It returns a property that looks similar to this:

```javascript
{ rss: 26247168,
  heapTotal: 5767168,
  heapUsed: 3573032,
  external: 8772 }
```

*Heap* can mean different things in different contexts: a heap can refer to [a specific data structure](https://en.wikipedia.org/wiki/Heap_(data_structure)), but it can also refer to the a block of [computer memory](https://en.wikipedia.org/wiki/Memory_management). `process.memoryUsage().heapUsed` will return a number representing how many bytes of memory the current process is using. 

The `process.argv` property holds an array of command line values provided when the current process was initiated. The first element in the array is the absolute path to Node, which ran the process. The second element in the array is the path to the file that’s running. The following elements will be any command line arguments provided when the process was initiated. Command line arguments are separated from one another with spaces.

```javascript
node myProgram.js testing several features
console.log(process.argv[3]); // Prints 'several'
```

We’ve only covered a few of the properties of the `process` object, so make sure to check out the [documentation on the `process` object](https://nodejs.org/api/process.html) to learn more about it and explore some of its other methods and properties. 

Let’s get some practice using the `process` object!



# Node

##1 Core Modules and Local Modules

*Modularity* is a software design technique where one program has distinct parts each providing a single piece of the overall functionality. These separate *modules* come together to build a cohesive whole. Modularity is essential for creating scalable programs which incorporate libraries and frameworks and separate the program’s concerns into manageable chunks. Essentially, a module is a collection of code located in a file. Instead of having an entire program located in a single file, code is organized into separate files and combined through *requiring* them where needed using the `require()` function. 

To save developers from having to reinvent the wheel each time, Node has several modules included within the environment to efficiently perform common tasks. These are known as the *core modules*. The core modules are defined within Node.js’s source and are located in the lib/ folder. Core modules are required by passing a string with the name of the module into the `require()` function:

```javascript
// Require in the 'events' core module:
let events = require('events');
```

We can use the same `require()` function to require modules of our own creation. To handle these different tasks, the `require()` function includes some interesting logic “under the hood.” The `require()`function will first check to see if its argument is a core module, if not, it will move on to different attempts to locate it. Check out the [Node Modules documentation](https://nodejs.org/api/modules.html#modules_modules)to learn more about how `require()` works. 

Let’s walk through the process of requiring a local module:

```javascript
// dog.js
module.exports = class Dog {
 
  constructor(name) {
    this.name = name;
  }
 
  praise() {
    return `Good dog, ${this.name}!`;
  }
};
 
```

Above, in the **dog.js** file, we assign the `Dog` class as the value of `module.exports`. Each JavaScript file in the Node environment has a special JavaScript object called `module.exports`. It holds everything in that file, or module, that’s available to be required into a different file.

```javascript
// app.js
let Dog = require('./dog.js');
const tadpole = new Dog('Tadpole');
console.log(tadpole.praise());
```

In our **app.js** file we assign the variable `Dog` to the `module.exports` object of our **dog.js** file by invoking the `require()` function. Unlike when we require core modules which are required in with the name of the module as a string, local modules are required by passing in the path to the module. The `require()`function has some other quirks, like assuming file extensions if none are provided; this means we could have written `let Dog = require('./dog');` in place of `let Dog = require('./dog.js');` in the code above, and the `require()` function would have still correctly located and required in **dog.js**.



##2 Event-Driven Architecture

Node is often described as having event-driven architecture. Let’s explore what that means. 

In traditional imperative programming, we give the computer a series of instructions to execute in a pre-defined order. In contrast, when we write web applications, we often need to write logic to handle situations without knowing exactly when they’ll occur. For example, when programming a website, we might provide functionality for a click event without knowing when a user will trigger it. When Node was created, it applied this same concept of event-driven principles to the back-end environment. 

Node provides an `EventEmitter` class which we can access by requiring in the `events` core module:

```javascript
// Require in the 'events' core module
let events = require('events');
 
// Create an instance of the EventEmitter class
let myEmitter = new events.EventEmitter();
```

Each event emitter instance has an `.on()` method which assigns a *listener* callback function to a named event. The `.on()` method takes as its first argument the name of the event as a string and, as its second argument, the listener callback function. 

Each event emitter instance also has an `.emit()`method which announces a named event has occurred. The `.emit()` method takes as its first argument the name of the event as a string and, as its second argument, the data that should be passed into the listener callback function. 

```javascript
let newUserListener = (data) => {
  console.log(`We have a new user: ${data}.`);
};
 
// Assign the newUserListener function as the listener callback for 'new user' events
myEmitter.on('new user', newUserListener)
 
// Emit a 'new user' event
myEmitter.emit('new user', 'Lily Pad') //newUserListener will be invoked with 'Lily Pad'
```

Let’s create an event emitter!



##3 User Input/Output

If you’ve worked with JavaScript before, you’re likely familiar with the concept of *input/output* even if you haven’t heard it called that. At its most abstract, output is any data or feedback that a computer provides (like to a human user), while input is data provided to the computer. When we use `console.log()` we prompt the computer to output information to the console. In the Node environment, the console is the terminal, and the `console.log()`method is a “thin wrapper” on the `.stdout.write()`method of the `process` object. `stdout` stands for standard output. 

In Node, we can also receive input from a user through the terminal using the `stdin.on()` method on the `process` object:

```javascript
process.stdin.on('data', (userInput) => {
  let input = userInput.toString()
  console.log(input)
});
```

Here, we were able to use `.on()` because under the hood `process.stdin` is an instance of `EventEmitter`. When a user enters text into the terminal and hits enter, a `'data'` event will be fired and our anonymous listener callback will be invoked. The `userInput` we receive is an instance of [the Node `Buffer` class](https://nodejs.org/api/buffer.html#buffer_buffer), so we convert it to a string before printing.

