class Fire {
  // Member variables
  int x, y, w, h;
  PImage bigFire, dwindlingFire;
  // Constructers
  Fire() {
    x = width/2;
    y = height/2+50;
    w = 125;
    h = 125;
    bigFire = loadImage("bigFire.png");
    bigFire.resize(w, h);
    //dwindlingFire = loadImage("dwindling.png");
  }

  void display() {
    imageMode(CENTER);
    image(bigFire,x,y);
    
  }
}
