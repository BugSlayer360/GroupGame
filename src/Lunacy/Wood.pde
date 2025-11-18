class Wood {
  
  //member variables
  int w;
  float x, y, d;
  PImage stick;
  
  // Constructors
  Wood() {
    x=int(random(width));
    y=int(random(height, height/2));
    w=15;
    d=dist(mouseX, mouseY, x, y);
  }
  
  void display() {
    stick.resize(w, w);
    image(stick, x, y);
  }
  
  boolean grabbed() {
    if (d<15) {
      return true;
    } else {
      return false;
    }
  }
}
