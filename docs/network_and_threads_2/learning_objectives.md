---
title: Læringsmål
description: Læringsmål for tråde
layout: default
nav_order: 1
permalink: /network-threads-2/learningobjectives/
parent: Netværk og tråde II
---

# Læringsmål for Tråde

# Efter denne uge er det målet at du


1. Be able to use simple thread mechanisms in Java with Executors
    - What is an ExecutorService and how do you instantiate them?
    - Show a couple of examples where you start two tasks
    - Show how to wait for a thread to finish
    - Show how to shut down an executor
    - Explain a little about the different types of Executors (fixed, cached etc)

2. Can demonstrate the use of our homemade chat server
   - Explain the overall construction (drawing)
   - Why and how do we use threads?
   - Select some of the code and explain how it works

3. Explain the structure of a chat server
   - Server: Accepts clients and relays messages.
   - Clients: Connect to the server, send, and receive messages.
   - Shared resource: A list of connected clients.

4. Explain the use of the Singleton pattern
    - The chat server itself can be a singleton, ensuring that only one server instance is running at a time.
    - Show how to create a thread-safe singleton using synchronized blocks or volatile.

5. Explain the use of the Observer pattern
    - The chat server can use the observer pattern to notify clients of new messages.
    - Show how to implement the observer pattern in Java.

6. Explain the use of the Double-Checked Locking pattern
    - The chat server can use the double-checked locking pattern to ensure thread safety when initializing the singleton instance.
    - Show how to implement the double-checked locking pattern in Java.

7. Explain the use of the volatile keyword

8. Explain the use of the synchronized keyword

9. Explain the use of the Strategy pattern
    - The chat server can use the strategy pattern to allow different types of message handling.
    - Show how to implement the strategy pattern in Java.

10. Explain the use of the Factory pattern
    - The chat server can use the factory pattern to create different types of clients.
    - Show how to implement the factory pattern in Java.

11. Explain the use of the Decorator pattern
    - The chat server can use the decorator pattern to add functionality to clients.
    - Show how to implement the decorator pattern in Java.