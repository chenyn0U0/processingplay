//#######################class object####################################
class Object{
  ArrayList<Point> p;
  IsoSkeleton skeleton;
  ArrayList<Float> fitparents;
  
  float lifelength;
  float minX,maxX,minY,maxY,minZ,maxZ;
  
  float parenttemp;
  //+++++++++++++++read from objtxt++++++++++++++++
  Object(String filename,float temp){
    p=new ArrayList<Point>();
    try{
      boolean pointsinitialize=false;
      String lines[] = loadStrings(filename);
      for (int i = 0 ; i < lines.length; i++) {
        String l[]=lines[i].split("\\s+"); 
        if(l[0].equals("v")){
          Point point=new Point(parseFloat(l[1]),parseFloat(l[2]),parseFloat(l[3]));
          p.add(point);
          p.get(p.size()-1).id=p.size()-1;
        }
      }
      for (int i = 0 ; i < lines.length; i++) {
        String l[]=lines[i].split("\\s+"); 
        if(l[0].equals("f")){
          for(int m=0;m<l.length-1;m++){
            for(int n=0;n<l.length-1;n++){
              if(m!=n){
                p.get(parseInt(l[m+1])-1).cp.add(parseInt(l[n+1])-1);
              }
            }
          }
        }
      }
      initialize("parents");
      parenttemp=temp;
    }
    catch(Exception e){
      println("File error.");
    }
  }
  //++++++++++++++++++++++++++++++++++++++++++++
  //++++++++++++++born with parents++++++++++++++++++
  Object(Object o1,Object o2){
    float[] minmaxxyz=new float[6];
    if(o1.minX<o2.minX) minmaxxyz[0]=o1.minX;
    else minmaxxyz[0]=o2.minX;
    if(o1.maxX>o2.maxX) minmaxxyz[1]=o1.maxX;
    else minmaxxyz[1]=o2.maxX;
    if(o1.minY<o2.minY) minmaxxyz[2]=o1.minY;
    else minmaxxyz[2]=o2.minY;
    if(o1.maxY>o2.maxY) minmaxxyz[3]=o1.maxY;
    else minmaxxyz[3]=o2.maxY;
    if(o1.minZ<o2.minZ) minmaxxyz[4]=o1.minZ;
    else minmaxxyz[4]=o2.minZ;
    if(o1.maxZ>o2.maxZ) minmaxxyz[5]=o1.maxZ;
    else minmaxxyz[5]=o2.maxZ;
 
    
    ArrayList<Point>[][][] pointgrid1=putongrid(o1,mategrid,minmaxxyz);
    ArrayList<Point>[][][] pointgrid2=putongrid(o2,mategrid,minmaxxyz);
    ArrayList<Point> points=new ArrayList<Point>();

    for(int x=0;x<mategrid[0];x++){
      for(int y=0;y<mategrid[1];y++){
        for(int z=0;z<mategrid[2];z++){
//          println(x,y,z);
          int s1=pointgrid1[x][y][z].size();
          int s2=pointgrid2[x][y][z].size();
          ArrayList<Point> ps=new ArrayList<Point>();
          for(int i=0;i<s1;i++){
            ps.add(pointgrid1[x][y][z].get(i));
          }
          for(int i=0;i<s2;i++){
            if(s1!=0){
              boolean notsame=true;
              for(int j=0;j<ps.size();j++){
                if(ps.get(j).getdist(pointgrid2[x][y][z].get(i))==0){
                  notsame=false;
                }
              }
              if(notsame) ps.add(pointgrid2[x][y][z].get(i));
            }
            if(s1==0) ps.add(pointgrid2[x][y][z].get(i));
          }
          float expnum;
          if(s1<s2) expnum=random(s1,s2);
          else expnum=random(s2,s1);
          
          for(int i=0;i<ps.size();i++){
            if(random(0,ps.size())<=expnum){
              
              if(i<s1) points.add(new Point(points.size(),1,ps.get(i)));
              else points.add(new Point(points.size(),2,ps.get(i)));
//              points.get(points.size()-1).printthis();
            }
          }
        }
      }
    }
    
    Object o;
    
    for(int i=0;i<points.size();i++){
      if(points.get(i).getlastshape()==1) o=o1;
      else o=o2;
      ArrayList<Integer> cp=o.p.get(points.get(i).getlastid()).getconn();
      for(int j=0;j<cp.size();j++){
        Point targetpoint=o.p.get(cp.get(j));
        
        float mindist;
        int minid;
        if(i!=0){
          mindist=targetpoint.getdist(points.get(0));
          minid=0;
        }
        else{
          mindist=targetpoint.getdist(points.get(1));
          minid=1;
        }
        for(int k=0;k<points.size();k++){
          float thisdist=targetpoint.getdist(points.get(k));
          if(mindist>thisdist&&k!=i){
            mindist=thisdist;
            minid=k;
          }
        } 
//        println(mindist,minid,points.size());
        points.get(i).addconn(points.get(minid));
      }
    }
    
    
    
    p=points;
    initialize("normal");
    lifelength=random(lifeLength-lifeRange,lifeLength+lifeRange);
  }
  //+++++++++++++++++++++++++++++++++++++++++++++++++
  //++++++++copy from another object+++++++++++++++++
  Object(Object o,ArrayList<Object> parents){
    p=o.p;
    maxX=o.maxX;
    minX=o.minX;
    maxY=o.maxY;
    minY=o.minY;
    maxZ=o.maxZ;
    minZ=o.minZ;
    lifelength=random(lifeLength-lifeRange,lifeLength+lifeRange);
    setfitness(parents);
  }
  //+++++++++++++++++++++++++++++++++++++++++++++++++
  
