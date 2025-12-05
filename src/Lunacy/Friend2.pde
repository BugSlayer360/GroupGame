class Friend2 {
  // Member Variables
  int x, y;
  PImage f1;
  char state;
  //Constructor
  Friend2() {
    x = 200;
    y = 500;
    f1 = loadImage("sittingImagef2.png");
  }
  // Member Methods
  void display() {
    imageMode(CENTER);
   
      image(f1, x, y);
    
  }

}
