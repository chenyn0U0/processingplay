import processing.serial.*;

Serial myPort;

void setup(){
  size(500,500);
  myPort = new Serial(this,"COM6", 9600);  //in fact, any rate is ok...
  myPort.bufferUntil('\n');  //buffer until meet '\n', then call the event listener
}

void draw(){

}

//listen to the event. when buffer filled, run this method
void serialEvent(Serial p) {
  background(255);
  String inString = p.readString();
  String[] revisions = splitTokens(inString,",");
  float parsex=map(Float.parseFloat(revisions[0]),95,130,0,width);
  float parsey=map(Float.parseFloat(revisions[1]),95,135,height,0);
  print(inString);
   ellipse(parsey, parsex, 50, 50);
}




