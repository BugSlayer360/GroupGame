class Wood(){
  //member variables
  int x,y,w,d;
  PImage stick;
  //constructors
  Wood(){
    x=int(random(width));
    y=int(random(height,height/2));
    w=15;
    d=dist(MOUSEX,MOUSEY,x,y);
  }
  void display(){
    stick.resize(w,w);
    image(stick,x,y);
  }

  void mousePressed() {
    boolean grabbed() {
      if(d<15){
        return true;
      } else {
        return false;
      }
    }
  }
}
