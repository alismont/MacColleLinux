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
  while (cpt < 10) {
      myPort.write("G91Y-10F5000");
      myPort.write('\r');
      myPort.write("G91Y10F5000");
      myPort.write('\r');
      cpt=cpt+1;
  }
  cpt=0;
}
