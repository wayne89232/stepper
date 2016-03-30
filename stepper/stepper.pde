import controlP5.*;
import processing.serial.*;

ControlP5 cp5;
int knobValue = 100;

Knob myKnobA;
Knob myKnobB;
Serial myPort;

void setup() {
  
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600);
  
  size(700,400);
  smooth();
  noStroke();
  cp5 = new ControlP5(this);
  
  myKnobA = cp5.addKnob("counter_clockwise")
               .setRange(0,-360)
               .setValue(0)
               .setPosition(200,150)
               .setRadius(50)
               ;
                     
  myKnobB = cp5.addKnob("clockwise")
               .setRange(0,360)
               .setValue(0)
               .setPosition(400,150)
               .setRadius(50)
               ;
}

void draw() {
}

void counter_clockwise(int theValue) {
  theValue = theValue * 2048 / 360 ;
  myPort.write(str(theValue));
  //println("setting value to "+theValue);
}
void clockwise(int theValue) {
  theValue = theValue * 2048 / 360 ;
  myPort.write(str(theValue));
  println("setting value to "+theValue);
}