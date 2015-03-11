//for initialize

float[] getcentrepoint(float[][] alldata){
  float[] value=new float[6];//0-maxX;1-minX;2-maxY;3-minY;4-maxZ;5-minZ
  value[0]=alldata[0][0];
  value[1]=alldata[0][0];
  value[2]=alldata[0][1];
  value[3]=alldata[0][1];
  value[4]=alldata[0][2];
  value[5]=alldata[0][2];
  for(int i=0;i<alldata.length;i++){
    if(alldata[i][0]>value[0]) value[0]=alldata[i][0];
    if(alldata[i][0]<value[1]) value[1]=alldata[i][0];
    if(alldata[i][1]>value[2]) value[2]=alldata[i][1];
    if(alldata[i][1]<value[3]) value[3]=alldata[i][1];
    if(alldata[i][2]>value[4]) value[4]=alldata[i][2];
    if(alldata[i][2]<value[5]) value[5]=alldata[i][2];
  }
  float[] centrepoint={(value[0]+value[1])/2,(value[2]+value[3])/2,(value[4]+value[5])/2};
  return centrepoint;
}

//floats[][] functions
  float[][] getalldata(float[][] a,float[][] b){
  float[][] result=new float[a.length+b.length][3];
  int k=0;
  for(int i=0;i<a.length;i++){
    result[k]=a[i];
    k++;
  }
  for(int j=0;j<b.length;j++){     
    result[k]=b[j];
    k++;
  }
  return result;
}
  
  
  float[][] change(float[][] now,float maxchange){
    float[][] newrh=createrandom(now,maxchange);
    now=plus(now,newrh);
    return now;
  }

  float[][] createrandom(float[][] num,float maxchange){
    float[][] result=new float[num.length][3];
    for(int i=0;i<result.length;i++){
      result[i][0]=random(-maxchange,maxchange);
      result[i][1]=random(-maxchange,maxchange);
      result[i][2]=random(-maxchange,maxchange);
    }
    return result;
  }
  
  float[][] plusonevalue(float[][] num,float change[]){
    float[][] nnum=new float[num.length][3];
    for(int i=0;i<num.length;i++){
      nnum[i][0]=num[i][0]+change[0];
      nnum[i][1]=num[i][1]+change[1];
      nnum[i][2]=num[i][2]+change[2];
    }
    return nnum;
  }
  
  float[][] minusonevalue(float[][] num,float change[]){
    float[][] nnum=new float[num.length][3];
    for(int i=0;i<num.length;i++){
      nnum[i][0]=num[i][0]-change[0];
      nnum[i][1]=num[i][1]-change[1];
      nnum[i][2]=num[i][2]-change[2];
    }
    return nnum;
  }
  
  float[][] plus(float[][] num,float change[][]){
    for(int i=0;i<num.length;i++){
      num[i][0]+=change[i][0];
      num[i][1]+=change[i][1];
      num[i][2]+=change[i][2];
    }
    return num;
  }
  
  float[][] minus(float[][] num,float change[][]){
    for(int i=0;i<num.length;i++){
      num[i][0]-=change[i][0];
      num[i][1]-=change[i][1];
      num[i][2]-=change[i][2];
    }
    return num;
  }
  
  void addskeleton(IsoSkeleton skeleton,PVector[] pts){
    for (int i=0; i<pts.length; i++) {
      for(int j=i+1;j<pts.length;j++){
        skeleton.addEdge(pts[i], pts[j]);
      }
    }
  }
  
  PVector[] getpvector(float[][] num){
      PVector[] pointgroup = new PVector[num.length];
      for(int i=0;i<num.length;i++){
        pointgroup[i]=new PVector(num[i][0],num[i][1],num[i][2]);
      }
      return pointgroup;
  }

//float[] rotZ(float[] point,float angle){
//  float radius=sqrt((point[0]*point[0])+(point[1]*point[1]));
//  float initialangle=atan(point[1]/point[0]);
//  println((initialangle+angle)/PI*180);
//  float[] result={(cos(initialangle+angle)*radius),(sin(initialangle+angle)*radius),point[2]};
//  return result;
//}
//
//float[] rotY(float[] point,float angle){  
//  float radius=sqrt((point[2]*point[2])+(point[0]*point[0]));
//  float initialangle=atan(point[2]/point[0]);
//  float[] result={(sin(initialangle+angle)*radius),point[1],(cos(initialangle+angle)*radius)};
//  return result;
//}

float[] rotZ(float[] point,float angle){
  
  float[] result={((point[0]*cos(angle))-(point[1]*sin(angle)) ),((point[0]*sin(angle))+(point[1]*cos(angle))),point[2]};
  return result;
}

float[] rotY(float[] point,float angle){  
  float[] result={((point[0]*cos(angle))-(point[2]*sin(angle) )),point[1],((point[0]*sin(angle))+(point[2]*cos(angle)))};
  return result;
}


//for display

boolean sketchFullScreen() {
  return fullscreen;
}
