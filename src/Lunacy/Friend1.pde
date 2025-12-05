class Friend1 {
  // Member Variables
  int x, y, x2, y2;
  PImage f1, f2, f3, f4;
  char state;
  Table dialogue;
  TableRow row;
  //Constructor
  Friend1() {
    x = 800;
    y = 450;
    x2 = 300;
    y2 = height;
    f1 = loadImage("sittingimagef1.png");
    f2 = loadImage("normalsanityf1.png");
    f3 = loadImage("lowsanityf1.png");
    f4 = loadImage("verylowsanityf1.png");
    state = 'n';
    dialogue = loadTable("tommydialogue.csv", "header");
  }
  // Member Methods
  void display() {
    imageMode(CENTER);
    if (state == 's') {
      image(f1, x, y);
    } else if (state == 'n') {
      image(f1, x2, y2);
      for (TableRow row : dialogue.rows()) {

        int id = row.getInt("id");
        String tdialogue = row.getString("dialogue");
       // String name = row.getString("name");
       row = dialogue.getRow(2);

        println(id + " (" + tdialogue + ") has an ID of " + id);
      }
    } else if (state == 'l') {
      image(f3, x2, y2);
    } else if (state == 'v') {
      image(f4, x2, y2);
    }
  }
}
