

class Fish{
  float fishx;
  float fishy;
  int fishWeight;
  int tailnumber;
  int color1;
  int color2;
  int color3;
  int color01;
  int color02;
  int color03;
  int speed;
  int turncounter;
  float lastangel;
  Fishtail[] fishtails;
  Fish(){
    this.turncounter=0;
    this.lastangel=0;
    
    this.fishx=-100;
    this.fishy=-100;
    this.tailnumber=10;
    this.color1=int(random(0,255));
    this.color2=int(random(0,255));
    this.color3=int(random(0,255));
    
    this.color01=int(random(0,255));
    this.color02=int(random(0,255));
    this.color03=int(random(0,255));
    
    this.fishWeight=40;
    this.speed=5;
    this.fishtails=new Fishtail[10];
    for(int i=0;i<tailnumber;i++){
      fishtails[i]=new Fishtail(i,-100,-100);
    }
  }
  Fish(float x, float y, int tailnumber, int c1, int c2, int c3,int fw){
    this.turncounter=0;
    this.lastangel=0;
    
    this.fishx=x;
    this.fishy=y;
    this.tailnumber=tailnumber;
    this.color1=c1;
    this.color2=c2;
    this.color3=c3;
    
    this.color01=int(random(0,255));
    this.color02=int(random(0,255));
    this.color03=int(random(0,255));
    
    this.fishWeight=fw;
    this.speed=int(random(fw/10,fw/8));
    this.fishtails=new Fishtail[tailnumber];
    for(int i=0;i<tailnumber;i++){
      fishtails[i]=new Fishtail(i,x,y);
    }
  }
  //function
  void move(float x,float y){
    float lx=this.fishx;
    float ly=this.fishy;
    this.fishx=x;
    this.fishy=y;
    for(int i=0;i<this.tailnumber;i++)
    {
      float sx=this.fishtails[i].tailx;
      float sy=this.fishtails[i].taily;
      this.fishtails[i].tailchange(lx,ly);
      lx=sx;ly=sy;
    }
  }
  void movetowardmouse(float mx,float my){
    float dx=this.fishx;
    float dy=this.fishy;
    float distance=sqrt(sq(mx-this.fishx)+sq(my-this.fishy));
    if(this.turncounter==0){
    float angel=atan2(((my-this.fishy)/distance),((mx-this.fishx)/distance));
    float moveangel= angel+(random(-1,1)*(fishmoveangel/2));
    this.lastangel=moveangel;
    }
    dx=this.fishx+(this.speed*cos(this.lastangel));
    dy=this.fishy+(this.speed*sin(this.lastangel));
    
    
    this.turncounter++;
    if(this.turncounter>3*this.tailnumber)this.turncounter=0;
    
    this.move(dx,dy);
  }
  void drawfish(){
      stroke(this.color1,this.color2,this.color3);
      strokeWeight(this.fishWeight);
      point(this.fishx,this.fishy);
      for(int i=0;i<this.tailnumber;i++){
        this.fishtails[i].drawtail(this.fishWeight,this.tailnumber,this.color1,this.color2,this.color3,this.color01,this.color02,this.color03);
      }

  }
}

class Fishtail{
int tailnumber;
float tailx;
float taily;
Fishtail(int n,float x,float y){
this.tailnumber=n;
this.tailx=x;
this.taily=y;
}
//function
void tailchange(float x, float y){
  this.tailx=(x+this.tailx)/2;
  this.taily=(y+this.taily)/2;
}
void drawtail(int fishWeight,int totaltailnumber,int thecolor1,int thecolor2,int thecolor3,int c1,int c2,int c3){
  int opicity=int(map(this.tailnumber,-1,totaltailnumber,255,0));
  int color1=int(map(this.tailnumber,-1,totaltailnumber,thecolor1,c1));
  int color2=int(map(this.tailnumber,-1,totaltailnumber,thecolor2,c2));
  int color3=int(map(this.tailnumber,-1,totaltailnumber,thecolor3,c3));
 
  int weight=int(map(this.tailnumber,-1,totaltailnumber,fishWeight,0));
  
  stroke(color1,color2,color3,opicity);
  strokeWeight(weight+2);
  point(this.tailx,this.taily);
}
}





class PressedPoint{
int x;
int y;
PressedPoint(int _x, int _y){
  this.x=_x;
  this.y=_y;
}
void drawpoint(){
  stroke(255);
  strokeWeight(0);
  fill(100,100); 
  ellipse(x, y, 40, 40); 
  
  fill(100,150); 
  ellipse(x, y, 25, 25); 
  
  fill(#FF0000,200); 
  ellipse(x, y, 13,13);  
}
}
