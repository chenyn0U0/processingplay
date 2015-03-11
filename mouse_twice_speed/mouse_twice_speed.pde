void setup() {
  size(1200, 800);
  noStroke();
}

void draw() {
  background(204);
  float  x1 = map(mouseX, width/4, width/4*3, 0, width);
  float  y1 = map(mouseY, width/4, width/4*3, 0, width);
  if(x1>width) x1=width;
  if(x1<0) x1=0;
  if(y1>height) y1=height;
  if(y1<0) y1=0;
  ellipseMode(CENTER);
  ellipse(x1, y1, 50, 50);  

}
