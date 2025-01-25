# TDD (Test Driven Development)
![](https://developer.ibm.com/developer/default/articles/5-steps-of-test-driven-development/images/tdd-red-green-refactoring-v3.png)

## What is TDD?

- TDD is a software development process that relies on the repetition of a very short development cycle: requirements are turned into very specific test cases, then the software is improved to pass the new tests, only.
- This is opposed to software development that allows software to be added that is not proven to meet requirements.
- The following sequence is generally followed:
  1. Add a test
  2. Run all tests and see if the new test fails (which it should)
  3. Write the code
  4. Run tests (which should now pass)
  5. Refactor code (if necessary)
  6. Repeat (for each new feature)

## Why TDD?

- TDD is a way to think through requirements or design before writing functional code. It also helps us to think about the code from the perspective of the user. Furthermore TDD is a way to ensure that the code is testable, maintainable, readable and reliable.

## How to do TDD?

- We will use JUnit to write our tests and to run them.
- Inside a class file we will create a test class that will contain the test methods.
- [Follow these directions](https://www.jetbrains.com/help/idea/create-tests.html#create-test-dialog)
