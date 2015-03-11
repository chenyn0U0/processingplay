Bubble[] bubbles=new Bubble[300];
int bubbleno=0;

void setup(){
  size(1000,600);
}

void draw()
{
  background(255,255,255);
  for(int i=0;i<bubbleno;i++)
  {
    bubbles[i].drawBubble();
  }
}

void mousePressed(){
  bubbles[bubbleno]=randombubble();
  bubbleno++;
}

Bubble randombubble()
{
  Bubble bubble=new Bubble();
  return bubble;
}

class Bubble
{
  float x;
  float y;
  float innerra;
  float outra;
  float speed;
  Bubble(float x,float y,float innerra,float outra,float speed){
  this.x=x;
  this.y=y;
  this.innerra=innerra;
  this.outra=outra;
  this.speed=speed;
  }
  Bubble(){
  this.x=random(0,width);
  this.y=random(0,height);
  this.innerra=random(10,30);
  this.outra=random(35,60);
  this.speed=random(1,10);
  if(this.x>=width/2) this.speed=0-this.speed;
  }
  void drawBubble()
  {
    this.x+=this.speed;
    stroke(1); 
    fill(0,0,0,50);
    ellipseMode(CENTER);
    ellipse(x,y,outra,outra);
    stroke(1); 
    fill(0,0,0,100);
    ellipseMode(CENTER);
    ellipse(x,y,innerra,innerra);
  }
}
