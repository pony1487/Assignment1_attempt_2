

 

C15737505 
===================
Object Oriented Programming Assignment 1
===================


For this assignment I tried to take inspiration  from various sci fi films and games to base my UI on.

Navigation
--------------
You can use numbers 0-5 to move from screen to screen of use the mouse to click buttons, stars etc
-Menu = 0
-Readme = 1
-Map = 2
-Transistion = 3
-Planet View = 4
-Exit = 5


Screens
-------------

The project consists of 5 screens:

 - Menu
 - Readme
 - Map
 - Transition
 - Planet View

**Menu**
	The menu has three buttons. Each button is an object of class Button. The button class has a position , size, font and methods to render each button with text and to check if it is clicked. Each button when clicked, will change to mode of the sketch which will lead to the appropriate page.

The background of the Menu is a array of objects of class Transition. It is basically X amount of points draw in random positions(x,y) to represent stars. This is used later to create the warp drive effect when the mode is changed to Transition screen.

The sun at the bottom is two arcs. I used the filter(BLUR, 6); method here, however it slows the menu down and makes it lag when click. It is commented out.m Uncomment to see the effect(line 686 on Assignment1_attempt2 page)

**Readme**
The Readme page is modelled after the famous Star Wars scrolling text. The drawReadme() methods creates strings and writes them to the screen using the processing method text(). The y position of the text is decreased until it reached certain point and then resets. This give the scrolling effect.

**Map**
The map page consists of two Faders, a star map (similar to Lab test but modified), a Star Wars trench drawing and a Hal from Space odyssey drawing.

The Faders are objects of class Fader. The Faders have a position, height and width. The Fer is rendered and then the Y value is updated in the update method. It follows the mouse Y between a certain range. This allows the Fader to move up and down.
The Fader is also mapped to a LED type display on the left and controls the volume of the background space sounds.

The second Fader is used to control the Hal display(digitalRain object). I had started to try and recreate the Matrix Digital Rain effect but changed my mind to go with something else.
Like the first Fader this one, is mapped to control the speed of the arcs in the DigitalRain class. It also plays a audio file when the Fader is maxed.

The Star Map is a object of the class Star. It reads a file using  loadTable() and fills an arrayList of stars. Each has a size, name and position. Each also has an arrayList of Planet objects. Each planet has random size, speed and orbit.

It checks for the mouse click over a star. If the star is clicked, the transition screen is called and an planet display corresponding the the values of planets the each star has will be displayed.

**Transition Screen**
This screen use the random points on the screen. Increasing or decreasing the X and Y values of the lines it gives a blur/warp effect.
This screen needs to be reset after each use or it will continue "warping" forever.

**Planet View**
The planet view will show the planets each star has. The planets are stored in an arrayList Each star object has its own list of planets. The planets are objects, each having their own position, radius, colour and speed.

**Use of Inheritance and Polymorphism
There is a base class SpaceObject. The Asteriod Class and the UFO Class inherit common fields to reduce duplicate code. There is one Asteroid object and one UFO object stored in an arrayList of
SpaceObjects. While iterating through this arrayList the correct method is called for the each object. If one of these objects hits a planet it is removed from the arrayList.

[![Video](http://img.youtube.com/vi/MnEqwMS12lw/0.jpg)](http://www.youtube.com/watch?v=MnEqwMS12lw

