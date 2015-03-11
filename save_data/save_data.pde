//######################setup here######################
//file name↓
String fileName="thedata.txt";
//COM port↓
String comport="COM9";
//######################setup here######################

import processing.serial.*;
Serial myPort;

void setup(){
  size(270,400);
  myPort = new Serial(this,comport, 9600);  //in fact, any rate is ok...
  myPort.bufferUntil('\n');  //buffer until meet '\n', then call the event listener
PImage img=loadImage("tuzhi.jpg");
image(img,width/2-img.width/2,height/2-img.height/2);  
}

void draw(){
}

//listen to the event. when buffer filled, run this method
void serialEvent(Serial p) {
String inString = p.readString();
String lines[] = loadStrings(fileName);
String newlines[]=new String[lines.length+1];
for (int i = 0 ; i < lines.length; i++) {
  println(lines[i]);
  newlines[i]=lines[i];
}
  newlines[lines.length]=inString;
  saveStrings(fileName, newlines);
  println(inString);
}




