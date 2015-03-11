int anglenum=20;
float innerra=100;
float outra=150;

PVector[] innerpoi= new PVector[anglenum];
PVector[] outpoi= new PVector[anglenum];

void setup()
{
  size((int)(2*outra+200),(int)(2*outra+200));
  beginShape();
  for(int i=0;i<anglenum;i++)
  {
    float smallangel=TWO_PI/(2*anglenum);
  vertex(width/2+outra*cos(smallangel*(2*i)),height/2+outra*sin(smallangel*(2*i)));
  vertex(width/2+innerra*cos(smallangel*(2*i+1)),height/2+innerra*sin(smallangel*(2*i+1)));
  }
  endShape(CLOSE);
}
