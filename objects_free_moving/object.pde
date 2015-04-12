class Object{
float r;
float material;//0-1
PVector position;
PVector v;
Object(float ri,float mi,float xi,float yi){
  r=ri;
  material=mi;
  position=new PVector(xi,yi);
  v=new PVector(0,0);
}
int geta(Object o,float g){
  int score=0;
  float thex=o.position.x-this.position.x;
  float they=o.position.y-this.position.y;
  float a;
  if((thex*thex)+(they*they)<(this.r+o.r)*(this.r+o.r)){
    score++;
    a=-(o.r*o.r*o.material*g)/((thex*thex)+(they*they));
    stroke(100);
    line(o.position.x,o.position.y,this.position.x,this.position.y);
  }
  else a=(o.r*o.r*o.material*g)/((thex*thex)+(they*they));
  PVector pa=new PVector(thex,they);
  pa.normalize();
  pa.mult(a);
  v.add(pa);
  return score;
}
void drawthis(){
  stroke(0);
  float c=map(material,0,1,1,0);
  fill(c*255);
  position.add(v);
  ellipse(position.x,position.y,r,r);
}
}