  void printthis(){
    for(int i=0;i<p.size();i++){
      println(p.get(i).id,p.get(i).c,p.get(i).cp);
    }
    println(minX,maxX,minY,maxY,minZ,maxZ);
  }
  
  void initialize(String mode){//mode-normal:only get minmaxxyz/parents:put shape in center
    if(mode=="parents"){
      float cx=0;
      float cy=0;
      float cz=0;
      for(int i=0;i<p.size();i++){
        cx+=p.get(i).getX();
        cy+=p.get(i).getY();
        cz+=p.get(i).getZ();
      }
      cx=cx/p.size();
      cy=cy/p.size();
      cz=cz/p.size();
      for(int i=0;i<p.size();i++){
        p.get(i).movepoint(-cx,-cy,-cz);
        p.get(i).multipoint(50);
      }
    }
    minX=p.get(0).getX();
    maxX=p.get(0).getX();
    minY=p.get(0).getY();
    maxY=p.get(0).getY();
    minZ=p.get(0).getZ();
    maxZ=p.get(0).getZ();
    for(int i=1;i<p.size();i++){
      float x=p.get(i).getX();
      float y=p.get(i).getY();
      float z=p.get(i).getZ();
      if(x<minX) minX=x;
      if(x>maxX) maxX=x;
      if(y<minY) minY=y;
      if(y>maxY) maxY=y;
      if(z<minZ) minZ=z;
      if(z>maxZ) maxZ=z;
    }
  }
  
  void buildskeleton(float[] move,Object previewso,boolean animateornot){
    skeleton=new IsoSkeleton(this,move,previewso,animateornot);
  }
  
  void drawthis(float a,float b){
    skeleton.plot(a,b);
  }
  
  float getfitness(Object o){
    Object o2=o;
    int samenum=0;
    float totaldist=0;
    ArrayList<Integer> minidlist=new ArrayList<Integer>();
    for(int i=0;i<p.size();i++){
      float mindist=this.p.get(i).getdist(o2.p.get(0));
      int minid=0;
      for(int j=1;j<o2.p.size();j++){
        float dist=this.p.get(i).getdist(o2.p.get(j));
        if(mindist>dist){
          mindist=dist;
          minid=j;
        }
      }
      if(mindist==0) samenum++;
      totaldist+=mindist;
      minidlist.add(minid);
    }
    //need to be changed
    float thisperc= (float)samenum/p.size();
    float parperc= (float)samenum/o.p.size();
    return sqrt(thisperc*parperc);
//    return totaldist;
  }
  

  
  void setfitness(ArrayList<Object> parents){
    fitparents=new ArrayList<Float>();
    for(int i=0;i<parents.size();i++){
      fitparents.add(this.getfitness(parents.get(i)));
    }
    println(fitparents);
  }
  
