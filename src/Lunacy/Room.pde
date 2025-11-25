class Room {
  // Member Variables
  int x, y, w, roomNum;
  ArrayList<Tree> trees = new ArrayList<Tree>();
  ArrayList<Wood> woods = new ArrayList<Wood>();
  PImage ground;

  // Constructor
  Room() {
    x = width/2;
    y = height/2
    w = 500;
    roomNum = 5;
    ground = loadImage("ground.png");

  }

  // Member Methods
  void display() {
    imageMode(CENTER);
    image(ground, x, y);
    ground.resize(w,w);
  }
}






class ForestRoom {
  // Member Variables
  int x, y, w, h, treeCount;
  ArrayList<Tree> trees = new ArrayList<Tree>();
  PImage ground;

  // Constructor
  ForestRoom() {
    x = width/2;
    y = height/2
    w = 500;
    h = 500;
    treeCount = int(random(8,10));
    ground = loadImage("ground.png");
    for (int i = 0; i < treeCount; i++) {
      trees.add(new Tree());
    }
  }

  // Member Methods
  void display() {
    imageMode(CENTER);
    image(ground, x, y);
    ground.resize(w,h);
  }
}
