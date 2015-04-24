  ArrayList<animationrule> buildanimationrules(Object o1,Object o2){//now o - o1; before o - o2
  
    ArrayList<animationrule> rules=new ArrayList<animationrule>();
  
    for(int i=0;i<o2.p.size();i++){
      rules.add(new animationrule(o2.p.get(i)));
    }
  
    
  
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
          
          float[][] distancegrid=new float[s1][s2];
          int[] closestto1=new int[s1];
          for(int i=0;i<s1;i++){
            for(int j=0;j<s2;j++){
              float distance=pointgrid1[x][y][z].get(i).c.dist(pointgrid2[x][y][z].get(j).c);
              distancegrid[i][j]=distance;
              }
//              println("yoo:",x,y,z,i,j,pointgrid1[x][y][z].get(i).c.dist(pointgrid2[x][y][z].get(j).c));
            }
          
          if(s1!=0||s2!=0){
            if(s1==0){//select a point from all newo as all the end points for s2
            
            }
            else if(s2==0){//select a point from all beforeo as all the start point for s1
            
            }
            else if(s1==s2){
              
            }
            else if(s1<s2){//have points to die
            
            }
            else if(s1>s2){//add new points
            
            }
          }
          
        }
      }
    }
    
    return rules;
  }


  
  
//  int getmin(float[] shuzu){
//    
//  }






















class animationrule{
  boolean shown;
  boolean showfromstart;
  boolean showtillend;
  int startruleid_ifnotshowfromstart;
  int starttime;
  PVector startposition;
  PVector endposition;
  int finishpointid;
  ArrayList<Integer> truecps;
  ArrayList<Integer> nowcps;
  ArrayList<Integer> nowtruecps;
  float nowpercentage;
  
  animationrule(Point p){
    startposition=p.c;
    nowcps=p.cp;
    shown=true;
    showfromstart=true;
    starttime=0;
  }
  
  animationrule(int startruleid,int finishpointid){
    shown=false;
    showfromstart=false;
    startruleid_ifnotshowfromstart=startruleid;
    showtillend=true;
    starttime=0;
  }
  
  void show(ArrayList<animationrule> array,int animation){
    if(!shown&&!showfromstart){
      shown=true;
      startposition=array.get(startruleid_ifnotshowfromstart).getnowposition();
      starttime=animation;
    }
  }
  
  PVector getnowposition(){
    float percentage=nowpercentage;
    float x=startposition.x+(percentage*(endposition.x-startposition.x));
    float y=startposition.y+(percentage*(endposition.y-startposition.y));
    float z=startposition.z+(percentage*(endposition.z-startposition.z));
    PVector nowposition=new PVector(x,y,z);
    return nowposition;
  }
  
  void printthis(){
   println("shown:",shown," fromstart:",showfromstart," tillend:",showtillend," startid:","finishpointid",finishpointid,startruleid_ifnotshowfromstart," nowcp:",nowcps,nowtruecps);
  }
  
  void updatecp(float percentage){
    int i=0,j=0;
    while(i<nowcps.size()){
      if(random(0,1)<percentage) {
        nowcps.remove(i);
        i--;
      }
      i++;
    }
    while(j<truecps.size()){
      if(random(0,1)<percentage) {
        nowtruecps.add(truecps.get(j));
        truecps.remove(j);
        j--;
      }
      j++;
    }
  }
  
  void getpoint(ArrayList<Point> points){
    Point p;
    if(shown){
      p=new Point(getnowposition(),nowcps,nowtruecps);
    }
    else{
      p=new Point(getnowposition());
    }
    points.add(p);
  }
}



ArrayList<Point> getpfromanimationrule(ArrayList<animationrule> rules){
  ArrayList<Point> points=new ArrayList<Point>();
  for(int i=0;i<rules.size();i++){
    rules.get(i).getpoint(points);
  }
  return points;
}








