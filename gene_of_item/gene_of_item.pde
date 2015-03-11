int itemnum=100;
int thewidth=1000;
int theheight=800;

Item[] items=new Item[itemnum];
itemCompareReport[] report=new itemCompareReport[itemnum];
anItem[] cells=new anItem[itemnum];

float size=(float)Math.sqrt(thewidth*theheight/itemnum)*0.64;


void setup() {
  size(thewidth,theheight);
  
  
  
  //######################################
  for(int i=0;i<items.length;i++){
    items[i]=new Item(random(0,15),random(0,15),random(0,15),random(0,15),random(0,15),random(0,15),random(0,15));
    //____________________________________-
    
    cells[i]=new anItem(i,items[i],thewidth*0.15+(size*((int)(i%(thewidth*0.8/size)))),theheight*0.2+(size*((int)(i/(thewidth*0.8/size)))),size);
    
    //------------------------------------
    report[i]=new itemCompareReport(i,itemnum);
    items[i].printItem();
  }
  
  for(int i=0;i<itemnum;i++){
    for(int j=0;j<itemnum;j++){
      float fitness=items[i].compare(items[j]);
      report[i].setCompareResult(j,fitness);
    }
      //report[i].printResult();
      report[i].printHighFitness(items[report[i].itemA].highfitness,items[report[i].itemA].lowerfitness);
  }
  
  
}


void draw(){
  background(255);
for(int i=0;i<itemnum;i++){
  cells[i].drawItem();
}

for(int i=0;i<itemnum;i++){
   for(int j=i+1;j<itemnum;j++){
    cells[i].drawRelationship(cells[j]);
  }
}

}

int locked=-1;
void mouseDragged(){
  if(locked==-1){
  for(int i=0;i<itemnum;i++){
    if(mouseX>cells[i].x-(cells[i].size/2)&&mouseX<cells[i].x+(cells[i].size/2)&&
        mouseY>cells[i].y-(cells[i].size/2)&&mouseY<cells[i].y+(cells[i].size/2)){
      locked=i;
      break;
    }
  }}
  else{
      cells[locked].x=mouseX;
      cells[locked].y=mouseY;}
}

void mouseReleased(){
  locked = -1;
}
