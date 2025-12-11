//Nico Snow
class Friend {
  // Member Variables
  int x, y, cX, cY, x2, y2, sW, sH, w, h;
  PImage f1, f2, f3, f4, car;
  char state;
  Table dialogue;
  TableRow row;
  //Constructor
  Friend(int x, int y, int cX, int cY) {
    this.x = x;
    this.y = y;
    this.cX = cX;
    this.cY = cY;
    x2 = width/2-100;
    y2 = height/2+80;
    sW = 50;
    sH = 50;
    w = 520;
    h = 400;;
    f1 = loadImage("sittingImage.png");
    f1.resize(sW, sH);
    f2 = loadImage("normalsanityf1.png");
    f2.resize(w, h);
    f3 = loadImage("lowsanityf1.png");
    f3.resize(w, 500);
    f4 = loadImage("verylowsanityf1.png");
    f4.resize(w, h);
    car = loadImage("car.png");
    car.resize(150, 125);
    state = 's';
    dialogue = loadTable("tommydialogue.csv", "header");
  }


  // Member Methods
  void display() {
    imageMode(CENTER);
    if (state == 's') {
      image(car, cX, cY);
      image(f1, x, y);
    } else if (state == 'n') {
      image(f2, x2, y2);
      //for (TableRow row : dialogue.rows()) {

      //  int id = row.getInt("id");
      //  String tdialogue = row.getString("dialogue");
      // // String name = row.getString("name");
      // row = dialogue.getRow(2);

      //  println(id + " (" + tdialogue + ") has an ID of " + id);
      //}
    } else if (state == 'l') {
      image(f3, x2, height/2);
    } else if (state == 'v') {
      image(f4, x2+20, height/2+75);
    }
  }


  boolean clicked(int tempX, int tempY) {
    if (tempX > x-50/2 && tempX < x+50/2 && tempY > y-100/2 && tempY < y+100/2) {
      return true;
    } else {
      return false;
    }
  }
}
