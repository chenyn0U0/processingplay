class IsoSkeleton{
  ArrayList<Point> p;
  
  ArrayList<Point> pt;
  ArrayList<Point> pl;
  ArrayList<Point> pr;
  ArrayList<Point> pb;
  
  float animation;
  ArrayList<animationrule> animationrules;
  
  
  
  IsoSkeleton(Object nowo,float[] move,Object beforeo,boolean animateornot){
    p=nowo.p;
    getfourp();
    
//    if(animateornot) {
//      animation=100;
//      buildanimationrules(nowo,beforeo);
//    }
//    else animation=0;
    
    
  }

  void plot(float a,float b){
    if(rotatespeed!=0)  rotateall();
    if(showwhich[0]==1)
    drawshape(a,b,pt);
    if(showwhich[1]==1)
    drawshape(a,b,pl);
    if(showwhich[2]==1)
    drawshape(a,b,pr);
    if(showwhich[3]==1)
    drawshape(a,b,pb);
    
    if(createobj){ 
      createobj=false;
      createobj(a,b,p); 
    }
  }
  
  void getfourp(){
    if(showwhich[0]==1)
      pt=copyp(p,0,PI,0,-distancetocenter,0,move);
    if(showwhich[1]==1)
      pl=copyp(p,PI/2,PI/2,-distancetocenter,0,0,move);
    if(showwhich[2]==1)
      pr=copyp(p,-PI/2,-PI/2,distancetocenter,0,0,move);
    if(showwhich[3]==1)
      pb=copyp(p,PI,0,0,distancetocenter,0,move);
  }
  
  void rotateall(){
  for(int i=0;i<p.size();i++){
      p.get(i).c=rotY(p.get(i).c,rotatespeed);
    }
  getfourp();
  }
  
}



ArrayList<Point> copyp(ArrayList<Point> p,float rotatey,float rotatez,float movex,float movey,float movez,float[] allmove){
    ArrayList<Point> result=new ArrayList<Point>();
    float[] translate={allmove[0]+movex,allmove[1]+movey,allmove[2]+movez};
    for(int i=0;i<p.size();i++){
      PVector c=getplus(rotZ(rotY(p.get(i).c,rotatey),rotatez),translate);
      result.add(new Point(c,p.get(i).cp));
    }
    return result;
}


PVector rotZ(PVector point,float angle){
  PVector result=new PVector(((point.x*cos(angle))-(point.y*sin(angle)) ),((point.x*sin(angle))+(point.y*cos(angle))),point.z);
  return result;
}

PVector rotY(PVector point,float angle){  
  PVector result=new PVector(((point.x*cos(angle))-(point.z*sin(angle) )),point.y,((point.x*sin(angle))+(point.z*cos(angle))));
  return result;
}

PVector getplus(PVector point,float[] move){
  PVector result=new PVector(point.x+move[0],point.y+move[1],point.z+move[2]);
  return result;
}



void drawshape(float a,float b,ArrayList<Point> p){
  for(int i=0;i<p.size();i++){
    for(int j=0;j<p.get(i).cp.size();j++){
      if(p.get(i).cp.get(j)>i){
        PVector p1=p.get(i).getmovedpoint(0,0,0);
        PVector p2=p.get(p.get(i).cp.get(j)).getmovedpoint(0,0,0);
        stroke(strokecolor);
        drawline(p1,p2,a*10);
      }
    }
  }
}

void drawline(PVector pa,PVector pb,float weight){
  float x=pa.x-pb.x;
  float y=pa.y-pb.y;
  float z=pa.z-pb.z;
  if(x>y&&x>z) drawX(pa,pb,weight);
  else if(y>z) drawY(pa,pb,weight);
  else drawZ(pa,pb,weight);
//  drawcube(pa,weight);
//  drawcube(pb,weight);
}





void drawX(PVector pa,PVector pb,float weight){
  PVector[][] pair=new PVector[4][2];
  pair[0][0]=new PVector(pa.x,pa.y,pa.z+weight);
  pair[1][0]=new PVector(pa.x,pa.y+weight,pa.z);
  pair[2][0]=new PVector(pa.x,pa.y,pa.z-weight);
  pair[3][0]=new PVector(pa.x,pa.y-weight,pa.z);
  pair[0][1]=new PVector(pb.x,pb.y,pb.z+weight);
  pair[1][1]=new PVector(pb.x,pb.y+weight,pb.z);
  pair[2][1]=new PVector(pb.x,pb.y,pb.z-weight);
  pair[3][1]=new PVector(pb.x,pb.y-weight,pb.z);
  for(int i=0;i<pair.length;i++){
    int j=i-1;
    if(j<0) j=pair.length-1;
    beginShape();
    vertex(pair[i][0].x, pair[i][0].y, pair[i][0].z);
    vertex(pair[j][0].x, pair[j][0].y, pair[j][0].z);
    vertex(pair[j][1].x, pair[j][1].y, pair[j][1].z);
    vertex(pair[i][1].x, pair[i][1].y, pair[i][1].z);
    endShape(CLOSE);
  }
//  PVector pap,pbp;
//  if(pa.x-pb.x<0){
//    pap=new PVector(pa.x-weight,pa.y,pa.z);
//    pbp=new PVector(pb.x+weight,pb.y,pb.z);
//  }
//  else{
//    pap=new PVector(pa.x+weight,pa.y,pa.z);
//    pbp=new PVector(pb.x-weight,pb.y,pb.z);
//  }
//  drawfixer(pap,pbp,pair);
}

