class Characteristic{
  String name;
}


class numChara{
  String name;
  float value;
  float range;
  
  numChara(String name,float value,float range){
    this.name=name;
    this.value=value;
    this.range=range;
  }
  
  numChara(String name,float value){
    this.name=name;
    this.value=value;
    this.range=0;
  }
  
  boolean compare(numChara v){
    //if(v.name!=this.name) return 2;//error: not for the same characteristic
    if(v.value>=this.value-(this.range/2)&&v.value<=this.value+(this.range/2))
            return true;//values equal each other
    else return false;//values do not equal each other   
  }
}

class itemCompareReport{
  int itemA;
  int bNum;
  int[] itemB;
  float[] result;
  
  itemCompareReport(int aID,int bnum){
    itemA=aID;
    bNum=bnum;
    itemB=new int[bnum];
    for(int i=0;i<bNum;i++){
      itemB[i]=-1;//if a itemB[x] is -1, means not existed yet
    }
    result=new float[bnum];
  }
  
  void setCompareResult(int bID,float compareResult){
    if(bID!=itemA){
      itemB[bID]=bID;
      result[bID]=compareResult;
    }
  }
  
  void printResult(){
    print(itemA);
    for(int i=0;i<bNum;i++){
      if(itemB[i]!=-1) println("\t"+itemB[i]+"\t"+result[i]);
    }
    println();
  }
  
  
  int printHighFitness(float highFitnessValue,float lowerFitnessValue){
    print(itemA);
    int highlymatch=0;
    int lowermatch=0;
    String lowerFit="";//to store lower matched information
    for(int i=0;i<bNum;i++){
      if(itemB[i]!=-1){
        if(result[i]>=highFitnessValue){
         println("\t"+itemB[i]+"\t"+result[i]);
         highlymatch++;
        }
        else if(result[i]>=lowerFitnessValue){
          lowerFit+="\t"+itemB[i]+"\t"+result[i]+"\n";
          lowermatch++;
        }
      }
    }
    if(highlymatch==0){
      println("\tno hightly match");
      if(lowermatch!=0){
        print(lowerFit);
        println("\tlower match: "+lowermatch);
      }
      else println("\tno lower match");
    }
    else println("\thighly match: "+highlymatch);
    println();
    return highlymatch;
  }
}
