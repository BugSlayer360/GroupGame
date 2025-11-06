class MainRoom {
  // Member Variables
  int x, y, w, h;
  PImage ground;

  // Constructor
  MainRoom() {
    x=width/2;
    y=height/2;
    w=500;
    h=500;
    ground = loadImage("ground.png");
  }

  // Member Methods
  void display() {
    imageMode(CENTER)
    ground.resize(w,w);
    image(ground, x, y);
  }
}
