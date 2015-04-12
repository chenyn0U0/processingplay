float g=1;


ArrayList<Object> objects=new ArrayList<Object>();;
int score=0;

void setup(){
  size(800,600);
}

void draw(){
  background(255);
  for(int i=0;i<objects.size();i++){
    for(int j=0;j<objects.size();j++){
      if(i!=j){
        score+=objects.get(i).geta(objects.get(j),g);
      }
    }
  }
  for(int i=0;i<objects.size();i++){
    objects.get(i).drawthis();
  }
  fill(0);
  text(score,40,30);
}

void mousePressed(){
  Object newobject= new Object(random(1,100),random(0,1),mouseX,mouseY);
  objects.add(newobject);
  
}
