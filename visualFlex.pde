/*
Code based on “Arduino meets Processing” Potentiometer example
>> http://webzone.k3.mah.se/projects/arduino-workshop/projects/arduino_meets_processing/instructions/poti.html
Reads 4 analog inputs and visualizes them by drawing a 2x2 grid,
using grayscale shading of each square to represent sensor value.
>> http://www.kobakant.at/DIY/?cat=347
*/

import processing.serial.*;

// definition of window size
// you can change the size of the window as you like
// the thresholdGraph will be scaled to fit
// the optimal size for the thresholdGraph is 1000 x 400
int xWidth = 1200;
int yHeight = 600;

// xPos input array, using prefix
int[] xPosArr= {0,0,0,0,0}; 

// 
int[] messageArr= {0,0,0,0,0}; 
  
// Arrays for threshholding
int[] threshMax= {0,0,0,0,0}; 
int[] threshMin= {0,0,0,0,0}; 
  
// variables for serial connection. portname and baudrate are user specific
Serial port1;

//Set your serial port here (look at list printed when you run the application once)
String V3 = Serial.list()[0];
String portname1 = V3;
String newString = "";
int baudrate = 9600;
  
int prefix = 1;
String serialIN = "";
String serialINPUT = ""; 
String buffer = ""; 
int value = 0; 

// ThresholdGraph draws grid and poti states
ThresholdGraph in;

void setup(){
  // set size and framerate
  size(xWidth, yHeight);
  frameRate(25);
  background(255);
  strokeWeight(5);
  stroke(0);
  smooth();
  strokeCap(ROUND);

  // establish serial port connection      
  port1 = new Serial(this, portname1, baudrate);
  println(Serial.list());  // print serial list

  // create DisplayItems object
  in = new ThresholdGraph();
  
  // THRESHOLD VALUES:
  // using the thresholdGraph you can determine the MIN and MAX values
  // of your sensors. Enter these here. They must lie between 0 and 1000.
  
    //MIN trashhold
    threshMin[0] = 803;   // one
    threshMin[1] = 815;   // two
    threshMin[2] = 769;   // three
    threshMin[3] = 771;   // four
    threshMin[4] = 855;   // five
    
    //MAX trashhold
    threshMax[0] = 945;   // one
    threshMax[1] = 950;   // two
    threshMax[2] = 920;   // three
    threshMax[3] = 940;   // four
    threshMax[4] = 955;   // five
}//end setup


// draw listens to serial port, draw 
void draw(){
  
  // listen to serial port and trigger serial event  
  while(port1.available() > 0){
        serialIN = port1.readString();
       // println(serialIN);
        serialEvent(serialIN);  
        }
        
  // threshold serial input  
  threshHolding();  

  // draw serial input
  in.update();
}//end draw()
