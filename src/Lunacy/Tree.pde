class Tree{
  // member variables
  int x, y;
  PImage tree;
  //constructors
  Tree(x,y){
    this.x=x;
    this.y=y;
tree= loadImage("tree.png");
  }
  void display(){
  
    image(tree,x,y);
  }
}
