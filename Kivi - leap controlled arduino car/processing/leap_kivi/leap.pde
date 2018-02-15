
import de.voidplus.leapmotion.*;
LeapMotion leap;

import processing.serial.*;
Serial myPort;

int voltagex;// From X-Axis
int voltagez;// From Z-Axis

void setup()
{
  size(800, 500, P3D);
  background(255);
  noStroke();
  fill(50);
  
  myPort = new Serial(this, Serial.list()[1], 9600);
  System.out.println( Serial.list()[0]);// Check your Port!

  leap = new LeapMotion(this);//Declare the Leap device!
}

void draw() 
{
background(255);

// int fps = leap.getFrameRate(); 

/*
The fps variable and this method was causing issues for us
But maybe try uncommenting it and it might work out well for you.
*/

for (Hand hand : leap.getHands()) 
{
float   handGrab           = hand.getGrabStrength();
PVector handStabilized     = hand.getStabilizedPosition();// Get the hand coordinates! 

voltagex = (int) map(handStabilized.x, 0, 700,-254,255);// Get the x coordinate and scale it

if(voltagex>255)//Setting boundaries, so the values dont go beyond the range.
 voltagex=255;
else if(voltagex<-255)
 voltagex=-255;

voltagez = (int) map(handStabilized.z, -20, 80, -254,255);// Get the z coordinate and scale it

if(voltagez>255)
 voltagez=255;
else if(voltagez<-255)
 voltagez=-255;

System.out.println("this is x "+voltagex);
System.out.println("this is z "+voltagez);

if(handGrab>0.85)  // To implement the Grab gesture
{
myPort.write("0 0");//Apply Brakes by grabbing!
handGrab = hand.getGrabStrength();
}


String out= str(voltagex) + ' ' + str(voltagez);//Convert the coordinates to String.

myPort.write(out);//Send out the String as Bytes through the COM Channel (for us it was COM9, may vary)
System.out.println(out);

hand.draw();

}


}

void leapOnInit() {

}
void leapOnConnect() {

}
void leapOnFrame() {

}
void leapOnDisconnect() {

}
void leapOnExit() {

}