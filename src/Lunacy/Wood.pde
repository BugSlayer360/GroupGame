// Forrest Jefferson| Wood
class Wood {

  //member variables
  int w, h;
  float x, y;
  PImage stick;

  // Constructors
  Wood() {
    // wood is implemented randomly
    x = random(width);
    y = random(height);
    w = 50;
    h = 50;
    stick = loadImage("stick.png");
    stick.resize(w, h);
  }

  void display() {
    image(stick, x, y);
  }
  
  void update(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  boolean clicked(int tempX, int tempY) {
    if (tempX > x-w/2 && tempX < x+w/2 && tempY > y-h/2 && tempY < y+h/2) {
      return true;
    } else {
      return false;
    }
  }
}
