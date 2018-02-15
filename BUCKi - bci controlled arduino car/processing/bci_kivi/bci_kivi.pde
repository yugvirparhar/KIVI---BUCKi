//CONTROL INTERFACE

import processing.serial.*;
Serial myPort;

int rectx, recty;   //Declaring coordinates for the buttons
int rect1x, rect1y;
int rect2x, rect2y;
int rect3x, rect3y;
int rect4x, rect4y;

int rectsize = 90;   //All the buttons will have height and width of 90 pixels

color rectColor = 0; //We will implement change in color for good UX
color rect1color =0;
color rect2color =0;
color rect3color =0;
color rect4color =0;

boolean rectover  = false;// To check whether cursor is over a button
boolean rect1over = false;
boolean rect2over = false;
boolean rect3over = false;
boolean rect4over = false;

void setup()
{
  size(800, 600);
  rectColor = color(0);
  rectx = width/2 - rectsize/2;         //Setting the buttons
  recty = height/2 - rectsize/2;
  rect1x = width/2 - 10 - 3*rectsize/2;
  rect1y = height/2 -rectsize/2;
  rect2x =width/2 +10 +rectsize/2;
  rect2y = height/2 -rectsize/2;
  rect3x = width/2  -rectsize/2;
  rect3y = height/2 + 10+ rectsize/2;
  rect4x = width/2 - rectsize/2;
  rect4y = height/2 -10 -3*rectsize/2;
  
  myPort = new Serial(this, Serial.list()[0], 9600);
}

void draw()
{
  update(mouseX, mouseY);
  background (255);
  stroke(0);
  fill(rectColor);
  rect(rectx, recty, rectsize, rectsize);//Creating the buttons
  fill(rect1color);
  rect(rect1x, rect1y, rectsize, rectsize);
    fill(rect2color);
  rect(rect2x, rect2y, rectsize, rectsize);
    fill(rect3color);
  rect(rect3x, rect3y, rectsize, rectsize);
    fill(rect4color);
  rect(rect4x, rect4y, rectsize, rectsize); 
}

void update(int x, int y) //Gives which button the cursor is on
{
  if(overRect(rectx, recty, rectsize, rectsize)){
  rectover  = true;
  rect1over = false; 
  rect2over = false;
  rect3over = false;
  rect4over = false;
}
else if(overRect(rect1x, rect1y, rectsize, rectsize))
{
  rectover  = false;
  rect1over = true;
  rect2over = false;
  rect3over = false;
  rect4over = false;
}
else if(overRect(rect2x, rect2y, rectsize, rectsize))
{
  rectover  = false;
  rect1over = false;
  rect2over = true;
  rect3over = false;
  rect4over = false;
}
else if(overRect(rect3x, rect3y, rectsize, rectsize))
{
  rectover  = false;
  rect1over = false;
  rect2over = false;
  rect3over = true;
  rect4over = false;
}
else if(overRect(rect4x, rect4y, rectsize, rectsize))
{
  rectover  = false;
  rect1over = false;
  rect2over = false;
  rect3over = false;
  rect4over = true;
}
}

void mousePressed(){
  if (rectover){ 
  rectColor =255;
  myPort.write(str(5));
}
else if(rect1over){
  rect1color =255;
  myPort.write(str(4));
}
else if(rect2over){
  rect2color =255;
  myPort.write(str(6));
}
else if(rect3over){
  rect3color =255;
  myPort.write(str(2));
}
else if(rect4over){
  rect4color =255;
  myPort.write(str(8));
}
}

void mouseReleased()
{
  if(rectover)
  {rectColor   =0;
  }
  else if(rect1over)
  {rect1color =0;
  }
  else if(rect1over)
  {rect1color =0;
  }
  else if(rect2over)
  {rect2color =0;
  }
  else if(rect3over)
  {rect3color =0;
  }
  else if(rect4over)
  {rect4color =0;
  }
}



boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}