
String fileName="outputcoor2.txt";

void setup(){
  String lines[] = loadStrings(fileName);
  for (int i = 0 ; i < lines.length; i++) {
    
    String l[]=lines[i].split("(\\s\\[\\s|\\,\\s|\\s\\]\\s\\[|\\])");
//    println(l);
    for(int m=0;m<l.length;m++){
      for(int n=0;n<l.length;n++){
        if(m!=n){
//          print("1");
          if(l[m].equals(l[n])) println(l[0],l[m],l[n]);
        }
      }
    }
    
  }
}

void draw(){}
