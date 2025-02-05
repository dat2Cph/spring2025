---
title: Network CodeLab exercise
description: Network Exercise
layout: default
parent: Exercises
grand_parent: Network and Threads I
nav_order: 2
permalink: /network-threads-1/exercises/codelab/
---

# CodeLab: Network CodeLab exercise

![](./images/network.png){: width="300px"}

## Purpose of the exercise

- **Part 1: Recap from yeasterday** Setup and Hands-On with Networking
  - Create a basic server using `ServerSocket` and a clientHandler with `Socket`.
  - **Task 1**: Send a message from client (use Telnet or build a simple client) to server.
  - **Task 2**: Make the server echo the client’s message.
  - **Task 3**: Make sure the server can handle multiple client requests and echo each one back without shutting down.
  - **Task 4**: Make a stop method that can be run when the client send a specific message (lige: "stop") to the server.
    - The stop method should close the server socket, the clientHandler socket, the input- and outputstreams.

- **Part 2** Basic HTTP Simulation
  - **Task 0**: When making a GET request to the server, the request should have a first line with the method, the path and the protocol version, like: `GET /hello HTTP/1.1`. Make a check to see if the request is upholding that format. If not, return a 400 Bad Request response. like this: `HTTP/1.1 400 Bad Request`
  - **Task 1**: Have the server respond to basic HTTP-like requests, following the protocol with GET and POST methods.
    - Example 1: GET /hello should return "Hello, World!". Like below:
      - server request:

```plaintext
GET /hello HTTP/1.1
Host: localhost:8080
User-Agent: Mozilla/5.0
Accept: text/html
```

- and server response:

```plaintext
HTTP/1.1 200 OK
Date: Sun, 26 Jan 2025 10:00:00 GMT
Server: YourServerName
Content-Type: text/html; charset=UTF-8
Content-Length: 12345

Hello, World!
```

- Hint: You can use a StringBuilder to build the request from the client over multiple lines like this:

```plaintext
StringBuilder requestBuilder = new StringBuilder();
String newLine;
while (in.ready() && (newLine = in.readLine()) != null && !newLine.isEmpty()) {
    requestBuilder.append(newLine).append("\n");
}
```

- Example 2: POST /echo with a message should return the message. If you feel for the challenge you can store the POSTed message and return it when a GET request is made to /echo.

```plaintext
POST /echo HTTP/1.1
Host: localhost:8080
User-Agent: Mozilla/5.0
Accept: text/html

Hello! This is a POST message. And here is the body of the Post request.
```

- and server response:

```plaintext
HTTP/1.1 200 OK
Date: Sun, 26 Jan 2025 10:00:00 GMT
Server: YourServerName
Content-Type: text/html; charset=UTF-8
Content-Length: 5

Hello
```

### Part 3: Advanced HTTP Simulation

- **Task 1**: Have the server respond to more advanced HTTP-like requests, following the protocol with a GET method.
  - Example: GET /index.html should return an HTML page like below:
  - server request:

```plaintext
GET /hello HTTP/1.1
Host: localhost:8080
User-Agent: Mozilla/5.0
Accept: text/html
```

- and server response:

```plaintext
HTTP/1.1 200 OK
Date: Sun, 26 Jan 2025 10:00:00 GMT
Server: YourServerName
Content-Type: text/html; charset=UTF-8
Content-Length: 12345

<!doctype html>
<html>
  <head>
    <title>Example Domain</title>
  </head>
  <body>
    <h1>Example Domain</h1>
    <div>data</div>
    </body>
</html>
```

- **Task 2** Make a post request sending data to the server. Let the server store the data in memory (in a variable) and when requested by a subsequent GET request like: GET /whateverwasposted, the data will be returned incapsulated in the index.html file inside the `<div></div>` element.
