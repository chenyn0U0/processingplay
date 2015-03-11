import processing.serial.*;

Serial myPort;

float lx=150;
float cx=250;
float rx=350;

void setup(){
  size(500,500);
  myPort = new Serial(this,"COM9", 9600);  //in fact, any rate is ok...
  myPort.bufferUntil('\n');  //buffer until meet '\n', then call the event listener
}

void draw(){
size(500,500);
}

//listen to the event. when buffer filled, run this method
void serialEvent(Serial p) {
  String inString = p.readString();
  String[] distance = splitTokens(inString,",");
  
  background(255);
  fill(getcolor(int(distance[3])));
  ellipse(lx, 0, 20, 20);
  fill(getcolor(int(distance[4])));
  ellipse(cx,0,20,20);
  fill(getcolor(int(distance[5])));
  ellipse(rx, 0, 20, 20);

  float left=Float.parseFloat(distance[0]);
  float center=Float.parseFloat(distance[1]);
  float right=Float.parseFloat(distance[2]);
  print(inString);  
  noFill();
  ellipse(lx, left, 30, 30);
  ellipse(cx,center,30,30);
  ellipse(rx, right, 30, 30);
}


color getcolor(int number)
{
  int result=255;  
  if(number==1) result=255;
  if(number==0) result=0;
  return result;
}