  float getlifeminusvalue(ArrayList<Float> fit){
    float minus=0;
    for(int i=0;i<fit.size();i++){
      minus+=abs(fitparents.get(i)-fit.get(i));
    }
    return minus;
  }
  
  
  boolean minuslife(ArrayList<Float> fit){
    float minus=getlifeminusvalue(fit);
    lifelength-=percentagelife*minus;
    if(lifelength<=0) return true;
    else return false;    
  }
  
  float getpercbytemp(float temp){
    float num=map(abs(parenttemp-temp),tempjudgevalue,0,0,1);
    if(num<0) num=0;
    return num;
  }
  
}


//########################class point###############################
class Point{
  PVector c;
  int id;
  int lastshape;
  int lastshapeid;
  ArrayList<Integer> cp=new ArrayList<Integer>();//connected points
  Point(float x, float y, float z){
    c=new PVector(x,y,z);
  }
  
  Point(PVector pc){
    c=pc;
  }
  
  Point(PVector pc,ArrayList<Integer> thecp){
    c=pc;
    cp=thecp;
  }
  
  Point(PVector pc,ArrayList<Integer> cp1,ArrayList<Integer> cp2){
    c=pc;
    for(int i=0;i<cp1.size();i++){
      cp.add(cp1.get(i));
    }
    for(int i=0;i<cp2.size();i++){
      cp.add(cp2.get(i));
    }
  }
  
  Point(int theid,int lastshapenum,Point p){
    id=theid;
    c=p.c;
    lastshape=lastshapenum;
    lastshapeid=p.id;
  }
  
  void setcp(ArrayList<Integer> cp1,ArrayList<Integer> cp2){
    for(int i=0;i<cp1.size();i++){
      cp.add(cp1.get(i));
    }
    for(int i=0;i<cp2.size();i++){
      cp.add(cp2.get(i));
    }
  }
  
  void printthis(){
    println(id,c,lastshape,lastshapeid,cp);
  }
  
  float getdist(Point p){
    return this.c.dist(p.c);
  }
  
  ArrayList<Integer> getconn(){
    return this.cp;
  }
  
  float getX(){
    return this.c.x;
  }
  float getY(){
    return this.c.y;
  }
  float getZ(){
    return this.c.z;
  }
  
  void movepoint(float x,float y,float z){
    c.x+=x;
    c.y+=y;
    c.z+=z;
  }
  
  void multipoint(float mul){
    c.x=c.x*mul;
    c.y=c.y*mul;
    c.z=c.z*mul;
  }
  
  void rotatepoint(){
  }
  
  PVector getmovedpoint(float x,float y,float z){
    PVector point=new PVector(c.x+x,c.y+y,c.z+z);
    return point;
  }
  
  int getlastshape(){
    return this.lastshape;
  }
  
  int getlastid(){
    return this.lastshapeid;
  }
  
  void addconn(Point p){
    boolean alreadyexist=false;
    for(int i=0;i<cp.size();i++){
      if(cp.get(i)==p.id) alreadyexist=true;
    }
    if(!alreadyexist){
      this.cp.add(p.id);
      p.cp.add(this.id);
    }
  }

}



























  ArrayList[][][] putongrid(Object o,int[] mategrid,float[] minmaxxyz){
    ArrayList<Point>[][][] pointgrid=new ArrayList[mategrid[0]][mategrid[1]][mategrid[2]];
    float intvx=(minmaxxyz[1]-minmaxxyz[0])/mategrid[0];
    float intvy=(minmaxxyz[3]-minmaxxyz[2])/mategrid[1];
    float intvz=(minmaxxyz[5]-minmaxxyz[4])/mategrid[2];
    for(int x=0;x<mategrid[0];x++){
      for(int y=0;y<mategrid[1];y++){
        for(int z=0;z<mategrid[2];z++){
          pointgrid[x][y][z]=new ArrayList<Point>();
        }
      }
    }
    
    for(int i=0;i<o.p.size();i++){
      int x=parseInt((o.p.get(i).getX()-minmaxxyz[0])/intvx);
      int y=parseInt((o.p.get(i).getY()-minmaxxyz[2])/intvy);
      int z=parseInt((o.p.get(i).getZ()-minmaxxyz[4])/intvz);
      if(x==mategrid[0]) x--;
      if(y==mategrid[1]) y--;
      if(z==mategrid[2]) z--;
      pointgrid[x][y][z].add(o.p.get(i));
    }
    return pointgrid;
  }