void drawY(PVector pa,PVector pb,float weight){
  PVector[][] pair=new PVector[4][2];
  pair[0][0]=new PVector(pa.x,pa.y,pa.z+weight);
  pair[1][0]=new PVector(pa.x+weight,pa.y,pa.z);
  pair[2][0]=new PVector(pa.x,pa.y,pa.z-weight);
  pair[3][0]=new PVector(pa.x-weight,pa.y,pa.z);
  pair[0][1]=new PVector(pb.x,pb.y,pb.z+weight);
  pair[1][1]=new PVector(pb.x+weight,pb.y,pb.z);
  pair[2][1]=new PVector(pb.x,pb.y,pb.z-weight);
  pair[3][1]=new PVector(pb.x-weight,pb.y,pb.z);
  for(int i=0;i<pair.length;i++){
    int j=i-1;
    if(j<0) j=pair.length-1;
    beginShape();
    vertex(pair[i][0].x, pair[i][0].y, pair[i][0].z);
    vertex(pair[j][0].x, pair[j][0].y, pair[j][0].z);
    vertex(pair[j][1].x, pair[j][1].y, pair[j][1].z);
    vertex(pair[i][1].x, pair[i][1].y, pair[i][1].z);
    endShape(CLOSE);
  }
//  PVector pap,pbp;
//  if(pa.y-pb.y<0){
//    pap=new PVector(pa.x,pa.y-weight,pa.z);
//    pbp=new PVector(pb.x,pb.y+weight,pb.z);
//  }
//  else{
//    pap=new PVector(pa.x,pa.y+weight,pa.z);
//    pbp=new PVector(pb.x,pb.y-weight,pb.z);
//  }
//  drawfixer(pap,pbp,pair);
}

void drawZ(PVector pa,PVector pb,float weight){
  PVector[][] pair=new PVector[4][2];
  pair[0][0]=new PVector(pa.x+weight,pa.y,pa.z);
  pair[1][0]=new PVector(pa.x,pa.y+weight,pa.z);
  pair[2][0]=new PVector(pa.x-weight,pa.y,pa.z);
  pair[3][0]=new PVector(pa.x,pa.y-weight,pa.z);
  pair[0][1]=new PVector(pb.x+weight,pb.y,pb.z);
  pair[1][1]=new PVector(pb.x,pb.y+weight,pb.z);
  pair[2][1]=new PVector(pb.x-weight,pb.y,pb.z);
  pair[3][1]=new PVector(pb.x,pb.y-weight,pb.z);
  for(int i=0;i<pair.length;i++){
    int j=i-1;
    if(j<0) j=pair.length-1;
    beginShape();
    vertex(pair[i][0].x, pair[i][0].y, pair[i][0].z);
    vertex(pair[j][0].x, pair[j][0].y, pair[j][0].z);
    vertex(pair[j][1].x, pair[j][1].y, pair[j][1].z);
    vertex(pair[i][1].x, pair[i][1].y, pair[i][1].z);
    endShape(CLOSE);
 
  }
//    PVector pap,pbp;
//  if(pa.y-pb.y<0){
//    pap=new PVector(pa.x,pa.y,pa.z-weight);
//    pbp=new PVector(pb.x,pb.y,pb.z+weight);
//  }
//  else{
//    pap=new PVector(pa.x,pa.y,pa.z+weight);
//    pbp=new PVector(pb.x,pb.y,pb.z-weight);
//  }
//  drawfixer(pap,pbp,pair);
}


//void drawcube(PVector p,float w){
//  beginShape();
//  vertex(p.x+w, p.y, p.z);
//  vertex(p.x, p.y+w, p.z);
//  vertex(p.x, p.y, p.z+w);
//  endShape(CLOSE);
//  beginShape();
//  vertex(p.x+w, p.y, p.z);
//  vertex(p.x, p.y+w, p.z);
//  vertex(p.x, p.y, p.z-w);
//  endShape(CLOSE);
//  beginShape();
//  vertex(p.x+w, p.y, p.z);
//  vertex(p.x, p.y-w, p.z);
//  vertex(p.x, p.y, p.z+w);
//  endShape(CLOSE);
//  beginShape();
//  vertex(p.x+w, p.y, p.z);
//  vertex(p.x, p.y-w, p.z);
//  vertex(p.x, p.y, p.z-w);
//  endShape(CLOSE);
//  beginShape();
//  vertex(p.x-w, p.y, p.z);
//  vertex(p.x, p.y+w, p.z);
//  vertex(p.x, p.y, p.z+w);
//  endShape(CLOSE);
//  beginShape();
//  vertex(p.x-w, p.y, p.z);
//  vertex(p.x, p.y+w, p.z);
//  vertex(p.x, p.y, p.z-w);
//  endShape(CLOSE);
//  beginShape();
//  vertex(p.x-w, p.y, p.z);
//  vertex(p.x, p.y-w, p.z);
//  vertex(p.x, p.y, p.z-w);
//  endShape(CLOSE);
//  beginShape();
//  vertex(p.x-w, p.y, p.z);
//  vertex(p.x, p.y-w, p.z);
//  vertex(p.x, p.y, p.z+w);
//  endShape(CLOSE);
//}

//void drawtriangle(PVector pa,PVector pb,PVector pc){
//  beginShape();
//  vertex(pa.x, pa.y, pa.z);
//  vertex(pb.x, pb.y, pb.z);
//  vertex(pc.x, pc.y, pc.z);
//  endShape(CLOSE);
//}
//
//
//void drawfixer(PVector pap,PVector pbp,PVector[][] ps){
//  for(int i=0;i<ps.length;i++){
//    int j=i-1;
//    if(j<0) j=ps.length-1;
//    drawtriangle(pap,ps[i][0],ps[j][0]);
//    drawtriangle(pbp,ps[i][1],ps[j][1]);
//  }
//}

