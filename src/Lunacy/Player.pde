class Player {
  // Member Variables
  int x, y, w, speed;
  PImage dude;

  // Constructor
  Player() {
    x = width/2-50;
    y = height/2;
    w = 100;
    dude = loadImage("dude.png")
    speed = 10;
  }

  // Member Methods
  void display() {
    imageMode(CENTER);
    image(dude, x, y);
  }

  void move() {}
}

