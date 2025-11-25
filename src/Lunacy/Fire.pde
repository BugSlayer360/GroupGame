class Fire {
  // Member variables
  int x, y, w, h;
  PImage fire;
  // Constructers
  Fire() {
    x = width/2;
    y = height/2;
    w = 100
    h = 75;
    fire = loadImage("fire.png");
  }

  void display() {
    imageMode(CENTER);
    image(fire,x,y);
    fire.resize(w,h);
  }
}
