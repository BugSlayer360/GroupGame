class Wood(){
  //member variables
  int x,y,w ;
  PImage stick;
  //constructors
  Wood(){
    x=int(random(width));
    y=int(random(height,height/2));
    w=15;
  }
  void display(){
    stick.resize(w,w);
    image(stick,x,y);
  }
}
