int thewidth=1000;
int theheight=800;
//############for mode 0 ↓#############
float percentforbackcenter=0.58;
float startvalue=theheight/2;
float endvalue=theheight/2;
//#####################################

//############for mode 1 ↓#############
float startx=thewidth/2;
float starty=theheight/2;
int fishnumber=100;
float fishmoveangel=PI/4*3;
//#####################################

int mode=0;
Fish[] allfish=new Fish[fishnumber];

PressedPoint pressedpoint=null;

void setup(){
  size(thewidth,theheight);
  
}

void draw()
{
  
    background(255);
    int movex=width/2;
    int movey=height/2;
    if(pressedpoint!=null){
      pressedpoint.drawpoint();
      movex=pressedpoint.x;
      movey=pressedpoint.y;
    }
  
  
  if(mode==0){
endvalue=movey;
float x=startvalue;
  for(int i=0;i<movex;i++){
    int strW=20;
    stroke(0,80); 
    strokeWeight(strW);   
    point(i,x);
        float randomvalue=random(0,strW);
    if(x>endvalue){
      if(random(0,100)<percentforbackcenter*100) x=x-randomvalue;
      else x=x+randomvalue;
    }
    else{
      if(random(0,100)>percentforbackcenter*100) x=x-randomvalue;
      else x=x+randomvalue;
    }
  }
  delay(100);
  }
  
  if(mode>0){
    for(int i=0;i<mode;i++){
      allfish[i].movetowardmouse(movex,movey);
      allfish[i].drawfish();
    }
  } 
}


void keyPressed(){
 for(int i=0;i<fishnumber;i++){
  allfish[i]=new Fish(int(random(0,width)),int(random(0,height)),int(random(7,13)),int(random(0,255)),int(random(0,255)),int(random(0,255)),int(random(20,40)));
}
  mode=fishnumber;
//  mode++;
//  if(mode==fishnumber+1)mode=0;
}

void mousePressed(){
 pressedpoint=new PressedPoint(mouseX,mouseY);
}

