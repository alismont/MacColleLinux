// Example by Tom Igoe

import processing.serial.*;

// The serial port:
Serial myPort;
int cpt=0;

void setup() {
  // List all the available serial ports:
  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[0], 115200);
  
       delay(5000);
     myPort.write("$X");
   myPort.write('\r');
   myPort.write("$H");
   myPort.write('\r');
  //myPort.write("G90");
   //myPort.write('\r');
   //myPort.write("G0Y100X50");
  // myPort.write('\r');
}

void draw() {
while (myPort.available() > 0) {
    String inBuffer = myPort.readString();   
    if (inBuffer != null) {
      println(inBuffer);
    }
  }
}


void mouseClicked() { 
    myPort.write("G90");
   myPort.write('\r');
     myPort.write("G0X53.50Y90. 70");
   myPort.write('\r');
  // while (cpt < 10) {
  // myPort.write("G0X53,50Y90,70");
  // myPort.write('\r');
  //   delay(5000);
  // myPort.write("G0Y100X50");
  // myPort.write('\r');
  //    delay(5000);
  //    cpt=cpt+1;
  //}
  cpt=0;
}
