#include <SoftwareSerial.h>

SoftwareSerial Genotronex(10, 11);

int x=0;
void setup()

{

pinMode(6, OUTPUT);
pinMode(9, OUTPUT);
pinMode(3 ,OUTPUT);
pinMode(5 ,OUTPUT);
Genotronex.begin(9600);
}
void forward()
{
  digitalWrite(3, LOW);
  digitalWrite(5, HIGH);
  digitalWrite(9, HIGH);
  digitalWrite(6, LOW);
}
void backward()
{
  digitalWrite(3, HIGH);
  digitalWrite(5, LOW);
  digitalWrite(9, LOW);
  digitalWrite(6, HIGH);
}
void brake()
{
  digitalWrite(3, LOW);
  digitalWrite(5, LOW);
  digitalWrite(9, LOW);
  digitalWrite(6, LOW);
}
void left()
{
  digitalWrite(3, LOW);
  digitalWrite(5, HIGH);
  digitalWrite(9, LOW);
  digitalWrite(6, LOW);
}
void right()
{
  digitalWrite(3, LOW);
  digitalWrite(5, LOW);
  digitalWrite(9, HIGH);
  digitalWrite(6, LOW);
}

void loop()

{
  while(Genotronex.available()>0)
{
  
 x= Genotronex.parseInt();
 if(x==8){
 Genotronex.print("FORWARD");
 forward();
}
  else if(x==2){
  Genotronex.println("BACKWARD");
  backward();
}
  else if(x==5){
   Genotronex.println("BRAKE");
   brake();
}
  else if(x==4){
   Genotronex.println("LEFT");
   left();
}
  else if(x==6){
   Genotronex.println("RIGHT");
   right();
}

}

}

