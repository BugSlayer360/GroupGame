class Friend1 {
  // Member Variables
  int x, y, x2, y2, w, h;
  PImage f1, f2, f3, f4;
  char state;
  Table dialogue;
  TableRow row;
  //Constructor
  Friend1(int x, int y) {
    this.x = x;
    this.y = y;
    x2 = width/2-100;
    y2 = height/2+80;
    w = 75;
    h = 75;
    f1 = loadImage("sittingImage.png");
    f1.resize(w, h);
    f2 = loadImage("normalsanityf1.png");
    f3 = loadImage("lowsanityf1.png");
    f4 = loadImage("verylowsanityf1.png");
    state = 's';
    dialogue = loadTable("tommydialogue.csv", "header");
  }
  
  
  // Member Methods
void display() {
    imageMode(CENTER);
    if (state == 's') {
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
      image(f3, x2, y2);
    } else if (state == 'v') {
      image(f4, x2, y2);
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
