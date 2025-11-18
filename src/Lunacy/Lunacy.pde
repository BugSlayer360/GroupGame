// Ender Hale, Nico Snow, Forrest Jefferson | November 6 2025 | Lunacy
BirdGame bg;
Friend1 friend1;
Friend2 friend2;
int sanity;
char screen = 's';
Button btnMenu, btnSettings, btnBack, btnHowToPlay, btnStart, btnPlay, btnPause;


void setup() {
  size(500, 500);
  bg = new BirdGame();
  sanity = 1000;
  friend1 = new Friend1();
  friend2 = new Friend2();

  // Screens in the game
  btnMenu = new Button("Menu", 220, 125, 160, 50);
  btnBack = new Button("Back", 220, 125, 160, 50);
  btnSettings = new Button("Settings", 220, 125, 160, 50);
  btnHowToPlay = new Button("How To Play", 220, 125, 160, 50);
  btnPlay = new Button("Start", 220, 125, 160, 50);
  btnPause = new Button("Pause", 220, 125, 160, 50);
}



void draw() {
  background(135, 206, 235);
  switch(screen) {
    //Start Game
  case 's':
    background(0);
    // Settings
  case 't':
    background(100);
    // How To Play screen
  case 'h':
    background(0, 0, 100);
    // Menu screen
  case 'm':
    background(0, 200, 0);
    // Pause screen
  case 'u':
    background(0, 0, 0);
    // gameover screen
  case 'g':
    background(300, 0);
  }
  bg.start();
  bg.update();
  friend1.display();
  friend2.display();
}

void startScreen() {
}


void keyPressed() {
}
void mousePressed() {
}
