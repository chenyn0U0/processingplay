import ComputationalGeometry.*;
float tempjudgevalue=10;
float percentagelife=2;
float lifeLength=10;
float lifeRange=0;

int[] mategrid={10,10,40};


float zm=1500;

ArrayList<Object> parents=new ArrayList<Object>();
ArrayList<Object> population=new ArrayList<Object>();
float temperature=38;


ArrayList<Float> fitparents;

void setup() {
  size(800,600, P3D);
  camera(0,0,zm,0,0,0,0,1,0);
//  parents.add(new Object("basicbulbshape2.txt",40));
//  parents.add(new Object("basicbulbshape.txt",10));
//  parents.add(new Object("obj.txt",20));
//  parents.add(new Object("KNIFEblunt.txt",30));
//  parents.add(new Object("KNIFESHARP.txt",40));

  parents.add(new Object("youhuabulb.txt",30));
  parents.add(new Object("youhuajieneng.txt",40));
  
  for(int i=0;i<parents.size();i++){
    population.add(new Object(parents.get(i),parents));
  }
  
}

void draw(){
  background(0);
  fill(255,255,0);
  float a=map(mouseX,0,width,0,5);
  float b=map(mouseY,0,height,0,0.5);

  
  population.get(population.size()-1).buildskeleton(0,0,0);
  population.get(population.size()-1).drawthis(a,b);
//  float sp = 0.01*frameCount;
//  println(frameCount);
//  camera(zm*sin(sp),0,zm*cos(sp),0,0,0,0,1,0);
}

void mousePressed(){
  int a = parseInt(random(0,population.size()));
  int b = parseInt(random(0,population.size()));
  while(a==b){
    b = parseInt(random(0,population.size()));
  }
//  population.add(new Object(population.get(0),population.get(population.size()-1)));
  population.add(new Object(population.get(a),population.get(b)));
//  delay(3000);
  population.get(population.size()-1).printthis();
  population.get(population.size()-1).setfitness(parents);
  
  fitparents=fitparent(temperature,parents);
  println(fitparents);
  
  minuslife(population,fitparents);

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
