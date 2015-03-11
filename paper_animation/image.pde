class Image{
  PImage[] img;
  PImage[] mask;
  Image(float unitwidth,String imgstr){
    String[] imgurl=imgstr.split(";");
    img=new PImage[imgurl.length];
    mask=new PImage[imgurl.length];
    for(int i=0;i<imgurl.length;i++){
      img[i]=loadImage(imgurl[i]);
      println(imgurl[i]);
      for(int m=0;m<img[i].pixels.length;m++){
        float lala=(((m%img[i].width))%(imgurl.length*unitwidth));
        if(lala>unitwidth-1){
          img[i].pixels[m]=color(0,0);   
        }
      }
    }
  }
  
  void drawimg(){
    for(int i=0;i<img.length;i++){
      image(img[i], (i*unitwidth), 0);
    }
  }
  
}
