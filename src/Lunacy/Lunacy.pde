// Ender Hale, Nico Snow, Forrest Jefferson | November 6 2025 | Lunacy
BirdGame bg;
Friend1 friend1;
Friend2 friend2;
ForestRoom forestRoom;
MainRoom maqinRoom;
int sanity;
char screen = 'm';
Button btnMenu, btnBack, btnHowToPlay, btnPlay, btnPause;
PImage menu, howToPlay, gameOver;


void setup() {
  size(500, 500);
  bg = new BirdGame();
  sanity = 1000;
  friend1 = new Friend1();
  friend2 = new Friend2();
  forestRoom = new ForestRoom();
  mainRoom = new MainRoom();

  // Buttons in the game
  btnMenu = new Button("Menu", 220, 125, 55, 40);
  btnBack = new Button("Back", 220, 125, 55, 40);
  btnHowToPlay = new Button("How To Play", 220, 125, 100, 40);
  btnPlay = new Button("Start", 220, 125, 55, 40);
  btnPause = new Button("Pause", 220, 125, 55, 40);
  //Screens
  menu = loadImage("StartScreen.png");
  howToPlay = loadImage("lunacyHowToPlay.png");
  gameOver = loadImage("gameOver.png");
}



void draw() {
  switch(screen) {
    //Play Game
  case 'p':
    playScreen();
    break;


    // How To Play screen
  case 'h':
    howToPlayScreen();
    break;


    // Menu screen
  case 'm':
    menuScreen();
    break;


    // Pause screen
  case 'u':
    pauseScreen();
    break;


    // gameover screen
  case 'g':
    gameOverScreen();
    break;
  }
}

void menuScreen() {
  background(80);
  imageMode(CENTER);
  image(menu, width/2, height/2);
  menu.resize(500,500);
  btnPlay.display(width/2-45, 150);
  btnPlay.clicked(mouseX, mouseY);
  btnHowToPlay.display(width/2+50, 150);
  btnHowToPlay.clicked(mouseX, mouseY);
}

void howToPlayScreen() {
  background(80);
  imageMode(CENTER);
  image(howToPlay, width/2, height/2);
  howToPlay.resize(500, 500);
  btnMenu.display(35,25); 
  btnMenu.clicked(mouseX, mouseY);
}

void pauseScreen() {
  background(80);
  pushStyle();
  rectMode(CENTER);
  fill(150,50,50,120);
  rect(width/2,height/2,100,200);
  popStyle();
  btnMenu.display(width/2, 300);  
  btnMenu.clicked(mouseX, mouseY);
  btnBack.display(width/2, 200); 
  btnBack.clicked(mouseX, mouseY);
}

void playScreen() {
  background(80);
  btnPause.display(100,100);
  btnPause.clicked(mouseX, mouseY);
}

void gameOverScreen() {
  background(80);
  imageMode(CENTER);
  image(gameOver, width/2, height/2);
  btnMenu.display(50,50);
  btnMenu.clicked(mouseX, mouseY);
}

void mousePressed() {
  if (btnMenu.clicked(mouseX, mouseY)) {
    screen = 'm';
  } else if(btnPlay.clicked(mouseX, mouseY)) {
    screen = 'p';
  } else if(btnBack.clicked(mouseX, mouseY)) {
    screen = 'p';
  } else if(btnHowToPlay.clicked(mouseX, mouseY)) {
    screen = 'h';
  } else if(btnPause.clicked(mouseX, mouseY)) {
    screen = 'u';
  }
}
