class Fire {
  // Member variables
  int x, y, w, h;
  PImage bigFire, dwindlingFire;
  // Constructers
  Fire() {
    x = width/2;
    y = height/2;
    w = 100
    h = 75;
    bigFire = loadImage("bigFire.png");
    dwindlingFire = loadImage("dwindling.png");
  }

  void display() {
    imageMode(CENTER);
    image(fire,x,y);
    fire.resize(w,h);
  }
}
