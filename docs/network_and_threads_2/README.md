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
        if (instance == null) { // First check (no locking) to avoid synchronization overhead
            synchronized (ChatServer.class) { // Lock only the first time
                if (instance == null) { // Second check inside synchronized block, in case another thread initialized the instance
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
    - Benefit: Thread-safe.
    - Efficient: Synchronization occurs only during the first initialization.

- Design Pattern: **Observer**
    - Clients can be observers that listen for messages from the server.
    - Demonstrate how to implement the Observer pattern in Java.
    - Show how the server can broadcast messages to all clients.
    - Example: When Client A sends a message, the server relays it to Clients B, C, etc.

```java
public interface ClientObserver {
    void notify(String message);
}

public class ChatServer {
    private List<ClientObserver> clients = new ArrayList<>();
    public void addClient(ClientObserver client) { clients.add(client); }
    public void broadcast(String message) {
        for (ClientObserver client : clients) {
            client.notify(message);
        }
    }
}
```

- Thread Safety
    - Use synchronized blocks or CopyOnWriteArrayList for thread-safe operations.

- Protocol for Chat
    - Define a simple text-based protocol:
    - Messages like JOIN, MESSAGE, LEAVE.

### Preparation before class
- Watch video: 
    - [Video 7: Singleton Design Patterns (8:30)](https://www.youtube.com/watch?v=tSZn4wkBIu8&ab_channel=Geekific)
    - [Video 8: Observer Design Pattern (3:30)](https://www.youtube.com/watch?v=7B1DFe0VBxI&ab_channel=ByteVigor)
    - [Video 9: Chat Server Architecture (39:00)](https://www.youtube.com/watch?v=hIc_9Wbn704&ab_channel=NeuralNine)
- Read material
    - [Design Patterns](https://www.javatpoint.com/design-patterns-in-java)

### Exercises
1. Implement a way to store and set a name of the client in each client handler
2. Maintain a list of active clients in the server
3. Make the code to handle a client adding her name and store it in the server.
    - All messages from the server to the client, should subsequently include the name of the client. Like: `ClientName: Message`
4. Implement a way to send a message to all clients when a new client joins the server.
5. Implement a way to send private messages to a specific client at random time intervals.
- Hint: Use the `Random` class to generate
    - a random number of milliseconds to wait before sending the message
    - a random client to send the message to
    - a random message to send
```java
Random random = new Random();
int randomDelay = random.nextInt(5000); // Random number between 0 and 5000
// start a new thread that waits for the randomDelay before sending the message
new Thread(() -> {
    try {
        Thread.sleep(randomDelay);
        // send the message
    } catch (InterruptedException e) {
        e.printStackTrace();
    }
}).start();
```

- 
## Week 2 - Wednesday - Codelab: Building a Chat Server
- [Video of yesterdays class](https://cphbusiness.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=54bca0c7-22c6-4244-9a0b-b28100b34ef9)
### Tasks
- Building the Chat Server
    - Task 1: Modify the multithreaded server to maintain a list of active clients.
    - Task 2: Implement message broadcasting (server relays messages to all clients), so that when a new client joins, all other clients receive a notification.
    - Task 3: Enable a client to set a name when joining.
    - Task 4: Implement a simple text-based protocol for chat messages. ALA:

```plaintext
#JOIN <nickname> - A client joins the chat with a nickname.
#MESSAGE <message> - A client sends a message to all other clients, not including the sender themselves!
#LEAVE - A client leaves the chat.
#PRIVATE <nickname> <message>   - A client sends a private message to another client.
#GETLIST - A client requests a list of all active clients.
#PRIVATESUBLIST "nickname1,nickname2,nickname3" <message> - A client sends a private message to a list of clients.
#HELP - A client requests a list of available commands.
#STOPSERVER - A client requests to stop the server (all clients are first notified, then disconnected, removed from the list and all closable resources are closed).
```

- Automatic moderation
    - Task 5: Implement a simple automatic moderation system that filters out messages containing inappropriate words (replace it with stars like this: ******).
    - Task 6: Implement a command to add a word to the list of inappropriate words.
    - Task 7: Implement a command to remove a word from the list of inappropriate words.
    - Task 8: Implement a command to list all inappropriate words.
    - Task 9: Implement a mechanism to ban a client after having sent 3 messages containing inappropriate words.

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
- The Strategy Pattern is useful when we want to encapsulate behaviors (strategies) and make them interchangeable at runtime. In our chat server, one area that could benefit from this pattern is message processing, where different commands (#JOIN, #MESSAGE, #PRIVATE, #LEAVE, etc.) are handled in a big if block.
- By applying the Strategy Pattern, we can:
    - Encapsulate each message-handling strategy separately.
    - Avoid large if-else blocks inside the run() method.
    - Make it easier to add new commands without modifying existing code (Open-Close principle in `SOLID`).
    - Example: When a client sends a message starting with "#", the server uses a CommandStrategy to handle it.

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
    - [Video 10: Thread Pools (20:00)](https://www.youtube.com/watch?v=Nb85yJ1fPXM&ab_channel=JakobJenkov)
    - [Video 11: Strategy Pattern (2:20)](https://www.youtube.com/watch?v=E9-4uaoncVY&ab_channel=JonoWilliams)
    - [Video 12: Strategy Pattern in java (7:30)](https://www.youtube.com/watch?v=E9-4uaoncVY&ab_channel=JonoWilliams)
  
### Exercises
- Implement a thread pool for handling client connections.
- Refactor the server to use the Strategy pattern for handling commands.
- Implement a command handler that processes messages starting with "/".
- Look at the decorator pattern for adding e.g. colored text to the messages.


## Week 2 - Friday: Strategy Pattern, Factory Pattern and Decorator Pattern
- Final Assignment: Complete the Chat Server
    - Add finishing touches to the server: finish any tasks from the codelab exercise, that was not done yet.
    - 
    - Implement a **Strategy pattern** for handling commands.
    - Use the **Factory pattern** to create different types of commands.
    - Add a **Decorator pattern** for additional features (e.g., colored text).

```java
System.out.println("\u001B[31mThis is red text\u001B[0m");
System.out.println("\u001B[32mThis is green text\u001B[0m");
System.out.println("\u001B[34mThis is blue text\u001B[0m");
```
    
- Deliverables:
    - Fully working chat server and client.
    - Test cases to demonstrate features.

<table>
    <tr>
        <th>Color</th>
        <th>ANSI Code</th>
    </tr>
    <tr><td style="background-color: black; color: white;">Black</td><td>\u001B[30m</td></tr>
    <tr><td style="background-color: red; color: white;">Red</td><td>\u001B[31m</td></tr>
    <tr><td style="background-color: green; color: white;">Green</td><td>\u001B[32m</td></tr>
    <tr><td style="background-color: yellow; color: black;">Yellow</td><td>\u001B[33m</td></tr>
    <tr><td style="background-color: blue; color: white;">Blue</td><td>\u001B[34m</td></tr>
    <tr><td style="background-color: magenta; color: white;">Magenta</td><td>\u001B[35m</td></tr>
    <tr><td style="background-color: cyan; color: black;">Cyan</td><td>\u001B[36m</td></tr>
    <tr><td style="background-color: white; color: black;">White</td><td>\u001B[37m</td></tr>
    <tr><td style="background-color: gray; color: black;">Bright Black (Gray)</td><td>\u001B[90m</td></tr>
    <tr><td style="background-color: #ff5555; color: white;">Bright Red</td><td>\u001B[91m</td></tr>
    <tr><td style="background-color: #55ff55; color: black;">Bright Green</td><td>\u001B[92m</td></tr>
    <tr><td style="background-color: #ffff55; color: black;">Bright Yellow</td><td>\u001B[93m</td></tr>
    <tr><td style="background-color: #5555ff; color: white;">Bright Blue</td><td>\u001B[94m</td></tr>
    <tr><td style="background-color: #ff55ff; color: white;">Bright Magenta</td><td>\u001B[95m</td></tr>
    <tr><td style="background-color: #55ffff; color: black;">Bright Cyan</td><td>\u001B[96m</td></tr>
    <tr><td style="background-color: #ffffff; color: black;">Bright White</td><td>\u001B[97m</td></tr>
</table>