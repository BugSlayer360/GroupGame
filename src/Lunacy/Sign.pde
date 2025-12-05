// Ender Hale made this class | December 4 2025 | Lunacy
class Sign {
  // Member Variables
  int x, y, w, h;
  float angle;
  PImage sign;

  // Constructor
  // You can set each sign individually
  Sign(int x, int y, int w, int h, float angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.w = w;
    this.h = h;
    sign = loadImage("sign.png");
  }

  // Member Methods
  void display() {
    // Sets a rotation point and makes image
    pushMatrix();
    translate(x,y);
    rotate(angle);
    imageMode(CENTER);
    //sign.resize(w, h);
    image(sign, 0, 0);
    popMatrix();
  }
  
  // Checks if the sign is clicked or not
  boolean clicked(int tempX, int tempY) {
    if (tempX > x-w/2 && tempX < x+w/2 && tempY > y-h/2 && tempY < y+h/2) {
      return true;
    } else {
      return false;
    }
  } 
}
