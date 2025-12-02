// Forrest Jefferson| wood
// to do list: display wood, get wood sprite
class Wood {
  
  //member variables
  int w;
  float x, y, d;
  PImage stick;
  
  // Constructors
  Wood() {
    this.x=x
    this.y=y
    w=15;
//calculate distance beetween wood and mouse
    d=dist(mouseX, mouseY, x, y);
  }
  
  void display() {
    stick.resize(w, w);
    image(stick, x, y);
  }
  // if the mouse is near the stick, grabbed is true
  boolean grabbed() {
    if (d<15) {
      return true;
    } else {
      return false;
    }
  }
}
