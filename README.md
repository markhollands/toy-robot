Toy Robot Simulator
===================

The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.

 - There are no other obstructions on the table surface.

 - The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.

###Running the program

Clone this repo or download the zip and it is ready to go.

From the main directory, run :

 `ruby application.rb`

The application will wait for input from the keyboard

The application has been tested using 2.1.2, but should work fine with earlier versions.


###Using the program

Once you are in the program you can issue the following commands

- PLACE x y direction

eg.  PLACE 0 1 NORTH

- REPORT

The robot will report back it's current position and direction

- MOVE

The robot will move forward one square in it's current direction

- LEFT

The robot will turn 90 degrees to the left

- RIGHT

The robot will turn 90 degrees to the right

 ###Running the tests

 From the main directory, run this command to run all of the tests : 

 `rspec spec/*`

###Extensions

The application has been designed with different robot types in mind, using chess as a model.  A BishopRobot type has been developed using the movement model and a test suite has been created to ensure it's validity.


