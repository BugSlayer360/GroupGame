class Friend1 {
  // Member Variables
  int x, y;
  PImage f1, f2, f3, f4;
  char state;
  //Constructor
  Friend1() {
    x = 800;
    y = 450;
    x2 = 300;
    y2 = height;
    f1 = loadImage("sittingImagef1.png");
    f2 = loadImage("normalSanityf1.png");
    f3 = loadImage("lowSanityf1.png");
    f4 = loadImage("veryLowSanityf1.png");
    state = 's';
  }
  // Member Methods
  void display() {
    imageMode(CENTER);
    if (state == 's') {
      image(f1, x, y);
    } else if (state == 'n'){
      image(f2, x2, y2);
    }else if (state == 'l'){
      image(f3,x2,y2);
    }else if (state == 'v'){
      image(f4,x2,y2);
    }
  }

}
