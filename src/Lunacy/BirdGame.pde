class BirdGame {
  
  // Member Variables
  int x, y, speed;
  PImage bird, evilBird;
  
  // Constructors
  BirdGame() {
    x = int(random(-10,-5));
    y = int(random(0,height/2));
    speed = int(random(5,8));
    bird = loadImage("bird.png");
    evilBird = loadImage("evilBird.png");
  }

  // Member Methods
  void update() {
    x += speed;   // move to the right
    if (x > width) {
      // reset bird once it flies off the screen
      x = int(random(-50, -10));
      y = int(random(0, height / 2));
      speed = int(random(5, 8));
    }
  }
  void display() {
    if (evil) {
      image(evilBird, x, y);
    } else {
      image(bird, x, y);
    }
  }
  
}
