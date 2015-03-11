PVector[] points= new PVector[200];
int poinum=0;
int disvalue1=50;
int disvalue2=200;
int disvalue3=400;
int lastnum=0;

void setup(){
size(1000,1000);
}

void draw(){
  if(lastnum<poinum){
  if(poinum>1){
for(int i=0;i<poinum;i++)
{for(int j=0;j<i;j++){
float distance=dist(points[i].x,points[i].y,points[j].x,points[j].y);
if(distance<disvalue1){strokeWeight(3); line(points[i].x,points[i].y,points[j].x,points[j].y);}
else if(distance<disvalue2){strokeWeight(2);  line(points[i].x,points[i].y,points[j].x,points[j].y);}
else if(distance<disvalue3){strokeWeight(1);  line(points[i].x,points[i].y,points[j].x,points[j].y);}
}
}
}
}
}

void mousePressed(){
points[poinum]= new PVector(mouseX,mouseY);
strokeWeight(3);
point(mouseX,mouseY);
poinum++;
}
