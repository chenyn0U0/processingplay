class Cover{
  float[] lines;
  float unitwidth;
  int aninum;
  float size;
  float nowposition;
  Cover(float uw,int an,float s){
    nowposition=width*size+width+100;
    unitwidth=uw;
    aninum=an;
    size=s;
    int num=(int)((width*size)/(uw*an));
    lines=new float[num];
    
    for(int i=0;i<num;i++){
       lines[i]=i*aninum*unitwidth;
    }
  }
  void drawcover(){
    fill(0);
    noStroke();
    getnowposition();
    for(int i=0;i<lines.length;i++){
      rect(nowposition+lines[i],0,(unitwidth*aninum/3*2),height);
      
    }
  }  
  
  void getnowposition(){
    nowposition=map(mouseX,0,width,-(width*size+100),width+100);
  }
}
