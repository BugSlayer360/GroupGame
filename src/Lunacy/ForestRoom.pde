class ForestRoom {
  // Member Variables
  int x, y, w, h, treeCount;
  ArrayList<Tree> trees = new ArrayList<Tree>();
  ArrayList<Wood> woods = new ArrayList<Wood>();
  PImage ground;

  // Constructor
  ForestRoom() {
    x = width/2;
    y = height/2;
    w = 500;
    h = 500;
    treeCount = int(random(8,10));
    ground = loadImage("ground.png");
    ground.resize(w,h);
    for (int i = 0; i < treeCount; i++) {
      trees.add(new Tree());
    }
    for (int i = 0; i < treeCount; i++) {
      woods.add(new Wood());
    }
  }

  // Member Methods
  void display() {
    imageMode(CENTER);
    image(ground, x, y);
// Forrest: displays the trees and wood within the ForestRoom class, which displays within the main class
    for (Tree t : trees) t.display();
    for (Wood w : woods) w.display();
  }
}
