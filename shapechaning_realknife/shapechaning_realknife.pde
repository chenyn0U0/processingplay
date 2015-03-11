/*-----------------------------------
Library: ComputationalGeometry
By: Mark Collins & Toru Hasegawa
Example: IsoWrap

Creates a simple boundary hull
around a group of points, effectively
shrink wrapping the point cloud
------------------------------------*/

import ComputationalGeometry.*;


float maxthickness=200;
float maxhowlong=200;
IsoWrap wrap1;
IsoWrap wrap2;


void setup() {
  size(800,800, P3D);
}

void draw(){
  
  background(220);
  lights();  
  float zm = 500;
  float sp = 0.05 * frameCount;
  camera(zm * cos(sp)+120, 200, zm * sin(sp), 120,200, 0, 0, 1, 0);

  fill(255,255,0);
  stroke(100);
  
   wrap1=new IsoWrap(this);
   wrap2= new IsoWrap(this);
  
  float thickness=map(mouseX,0,width,1,maxthickness);
  float howlong=map(mouseY,0,height,0,maxhowlong);
  
  Knife shape=new Knife(thickness,howlong);
  shape.drawknife();
}



PVector[] getshape(IsoWrap wrap,float[][] num){
    PVector[] pointgroup = new PVector[num.length];
    for(int i=0;i<num.length;i++){
      pointgroup[i]=new PVector(num[i][0],num[i][1],num[i][2]);
      wrap.addPt(pointgroup[i]);
    }
    return pointgroup;
}

class Knife{
  float[][] handle;
  float[][] blade;
  Knife(float thickness,float howlong){
      float[][] h={{100,400,-thickness},{100,200,-thickness},{130,200,-thickness},{140,400,-thickness},{100,400,thickness},{100,200,thickness},{130,200,thickness},{140,400,thickness}}; 
      float[][] b={{100,0,0},{100,200,thickness},{100,200,-thickness},{130,200,-thickness},{130,200,thickness},{145+howlong,200,0},{107+howlong,10,0},{100+(howlong/2),20,thickness/2},{100+(howlong/2),20,-thickness/2},{135+(howlong/2),200,thickness/2},{135+(howlong/2),200,-thickness/2}};
      this.handle=h;
      this.blade=b;
  }
  
  void drawknife(){
      // Add points
      getshape(wrap1,handle);
      getshape(wrap2,blade);
      wrap1.plot();
      wrap2.plot();
  }
}
