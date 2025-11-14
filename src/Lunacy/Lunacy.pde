// Ender Hale, Nico Snow, Forrest Jefferson | November 6 2025 | Lunacy
BirdGame bg;
Friend1 friend1;
Friend2 friend2;
int sanity;
char screen = '';
char room = '';
void setup() {
  size(500,500);
  bg = new BirdGame();
  friend1 = new Friend1();
  tree = new Tree();
  wood = new Wood
}

void draw() {
  background(135,206,235);
  bg.start();
  bg.update();
  //bg.keyPressed(char k);
  friend1.display();
  friend2.display();
  tree.display();
}

void keyPressed() {
 
}
void mousePressed() {
  
}
