class Tree {
  // member variables
  int x, y, w, h;
  PImage tree;
  
  // Constructors
  Tree(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    tree = loadImage("tree.png");
  }
  void display() {
    imageMode(CENTER);
    image(tree, x, y, w, h);
  }
  
}
