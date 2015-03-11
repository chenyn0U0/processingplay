


class Knife{
  Chara handle;
  Chara blade;
  boolean initialized;
  
//  Pointset border;//not be using yet
  
  Knife(Chara h,Chara b){
      this.handle=h;
      this.blade=b;
      this.initialized=false;
  }
  
  void drawskeleton(IsoSkeleton skeleton,float plota,float plotb){
    addskeleton(skeleton,getpvector(handle.alldata));
    addskeleton(skeleton,getpvector(blade.alldata));
    skeleton.plot(plota,plotb);
  }  

  void initialize(){
     float[] centrepoint=getcentrepoint(getalldata(handle.alldata,blade.alldata));
     handle.initialize(centrepoint);
     blade.initialize(centrepoint);
     initialized=true;
  }
  
  void move(float[] move){
    handle=handle.getplus(move);
    blade=blade.getplus(move);
  }
  
  void thisrotate(float angle){
    handle=handle.getrotY(angle);
    blade=blade.getrotY(angle);
  }
  
  Knife getright(float distancetocenter){
    float[] translate={distancetocenter,0,0};
    Chara newh;
    Chara newb;
    newh=handle.getrotY(-PI/2).getrotZ(-PI/2).getplus(translate);
    newb=blade.getrotY(-PI/2).getrotZ(-PI/2).getplus(translate);
    Knife right= new Knife(newh,newb);
    return right;
  }
  
  Knife getback(float distancetocenter){
    float[] translate={0,distancetocenter,0};
    Chara newh;
    Chara newb;
    newh=handle.getrotY(PI).getrotZ(0).getplus(translate);
    newb=blade.getrotY(PI).getrotZ(0).getplus(translate);
    Knife back= new Knife(newh,newb);
    return back;
  }
  
  Knife getup(float distancetocenter){
    float[] translate={0,-distancetocenter,0};
    Chara newh;
    Chara newb;
    newh=handle.getrotY(0).getrotZ(PI).getplus(translate);
    newb=blade.getrotY(0).getrotZ(PI).getplus(translate);
    Knife up= new Knife(newh,newb);
    return up;
  }
  
    Knife getleft(float distancetocenter){
    float[] translate={-distancetocenter,0,0};
    Chara newh;
    Chara newb;
    newh=handle.getrotY(PI/2).getrotZ(PI/2).getplus(translate);
    newb=blade.getrotY(PI/2).getrotZ(PI/2).getplus(translate);
    Knife left= new Knife(newh,newb);
    return left;
  }
  
  
}




class Chara{
  float[][] changable;
  float[][] still;
  float[][] alldata;
  
  Chara(float[][] c,float[][] s){
    changable=c;
    still=s;
    bindalldata();
  }
  
  void bindalldata(){
    alldata=getalldata(changable,still);
  }
  
  
  void getchange(float value){
    change(changable,value);
    bindalldata();
  }
  
  void initialize(float[] center){
    changable=minusonevalue(changable,center);
    still=minusonevalue(still,center);
    bindalldata();
  }
  
  Chara getplus(float[] avalue){
    float[][] c=changable;
    c=plusonevalue(c,avalue);
    float[][] s=still;
    s=plusonevalue(s,avalue);
    Chara a=new Chara(c,s);
    return a;
  }
  
  
  Chara getrotZ(float angle){
    float[][] newc=new float[changable.length][3];
    float[][] news=new float[still.length][3];
    for(int i=0;i<changable.length;i++){
      newc[i]=rotZ(this.changable[i],angle);
    }
    for(int i=0;i<still.length;i++){
      news[i]=rotZ(this.still[i],angle);
    }
    Chara rotatedChara=new Chara(newc,news);
    return rotatedChara;
  }
  
  Chara getrotY(float angle){
    float[][] newc=new float[changable.length][3];
    float[][] news=new float[still.length][3];
    for(int i=0;i<changable.length;i++){
      newc[i]=rotY(changable[i],angle);
    }
    for(int i=0;i<still.length;i++){
      news[i]=rotY(still[i],angle);
    }
    Chara rotatedChara=new Chara(newc,news);
    return rotatedChara;
  }
}




