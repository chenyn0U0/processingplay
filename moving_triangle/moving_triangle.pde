int pointnum=130;
float pointdist=100;


PVector[] points= new PVector[pointnum];

void setup(){
size(1000,800);
points[0]=new PVector(0,0);
float xvalue=0;
float yvalue=0;
for(int i=1;i<pointnum;i++)
{
  PVector newpoint;
  boolean judge; 
  do {
      judge=false;
      newpoint=backmovement((int)floor(random(1,6)),points[i-1]);
      for(int j=0;j<i;j++) {if(newpoint==points[j]) judge=true;}
  }
  while(judge);
  points[i]=newpoint;
  xvalue+=points[i].x;
  yvalue+=points[i].y;
}
xvalue=xvalue/pointnum;
yvalue=yvalue/pointnum;
for(int i=0;i<pointnum;i++)
{
strokeWeight(10);
points[i].x=points[i].x-xvalue+width/2;
points[i].y=points[i].y-yvalue+height/2;
point(points[i].x,points[i].y);}
}

void draw(){
background(255,255,255);
for(int i=0;i<pointnum;i++)
{
  PVector newpoint;
  boolean judge;
  do {
      judge=false; 
      newpoint=backmovement((int)floor(random(0,6)),points[i]);
      for(int j=0;j<i;j++) {if(newpoint==points[j]) judge=true;}
  }
  while(judge);
  points[i]=newpoint;
}
//draw
for(int i=0;i<pointnum;i++){strokeWeight(10);
point(points[i].x,points[i].y);}
for(int i=0;i<pointnum-1;i++)
{for(int j=i+1;j<pointnum;j++){
float distance=dist(points[i].x,points[i].y,points[j].x,points[j].y);
if(distance<101){
strokeWeight(1); 
line(points[i].x,points[i].y,points[j].x,points[j].y);}
}
}
//draw
  delay(500);
}

PVector backmovement(int a,PVector pre)
{
  PVector result=new PVector();
  if(random(0,100)<30){
  if(a==0) result=pre;
  if(a==1) result=new PVector(pre.x-pointdist/2,pre.y+pointdist*sin(TWO_PI/6));
  if(a==2) result=new PVector(pre.x+pointdist/2,pre.y+pointdist*sin(TWO_PI/6));
  if(a==3) result=new PVector(pre.x+pointdist,pre.y);
  if(a==4) result=new PVector(pre.x+pointdist/2,pre.y-pointdist*sin(TWO_PI/6));
  if(a==5) result=new PVector(pre.x-pointdist/2,pre.y-pointdist*sin(TWO_PI/6));
  if(a==6) result=new PVector(pre.x-pointdist,pre.y);}
  else result=pre;
  return result;
}

