---
title: Exercises
description: Exercises for tdd and git
layout: default
nav_order: 2
parent: TDD and GIT
has_children: true
permalink: /tdd-git/exercises/
---

# Introduction to This Week's Topic and Exercises

Before we begin, it's important that you have an overall picture of where we are heading and what we are trying to learn in each exercise. That's why this overview is provided.

## The Big Picture

The goal of this week in the second semester is to introduce networks and network programming. And why is this interesting?

It is because many today work with software development that needs to be used by many simultaneous users and systems.

Network applications vary widely. Web applications are probably the example most of us are most familiar with in our daily lives. It could also be online games, mobile applications that pull data from servers, financial systems, etc. The list is endless. The common denominator is that our software must be able to communicate across systems and machines. So **network communication** is the key concept.

![Network](../img/steampunkserver.webp)

## Goal of the Second Semester

One of the main objectives of the second semester is to be able to build a dynamic website that runs on a virtual server in the "cloud." That is, a website that is publicly available 24/7 and allows users to log in with specific rights, share, edit, delete, and update data stored in a database.

In practice, we will develop our website with some "ready-made" technologies (also known as a **tech stack**):

- **Java**: Our familiar object-oriented programming language.
- **Javalin**: A microframework for Java that makes it easier to develop websites.
- **Jetty**: A modern web server and servlet container that can handle many simultaneous users, built to run Java-based backends.
- **Postgresql**: A database server that prides itself on being the most advanced open-source relational database in the world.
- **HTML** and **CSS**: These frontend technologies are used for the user interface.

Our entire **tech stack** is open-source and scalable to millions of hits per day.

None of these technologies would work together if we didn’t have an underlying network layer. The thing that makes communication possible. As developers, we don’t necessarily need to be experts in networking. We use various methods that encapsulate (wrap) the deeper layers of communication, especially those handled by the operating system. However, there is a **gray area** of knowledge and concepts that are good to know. We call it a **gray area** because it’s hard to define exactly what is important to understand — and how much. It’s like not needing to know about water pumps and heating elements to use your dishwasher, but it’s good to know a little about salt and machine descaling and how to clean the filter. So, this is a topic related to **general knowledge** as a software developer.

Here’s a stack of abbreviations and concepts we will deal with:

Protocol, HTTP, HTTPS, SSL, DNS, IP, localhost, Port, Socket, TCP/IP, UDP, URL, URI, Client, ServerSocket, LAN, WAN, headers, requests, responses, status codes, PrintWriter, BufferedReader, InputStreamReader, HTML, CSS.

## Path to the Goal of the Second Semester

In the networking part of the second semester, we have two components:

### Theory

We will go through some theory about the above networking concepts. We won’t dive deep, but enough to provide a fundamental understanding.

### Practice

We have created a set of exercises and demo code in Java, where we will experiment with the theory in practice. Initially, we will use some demos created with the goal of reaching our target. That is, being able to build a small website that runs on our own self-built web server. Later in the semester, we will build websites using **Javalin** and a professional web server (**Jetty**). But first, we’ll build our own small version to get a good sense of how everything works. The hope is, of course, that we will have a flying start when it’s time to use **Javalin**, and avoid having to accept too much "black magic."

The first exercises deal with the most primitive network communication. We’ll simply establish a connection between a client and a server — and then send a single line of text. After that, we will gradually build functionality so that we can eventually fetch an actual webpage.

The exercises are divided into three sets, which we will work on throughout the week.

- Part 1: [TCP/IP and Sockets](./exercises01_sockets.md)
- Part 2: [HTTP and Web Pages](./exercises02_http.md)
- Part 3: [Build Your Own Web Server](./exercises03_webserver.md)
