


void createobj(float a,float b,ArrayList<Point> p){
  ArrayList<String> vstring=new ArrayList<String>();
  ArrayList<String> fstring=new ArrayList<String>();

  for(int i=0;i<p.size();i++){
    for(int j=0;j<p.get(i).cp.size();j++){
      if(p.get(i).cp.get(j)>i){
        PVector p1=p.get(i).getmovedpoint(0,0,0);
        PVector p2=p.get(p.get(i).cp.get(j)).getmovedpoint(0,0,0);
        addlinetoobj(p1,p2,a*10,vstring,fstring);
      }
    }
  }
  getobjstring(vstring,fstring);
  
}


void getobjstring(ArrayList<String> vstring,ArrayList<String> fstring){
  String[] objstring=new String[vstring.size()+fstring.size()+1];
  println("1start");
  int ni=0;
  for(int i=0;i<vstring.size();i++){
    objstring[ni]=vstring.get(i);
    ni++;
  }
  objstring[ni]="\n";
  ni++;
  println("1finished\n2start");
  for(int i=0;i<fstring.size();i++){
    objstring[ni]=fstring.get(i);
    ni++;
  }
  println("2finished");
  
  saveStrings(filename+nowid+".obj", objstring);
}



void addlinetoobj(PVector pa,PVector pb,float weight,ArrayList<String> vstring,ArrayList<String> fstring){
  PVector[][] pair;
  float x=pa.x-pb.x;
  float y=pa.y-pb.y;
  float z=pa.z-pb.z;
  if(x>y&&x>z) pair=Xpair(pa,pb,weight);
  else if(y>z) pair=Ypair(pa,pb,weight);
  else pair=Zpair(pa,pb,weight);
  addpoint(pair,vstring,fstring);
}


void addpoint(PVector[][] pair,ArrayList<String> vstring,ArrayList<String> fstring){
  int num=vstring.size()+1;
  for(int i=0;i<pair.length;i++){
    for(int j=0;j<pair[i].length;j++){
      String v="v "+pair[i][j].x+" "+pair[i][j].y+" "+pair[i][j].z+"\n";
      vstring.add(v);
    }
  }
  for(int i=0;i<2;i++){
    String f="f "+(num+i)+" "+(num+i+2)+" "+(num+i+4)+" "+(num+i+6)+"\n";
    fstring.add(f);
  }
  for(int i=0;i<pair.length;i++){
    int j=i-1;
    if(j<0) j=pair.length-1;
    String f="f "+((2*i)+num)+" "+((2*j)+num)+" "+((2*j)+num+1)+" "+((2*i)+num+1)+"\n";
    fstring.add(f);
  }
}


PVector[][] Xpair(PVector pa,PVector pb,float weight){
  PVector[][] pair=new PVector[4][2];
  pair[0][0]=new PVector(pa.x,pa.y,pa.z+weight);
  pair[1][0]=new PVector(pa.x,pa.y+weight,pa.z);
  pair[2][0]=new PVector(pa.x,pa.y,pa.z-weight);
  pair[3][0]=new PVector(pa.x,pa.y-weight,pa.z);
  pair[0][1]=new PVector(pb.x,pb.y,pb.z+weight);
  pair[1][1]=new PVector(pb.x,pb.y+weight,pb.z);
  pair[2][1]=new PVector(pb.x,pb.y,pb.z-weight);
  pair[3][1]=new PVector(pb.x,pb.y-weight,pb.z);
  return pair;
}

PVector[][] Ypair(PVector pa,PVector pb,float weight){
  PVector[][] pair=new PVector[4][2];
  pair[0][0]=new PVector(pa.x,pa.y,pa.z+weight);
  pair[1][0]=new PVector(pa.x+weight,pa.y,pa.z);
  pair[2][0]=new PVector(pa.x,pa.y,pa.z-weight);
  pair[3][0]=new PVector(pa.x-weight,pa.y,pa.z);
  pair[0][1]=new PVector(pb.x,pb.y,pb.z+weight);
  pair[1][1]=new PVector(pb.x+weight,pb.y,pb.z);
  pair[2][1]=new PVector(pb.x,pb.y,pb.z-weight);
  pair[3][1]=new PVector(pb.x-weight,pb.y,pb.z);
  return pair;
}

PVector[][] Zpair(PVector pa,PVector pb,float weight){
  PVector[][] pair=new PVector[4][2];
  pair[0][0]=new PVector(pa.x+weight,pa.y,pa.z);
  pair[1][0]=new PVector(pa.x,pa.y+weight,pa.z);
  pair[2][0]=new PVector(pa.x-weight,pa.y,pa.z);
  pair[3][0]=new PVector(pa.x,pa.y-weight,pa.z);
  pair[0][1]=new PVector(pb.x+weight,pb.y,pb.z);
  pair[1][1]=new PVector(pb.x,pb.y+weight,pb.z);
  pair[2][1]=new PVector(pb.x-weight,pb.y,pb.z);
  pair[3][1]=new PVector(pb.x,pb.y-weight,pb.z);
  return pair;
}
