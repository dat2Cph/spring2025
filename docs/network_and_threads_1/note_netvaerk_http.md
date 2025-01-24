---
Title: Theory
Description: Network Theory
Layout: Default
Nav Order: 2
Permalink: /network/theory/
Parent: HTTP and Network I
---

# Network & HTTP (Week 1 Notes)

This note consists of three parts: 
1. one about networks, 
2. one about HTTP, and finally, 
3. one about Java resources (since we need them to make the examples work).

## Network

The key concepts you need to understand network programming are:

- IP Addresses - the computer's "phone number" on the internet
- Port Numbers - which program on the computer you want to communicate with
- Protocol - how we should communicate once the connection is established
- Local Networks - e.g., Wi-Fi or phone hotspots

- This week’s exercises will cover all these elements. We'll focus on one protocol only: HTTP.

## How the Internet Works

When you type a URL in the browser and get a response from the server, all these elements come into play.

An HTTP URL looks like this: `http://ipaddress:port/path?quer`.

### IP Address

- There are two ways to specify an IP address. You can directly enter the IP address, which consists of four numbers between 0 and 255. For example, the website for Denmark’s Radio has the IP address 159.20.6.38, and Facebook has 31.13.64.35.

- However, you don’t need to type http://159.20.6.38 to visit Denmark’s Radio’s website. Your computer uses special computers on the internet called "DNS" (Domain Name System). A DNS server is a computer on the internet that has a table of which IP address corresponds to which name. Your browser has several built-in, well-known DNS servers (Google, for instance, has a DNS at 8.8.8.8).

- Using an IP address, you can reach another computer on the internet.
Server, Port, Socket

- A server is, first and foremost, a program running "in the background" on a machine. In everyday language, we often refer to machines housed in large server rooms as servers, but this is slightly misleading, as you can also run server programs on your own laptop. Practically, however, both are called "servers," and we’ll follow this convention.

- Typically, we ask our browser to retrieve an HTML page from a server (using its IP address). If you don’t specify anything, the browser will contact port 80, the default port for a web server. But servers can do much more than just deliver HTML pages. You can request emails from a mail server, send emails through a mail server, share screens, download files from an FTP server, print a document through a printer server, etc.

- When contacting a server, there must be a program ready to handle the request. To allow servers to handle multiple types of requests, different programs run simultaneously, each assigned a port number. A web server typically listens on port 80, but any port number can be used (with some restrictions below 1024, as these are reserved for standard protocols).

- You might encounter the terms "port" and "socket" used interchangeably. For our purposes, this is acceptable.

  - Note - You can run both the client and server on the same machine. There’s a special name for this: localhost (with IP address 127.0.0.1). For example, if you want to fetch an HTML page named index.html from a local web server, you can enter http://localhost/index.html or http://127.0.0.1/index.html in your browser.

### Client and Server

In the examples above, the browser communicates with a web server. The server is the program waiting for incoming requests, while the client is the program initiating the request.

Below is a simple Java program for a web server listening on port 8080:
```java
private static void main(String args...) throws Exception {
    final int port = 8080;
    final ServerSocket server = new ServerSocket(port);
    System.out.println("Listening for connection on port " + port + " ....");
    while (true) { // keep listening (as is normal for a server)
        try (Socket socket = server.accept()) {
            System.out.println("-----------------");
            System.out.println("Client: " + socket.getInetAddress().getHostName());
            System.out.println("-----------------");
            BufferedReader br = new BufferedReader(
                new InputStreamReader(socket.getInputStream())
            );
            String line;
            while (!((line = br.readLine()).isEmpty())) {
                System.out.println(line);
            }
            String httpResponse = "HTTP/1.1 200 OK\r\n\r\nHello 2. Sem";
            socket.getOutputStream().write(httpResponse.getBytes("UTF-8"));
        }
    }
}
```

- Line 3 creates a ServerSocket object that listens on port 8080.
- Line 6 calls server.accept, making the program wait for a client program to connect to port 8080 on the same machine.
- When a client connects, a Java Socket object is created to manage the connection between the server and the client (e.g., a browser).
- From a Socket object, other objects and information can be accessed:

- Line 9 retrieves information about the client.
- Lines 11–12 create a BufferedReader to read what the client sends. (We access this connection via socket.getInputStream() in line 12.) The first blank line marks the end of the HTTP header (explained below).
- Line 18 uses the socket’s output stream (socket.getOutputStream()) to send a response back to the client.

### HTTP

HTTP is a protocol used between a browser (client) and a web server.

A protocol defines what the server expects the client to send and what the client can expect in return.

If we run the server above and enter http://localhost:8080/hokus/pokus.html?moria=Mellon in the browser, the browser sends the following message to the server program:

```http
GET /hokus/pokus.html?moria=Mellon HTTP/1.1
Host: localhost:8080
Cookie: Idea-a4e040fd=7ba0ca53-a320-4c62-9c1c-ea3467502c81
Connection: keep-alive
Upgrade-Insecure-Requests: 1
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1.2 Safari/605.1.15
Accept-Language: en-us
DNT: 1
Accept-Encoding: gzip, deflate
```

- The key part is the first line: it states the browser wants to retrieve information (GET). Later, we’ll also use POST for updating data.

- The first line specifies that the browser communicates using HTTP version 1.1 (version 2 also exists).

- The crucial part of the first line is /hokus/pokus.html?moria=Mellon. Here:

- /hokus/pokus.html is the path (the file location).
- moria=Mellon are the parameters (data sent to the server for customization).

- Typically, the path indicates which HTML page to return, while parameters adjust its contents.

### HttpRequest

- In this week’s code, a special Java class called HttpRequest helps read a request and extract headers, paths, parameters, etc., from the message sent by the browser.

- There are many Java classes designed to handle HTTP request messages. When we transition to the Tomcat server, we’ll use one called HttpServerRequest.

### HttpResponse

- Similarly, there are classes for generating server responses. We won’t cover these this week but will explore them in the next.
Standard Server Protocols

- Protocols like HTTP, TCP, UDP, SMTP, FTP, etc., are complex. Usually, you shouldn’t implement them from scratch; instead, rely on libraries to handle the details.

