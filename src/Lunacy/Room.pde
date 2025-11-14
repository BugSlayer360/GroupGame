class Room {
  // Member Variables
  int x, y, w;
  ArrayList<Tree> trees = new ArrayList<Tree>();
  PImage ground;

  // Constructor
  Room() {
    x = width/2;
    y = height/2
    w = 500;
    ground = loadImage("ground.png");

  }

  // Member Methods
  void display() {
    imageMode(CENTER);
    image(ground, x, y);
    ground.resize(w,w);
  }
}
