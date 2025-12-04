// Forrest Jefferson| wood
class Wood {
  
  //member variables
  int w;
  float x, y, d;
  PImage stick;
  
  // Constructors
  Wood() {
// wood is implemented randomly
    this.x=random(width);
    this.y=random(height);
    w=15;
//calculate distance beetween wood and mouse
    d=dist(mouseX, mouseY, x, y);
  }
  
  void display() {
//recalculate d every frame
    d=dist(mouseX, mouseY, x, y);
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
