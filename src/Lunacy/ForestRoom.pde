class ForestRoom {
  // Member Variables
 
  PImage ground;

  // Constructor
  ForestRoom() {
    x = width/2;
    y = height/2;
    w = 500;
    h = 500;
   
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

  }
}
