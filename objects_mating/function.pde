IsoSkeleton getIsoSkeleton(){
  IsoSkeleton newske=new IsoSkeleton(this);
  return newske;
}

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
