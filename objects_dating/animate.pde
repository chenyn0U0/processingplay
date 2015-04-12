//  Object(Object o1,Object o2){
//    float[] minmaxxyz=new float[6];
//    if(o1.minX<o2.minX) minmaxxyz[0]=o1.minX;
//    else minmaxxyz[0]=o2.minX;
//    if(o1.maxX>o2.maxX) minmaxxyz[1]=o1.maxX;
//    else minmaxxyz[1]=o2.maxX;
//    if(o1.minY<o2.minY) minmaxxyz[2]=o1.minY;
//    else minmaxxyz[2]=o2.minY;
//    if(o1.maxY>o2.maxY) minmaxxyz[3]=o1.maxY;
//    else minmaxxyz[3]=o2.maxY;
//    if(o1.minZ<o2.minZ) minmaxxyz[4]=o1.minZ;
//    else minmaxxyz[4]=o2.minZ;
//    if(o1.maxZ>o2.maxZ) minmaxxyz[5]=o1.maxZ;
//    else minmaxxyz[5]=o2.maxZ;
// 
//    
//    ArrayList<Point>[][][] pointgrid1=putongrid(o1,mategrid,minmaxxyz);
//    ArrayList<Point>[][][] pointgrid2=putongrid(o2,mategrid,minmaxxyz);
//    ArrayList<Point> points=new ArrayList<Point>();
//
//    for(int x=0;x<mategrid[0];x++){
//      for(int y=0;y<mategrid[1];y++){
//        for(int z=0;z<mategrid[2];z++){
////          println(x,y,z);
//          int s1=pointgrid1[x][y][z].size();
//          int s2=pointgrid2[x][y][z].size();
//          ArrayList<Point> ps=new ArrayList<Point>();
//          for(int i=0;i<s1;i++){
//            ps.add(pointgrid1[x][y][z].get(i));
//          }
//          for(int i=0;i<s2;i++){
//            if(s1!=0){
//              boolean notsame=true;
//              for(int j=0;j<ps.size();j++){
//                if(ps.get(j).getdist(pointgrid2[x][y][z].get(i))==0){
//                  notsame=false;
//                }
//              }
//              if(notsame) ps.add(pointgrid2[x][y][z].get(i));
//            }
//            if(s1==0) ps.add(pointgrid2[x][y][z].get(i));
//          }
//          float expnum;
//          if(s1<s2) expnum=random(s1,s2);
//          else expnum=random(s2,s1);
//          
//          for(int i=0;i<ps.size();i++){
//            if(random(0,ps.size())<=expnum){
//              
//              if(i<s1) points.add(new Point(points.size(),1,ps.get(i)));
//              else points.add(new Point(points.size(),2,ps.get(i)));
////              points.get(points.size()-1).printthis();
//            }
//          }
//        }
//      }
//    }
//    
//    Object o;
//    
//    for(int i=0;i<points.size();i++){
//      if(points.get(i).getlastshape()==1) o=o1;
//      else o=o2;
//      ArrayList<Integer> cp=o.p.get(points.get(i).getlastid()).getconn();
//      for(int j=0;j<cp.size();j++){
//        Point targetpoint=o.p.get(cp.get(j));
//        
//        float mindist;
//        int minid;
//        if(i!=0){
//          mindist=targetpoint.getdist(points.get(0));
//          minid=0;
//        }
//        else{
//          mindist=targetpoint.getdist(points.get(1));
//          minid=1;
//        }
//        for(int k=0;k<points.size();k++){
//          float thisdist=targetpoint.getdist(points.get(k));
//          if(mindist>thisdist&&k!=i){
//            mindist=thisdist;
//            minid=k;
//          }
//        } 
////        println(mindist,minid,points.size());
//        points.get(i).addconn(points.get(minid));
//      }
//    }
//    
//    
//    
//    p=points;
//    initialize("normal");
//    lifelength=random(lifeLength-lifeRange,lifeLength+lifeRange);
//  }
