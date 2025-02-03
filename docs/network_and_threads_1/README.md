---
title: Network and Threads I
description: Overview of the network and threads week
layout: default
nav_order: 4
has_children: true
permalink: /network-threads-1/
---

# Network, HTTP Protocol and Client/Server

## Week 1 - Tuesday: Client-Server Interactions/Protocols

- Topics: Network protocols, TCP/IP, HTTP, HTTPS, DNS, DHCP, IP address, MAC address, Ports, Socket, Client, Server, Request, Response, HTTP methods, HTTP status codes, HTTP headers, HTTP cookies
- Introduction to Networking in Java
    - Basics: What is a network? IP addresses, ports, protocols (focus on TCP and HTTP).
    - Java networking classes: Socket, ServerSocket - Code Together.
    - **Demonstrate a simple client-server interaction (e.g., a server sending "Hello" to the client)**.
- Protocals and HTTP Basics
    - Explain how protocols like HTTP work at a high level.
    - URL structure: http://host:port/path?query.
    - Role of DNS and localhost (127.0.0.1).
- Assignment Introduction
    - Explain the goal: Build a chat server by the end of Week 2.
    - Break it down: This week focuses on networking and server basics.

### Preparation before class
- Watch video(s): 
    - [Video 1: Networking Basics](https://www.youtube.com/watch?v=v4sRKGarh5Q&ab_channel=WhiteboardDoodles)
    - Video 2: [Protocols and HTTP Basics (The exact format of each part of Request and Response, HTTP methods, HTTP status codes, HTTP headers)](https://www.youtube.com/watch?v=wW2A5SZ3GkI&ab_channel=FollowAndrew)
    - Video 3: [Client-Server Interaction with Sockets](https://www.youtube.com/watch?v=8J7jS4G6AkE&ab_channel=DavidDobervich)
    - Video 4: [TCP socket programming 1](https://cphbusiness.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=766a7b19-19f9-4bee-8eba-b27700fb84b2)
    - Video 5: [TCP socket programming 2](https://cphbusiness.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=cca622fd-4f7d-4e2f-985d-b2770109ef62)
    - Video 6: [HTTP](https://cphbusiness.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=f3699294-0a8e-49a5-8eb9-b279007f93fc)

- Read about [network and the http protocol](./note_netvaerk_http.md)
- Install Telnet on Windows: `dism /online /Enable-Feature /FeatureName:TelnetClient` from PowerShell as admin
- Install Telnet on Mac: `brew install telnet`.

### Exercises to do in class
- Kahoot Quiz: Networking Basics
- Exercise 1: Create a simple client-server interaction.
- Look at HTTP basics: `curl -v http://www.example.com`
- And in the browsers network tab

### Home Assignment
- Explore Real-World Servers
    - Example: Use telnet to interact with a web server or check HTTP headers.
    - Learning Objectives:
        - Understand the basics of TCP/IP communication.
        - Learn how HTTP requests and responses work.
        - Use telnet to manually interact with web servers.
    - Preparation:
        - Ensure Telnet is Installed: [Install Telnet with Brew](https://discussions.apple.com/thread/251160017?sortBy=rank), [Install on windows](https://www.technipages.com/windows-enable-telnet/)
    - Choose Accessible Servers:
        - Select common servers that students can test safely:
            - www.example.com
            - www.google.com
            - httpbin.org (great for exploring HTTP)

    - Activity Plan
        1. Explain the Basics of Telnet
            - Telnet is a tool that allows you to open a raw TCP connection to a server.
            - It works at the application layer and lets you send custom requests manually.
        2. Connect to a Web Server
            - Demonstrate how to use telnet to connect to a server on port 80 (HTTP).
            - Example:
                - telnet www.example.com 80 (type `quit` to exit telnet prompt)
        - Explain:
            - www.example.com: The hostname of the web server.
            - 80: The port number for HTTP communication.
        3. Manually Send an HTTP Request
            - Once connected, type an HTTP GET request manually:
            - ```
            GET / HTTP/1.1
            Host: www.example.com
            ```
            - Follow this with an empty line (press Enter twice) to signal the end of the request.
            - Explain the components of the request:
                - GET: HTTP method to request data.
                - /: The path (root in this case).
                - HTTP/1.1: HTTP version.
                - Host: Specifies the server's domain.
        4. Analyze the Response
            - After sending the request, the server will respond with:
            - HTTP headers (e.g., HTTP/1.1 200 OK, Content-Type, Date, etc.).  
            - The content of the page (if any).  
            - Example Response:

    ```
    HTTP/1.1 200 OK
    Date: Sun, 26 Jan 2025 10:00:00 GMT
    Server: ECS (dcb/7F3B)
    Content-Type: text/html; charset=UTF-8
    Content-Length: 1256
    Connection: keep-alive

    <!doctype html>
    <html>
      <head>
        <title>Example Domain</title>
      </head>
      <body>
        <h1>Example Domain</h1>
        ...
        </body>
    </html>
    ```
        5. Experiment with Other Paths and Methods 
            - Request a different path:
            ```
            GET /robots.txt HTTP/1.1
            Host: www.example.com
            ```
            - Send a bad request and observe the response:
            ```
            GET /nonexistent HTTP/1.1
            Host: www.example.com
            ```
            - Try other methods like HEAD or POST (explain they might behave differently).
        6. Explore HTTP in the browsers network tab
            - Open the browser's developer tools (F12) and go to the Network tab.
            - Visit a website and observe the requests and responses.
            - 

## Week 1 - Wednesday - Codelab

- [CodeLab Exercise](./exercises/codelab.md)

## Week 1 - Thursday: Threads
- Introduction to Multithreading in Java
    - Explain threads: What are they? Why use them?
    - How multithreading solves the "one client at a time" problem in networking.
    - Java thread basics: Thread class and Runnable interface.
- Building a Threaded Server
    - Show how to handle multiple clients using threads.
    - Example: A server where each client connection is handled in its own thread.
- Challenges with Threads
    - Discuss thread safety and common issues: race conditions, synchronization, deadlocks.
    - Introduce the concept of shared resources (e.g., a shared List of clients).

### Preparation before class
- Watch video 
  - Video 4: Threads in Java (Why and How, Runnable, Thread, Shared Ressources, Thread Safety, Synchronization, Deadlocks, Volatile)
  - Video 5: Threaded Server (How to handle multiple clients using threads)
  - video 6: Working with text-based protocols (How to parse requests and send responses in java code)
- Read material ??

### Exercise
- Create a multithreaded "http validation" server, that can handle multiple clients at the same time and handle HTTP with headers like:
    - Request: User-Agent (User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36)
    - Response: Status-Line (HTTP/1.1 200 OK),
    - Response: Date (Date: Sun, 26 Jan 2025 10:00:00 GMT),
    - Response: Server (Server: AkamaiGHost),
    - Response: Content-Type (Content-Type: text/html; charset=UTF-8), 
    - Response: Content-Length (Content-Length: 12345)
- The server must evaluate the request and send back a response with the correct headers, status code and content (saying whether the request is valid http or not).

## Week 1 - Friday
- Weekly Exercise
Assignment Goal:

- Implement a multithreaded HTTP server:
    - The server should accept multiple clients.
    - Use Threads to manage client connections.
    - Parse HTTP requests and send appropriate responses using the HTTP protocol with headers like User-Agent, Date, Server, Content-Type, Content-Length.
    - Provide 3 different GET resources (/hello, /time, /echo ).
    - Provide a POST resource that stores the message and returns it on a subsequent GET request (eg: /echo).
