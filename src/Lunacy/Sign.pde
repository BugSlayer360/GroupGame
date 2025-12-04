// Ender Hale made this class | December 4 2025 | Lunacy
class Sign {
  // Member Variables
  int x, y, w, h;
  float angle;
  PImage sign;

  // Constructor
  // You can set each sign individually
  Sign(int x, int y, float angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    w = 100;
    h = 100;
    sign = loadImage("sign.png");
  }

  // Member Methods
  void display() {
    pushMatrix();
    translate(x,y);
    rotate(angle);
    imageMode(CENTER);
    sign.resize(w, h);
    image(sign, 0, 0);
    popMatrix();
  }
  
  boolean clicked(int tempX, int tempY) {
    if (tempX > x-w/2 && tempX < x+w/2 && tempY > y-h/2 && tempY < y+h/2) {
      return true;
    } else {
      return false;
    }
  } 
}
