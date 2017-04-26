# Shapes and parsing

An application that is capable of reading, parsing and evaluating string data from a file.

### Sample inputs are in these files:
* lib/assets/inputs.txt
* lib/predicates.txt

Inputs contains data that the predicates must be evaluated on.

### Goal
  * The application must be able to create specific objects based on inputs.txt file.
  * The input files are structured in such a way that columns are separated by space
  * The first column is the kind of Object that is to be created
  * The rest of the columns are parameters of the Object
  (Eg: create a square with sides of length 5 for: square 5, or a circle with a radius of 7 for the line of circle 7)
  * Each of these objects (Square, Rectangle and Circle) must be able to calculate its own area and circumference

  predicates.txt contains expressions that the application must be able to evaluate for every Object created based on the input.
  
  Eg: the shape has a circumference less than 23 for the line  circumference < 23.
  
  Circumference and area respectively refer to appropriate properties of the Object the expression is being evaluated on.

Output might be written to stdout or a file.

### Requirements
  * The application must be written in Dart
  * The source code must be shared with us on Github
  * Use OOP principles and patterns where applicable
  * Use Clean Code principles where applicable
  * Make sure that you handle the most common error cases
  * Write at least 1 unit test for any part of the application
