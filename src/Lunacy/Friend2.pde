class Friend2 {
  // Member Variables
  int x, y;
  PImage f1;
  char state;
  //Constructor
  Friend2() {
    x = 1300;
    y = 350;
    f1 = loadImage("sittingImagef2.png");
    f1.resize(100,100);
  }
  // Member Methods
  void display() {
    imageMode(CENTER);
   
      image(f1, x, y);
    
  }

}
