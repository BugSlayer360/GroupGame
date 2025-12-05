// Ender Hale, Nico Snow, Forrest Jefferson | November 6 2025 | Lunacy
int sanity;
char screen = 'm';
int treeCount;
Button btnMenu, btnBack, btnHowToPlay, btnPlay, btnPause;
ArrayList<Sign> signs = new ArrayList<Sign>();
ArrayList<Tree> trees = new ArrayList<Tree>();
//ArrayList<Wood> woods = new ArrayList<Wood>();
Fire fire;
Sign sign;
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
  //treeCount = int(random(8,10));
  ground = loadImage("ground.png");
  fire = new Fire();
  sign = new Sign();
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








// Ender Hale, Nico Snow, Forrest Jefferson | November 6 2025 | Lunacy
int sanity;
char screen = 'm';
Button btnMenuHowToPlay, btnBack, btnHowToPlay, btnPlay, btnPause, btnMenuPause, btnMenuGameOver;
Sign leftSign, upSign, rightSign, downSign;
ArrayList<Tree> treesMain = new ArrayList<Tree>();
ArrayList<Tree> treesForest = new ArrayList<Tree>();
Fire fire;
PImage ground;
PImage menu, howToPlay, gameOver;
boolean loadForest;


void setup() {
  size(500, 500);
  sanity = 1000;
  loadForest = false;


  // Buttons in the game
  btnMenuHowToPlay = new Button("Menu", 220, 125, 55, 40);
  btnMenuPause = new Button("Menu", 220, 125, 55, 40);
  btnMenuGameOver = new Button("Menu", 220, 125, 55, 40);
  btnBack = new Button("Back", 220, 125, 55, 40);
  btnHowToPlay = new Button("How To Play", 220, 125, 100, 40);
  btnPlay = new Button("Start", 220, 125, 55, 40);
  btnPause = new Button("Pause", 220, 125, 55, 40);
  //Screens
  menu = loadImage("StartScreen.png");
  howToPlay = loadImage("lunacyHowToPlay.png");
  gameOver = loadImage("gameOver.png");
  ground = loadImage("ground.png");
  fire = new Fire();


  // Sets up trees and signs for future use
  // Adds 2 signs to hard coded places
  leftSign = new Sign(60, 300, 100, 100, 0);
  upSign = new Sign(270, 170, 100, 100, HALF_PI);
  rightSign = new Sign(440, 285, -100, 100, PI);
  downSign = new Sign(270, height-60, 100, 100, PI+HALF_PI);

  // Adds 7 trees to hard coded places
  treesMain.add(new Tree(150, 70, 230, 230));
  treesMain.add(new Tree(50, 120, 230, 230));
  treesMain.add(new Tree(width-30, 60, 230, 230));
  treesMain.add(new Tree(width-20, height-100, 230, 230));
  treesMain.add(new Tree(20, height-20, 230, 230));
  treesMain.add(new Tree(width-80, height-50, 230, 230));
  treesMain.add(new Tree(400, 140, 230, 230));
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

    // Forest screen
  case 'f':
    forestRoomScreen();
    break;

    // Bird Game
  case 'b':
    birdGame();
    break;

    // Waterfall screen
  case 'w':
    waterfallScreen();
    break;
  }

  //switch(screen) {
  //case 'm':
  //  menuScreen();
  //  break;
  //case 'r':
  //  mainRoomScreen();
  //  break;
  //case 'h':
  //  howToPlayScreen();
  //  break;
  //default:             // Default executes if the case names
  //  println("None");   // don't match the switch parameter
  //  break;
  //}
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
  btnMenuHowToPlay.display(35, 25);
  btnMenuHowToPlay.clicked(mouseX, mouseY);
}

void pauseScreen() {
  pushStyle();
  rectMode(CENTER);
  fill(150, 50, 50, 120);
  rect(width/2, height/2, 100, 200);
  popStyle();
  btnMenuHowToPlay.display(width/2, 300);
  btnMenuHowToPlay.clicked(mouseX, mouseY);
  btnBack.display(width/2, 200);
  btnBack.clicked(mouseX, mouseY);
}


void gameOverScreen() {
  background(80);
  imageMode(CENTER);
  image(gameOver, width/2, height/2);
  btnMenuGameOver.display(50, 50);
  btnMenuGameOver.clicked(mouseX, mouseY);
}

void mainRoomScreen() {
  background(0);
  imageMode(CENTER);
  ground.resize(width, height);
  image(ground, width/2, height/2);


  // Displays each tree
  for (Tree t : treesMain) t.display();

  // Displays the fire
  fire.display();

  // Displays both signs
  leftSign.display();
  leftSign.clicked(mouseX, mouseY);
  upSign.display();
  upSign.clicked(mouseX, mouseY);
  rightSign.display();
  rightSign.clicked(mouseX, mouseY);
  downSign.display();
  downSign.clicked(mouseX, mouseY);

  btnPause.display(50, 40);
  btnPause.clicked(mouseX, mouseY);
}




void forestRoomScreen() {
  background(0);
  imageMode(CENTER);
  ground.resize(width, height);
  image(ground, width/2, height/2);


  if (loadForest == false) {
    for (int i = 0; i < treesForest.size(); i++) {
      Tree t = treesForest.get(i);
      t.update(int(random(width)), int(random(height)));
      if (i >= treesForest.size()) {
        loadForest = true;
        noLoop();
      }
    }
  }
  // Displays each tree
  for (Tree t : treesForest) t.display();

  // Displays the fire
  fire.display();

  // Displays both signs
  leftSign.display();
  leftSign.clicked(mouseX, mouseY);
  upSign.display();
  upSign.clicked(mouseX, mouseY);
  rightSign.display();
  rightSign.clicked(mouseX, mouseY);
  downSign.display();
  downSign.clicked(mouseX, mouseY);

  btnPause.display(50, 40);
  btnPause.clicked(mouseX, mouseY);
}

void birdGame() {
}

void waterfallScreen() {
}

void mousePressed() {
  if (btnMenuHowToPlay.clicked(mouseX, mouseY)) {
    screen = 'm';
  } else if (btnMenuGameOver.clicked(mouseX, mouseY)) {
    screen = 'm';
  } else if (btnMenuPause.clicked(mouseX, mouseY)) {
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

  // Checking which sign pressed
  if (leftSign.clicked(mouseX, mouseY)) {
    screen = 'b';
  } else if (upSign.clicked(mouseX, mouseY)) {
    screen = 'f';
  } else if (rightSign.clicked(mouseX, mouseY)) {
    screen = 'f';
  } else if (downSign.clicked(mouseX, mouseY)) {
    screen = 'w';
  }
}

