// Lunacy Game - Ender Hale, Nico Snow, Forrest Jefferson | Dec 2025

int sanity;
char screen = 'm';
char prevScreen;
Friend1 friend1;
Friend2 friend2;
Button btnBack, btnHowToPlay, btnPlay, btnPause, btnMenuHowToPlay, btnMenuPause, btnMenuGameOver;
Sign sign, leftSign, upSign, rightSign, downSign, rightBirdSign;
ArrayList<Tree> treesMain = new ArrayList<Tree>();
ArrayList<Tree> treesForest = new ArrayList<Tree>();
ArrayList<Bird> birds = new ArrayList<Bird>();
PVector crosshair;
Fire fire;

PImage ground;
PImage menu, howToPlay, gameOver;

void setup() {
  size(500, 500);
  sanity = 1000;

  // Friends
  friend1 = new Friend1();
  friend2 = new Friend2();

  // Buttons
  btnBack = new Button("Back", 220, 125, 55, 40);
  btnHowToPlay = new Button("How To Play", 220, 125, 100, 40);
  btnPlay = new Button("Start", 220, 125, 55, 40);
  btnPause = new Button("Pause", 220, 125, 55, 40);
  btnMenuHowToPlay = new Button("Menu", 220, 125, 55, 40);
  btnMenuPause = new Button("Menu", 220, 125, 55, 40);
  btnMenuGameOver = new Button("Menu", 220, 125, 55, 40);

  // Screens
  menu = loadImage("StartScreen.png");
  howToPlay = loadImage("lunacyHowToPlay.png");
  gameOver = loadImage("gameOver.png");
  ground = loadImage("ground.png");

  // Set fire and crosshair
  fire = new Fire();
  crosshair = new PVector(width/2, height/2);
  crosshair.set(mouseX, mouseY);

  // Clear and add new birds
  birds.clear();
  for (int i = 0; i < 4; i++) {  // spawn 4 birds
    birds.add(new Bird());
  }



  // Signs
  leftSign = new Sign(60, 300, 100, 100, 0);
  upSign = new Sign(270, 170, 100, 100, HALF_PI);
  rightSign = new Sign(440, 285, -100, 100, PI);
  downSign = new Sign(270, height-60, 100, 100, PI+HALF_PI);
  rightBirdSign = new Sign(440, height-60, 100, 100, PI);

  // Main room trees (hard-coded)
  treesMain.add(new Tree(150, 70, 230, 230));
  treesMain.add(new Tree(50, 120, 230, 230));
  treesMain.add(new Tree(width-30, 60, 230, 230));
  treesMain.add(new Tree(width-20, height-100, 230, 230));
  treesMain.add(new Tree(20, height-20, 230, 230));
  treesMain.add(new Tree(width-80, height-50, 230, 230));
  treesMain.add(new Tree(400, 140, 230, 230));

  // Forest trees (placeholder)
  for (int i = 0; i < 10; i++) {
    treesForest.add(new Tree(0, 0, 230, 230));
  }
}

void draw() {
  //background(255);

  switch(screen) {
  case 'h':
    howToPlayScreen();
    break;
  case 'm':
    menuScreen();
    break;
  case 'u':
    pauseScreen();
    break;
  case 'g':
    gameOverScreen();
    break;
  case 'r':
    mainRoomScreen();
    break;
  case 'f':
    forestRoomScreen();
    break;
  case 'b':
    birdGame();
    break;
  case 'w':
    waterfallScreen();
    break;
  }

  // Display friends
  friend1.display();
  friend2.display();
}





// -------------------- Screens --------------------
void menuScreen() {
  // Show menu screen
  background(80);
  imageMode(CENTER);
  image(menu, width/2, height/2);
  menu.resize(500, 500);

  // Display and set clicked area for buttons
  btnPlay.display(width/2-45, 150);
  btnPlay.clicked(mouseX, mouseY);
  btnHowToPlay.display(width/2+50, 150);
  btnHowToPlay.clicked(mouseX, mouseY);
}




void howToPlayScreen() {
  // Show picture of rules
  background(80);
  imageMode(CENTER);
  image(howToPlay, width/2, height/2);
  howToPlay.resize(500, 500);

  // Display and set clicked area for buttons
  btnMenuHowToPlay.display(35, 25);
  btnMenuHowToPlay.clicked(mouseX, mouseY);
}

void pauseScreen() {

  // Show pause box with buttons
  pushStyle();
  rectMode(CENTER);
  fill(0,150);
  rect(width/2, height/2, 100, 200);
  popStyle();

  // Display and set clicked area for buttons
  btnMenuPause.display(width/2, 300);
  btnMenuPause.clicked(mouseX, mouseY);
  btnBack.display(width/2, 200);
  btnBack.clicked(mouseX, mouseY);
}

void gameOverScreen() {
  // Refresh background
  background(80);
  imageMode(CENTER);
  image(gameOver, width/2, height/2);

  // Display and set clicked area for buttons
  btnMenuGameOver.display(50, 50);
  btnMenuGameOver.clicked(mouseX, mouseY);
}

