import processing.serial.*;
float coloropacity=0;
float touchlevel=0;
boolean touched=false;
Serial myPort;
PVector vm,va,v;
int wallzuli=3;
float mocazuli=0.2;

int boardlength=100;
int boardheight=5;
int ballsize=30;

Board board=new Board(0,0,boardlength);


void setup() {
    size(1000,600);
  vm = new PVector(1, 5);
  va = new PVector(0,1);
  v = new PVector(0,0); 
    myPort = new Serial(this,"COM6", 9600);  //in fact, any rate is ok...
  myPort.bufferUntil('\n');  //buffer until meet '\n', then call the event listener

}

void draw() {
 background(255);
 board.update(mouseX,mouseY);
 board.drawboard();
 fill(255,coloropacity,coloropacity);
 if(v.x>width||v.x<0){vm.x=-vm.x-1+wallzuli;}
 if(v.y==height-(ballsize/2)){
   if(vm.x>0){vm.x-=mocazuli;if(vm.x<0)vm.x=0;}
   else{vm.x+=mocazuli;if(vm.x>0)vm.x=0;}
 }
 if(board.ychange(v.x,v.y,ballsize,vm.x,vm.y)&&vm.y<=1){v.y=mouseY-(ballsize/2);vm.y=0;}
 if((v.y>height-(ballsize/2)||board.ychange(v.x,v.y,ballsize,vm.x,vm.y))&&vm.y>1){
 vm.y=-vm.y-1+wallzuli;
if(vm.y<wallzuli&&-vm.y<wallzuli)vm.y=0;
 }
 if(touched){vm.y=-15;touched=false;}
 if(vm.y!=0||v.y!=height-(ballsize/2))vm.add(va);

 ellipse(v.x, v.y, ballsize, ballsize);
  v.add(vm);
}

void mousePressed(){
jump();

}
void jump(){
if(vm.y<0)vm.y-=2;
else vm.y=-15;
if(vm.x>=0) vm.x+=1;
else vm.x-=1;
}

void keyPressed(){

}


class Board{
int x;
int y;
int l;//length



Board(int xx,int yy,int ll){
  x=xx;
  y=yy;
  l=ll;
}
void update(int xx,int yy){
  x=xx;y=yy;
}
void drawboard(){
  rectMode(RADIUS);
  rect(x,y,l,boardheight);
}


boolean ychange(float vx,float vy,int ballsize,float vmx,float vmy){
  float top=y-(boardheight/2);
  float bottom=y+(boardheight/2);
  float left=x-l;
  float right=x+l;
  
  float ballb=vy+(ballsize/2);
  float ballt=vy-(ballsize/2);
  float balll=vx-(ballsize/2);
  float ballr=vx+(ballsize/2);
  float nballb=vy+(ballsize/2)+vmy;
  float nballt=vy-(ballsize/2)+vmy;
  float nballl=vx-(ballsize/2)+vmx;
  float nballr=vx+(ballsize/2)+vmx;
 if(ballr>=left&&balll<=right&&((ballb<top&&nballb>=top)))
 {return true;}

 else {return false;}
}

}


//listen to the event. when buffer filled, run this method
void serialEvent(Serial p) {  
  String inString = p.readString();
  String[] distance = splitTokens(inString,",");
  print(inString);
  if(touchlevel<4&&Float.parseFloat(distance[0])>3) touched=true;
  print(touched);
  touchlevel=Float.parseFloat(distance[0]);
  coloropacity=map(Float.parseFloat(distance[0]),1,17,255,0);
}

