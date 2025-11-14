// Ender Hale, Nico Snow, Forrest Jefferson | November 6 2025 | Lunacy
BirdGame bg;
Friend1 friend1;
Friend2 friend2;
ArrayList<Tree> trees = new ArrayList<Tree>();
int sanity;
char screen = '';
Button btnMenu, btnSettings, btnCredits, btnBack;
void setup() {
  size(500,500);
  bg = new BirdGame();
  friend1 = new Friend1();
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
