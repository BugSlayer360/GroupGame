class Room {
  // Member Variables
  int x, y, w, h;
  PImage ground;

  // Constructor
  Room() {
    x = 
    y = 
    w = 
    h = 
    ground = loadImage("ground.png");
  }

  // Member Methods
  void display() {
    imageMode(CENTER)
      ground.resize(w, w);
    image(ground, x, y);
  }
}
