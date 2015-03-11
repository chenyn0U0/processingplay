/**
 * Load and Display an OBJ Shape. 
 * 
 * The loadShape() command is used to read simple SVG (Scalable Vector Graphics)
 * files and OBJ (Object) files into a Processing sketch. This example loads an
 * OBJ file of a rocket and displays it to the screen. 
 */


PShape rocket;

float ry;
  
public void setup() {
  size(800,600, P3D);
    
  rocket = loadShape("basicbulbshape.obj");
  camera(width/2,height/2,50,width/2,height/2+20,0,0,1,0);
}

public void draw() {
  background(0);
  lights();
  
  translate(width/2, height/2 + 100, -200);
  rotateZ(PI);
  rotateY(ry);
  shape(rocket);
  
  ry += 0.02;
  
  
}
