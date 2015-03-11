int pixpoidis=30;
//changable end
int i=0;
int picnum=3;
PImage[] img=new PImage[picnum];
   boolean drawornot=false;
   int opicity=255;
   Brush brush=new Brush();

void setup(){
  size(1000,800);
    background(255,255,255);
  img[0]=loadImage("xiaoge.jpg");
  img[1]=loadImage("konoe.jpg");
  img[2]=loadImage("tuzhi.jpeg");
   image(img[i],width/2-img[i].width/2,height/2-img[i].height/2);
}

void draw(){
  if(drawornot){
      float x=mouseX;
      float y=mouseY;
      color c=get((int)x,(int)y);
      float value = brightness(c);
      brush.drawsquare(x,y,c);
    }
}
  

void mousePressed(){
  drawornot=true;
}

void mouseReleased(){
  drawornot=false;
}


int squarei=0;
class Brush
{
void drawpoint(float x,float y,color c){
  noStroke();
  fill(c,opicity);
  ellipse(x,y,pixpoidis,pixpoidis);
}

void drawsquare(float x,float y,color c){
  translate(x,y);
  rotate(PI/9.0*squarei);
  strokeWeight(1);
  fill(c,opicity);
  rectMode(CENTER);
  rect(0,0,pixpoidis,pixpoidis);
  squarei++;
}

}
