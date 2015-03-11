


//String fileName="countries.txt";
//
//void setup(){
//  String lines[] = loadStrings(fileName);
//  String sql="";
//  for (int i = 0 ; i < lines.length; i++) {
//    //println(lines[i]);
//    String l1[]=lines[i].split("\\)");
//    String l2[]=l1[0].split("-");
//    String l3[]=l2[1].split("\\(");
//    String info[]={l2[0],l3[1]};
//    sql+=getsql(info[0],info[1]);
//    
//  }
//  println(sql);
//}
//
//void draw(){}
//
//String getsql(String sn,String n){
//  String sql="INSERT INTO `s1425535`.`nations` (`name`, `shortName`) VALUES ('"+n+"', '"+sn+"');  ";
//  return sql;
//}
