float predegree=20;
float firstra=10;
float lastra=200;
int shapenum=40;
int shapeangle=4;
float preangle= radians(predegree);

void setup(){
size(1000,600);
for(int i=0;i<shapenum;i++){
  float ra=lastra-(((lastra-firstra)/shapenum)*i);
  drawshape(shapeangle,ra,preangle*i);
}

}



void drawshape(int shapeangle,float shapera,float degree)
{
  beginShape();
  for(int i=0;i<shapeangle;i++)
  {
    float angle=TWO_PI/shapeangle;
    vertex(width/2+shapera*cos(angle*i+degree),height/2+shapera*sin(angle*i+degree));
  }
  endShape(CLOSE);
}
