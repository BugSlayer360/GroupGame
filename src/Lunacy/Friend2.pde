class Friend2 {
  // Member Variables
  int x, y, x2, y2;
  PImage f1, f2, f3, f4;
  char state;
  //Constructor
  Friend2() {
    x = 200;
    y = 500;
    x2 = 300;
    y2 = height;
    f1 = loadImage("sittingImagef2.png");
    f2 = loadImage("normalSanityf2.png");
    f3 = loadImage("lowSanityf2.png");
    f4 = loadImage("veryLowSanityf2.png");
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
