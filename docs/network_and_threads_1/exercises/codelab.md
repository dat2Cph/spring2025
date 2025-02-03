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

- **Part 1** Setup and Hands-On with Networking
    - Students create a basic server using ServerSocket and a client with Socket.
    - Task 1: Send a message from client to server.
    - Task 2: Make the server echo the client’s message.
    - Task 3: Make sure the server can handle multiple client requests and echo each one back without shutting down.
    - Task 4: Make a stop method that can be run when the client send a specific message (lige: "stop") to the server.
        - The stop method should close the server socket, the clientHandler socket, the input and output streams.

- **Part 2** Basic HTTP Simulation
    - Task 1: Have the server respond to basic HTTP-like requests, following the protocol with GET and POST methods.
      - Example: GET /hello should return "Hello, World!".
      - Example: POST /echo with a message should return the message. If you feel for the challenge you can store the POSTed message and return it when a GET request is made to /echo.
    - Task 2: Parse requests like GET /hello and send appropriate responses with the correct status codes and headers.
    - Example:
```
GET /hello HTTP/1.1
Host: localhost:8080
User-Agent: Mozilla/5.0
Accept: text/html
```
```
HTTP/1.1 200 OK
Date: Sun, 26 Jan 2025 10:00:00 GMT
Server: YourServerName
Content-Type: text/html; charset=UTF-8
Content-Length: 12345

Hello, World!
```