void mainRoomScreen() {
  // Refresh background
  background(0);
  imageMode(CENTER);
  image(ground, width/2, height/2);
  ground.resize(width, height);

  for (Tree t : treesMain) t.display();
  fire.display();

  leftSign.display();
  leftSign.clicked(mouseX, mouseY);
  upSign.display();
  upSign.clicked(mouseX, mouseY);
  rightSign.display();
  rightSign.clicked(mouseX, mouseY);
  downSign.display();
  downSign.clicked(mouseX, mouseY);

  // Display and set clicked area for buttons
  btnPause.display(50, 40);
  btnPause.clicked(mouseX, mouseY);
}

void forestRoomScreen() {
  // Refresh background
  background(0);
  imageMode(CENTER);
  ground.resize(width, height);
  image(ground, width/2, height/2);


  // Display randomized trees
  for (Tree t : treesForest) t.display();

  // Display and set clicked area for signs
  downSign.display();
  downSign.clicked(mouseX, mouseY);

  // Display and set clicked area for buttons
  btnPause.display(50, 40);
  btnPause.clicked(mouseX, mouseY);
}



void birdGame() {
  // Sets background to sky blue and moves ground down
  background(135, 206, 235);
  imageMode(CENTER);
  ground.resize(width, height);
  image(ground, width/2, height+10);

  // Spawn and update and display birds
  for (int i = birds.size()-1; i >= 0; i--) {
    Bird b = birds.get(i);
    b.update();
    b.display();

    // Check when bird is off screen
    if (b.reachedSide()) {
      birds.remove(i);
      birds.add(new Bird());
    }
  }

  // Draws Crosshair
  pushStyle();
  stroke(0);
  strokeWeight(2);
  line(mouseX-10, mouseY, mouseX+10, mouseY);
  line(mouseX, mouseY-10, mouseX, mouseY+10);
  popStyle();


  // Display and set clicked area for buttons
  btnPause.display(50, height-40);
  btnPause.clicked(mouseX, mouseY);
  
  rightBirdSign.display();
  rightBirdSign.clicked(mouseX, mouseY);
}





void waterfallScreen() {
}



// -------------------- Forest Tree Randomization --------------------
void randomizeForestTrees() {
  for (Tree t : treesForest) {
    t.update(int(random(width)), int(random(height)));
  }
}

// -------------------- Mouse interaction --------------------
void mousePressed() {
  // Menu / Pause / Game Over buttons
  if (btnMenuHowToPlay.clicked(mouseX, mouseY) && screen == 'h') {
    screen = 'm';
    return;
  } else if (btnMenuPause.clicked(mouseX, mouseY) && screen == 'u') {
    screen = 'm';
    return;
  } else if (btnMenuGameOver.clicked(mouseX, mouseY) && screen == 'g') {
    screen = 'm';
    return;
  } else if (btnPlay.clicked(mouseX, mouseY) && screen == 'm') {
    screen = 'r';
    return;
  } else if (btnBack.clicked(mouseX, mouseY) && screen == 'u') {
    screen = prevScreen;
    return;
  } else if (btnHowToPlay.clicked(mouseX, mouseY) && screen == 'm') {
    screen = 'h';
    return;
  } else if ((btnPause.clicked(mouseX, mouseY)) && (screen == 'r' || screen == 'j' || screen == 'f' || screen == 'w' || screen == 'b')) {
    prevScreen = screen;
    screen = 'u';
    return;
  }



  //------------------- Sign interaction -----------------------

  // Sign interaction when main room
  if (screen == 'r') {
    if (leftSign.clicked(mouseX, mouseY)) {
      screen = 'b';
      return;
    } else if (upSign.clicked(mouseX, mouseY)) {
      screen = 'f';
      randomizeForestTrees(); // Randomize every time forest is entered
      return;
    } else if (rightSign.clicked(mouseX, mouseY)) {
      screen = 'j';
      return;
    } else if (downSign.clicked(mouseX, mouseY)) {
      screen = 'w';
      return;
    }
  }

  // Sign interaction when in forest
  if (screen == 'f') {
    if (downSign.clicked(mouseX, mouseY)) {
      screen = 'r';
      return;
    }
  }

  // Sign interaction when in jungle
  if (screen == 'j') {
    if (leftSign.clicked(mouseX, mouseY)) {
      screen = 'r';
      return;
    }
  }

  // Sign interaction when in waterfall
  if (screen == 'w') {
    if (upSign.clicked(mouseX, mouseY)) {
      screen = 'r';
      return;
    }
  }
  
  
  // Sign interaction when in birdGame
  if (screen == 'b') {
    if (rightBirdSign.clicked(mouseX, mouseY)) {
      screen = 'r';
      return;
    }
  }


  // ------------------- Friend interaction -----------------------
  // Friend interaction based on sanity
  if (friend1.clicked(mouseX, mouseY)) {
    if (sanity > 700) friend1.state = 'n';
    else if (sanity > 400) friend1.state = 'l';
    else friend1.state = 'v';
  }
}
