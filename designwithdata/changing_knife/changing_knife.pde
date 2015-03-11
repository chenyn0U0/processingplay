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
IsoSkeleton skeleton;
Knife shape;
float handlec[][];
float bladec[][];
  float thickness=5;
  float howlong=0;

void setup() {
  size(800,800, P3D);
  handlec=gethandlec();
  bladec=getbladec();
}

void draw(){

  background(220);
  lights();  
  float zm = 500;
  float sp = 0.03 * frameCount;
  camera(zm * cos(sp)+120, 200, zm * sin(sp), 120,200, 0, 0, 1, 0);

  fill(255,255,0);
  stroke(100);
  
  
  skeleton = new IsoSkeleton(this);
  
//  float thickness=map(mouseX,0,width,1,maxthickness);
//  float howlong=map(mouseY,0,height,0,maxhowlong);
  
  shape=new Knife(handlec,bladec);
  shape.drawskeleton();
  
  
//  
//  bladec=change(bladec,1);
//  handlec=change(handlec,0.2);
}



void mousePressed(){
  bladec=change(bladec,20);
  handlec=change(handlec,5);
}





float[][] gethandlec(){
  float[][] h={{100,200,-thickness},{100,200,thickness},{100,400,thickness},{100,400,-thickness},{130,200,-thickness},{140,400,-thickness},{130,200,thickness},{140,400,thickness}};       
  return h;
}

float[][] getbladec(){
  float[][] b={{100,200,thickness},{100,200,-thickness},{130,200,-thickness},{130,200,thickness},{100,0,0},{145+howlong,200,0},{107+howlong,10,0},{100+(howlong/2),20,thickness/2},{100+(howlong/2),20,-thickness/2},{135+(howlong/2),200,thickness/2},{135+(howlong/2),200,-thickness/2}};
  return b;
}



  float[][] change(float[][] now,float maxchange){
    float[][] newrh=createrandom(now,maxchange);
    now=addrandom(now,newrh);
    return now;
  }

  float[][] createrandom(float[][] num,float maxchange){
    float[][] result=new float[num.length][3];
    for(int i=2;i<result.length;i++){
      result[i][0]=random(-maxchange,maxchange);
      result[i][1]=random(-maxchange,maxchange);
      result[i][2]=random(-maxchange,maxchange);
    }
    return result;
  }

  float[][] addrandom(float[][] num,float random[][]){
    for(int i=2;i<num.length;i++){
      num[i][0]+=random[i][0];
      num[i][1]+=random[i][1];
      num[i][2]+=random[i][2];
    }
    return num;
  }
  
  float[][] minusrandom(float[][] num,float random[][]){
    for(int i=0;i<num.length;i++){
      num[i][0]-=random[i][0];
      num[i][1]-=random[i][1];
      num[i][2]-=random[i][2];
    }
    return num;
  }

















class Knife{
  float[][] handle;
  float[][] blade;
  
  Knife(float[][] h,float[][] b){
      this.handle=h;
      this.blade=b;
  }
  
  void drawskeleton(){
    PVector[] h=getonlyshape(handle);
    PVector[] b=getonlyshape(blade);
    addskeleton(skeleton,b);
    addskeleton(skeleton,h);
    
    skeleton.plot(10.f * float(mouseX) / (2.0f*width), float(mouseY) / (2.0*height));
  }  
}


  void addskeleton(IsoSkeleton skeleton,PVector[] pts){
    for (int i=0; i<pts.length; i++) {
      for(int j=i+1;j<pts.length;j++){
        skeleton.addEdge(pts[i], pts[j]);
      }
    }
  }


PVector[] getshape(IsoWrap wrap,float[][] num){
    PVector[] pointgroup = new PVector[num.length];
    for(int i=0;i<num.length;i++){
      pointgroup[i]=new PVector(num[i][0],num[i][1],num[i][2]);
      wrap.addPt(pointgroup[i]);
    }
    return pointgroup;
}

PVector[] getonlyshape(float[][] num){
    PVector[] pointgroup = new PVector[num.length];
    for(int i=0;i<num.length;i++){
      pointgroup[i]=new PVector(num[i][0],num[i][1],num[i][2]);
    }
    return pointgroup;
}
