float firstra;
float lastra;
int shapenum;
int shapeangle;
float preangle;

boolean drawornot=false;

void setup(){
size(1000,600);
}

void draw(){
  if(drawornot){
  firstra=0;
  lastra=random(20,100);
  shapeangle=(int)random(3,9);
  preangle=random(0,PI/2);
  shapenum=(int)random(10,50);
  for(int i=0;i<shapenum;i++){
  float ra=lastra-(((lastra-firstra)/shapenum)*i);
  drawshape(shapeangle,ra,preangle*i,mouseX,mouseY);}
  drawornot=false;}
}


void mousePressed(){
  drawornot=true;
}



void drawshape(int shapeangle,float shapera,float degree,float x,float y)
{
  beginShape();
  for(int i=0;i<shapeangle;i++)
  {
    float angle=TWO_PI/shapeangle;
    vertex(x+shapera*cos(angle*i+degree),y+shapera*sin(angle*i+degree));
  }
  endShape(CLOSE);
}
