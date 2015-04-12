//IsoSkeleton getIsoSkeleton(){
//  IsoSkeleton newske=new IsoSkeleton(this);
//  return newske;
//}

void minuslife(ArrayList<Object> population,ArrayList<Float> fitparents){
  for(int i=0;i<population.size();i++){
    if(population.get(i).minuslife(fitparents)) population.remove(i);
  }
  println("Now population:"+population.size());
}

ArrayList fitparent(float temp,ArrayList<Object> parents){
  ArrayList<Float> fitparents=new ArrayList<Float>();
  for(int i=0;i<parents.size();i++){
    fitparents.add(parents.get(i).getpercbytemp(temp));
  }
  return fitparents;
}


int[] getnewparents(ArrayList<Float> fitparents,ArrayList<Object> population,String mode){
  int[] result=new int[2];
  if(mode.equals("random")){
    int a = parseInt(random(0,population.size()));
    int b = parseInt(random(0,population.size()));
    while(a==b){
      b = parseInt(random(0,population.size()));
    }
    result[0]=a;
    result[1]=b;
  }
  if(mode.equals("bestparents")){
    float topfit;
    float secondfit;
    topfit=population.get(0).getlifeminusvalue(fitparents);
    result[0]=0;
    secondfit=population.get(0).getlifeminusvalue(fitparents);
    result[0]=0;
    if(population.size()==1){
      result[1]=1;
    }
    else if(population.get(1).getlifeminusvalue(fitparents)<topfit){
      result[1]=result[0];
      secondfit=topfit;
      result[0]=1;
      topfit=population.get(1).getlifeminusvalue(fitparents);
    }
    else{
      result[1]=1;
      secondfit=population.get(1).getlifeminusvalue(fitparents);
    }
    for(int i=2;i<population.size();i++){
      float thislife=population.get(i).getlifeminusvalue(fitparents);
      if(thislife<topfit){
        result[1]=result[0];
        secondfit=topfit;
        topfit=thislife;
        result[0]=i;
      }
      else if(thislife<secondfit){
        result[1]=i;
        secondfit=thislife;
      }
    }
  }
  if(mode.equals("bestfewparents")){
    ArrayList<Integer> idnum=new ArrayList();
    ArrayList<Float> lifevalue=new ArrayList();
    for(int i=0;i<population.size();i++){
      idnum.add(i);
      lifevalue.add(population.get(i).getlifeminusvalue(fitparents));
    }
    int change=1;
    while(change>0){
      change=0;
      for(int i=0;i<population.size()-1;i++){
        int j=i+1;
        if(lifevalue.get(i)>lifevalue.get(j)){
          int tempint=idnum.get(i);
          float tempfloat=lifevalue.get(i);
          idnum.set(i,idnum.get(j));
          lifevalue.set(i,lifevalue.get(j));
          idnum.set(j,tempint);
          lifevalue.set(j,tempfloat);
          change++;
        }
      }
    }
    float max=population.size()*topfewpercentage+1;
    if(max>population.size()-1) max=population.size()-1;
    result[0]=idnum.get(parseInt(random(0,max+0.99)));
    result[1]=idnum.get(parseInt(random(0,max+0.99)));
  }
  return result;
}










