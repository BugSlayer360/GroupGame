class Tree{
  // member variables
  Room r1;
  int x, y;
  PImage tree;
  //constructors
  Tree(){
r1 = new Room();
    x=r1.tx;
    y=r1.ty;
tree= loadImage("tree.png");
  }
  void display(){
  
    image(tree,x,y);
  }
}
