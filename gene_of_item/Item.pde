class Item{
  //Striname;
  
  numChara[] charas;
  
  float highfitness;
  float lowerfitness;
  
  Item(float av,float bv,float cv,float dv,float ev,float fv,float gv){
    
    this.charas=new numChara[7];
    
    this.charas[0]=new numChara("height",av,3);
    this.charas[1]=new numChara("width",bv,10);
    this.charas[2]=new numChara("color",cv,2);
    this.charas[3]=new numChara("whatever",dv,10);
    this.charas[4]=new numChara("characteristic",ev,5);
    this.charas[5]=new numChara("ahahahaha",fv,3);
    this.charas[6]=new numChara("yoooo!",gv,8);
    //this.name=name;
    
    highfitness=6.0/7.0;
    lowerfitness=5.0/7.0;
  }
  
  float compare(Item yo){
    float correct=0;
    for(int i=0;i<charas.length;i++){
      if(this.charas[i].compare(yo.charas[i])) correct++;
    }
    return correct/charas.length;
  }
  
  void printItem(){
    println(charas[0].name,charas[0].value,
            charas[1].name,charas[1].value,
            charas[2].name,charas[2].value,
            charas[3].name,charas[3].value,
            charas[4].name,charas[4].value,
            charas[5].name,charas[5].value,
            charas[6].name,charas[6].value);
  }
  
}
