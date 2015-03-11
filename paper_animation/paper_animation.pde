String imgstr="xiaoge.jpg;konoe.jpg;tuzhi.jpeg";
float unitwidth=4;
float size=2;
Cover cover;
Image img;

void setup(){
  size(800,600);
  cover=new Cover(unitwidth,imgstr.split(";").length,size);
  img=new Image(unitwidth,imgstr);
}

void draw(){
  background(255);
  img.drawimg();
  cover.drawcover();
  
}


