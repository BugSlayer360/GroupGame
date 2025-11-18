class Tree {
  // member variables
  int x, y;
  PImage tree;
  
  // Constructors
  Tree(int x, int y) {
    this.x = x;
    this.y = y;
    tree = loadImage("tree.png");
  }
  void display() {
    image(tree, x, y);
  }
  
}
