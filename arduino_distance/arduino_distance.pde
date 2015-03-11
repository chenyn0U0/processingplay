import processing.serial.*;

Serial myPort;

float lx=150;
float rx=350;

void setup(){
  size(500,500);
  myPort = new Serial(this,"COM6", 9600);  //in fact, any rate is ok...
  myPort.bufferUntil('\n');  //buffer until meet '\n', then call the event listener
}

void draw(){
size(500,500);
}

//listen to the event. when buffer filled, run this method
void serialEvent(Serial p) {
  background(255);
  ellipse(lx, 0, 20, 20);
  ellipse(rx, 0, 20, 20);
  String inString = p.readString();
  String[] distance = splitTokens(inString,",");
  
  float left=Float.parseFloat(distance[0]);
  float right=Float.parseFloat(distance[1]);
  print(inString);
  ellipse(250, (left+right), 50, 50);
  
  ellipse(lx, left*2, 30, 30);
  ellipse(rx, right*2, 30, 30);
}




