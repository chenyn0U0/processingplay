//import ComputationalGeometry.*;
float tempjudgevalue=10;
float percentagelife=2;
float lifeLength=100;
float lifeRange=0;

float topfewpercentage=0.3;

int[] mategrid={10,10,40};
int initialchild=30;

float zm=2500;

ArrayList<Object> parents=new ArrayList<Object>();
ArrayList<Object> population=new ArrayList<Object>();
float temperature=38;


ArrayList<Float> fitparents;

int nowid=0;
int lastid=0;

void setup() {
  
  size(800,600, P3D);
  camera(0,0,zm,0,0,0,0,1,0);
//  parents.add(new Object("basicbulbshape.txt",10));
//  parents.add(new Object("obj.txt",30));
//  parents.add(new Object("basicbulbshape2.txt",40));

//  parents.add(new Object("KNIFEblunt.txt",30));
//  parents.add(new Object("KNIFESHARP.txt",40));
//
  parents.add(new Object("youhuabulb.txt",30));
  parents.add(new Object("youhuajieneng.txt",40));
  
  for(int i=0;i<parents.size();i++){
    population.add(new Object(parents.get(i),parents));
  }
  
//  for(int i=0;i<initialchild;i++){
//   population.add(new Object(population.get(0),population.get(1)));
//   population.get(population.size()-1).setfitness(parents);
// }
 
 nowid=population.size()-1;
 lastid=nowid;
 population.get(nowid).buildskeleton(0,0,0);
}

void draw(){
  
  lights();
  background(0);
  fill(255,255,0);
  float a=map(mouseX,0,width,0,5);
  float b=map(mouseY,0,height,0,0.5);

  
  
  population.get(population.size()-1).drawthis(a,b);
  float sp = 0.01*frameCount;
//  println(frameCount);
  camera(zm*sin(sp),0,zm*cos(sp),0,0,0,0,1,0);
}

void mousePressed(){
 fitparents=fitparent(temperature,parents);
 
 for(int i=0;i<population.size()*0.001;i++){
   int[] newparents=getnewparents(fitparents,population,"bestfewparents");
   population.add(new Object(population.get(newparents[0]),population.get(newparents[1])));
   population.get(population.size()-1).setfitness(parents);
 }
 
//  delay(3000);
//  population.get(population.size()-1).printthis();
  if(nowid!=population.size()-1){
    lastid=nowid;
    nowid=population.size()-1;
  }
  
  population.get(nowid).buildskeleton(0,0,0);
  minuslife(population,fitparents);
  println(fitparents);
}

void keyPressed(){
  if (key == 'a') {
    temperature--;
  } 
  if (key == 'd') {
    temperature++;
  } 
  println(temperature);
}
