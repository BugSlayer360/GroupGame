// Ender Hale, Nico Snow, Forrest Jefferson | November 6 2025 | Lunacy
int sanity;
char screen = 'm';
int treeCount;
Button btnMenu, btnBack, btnHowToPlay, btnPlay, btnPause;
ArrayList<Sign> signs = new ArrayList<Sign>();
ArrayList<Tree> trees = new ArrayList<Tree>();
ArrayList<Wood> woods = new ArrayList<Wood>();
Fire fire;
Sign sign;
ForestRoom forestRoom;
PImage ground;
PImage menu, howToPlay, gameOver;


void setup() {
  size(500, 500);
  sanity = 1000;


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
  ground = loadImage("ground.png");
  treeCount = int(random(8,10));
  ground = loadImage("ground.png");
  fire = new Fire();
  sign = new Sign();
  forestRoom = new ForestRoom();
  treeCount = int(random(8,10));
  ground = loadImage("ground.png");
  
  
  // Sets up trees and signs for future use
  // Adds 2 signs to hard coded places
  signs.add(new Sign(60, 300, 0));
  signs.add(new Sign(270, 170, HALF_PI));

  // Adds 7 trees to hard coded places
  trees.add(new Tree(150, 70, 230, 230));
  trees.add(new Tree(50, 120, 230, 230));
  trees.add(new Tree(width-30, 60, 230, 230));
  trees.add(new Tree(width-20, height-100, 230, 230));
  trees.add(new Tree(20, height-20, 230, 230));
  trees.add(new Tree(width-80, height-50, 230, 230));
  trees.add(new Tree(400, 170, 230, 230));

  for (Tree t : trees) t.display();
  for (Wood w : woods) w.display();
}



void draw() {
  switch(screen) {

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

    // Main Room Screen
  case 'r':
    mainRoomScreen();
    break;
    
  case 'f':
    forestRoomScreen();
    break;
    
  case 'b':
    birdGame();
    break;
  }
}

void menuScreen() {
  background(80);
  imageMode(CENTER);
  image(menu, width/2, height/2);
  menu.resize(500, 500);
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
  btnMenu.display(35, 25);
  btnMenu.clicked(mouseX, mouseY);
}

void pauseScreen() {
  pushStyle();
  rectMode(CENTER);
  fill(150, 50, 50, 120);
  rect(width/2, height/2, 100, 200);
  popStyle();
  btnMenu.display(width/2, 300);
  btnMenu.clicked(mouseX, mouseY);
  btnBack.display(width/2, 200);
  btnBack.clicked(mouseX, mouseY);
}


void gameOverScreen() {
  background(80);
  imageMode(CENTER);
  image(gameOver, width/2, height/2);
  btnMenu.display(50, 50);
  btnMenu.clicked(mouseX, mouseY);
}

void mainRoomScreen() {
  background(0);
  imageMode(CENTER);
  image(ground, width/2, height/2);
  ground.resize(width, height);

  // Displays each tree
  for (Tree t : trees) t.display();
  
  // Displays the fire
  fire.display();
  
  // Displays both signs
  for (Sign s : signs) {
    s.display();
    s.clicked(mouseX, mouseY);
  }
  
  btnPause.display(50, 40);
  btnPause.clicked(mouseX, mouseY);
}

void forestRoomScreen() {}

void birdGame() {}

void mousePressed() {
  if (btnMenu.clicked(mouseX, mouseY)) {
    screen = 'm';
  } else if (btnPlay.clicked(mouseX, mouseY)) {
    screen = 'r';
  } else if (btnBack.clicked(mouseX, mouseY)) {
    screen = 'r';
  } else if (btnHowToPlay.clicked(mouseX, mouseY)) {
    screen = 'h';
  } else if (btnPause.clicked(mouseX, mouseY)) {
    screen = 'u';
  }
}
