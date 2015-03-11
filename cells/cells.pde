
int _WIDTH=800;
int _HEIGHT=600;

int cellsize=50;
Cell[][] cells;

void setup(){
_WIDTH=displayWidth;
_HEIGHT=displayHeight;
cells=new Cell[_WIDTH/cellsize][_HEIGHT/cellsize];

//same size with screen


size(_WIDTH,_HEIGHT);
for(int x=0;x<cells.length;x++){
  for(int y=0;y<cells[0].length;y++){
    cells[x][y]=new Cell(x,y,cellsize);
  }
}
}

void draw(){
  background(255);
  for(int x=0;x<cells.length;x++){
  for(int y=0;y<cells[0].length;y++){
    cells[x][y].displaycell();
  }}

  cells[int(mouseX/cellsize)][int(mouseY/cellsize)].drawcell();
}

class Cell{
int x;
int y;
int size;
boolean circleinside=false;
Cell(int _x,int _y,int _size){
x=_x;y=_y;size=_size;
}
void drawcell(){
  noFill();
  stroke(#00FF00);
    if(circleinside){
    stroke(#FF0000);
  }
  rect(x*size,y*size,size,size);
}
void displaycell(){
  if(circleinside){
    fill(#0000FF);
    noStroke();
    ellipse(x*size+(size/2),y*size+(size/2),size,size);
  }
}
}

void mousePressed(){
  cells[int(mouseX/cellsize)][int(mouseY/cellsize)].circleinside=true;
}
