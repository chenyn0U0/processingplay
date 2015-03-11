int pixpoidis=20;
int backgroundcolor=255;

//changable end
int i=0;
int picnum=3;
PImage[] img=new PImage[picnum];


void setup(){
  size(1000,800);
  img[0]=loadImage("xiaoge.jpg");
  img[1]=loadImage("konoe.jpg");
  img[2]=loadImage("tuzhi.jpeg");
}
void draw(){
  background(backgroundcolor);
  image(img[i],width/2-img[i].width/2,height/2-img[i].height/2);
  
  for(int a=0;a<(int)(img[i].width/pixpoidis+1);a++){
    for(int b=0;b<(int)(img[i].height/pixpoidis+1);b++){
      float x=width/2-(img[i].width/2)+((pixpoidis*a)+(pixpoidis/2));
      float y=height/2-(img[i].height/2)+((pixpoidis*b)+(pixpoidis/2));
      color c=get((int)x,(int)y);
      float value = brightness(c);
      fill(backgroundcolor);
      noStroke();
      //strokeWeight(3);
      rect(x-(pixpoidis/2),y-(pixpoidis/2),pixpoidis,pixpoidis);
      fill(c);
      float ra=(value/255)*pixpoidis;
      ellipse(x,y,ra,ra);
//      ellipse(x,y,pixpoidis,pixpoidis);
    }
  }
}
void mousePressed(){
  i++;
  if(i>picnum-1)i=0;
}
