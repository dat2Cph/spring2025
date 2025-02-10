---
title: Network and Threads II
description: Building a Chat Server
layout: default
nav_order: 5
has_children: true
permalink: /network-threads-2/
---

# Week 2 of the network and threads mini course - Building a Chat Server
## Week 2 - Tuesday: Chat Server / Design Patterns: Singleton, Observer
- Chat Server Architecture
    - Explain the structure of a chat server:
        - Server: Accepts clients and relays messages.
        - Clients: Connect to the server, send, and receive messages.
        - Shared resource: A list of connected clients.
- Design Pattern: **Singleton** (and **Double-Checked Locking**)
    - The chat server itself can be a singleton, ensuring that only one server instance is running at a time.
    - Show how to create a thread-safe singleton using synchronized blocks or volatile.
```java
public class ChatServer {
    private static ChatServer instance;
    private ChatServer() {}  // Private constructor
    public static synchronized ChatServer getInstance() {
        if (instance == null) {
            instance = new ChatServer();
        }
        return instance;
    }
}
```
OR (using double-checked locking pattern)
```java
public class ChatServer {
    private static volatile ChatServer instance; // Use 'volatile' to ensure visibility of changes across threads.

    private ChatServer() {}  // Private constructor

    public static ChatServer getInstance() {
        if (instance == null) { // First check (no locking)
            synchronized (ChatServer.class) { // Lock only the first time
                if (instance == null) { // Second check inside synchronized block
                    instance = new ChatServer();
                }
            }
        }
        return instance;
    }
}
```
- The above ensures:
- **volatile Keyword**:
    - The volatile keyword ensures that the instance variable is read from main memory and not from a thread's local cache. This guarantees visibility of changes to instance across threads.
- **Double-Checked Locking**:
    - The first if (instance == null) avoids synchronization overhead for subsequent calls once the instance is initialized.
    - The second check inside the synchronized block ensures that only one thread initializes the instance, even when multiple threads access it concurrently during the initialization phase.
Benefits:
    - Thread-safe.
    - Efficient: Synchronization occurs only during the first initialization.

- Design Pattern: **Observer**
    - Clients can be observers that listen for messages from the server.
    - Demonstrate how to implement the Observer pattern in Java.
    - Show how the server can broadcast messages to all clients.
    - Example: When Client A sends a message, the server relays it to Clients B, C, etc.

```java
public interface ClientObserver {
    void update(String message);
}

public class ChatServer {
    private List<ClientObserver> clients = new ArrayList<>();
    public void addClient(ClientObserver client) { clients.add(client); }
    public void broadcast(String message) {
        for (ClientObserver client : clients) {
            client.update(message);
        }
    }
}
```
u
- Thread Safety
    - Use synchronized blocks or CopyOnWriteArrayList for thread-safe operations.

- Protocol for Chat
    - Define a simple text-based protocol:
    - Messages like JOIN, MESSAGE, LEAVE.

### Preparation before class
- Watch video: 
    - [Video 7: Singleton and Observer Design Patterns (8:30)](https://www.youtube.com/watch?v=tSZn4wkBIu8&ab_channel=Geekific)
    - [Video 8: Observer Design Pattern (3:30)](https://www.youtube.com/watch?v=7B1DFe0VBxI&ab_channel=ByteVigor)
    - [Video 9: Chat Server Architecture (39:00)](https://www.youtube.com/watch?v=hIc_9Wbn704&ab_channel=NeuralNine)
- Read material
    - [Design Patterns](https://www.javatpoint.com/design-patterns-in-java)

### Exercises
- Exercise 3: TBD

- 
## Week 2 - Wednesday - Codelab: Building Chat Server
- Building the Chat Server
    - Task 1: Modify the multithreaded server to maintain a list of active clients.
    - Task 2: Implement message broadcasting (server relays messages to all clients).
- Optional Tasks:
    - Task 3: Add client nicknames.
    - Task 4: Allow private messages (e.g., /msg <nickname> <message>).

## Week 2 - Thursday: ThreadPools and Strategy Pattern
- Advanced Topics and Best Practices
    - Error handling: What happens when a client disconnects?
    - Logging and debugging tips for network applications.
    - Optimize the server using thread pools (ExecutorService).
- Refactor the Chat Server
    - Introduce thread pools for better performance.
    - Improve code structure and modularity.
- Wrap-Up and Showcase
    - Showcase example features: colored text, command handling (/help, /users).

- Design Pattern: **Thread Pool**
    - Use an ExecutorService to manage threads efficiently.
    - Example: Create a fixed-size thread pool for handling client connections.

```java
ExecutorService threadPool = Executors.newFixedThreadPool(10);
while (true) {
    Socket clientSocket = serverSocket.accept();
    threadPool.execute(new ClientHandler(clientSocket));
}

```
- Design Pattern: **Strategy Pattern**
    - Implement a command handler using the Strategy pattern.
    - Example: When a client sends a message starting with "/", the server uses a CommandStrategy to handle it.
```java
public interface Command {
    void execute(String[] args, ClientHandler handler);
}

public class BroadcastCommand implements Command {
    @Override
    public void execute(String[] args, ClientHandler handler) {
        handler.getServer().broadcast(String.join(" ", args));
    }
}

public class CommandProcessor {
    private Map<String, Command> commands = new HashMap<>();
    public void register(String commandName, Command command) {
        commands.put(commandName, command);
    }
    public void process(String input, ClientHandler handler) {
        String[] parts = input.split(" ", 2);
        Command command = commands.get(parts[0]);
        if (command != null) command.execute(parts[1].split(" "), handler);
    }
}
```

### Preparation before class
- Watch video: 
    - Video 9: Thread Pools and Strategy Pattern
  
- Read material

### Exercises
- Exercise 4: TBD

## Week 2 - Friday: Strategy Pattern, Factory Pattern and Decorator Pattern
- Final Assignment: Complete the Chat Server
    - Add finishing touches to the server (e.g., nicknames, private messages).
    - Implement a **Strategy pattern** for handling commands.
    - Use the **Factory pattern** to create different types of commands.
    - Add a **Decorator pattern** for additional features (e.g., colored text).
- Deliverables:
    - Fully working chat server and client.
    - Test cases to demonstrate features.