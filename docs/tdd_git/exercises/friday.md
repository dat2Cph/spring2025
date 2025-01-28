# Week 1 - Friday Exercise

## Create a new Project
- Create a new maven project in IntelliJ IDEA.
- Add the following dependencies to the `pom.xml` file:

```xml
<dependencies>
    <dependency>
        <groupId>org.junit.jupiter</groupId>
        <artifactId>junit-jupiter-api</artifactId>
        <version>5.9.0</version>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.junit.jupiter</groupId>
        <artifactId>junit-jupiter-engine</artifactId>
        <version>5.9.0</version>
        <scope>test</scope>
    </dependency>
```
- Create a new package called `tdd` and a new class called `Calculator`.
- Create a new junit 5 test class called `CalculatorTest`.

## Calculator
- Using TDD (Write the test first, then implement each method) create a simple calculator class with the following methods:
  - `add(int a, int b)`
  - `subtract(int a, int b)`
  - `multiply(int a, int b)`
  - `divide(int a, int b)`

## Git

- Create a new repository on GitHub called `tdd-calculator`.
- Add the project to the repository.
- Commit and push your changes to GitHub.
- Pull the changes from GitHub to your computer.
- Add a README.md file to the project.
- Add and commit
- Create a new branch called `featureAddString` and make changes to the `add` method.

## Calculator 2

- Add a new test for the `add` method that can take a String as input and return the sum of the numbers in the String.
  - Example: `add("1,2,3")` should return `6`.
  - Overload the `add` method to take a String as input.
- Add a new test for the `add` method that can take an array of numbers as input and return the sum of the numbers in the array.
  - Example: `add(new int[]{1,2,3})` should return `6`.
  - Overload the `add` method to take an array of numbers as input.
  - Make a description of the program and its features in the README.md file.

## Git 2
- Run git status to check the status of your repository before adding and committing changes.
- Add and commit your changes to the `featureAddString` branch. Make sure to write a good commit message.
- Merge the `featureAddString` branch into master.
- Run git log to explore the commit history. Identify the commit hashes, authors, and commit messages.
- Run git push to push your changes to GitHub.
- Add the git status and log messages to the README.md file and commit
- Create a gitignore file and add the target folder and the .idea folder to it.
- Make sure the remote repository is free of the target and .idea folders.
