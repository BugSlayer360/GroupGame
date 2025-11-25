class Button {
  String label;
  float x, y, w, h;

  Button(String label, float x, float y, float w, float h) {
    this.label = label;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void display(int x, int y) {
    this.x = x;
    this.y = y;
    fill(150, 50, 50);
    stroke(0);
    rectMode(CENTER);
    rect(x, y, w, h, 10);

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(16);
    text(label, x, y);
  }

  boolean clicked(int tempX, int tempY) {
    if (tempX > x-w/2 && tempX < x+w/2 && tempY > y-h/2 && tempY < y+h/2) {
      return true;
    } else {
      return false;
    }
  }
}
