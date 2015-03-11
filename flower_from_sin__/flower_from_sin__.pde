float dismax=20;
int anglenummax=18;


boolean shouldchange=true;
void setup(){
  size(800,600);
  background(255,255,255);
 }
void draw(){
  if(shouldchange){
background(255,255,255);
for(int i=0;i<width/(2*dismax);i++){
for(int j=0;j<height/(2*dismax);j++){
float x=i*2*dismax+dismax;
float y=j*2*dismax+dismax;
myshape(x,y,floor(random(3,anglenummax)),random(0,dismax),random(0,dismax));
}}
shouldchange=false;}
}
void mouseClicked(){shouldchange=true;}


void myshape(float x,float y,int anglenum,float innerdis,float outdis){
  beginShape();
  for(int i=0;i<360;i++)
  {
    float iangle=radians(i);
    float dis=(outdis-innerdis)/2*(sin(anglenum*iangle)+1)+innerdis;
    vertex(dis*cos(iangle)+x,dis*sin(iangle)+y);
  }
  endShape(CLOSE);
}
