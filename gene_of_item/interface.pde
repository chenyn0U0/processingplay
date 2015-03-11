class anItem{
  int ID;
  Item item;
  float x;
  float y;
  float size;
  
  anItem(int id,Item it,float xv,float yv,float sv){
    ID=id;
    item=it;
    x=xv;
    y=yv;
    size=sv;
  }
  
  void drawItem(){
    stroke(0);
    fill(255);
    ellipse(x,y,size,size);
    fill(0);
    text(ID,x,y);
  }
  
  void drawRelationship(anItem anoitem){
    float fitness=item.compare(anoitem.item);
    if(fitness>=item.highfitness){
      float c=map(fitness,0.5,1,255,0);
      stroke(c,c,c);
      line(x,y,anoitem.x,anoitem.y);
    }
  }
}
