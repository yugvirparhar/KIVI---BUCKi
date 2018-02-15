#include <SoftwareSerial.h>

SoftwareSerial Genotronex(10, 11);  //Define the RX and TX pins!
int BluetoothData; 

int x_coord= 0; // Controls Turning (Sign: Wheel | Magnitude: Acceleration)
int z_coord= 0; // Controls Movement (Sigh : Forward/Reverse | Magnitude : Acceleration)

void setup()
{
Genotronex.begin(9600);

pinMode(6, OUTPUT);
pinMode(9, OUTPUT);
pinMode(3 ,OUTPUT);
pinMode(5 ,OUTPUT);
}

void loop() 
{

  Brake();

while (Genotronex.available())
{
digitalWrite(13, HIGH);

// X coordinate received from Leap
x_coord = Genotronex.parseInt();

// Z coordinate received from Leap
z_coord = Genotronex.parseInt();

if(z_coord >=0) // Move Forward 
{
  if(x_coord>=0)//Right
  {
     Forward((255-x_coord), z_coord); // Slow Down Right Wheel
    }
   else//Left
  {
     Forward(z_coord, (255+x_coord)); // Slow Down Left Wheel
    }
 
  }
else // Backward
{
  z_coord = (-1)*z_coord;
  
  if(x_coord>=0)//Right
  {
     Backward(z_coord, (255-x_coord));// Slow Down Right Wheel
    }
   else//Left
  {
     Backward(255+x_coord, z_coord); // Slow Down Left Wheel
    }
  
  }
  //delay(100);
}
}

void Forward(int Wheel_Left,int Wheel_Right)
{
  analogWrite(3, 0);
  analogWrite(5, Wheel_Left);
  
  analogWrite(9, Wheel_Right);
  analogWrite(6, 0);
}
void Backward(int Wheel_Left, int Wheel_Right)
{
  analogWrite(3, Wheel_Left);
  analogWrite(5, 0);
  
  analogWrite(9, 0);
  analogWrite(6, Wheel_Right);
}
void Brake()
{
  analogWrite(3, 0);
  analogWrite(5, 0);
  
  analogWrite(9, 0);
  analogWrite(6, 0);
  }
