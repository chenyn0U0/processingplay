

float zr=-1;
float z=-5000;

void setup(){
  size(800, 600, P3D);
  lights();
}


void draw(){
fill(255);
stroke(0);
background(0);
pushMatrix();
translate(500, 48, -100); 
float change=0.01;
zr-=change;
rotateZ(zr);
rotateX(zr);
box(40);
popMatrix();

pushMatrix();
translate(100, 48, -100); 
rotateZ(zr);
box(80);
popMatrix();

float speedz=50;
z=z+speedz;
if(z>1000)z=-5000;
pushMatrix();
translate(400,300,z); 
rotateZ(-zr*2);
rotateY(-zr*2);
rotateX(-zr*2);
box(80);
popMatrix();


pushMatrix();
translate(300,200,0);
beginShape();
vertex(-100, -100, 0);
vertex( 100, -100, 0);
vertex(0,0,100);
vertex( 100,  100, 0);
vertex(-100,  100, 0);
vertex(0,0,100);
vertex( 100, -100, 0);
vertex( 100,  100, 0);
vertex(0,0,100);
vertex(-100, -100, 0);
vertex(-100,  100, 0);
vertex(0,0,100);
rotateX(zr);
rotateY(zr);
endShape(CLOSE);
popMatrix();


pushMatrix();
translate(width/2+200, height/2,0);
//fill(255,0);
rotateX(-zr);
rotateY(zr);
rotateZ(-zr*2);
noFill();
stroke(255);
sphere(100);
popMatrix();

//pushMatrix();
//translate(width/2,height/2,0);
//fill(255);
//stroke(0);
//box(800,600,1200);
//popMatrix();

}
