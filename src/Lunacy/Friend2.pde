class Friend2 {
  // Member Variables
  int x, y;
  PImage f1;
  char state;
  //Constructor
  Friend2(int x, int y) {
    this.x = x;
    this.y = y;
    f1 = loadImage("sittingImagef2.png");
    f1.resize(75, 75);
  }
  // Member Methods
  void display() {
    imageMode(CENTER);
   
      image(f1, x, y);
    
  }

}
