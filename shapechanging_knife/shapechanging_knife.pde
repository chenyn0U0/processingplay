/*-----------------------------------
Library: ComputationalGeometry
By: Mark Collins & Toru Hasegawa
Example: IsoSkeleton

Creates a 3D skeleton with adjustable 
thickness and node size, based on an
edge pairing of points.
------------------------------------*/

import ComputationalGeometry.*;
IsoSkeleton skeleton;


float eyeround=500;
float eyespeed=0.03;

void setup() {
  size(1000, 1000, P3D);

  // Create iso-skeleton
  skeleton = new IsoSkeleton(this);

    float[][] handlenum={{100f,400f},{100f,200f},{130f,200f},{140f,400f}};
    float[][] bladenum={{100f,0f},{100f,200f},{145,200f},{107f,10f}};
  
  
    PVector[] handle = getshape(handlenum);
    PVector[] blade = getshape(bladenum);

    drawshape(handle);
    drawshape(blade);
 
}

void draw() {
  background(220);
  lights();  
  float sp = eyespeed * frameCount;

  camera(120-eyeround*sin(sp),200,eyeround*cos(sp), 120, 200, 0, 0, 1, 0);
  
  noStroke();
  skeleton.plot(10.f * float(mouseX) / (2.0f*width), float(mouseY) / (2.0*height));  // Thickness as parameter
}




PVector[] getshape(float[][] num){
    PVector[] pointgroup = new PVector[num.length];
    for(int i=0;i<num.length;i++){
      pointgroup[i]=getp(num[i][0],num[i][1],0f);
    }
    return pointgroup;
}


PVector getp(float a, float b,float c){
  PVector x= new PVector(a,b,c);
  return x;
}

void drawshape(PVector[] pts){
    for (int i=0; i<pts.length; i++) {
      if(i+1==pts.length){
        skeleton.addEdge(pts[i], pts[0]);
      }
      else{
        skeleton.addEdge(pts[i], pts[i+1]);
      }
  }
}
