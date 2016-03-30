#include <Stepper.h>  
#define STEPS 200

String turns;

Stepper stepper(STEPS, 11, 10, 9, 8);

void setup() {

stepper.setSpeed(140);
Serial.begin(9600);
  
}

void loop() {
   if (Serial.available()) 
   {
     turns = Serial.readString(); 
     int a = turns.toInt();
     /*
     if(abs(a) < 1024){
        stepper.step(a);
     }
     else if(a >= 1024){
        stepper.step(-(2048-a));
     }
     else{
       stepper.step(2048+a);  
     }*/
     stepper.step(a);
     delay(1000);
   }
}
