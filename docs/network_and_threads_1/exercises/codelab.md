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

- Setup and Hands-On with Networking
    - Students create a basic server using ServerSocket and a client with Socket.
    - Task 1: Send a message from client to server.
    - Task 2: Make the server echo the client’s message.

- Basic HTTP Simulation
    - Have the server respond to basic HTTP-like requests, following the protocol with GET and POST methods.
      - Example: GET /hello should return "Hello, World!".
      - Example: POST /echo with a message should return the message. If you feel for the challenge you can store the POSTed message and return it when a GET request is made to /echo.
    - Task: Parse requests like GET /hello and send appropriate responses.

