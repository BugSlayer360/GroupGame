// Ender Hale made this class | December 4 2025 | Lunacy
class Sign {
  // Member Variables
  int x, y, w, h, treeCount;
  PImage sign;

  // Constructor
  // You can set each sign individually
  Sign(int x, int y) {
    this.x = x;
    this.y = y;
    w = 50;
    h = 50;
    sign = loadImage("sign.png");
  }

  // Member Methods
  void display() {
    imageMode(CENTER);
    image(sign, x, y);
    sign.resize(w,h);
  }
}
