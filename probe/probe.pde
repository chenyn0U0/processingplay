
String fileName="alldata.txt";
float lx=150;
float cx=250;
float rx=350;


int i=0;

void setup(){
  size(500,500);
}

void draw(){
size(500,500);



String lines[] = loadStrings(fileName);
if (i>lines.length-1) i=0;
  println(lines[i]);
  if(lines[i]!=""){
    
    String inString=lines[i];
  String[] distance = splitTokens(lines[i],",");
  
  background(255);
  fill(getcolor(int(distance[3])));
  ellipse(lx, 0, 20, 20);
  fill(getcolor(int(distance[4])));
  ellipse(cx,0,20,20);
  fill(getcolor(int(distance[5])));
  ellipse(rx, 0, 20, 20);
  
  fill(getcolor(int(distance[6])));
  ellipse(450, 450, 20, 20);

  float left=Float.parseFloat(distance[0]);
  float center=Float.parseFloat(distance[1]);
  float right=Float.parseFloat(distance[2]);
  print(inString);  
  noFill();
  ellipse(lx, left, 30, 30);
  ellipse(cx,center,30,30);
  ellipse(rx, right, 30, 30);
   
if(int(distance[3])!=0&&int(distance[4])!=0&&int(distance[5])!=0&&
int(distance[6])!=1){delay(0);}
else delay(200); 
}
  i+=2;
  

}


color getcolor(int number)
{
  int result=255;  
  if(number==1) result=255;
  if(number==0) result=0;
  return result;
}

