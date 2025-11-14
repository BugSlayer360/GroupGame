// Ender Hale, Nico Snow, Forrest Jefferson | November 6 2025 | Lunacy
BirdGame bg;
Friend1 friend1;
Friend2 friend2;
int sanity;
char screen = 's';
Button btnMenu, btnSettings, btnCredits, btnBack, btnHowToPlay, btnStart, btnPlay;


void setup() {
  size(500,500);
  bg = new BirdGame();
  sanity = 1000;
  friend1 = new Friend1();
  friend2 = new Friend2();

  // Screens in the game
  btnMenu = new Button("Menu", 220, 125,160,50);
  btnCredits = new Button("Credits", 220, 125,160,50);
  btnBack = new Button("Back", 220, 125,160,50);
  btnSettings = new Button("Settings", 220, 125,160,50);
  btnHowToPlay = new Button("How To Play", 220, 125,160,50);
  btnPlay = new Button("Start", 220, 125,160,50);
}



void draw() {
  background(135,206,235);
  bg.start();
  bg.update();
  friend1.display();
  friend2.display();
  tree.display();
}

void startScreen() {}


void keyPressed() {
 
}
void mousePressed() {
  
}
