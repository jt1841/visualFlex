/*
*  
*  This class draws a grid with a value scale and 
*  color rectangles acording to sensor input.
*
*/

class ThresholdGraph{

// variables of DisplayItems object 
PFont font;
int fontsize = 12;
String fontname = "Monaco-14.vlw";
String inputName = "";
float gridSpacing = width/25.0;
int gridValues = 10;
float potiHeight = height/6.0;
int potiWidth = 20;
int poti_ID = 0;
float scaleValue = width/250.0;
//float scaleValueY = height/400.0;

// constructor
ThresholdGraph(){
  font = loadFont(fontname);
  textFont(font, fontsize);
  }//end ThresholdGraph
 
  // draws grid and value scale
  void update(){
    //refresh background
    background(255);
    //scale(scaleValueX, scaleValueY);  //scale everything to fit window size
    
    for (int i = 0; i < xPosArr.length; i++){
      // draw thresholds in light(min) and dark(max) grey
      noFill();
      stroke(255,0,0);
      strokeWeight(2);
      rect((threshMin[i]-750)*scaleValue, i*potiHeight, (threshMax[i]-threshMin[i])/2*scaleValue, potiHeight);
      stroke(0,255,0);
      strokeWeight(2);
      rect((threshMax[i]-750)*scaleValue, i*potiHeight, -((threshMax[i]-threshMin[i])/2)*scaleValue, potiHeight); 

      noStroke();
      // poti colours and names
      if (i == 0){ fill(0, 255, 38); inputName = "-Thumb";}
      if (i == 1){ fill(255, 51, 156); inputName = "-Index";}
      if (i == 2){ fill(234, 255, 0); inputName = "-Middle";}
      if (i == 3){ fill(255, 82, 0); inputName = "-Ring";}
      if (i == 4){ fill(0, 136, 255); inputName = "-Pinky";}
      // draw poti at xpos 
      rect((xPosArr[i]-750)*scaleValue-potiWidth/2, i*potiHeight, potiWidth, potiHeight);
      
      // draw xpos as text
      fill(0);
      text((xPosArr[i])+inputName, (xPosArr[i]-750)*scaleValue, i*potiHeight+potiHeight/2);
      }//end for
    
    // draw grid to fit window size
    stroke(0);
    strokeWeight(1);
    
    // vertical lines
    for (int i=0; i<width/gridSpacing; i++){
      line(i*gridSpacing, 0, i*gridSpacing, height);
      textAlign(LEFT);
      text(i*gridValues+750, i*gridSpacing+2, fontsize);
      }//end for
      
translate(100,100);
  }// end update
}// end class Display/*

