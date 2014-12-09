Toy Robot Simulator
===================

The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.

 - There are no other obstructions on the table surface.
 - The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.

 ###Running the program

 Clone this repo or download the zip and it is ready to go.

 - `ruby application.rb` The application will wait for input from the keyboard

###Using the program

Once you are in the program you can issue the following commands

PLACE <x> <y> <direction>

- eg.  PLACE 0 1 NORTH

REPORT
MOVE
LEFT
RIGHT

 ###Running the tests

 From the main directory : 

 - `rspec spec/*`

