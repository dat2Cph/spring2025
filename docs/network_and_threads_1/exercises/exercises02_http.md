---
title: HTTP
description: Exercises in using HTTP
layout: default
nav_order: 3
permalink: /network-threads-1/exercises/http/
parent: Exercises
grand_parent: Networking and Threads I
---
# Network Exercises Part 2: HTTP

## Task 1: Demo 03

In Demo 03, we take our first look at the HTTP protocol. We will study HTTP request and response headers and send HTML from the server.

1.1 Run Demo 03. Do this by starting the server, opening a browser, and sending an HTTP request: <http://localhost:9090>. What happens?

1.2 Also try <http://127.0.0.1:9090>. What happens—and why?

1.3 Review the code and try to explain to your partner what is happening. Use the README file that comes with the project for inspiration, if needed.

1.4 There is no unit test for Demo 03. Try creating one.

1.5 Try extending the HTML text so that it returns a small extra message, e.g., your name. Get help with HTML here: [https://www.w3schools.com/html/html_elements.asp](https://www.w3schools.com/html/html_elements.asp)

## Task 2: Parsing Headers

The concept of `[parsing](https://ordnet.dk/ddo/ordbog?entry_id=11038980&query=parsing)` comes from computer science. It means taking input text and analyzing it based on a given syntax. The goal is to use the text for something meaningful, but first, we need to ensure that the text follows some rules (syntax). While parsing the text, we can store its content or meaning in usable data structures, which can then be used later.

2.1 Analyze a Header

Imagine these lines of text:

```text
GET /pages/index.html HTTP/1.1
Host: www.example.com
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate, br
Connection: keep-alive
Upgrade-Insecure-Requests: 1
````

Se nøje på teksten. Hvordan er den bygget op? Kan du identificere nogle simple regler? Se om du kan formulere dem.

2.2 Create a class called `HttpRequest`. Place it in a package named `parsers`. You now need to select some attributes and data structures to hold the elements from the header text. A good approach could be to handle the first line specially. You should store the HTTP method in a `String`, the URL in a `String`, and the HTTP version also in a separate `String` variable. The rest are (key: value) pairs. What do we know that is highly suitable for storing such data?

With these hints, write the method `parse(String header)`. Process the text and store the content in the respective data structures.

When done, you can optionally write a method to print the various elements from your data structures. After this exercise, you will be well-equipped to understand the next steps.

## Task 3: Demo 04

3.1 Run Demo 04 by executing the `main` method in both `RequestDataServer` and then `RequestDataClient`.

3.2 Look at line 26 in `RequestDataClient`. The first so-called request line reads: `POST /path/to/endpoint HTTP/1.1`. What does it mean? And specifically, what does `POST` mean?

3.3 Look at line 25 in `RequestDataClient`. Can you explain what `key1=value1&key2=value2` represents? What can it be used for? Hint: It has something to do with `POST`.

3.4 Take a close look at how `RequestDTO` is constructed. Try moving all the code related to this part into its own class, as suggested in the code. Make Demo 04 work with the external class.

## Task 4: Demo 05

4.1 Run Demo 05 by executing the `main` method in both `RequestFileServer` and `RequestFileClient`. Also, try running the unit test.

4.2 Try explaining what happens to your partner. Use the text in the project’s README file for inspiration.

4.3 Refactor the code so that `RequestDTO` and the related code use the same class you created in Demo 04.

4.4 In lines 57–61, there is a TODO note describing how you can modify Demo 05 so that, instead of using the client, you can call the server from a browser. Use IntelliJ’s TODO tab to locate the places you need to refactor. You simply need to comment out lines 54+55 and uncomment lines 57–61. That should do it.

4.5 Run `RequestFileServer` and send a request from your favorite browser. You need to fetch [http://localhost:9090/pages/index.html](http://localhost:9090/pages/index.html). Just click the link.

4.6 Create an extra file in `resources/pages` and name it `login.html`. Create an HTML page with the following content:

```html
<!DOCTYPE html>
<html>
<body>

<h2>HTML Forms</h2>

<form action="/pages/login.html" method="post">
    <label for="firstname">First name:</label><br>
    <input type="text" id="firstname" name="firstname" value="John"><br>
    <label for="lastname">Last name:</label><br>
    <input type="text" id="lastname" name="lastname" value="Doe"><br><br>
    <input type="submit" value="Login">
</form>

<p>If you click the "Submit" button, the form data will be sent to a page called "/pages/login.html".</p>

</body>
</html>

4.7 Run RequestFileServer and then load http://localhost:9090/pages/login.html in your browser. What happens?

4.8 Run RequestFileServer and click the login button. Be sure to have the "Network" tab open in the browser's developer tools. Check the various headers and payload. What do you see?

4.9 It’s a bit inconvenient that we need to keep restarting the web server—i.e., Demo 05 RequestFileServer. See if you can let it remain open and wait for multiple requests, similar to our EchoServer in Demo 02.

4.10 See if you can print out the request variables (if any). In this case, `firstname=john&lastname=doe`.
<hr/>

[Back to the overview](./README.md)