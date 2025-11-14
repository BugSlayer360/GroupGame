class Room {
  // Member Variables
Player p1;
  int x, y, w, h, tx, ty;
  PImage ground;

  // Constructor
  Room() {
    p1 = new Player();
    if(p1. roomNum == 0){
      tx=50;
      ty=50;
    }
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
