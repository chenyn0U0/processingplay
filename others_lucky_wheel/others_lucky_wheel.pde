float speed=5;//controllable
int runAnimation = 1;
//0-stop; 1-running; 2-waiting for stop 
float i=0;
float nowspeed=speed;
void setup() {
size(700,700);
frameRate(60);
background(250);
}
void draw(){ 
if(runAnimation==1){ 
//float i = millis()/5.00;
fill(153,204,255);
arc(350,350,600,600,radians(i),radians(60+i));
fill(255,153,102);
arc(350,350,600,600,radians(60+i),radians(120+i));
fill(255,153,255);
arc(350,350,600,600,radians(120+i),radians(180+i));
fill(153,204,153);
arc(350,350,600,600,radians(180+i),radians(240+i));
fill(204,153,102);
arc(350,350,600,600,radians(240+i),radians(300+i));
fill(255,255,102);
arc(350,350,600,600,radians(300+i),radians(360+i));
noStroke();
fill(255,255,255);
ellipse(350,350,50,50);
fill(255,255,255);
rect(347,350,6,-70);
fill(255,255,255);
triangle(359,281,350,263,341,281);
i=i+speed;}
if(runAnimation==2){ 
fill(153,204,255);
arc(350,350,600,600,radians(i),radians(60+i));
fill(255,153,102);
arc(350,350,600,600,radians(60+i),radians(120+i));
fill(255,153,255);
arc(350,350,600,600,radians(120+i),radians(180+i));
fill(153,204,153);
arc(350,350,600,600,radians(180+i),radians(240+i));
fill(204,153,102);
arc(350,350,600,600,radians(240+i),radians(300+i));
fill(255,255,102);
arc(350,350,600,600,radians(300+i),radians(360+i));
noStroke();
fill(255,255,255);
ellipse(350,350,50,50);
fill(255,255,255);
rect(347,350,6,-70);
fill(255,255,255);
triangle(359,281,350,263,341,281);
i=i+nowspeed;
if(nowspeed!=0)nowspeed--;
else{runAnimation=0;nowspeed=speed;}
}}
void mouseClicked(){ 
if(runAnimation ==1) runAnimation=2;
else if(runAnimation ==0) runAnimation=1;} 
void keyPressed()
{ if(keyCode==32){
  if(runAnimation ==0) runAnimation=1;
  else if(runAnimation ==1) runAnimation=2;}
}
