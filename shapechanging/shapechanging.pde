/*-----------------------------------
Library: ComputationalGeometry
By: Mark Collins & Toru Hasegawa
Example: IsoWrap

Creates a simple boundary hull
around a group of points, effectively
shrink wrapping the point cloud
------------------------------------*/

import ComputationalGeometry.*;

boolean fullscreen=true;
 
float zm = 1200;
float distancetocenter=400;
float[] move={0,50,0};

float a=1;
float b=0.3;

IsoSkeleton skeleton;
IsoSkeleton skeletonup;
IsoSkeleton skeletonleft;
//IsoSkeleton skeletonback;
IsoSkeleton skeletonright;

    
Knife shape;
Knife up;
Knife left;
Knife back;
Knife right;

void setup() {
  size(displayWidth, displayHeight, P3D);
  shape=new Knife(new Chara(gethandlec(1),gethandlec(0)),new Chara(getbladec(1),getbladec(0)));
  shape.initialize();
  right=shape.getright(distancetocenter);
  left=shape.getleft(distancetocenter);
  up=shape.getup(distancetocenter);
//  back=shape.getback(distancetocenter);
  
  right.move(move);
  left.move(move);
  up.move(move);
  
  camera(0,0,zm,0,0,0,0,1,0);
}

void draw(){
  a=map(mouseX,0,width,0,5);
  b=map(mouseY,0,height,0,0.5);
  
  
  background(0);
  lights();  

  float sp = 0.03 * frameCount;
//  camera(zm * cos(sp)+120, 200, zm * sin(sp), 120,200, 0, 0, 1, 0);
 
  fill(255,255,0);
  stroke(0);
  
  skeleton= new IsoSkeleton(this);
  skeletonup= new IsoSkeleton(this);
  skeletonleft= new IsoSkeleton(this);
//  skeletonback= new IsoSkeleton(this);
  skeletonright= new IsoSkeleton(this);
//  shape.drawskeleton(skeleton,a,b);
  shape.thisrotate(1*PI/180);
  up.drawskeleton(skeletonup,a,b);
  left.drawskeleton(skeletonleft,a,b);
//  back.drawskeleton(skeletonback,a,b);
  right.drawskeleton(skeletonright,a,b);//number1:0-5;number2:0-0.5
  update(distancetocenter, move);
}



void mousePressed(){
  shape.blade.getchange(20);
  shape.handle.getchange(5);
  
  update(distancetocenter, move);
}

int keystatus=0;
void keyPressed(){
  if(keystatus==0)  camera(zm * cos(PI/2*keystatus), 0, zm * sin(PI/2*keystatus), 0,0, 0, 0, 1, 0);
  if(keystatus==1)  camera(zm * cos(PI/2*keystatus), 0, zm * sin(PI/2*keystatus), 0,0, 0, -1, 0, 0);
  if(keystatus==2)  camera(zm * cos(PI/2*keystatus), 0, zm * sin(PI/2*keystatus), 0,0, 0, 0, -1, 0);
  if(keystatus==3)  camera(zm * cos(PI/2*keystatus), 0, zm * sin(PI/2*keystatus), 0,0, 0, -1, 0, 0);
  keystatus++;
  if(keystatus>3) keystatus=0;
  print(keystatus);
}



void  update(float distancetocenter, float[] move){
  right=shape.getright(distancetocenter);
  left=shape.getleft(distancetocenter);
  up=shape.getup(distancetocenter);
//  back=shape.getback(distancetocenter);

  right.move(move);
  left.move(move);
  up.move(move);
//  back.move(move);
}
