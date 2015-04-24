//press "A"/"D" on keyboard: minus/plus now temperature

String filename="child";//press "P" to output an OBJ file with this name

boolean saveframe=false;//true: capturing screenshot every time mouse is clicked

boolean showtext=true;//show text or not
float textposition=1150;//

String parentmode="bestfewparents";//how to choose parents of new child:"random";"bestparents";"bestfewparents"
float topfewpercentage=0.2;//if in "bestfewparents" mode


float tempjudgevalue=10;

float percentagelife=0;//life minus coefficient
float lifeLength=100;//average life length
float lifeRange=0;//random deviation of life length


int[] mategrid={10,10,40};
int initialchild=30;


//↓ for display
color surfacecolor=color(255,255,0);
color strokecolor=color(150,150,0);

boolean fullscreen=false;//show as fullscreen or not
float zm=1500;//control the size of shape
float distancetocenter=600;//how far shape would keep from center point
float[] move={0,-400,0};//adjust position of all the shapes
int[] showwhich={0,1,1,1};//back,left,right,front - "1" is for display
float rotatespeed=0;//rotating speed of shape(!- easy to get error if is not 0)


int[] animategrid={7,7,20};

ArrayList<Object> parents=new ArrayList<Object>();
ArrayList<Object> population=new ArrayList<Object>();
float temperature=38;//default temperature


ArrayList<Float> fitparents;

int nowid=0;
int lastid=0;
boolean createobj=false;


void setup() {
  
  size(displayWidth,displayHeight, P3D);
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
 population.get(nowid).buildskeleton(move,population.get(lastid),false);
}

void draw(){
  
  lights();
  background(0);
  fill(surfacecolor);
  float a=map(mouseX,0,width,0,5);
  float b=map(mouseY,0,height,0,0.5);

  
  
  population.get(population.size()-1).drawthis(a,b);
  float sp = 0.01*frameCount;
//  println(frameCount);
showtemperature();
}

void mousePressed(){
 fitparents=fitparent(temperature,parents);
 
 for(int i=0;i<population.size()*0.001;i++){
   int[] newparents=getnewparents(fitparents,population,parentmode);
   population.add(new Object(population.get(newparents[0]),population.get(newparents[1])));
   population.get(population.size()-1).setfitness(parents);
 }
 
//  delay(3000);
//  population.get(population.size()-1).printthis();
  if(nowid!=population.size()-1){
    lastid=nowid;
    nowid=population.size()-1;
  }
  
  population.get(nowid).buildskeleton(move,population.get(lastid),true);
  minuslife(population,fitparents);
  println(fitparents);
  
  
  if(saveframe) saveFrame();
  
  
}

void keyPressed(){
  if (key == 'a') {
    temperature--;
  } 
  if (key == 'd') {
    temperature++;
  } 
  if (key == 'p') {
    createobj=true;
  }
  println(temperature);
}
