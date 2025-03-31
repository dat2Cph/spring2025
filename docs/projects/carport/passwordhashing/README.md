---
title: 5.4 Password hashing
description: This is how to hash passwords with jBCrypt
layout: default
parent: Carport projekt
grand_parent: Projekter
nav_order: 10
permalink: /projekter/carport/password-hashing/
---

## 🔐 What is Hashing of Passwords?

**Hashing** is a one-way cryptographic function that transforms plaintext (like a password) into a fixed-length string of characters. It is *not* encryption (which is reversible); once a password is hashed, it cannot be turned back into the original plaintext.

Example:

- Input: `"mySecret123"`
- Hashed output (e.g., using bcrypt): `"$2a$10$J8K....yHQpjzFJJEVZuEq"`

### 🧠 Why is Hashing Important?

When you store passwords **as plain text**, if your database gets leaked, all user passwords are exposed.

Hashing protects passwords in the following ways:

- Even if attackers steal the database, they can’t directly read the passwords.
- Hashes are designed to be **slow**, making brute-force attacks expensive.
- Each hash includes a **salt** (random data) to prevent attackers from using precomputed tables (rainbow tables) to guess passwords.

## 🔧 How to Use jBCrypt in Java

### Step 1: Add jBCrypt to your Maven project

```xml
<dependency>
    <groupId>org.mindrot</groupId>
    <artifactId>jbcrypt</artifactId>
    <version>0.4</version>
</dependency>
```

### Step 2: Hash a Password (e.g., before saving to DB)

```java
import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {
    public static String hashPassword(String plainPassword) {
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt());
    }
}
```

Example usage:

```java
String password = "mySecret123";
String hashed = PasswordUtil.hashPassword(password);
// Save 'hashed' in your database
```

---

### Step 3: Compare a Plain Text Password with a Hashed One

```java
public class PasswordUtil {
    public static boolean checkPassword(String plainPassword, String hashedPasswordFromDB) {
        return BCrypt.checkpw(plainPassword, hashedPasswordFromDB);
    }
}
```

Example usage during login:

```java
String inputPassword = "mySecret123";
String hashedFromDB = getUserPasswordFromDB("user@example.com"); // Retrieve from DB

if (PasswordUtil.checkPassword(inputPassword, hashedFromDB)) {
    System.out.println("Password is correct");
} else {
    System.out.println("Invalid password");
}
```

## How to understand the hashed password

Let's break down the structure of a bcrypt hashed password clearly with your provided example:

```plaintext
$2a$10$ICNB4Nplp0p1C.CRbpkq6e2uSLRfs0AVndvKD.lRwbsbQ8kWKjcs2
```

A bcrypt hash typically consists of these main parts, separated by `$`:

```plaintext
$algorithm-version$cost-factor$salt+hash
```

---

## ⚙️ Breakdown of Your bcrypt Hash

Given:

```plaintext
$2a$10$ICNB4Nplp0p1C.CRbpkq6e2uSLRfs0AVndvKD.lRwbsbQ8kWKjcs2
```

### 1️⃣ **Algorithm Version (`2a`):**

- `2a` indicates the bcrypt algorithm version being used.
- Common versions include `2a`, `2b`, and `2y`.
- `2a` is widely used and indicates standard bcrypt with minor improvements.

### 2️⃣ **Cost Factor (`10`):**

- `10` indicates the cost factor, which is a measure of how computationally expensive hashing is.
- The hashing operation is repeated `2^cost-factor` times, here `2^10 = 1024` rounds.
- Higher values make brute-force attacks more difficult (but hashing takes longer).

Typical recommended values are from `10` to `14`.

### 3️⃣ **Salt (`ICNB4Nplp0p1C.CRbpkq6e`):**

- bcrypt automatically generates a random, unique **22-character base64-encoded salt**.
- In your hash, the salt is the first **22 characters after the cost factor**:  

  ```plaintext
  ICNB4Nplp0p1C.CRbpkq6e
  ```

- The salt ensures that identical passwords don't generate the same hash. It also defends against rainbow table attacks.

### 4️⃣ **Password Hash (`2uSLRfs0AVndvKD.lRwbsbQ8kWKjcs2`):**

- The final **31 characters** are the hashed password itself.
- This is the cryptographic result of combining your plaintext password with the given salt, through the hashing function over the specified number of rounds.

## 📌 Summarized structure for your hash example

| Part                  | Value                                    | Meaning                               |
| --------------------- | ---------------------------------------- | ------------------------------------- |
| Algorithm Version     | `2a`                                     | bcrypt algorithm version              |
| Cost factor           | `10`                                     | Work factor (`2^10 = 1024` rounds)    |
| Salt                  | `ICNB4Nplp0p1C.CRbpkq6e`                 | Unique salt                           |
| Password Hash         | `2uSLRfs0AVndvKD.lRwbsbQ8kWKjcs2`        | Resulting hashed password             |

---

## ✅ **Why this matters:**

When verifying a password:

- bcrypt extracts the salt and cost factor from the stored hash.
- It hashes the plaintext input with the extracted salt and cost factor.
- Finally, it compares the newly computed hash with the stored hash.

If they match, the password is correct.

This approach makes bcrypt secure, adaptive, and robust against brute-force attacks.
