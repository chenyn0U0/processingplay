//
//import ComputationalGeometry.*;
//
//
//String fileName="obj.txt";
//
//float[][] points; 
//IsoSkeleton skeleton= new IsoSkeleton(this);;
//
//
//void setup(){
//  size(800,600, P3D);
//  String lines[] = loadStrings(fileName);
//
//  int a=0;
//  for (int i = 0 ; i < lines.length; i++) {
//    
//    String l[]=lines[i].split(" "); 
//    if(l[0].equals("v")){
//      a++;
//    }
//  }
//  points=new float[a][3];
//  println(a);
//  a=0;
//  for (int i = 0 ; i < lines.length; i++) {
//    String l[]=lines[i].split(" "); 
//    if(l[0].equals("v")){
//      
//      float[] point={parseFloat(l[2]),parseFloat(l[3]),parseFloat(l[4])};
//      points[a]=point;
//      a++;
//    }
//    if(l[0].equals("f")){
//        float[][] unit=new float[l.length-1][3];
//        
//        for(int m=1;m<l.length;m++){
//          String[] n=l[m].split("/");
//         
//          unit[m-1]=points[parseInt(n[0])-1];
//        }
//        addskeleton(skeleton,getpvector(unit));
//    }
//  }
//  
//  
//
//}
//void draw(){
//    background(0);
//      float zm = 100;
//  float sp = 0.05 * frameCount;
//  camera(zm * cos(sp), 0, zm * sin(sp), 0,0, 0, 0, -1, 0);
////  float plota=map(mouseX,0,width,0,5);
////  float plotb=map(mouseY,0,height,0,0.5);
//float plota=0.1;
//  float plotb=0.1;
//  skeleton.plot(plota,plotb);
//
//println(frameCount);
//}
//
//
//
//
//  void addskeleton(IsoSkeleton skeleton,PVector[] pts){
//    for (int i=0; i<pts.length; i++) {
//      for(int j=i+1;j<pts.length;j++){
//        skeleton.addEdge(pts[i], pts[j]);
//      }
//    }
//  }
//  
//  PVector[] getpvector(float[][] num){
//      PVector[] pointgroup = new PVector[num.length];
//      for(int i=0;i<num.length;i++){
//        pointgroup[i]=new PVector(num[i][0],num[i][1],num[i][2]);
//      }
//      return pointgroup;
//  }

