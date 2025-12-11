// Lunacy Game - Ender Hale, Nico Snow, Forrest Jefferson | Dec 2025

// Global variables
Friend friend;
Fire fire;
Button btnBack, btnHowToPlay, btnPlay, btnPause, btnMenuHowToPlay, btnMenuPause, btnMenuGameOver, btnInventory, btnInventoryBack, btnFriendBack;
Sign sign, leftSign, upSign, rightSign, downSign, rightBirdSign;

// Arraylists
ArrayList<Tree> treesMain = new ArrayList<Tree>();
ArrayList<Tree> treesForest = new ArrayList<Tree>();
ArrayList<Bird> birds = new ArrayList<Bird>();
ArrayList<Wood> woods = new ArrayList<Wood>();


// All-around variables
int sanity;
char screen = 'm';
char prevScreen;

// Accuracy game variables
float targetSize, shrinkingCircle, birdX, birdY;
char requiredKey;
// Keep track of specific bird
Bird selectedBird = null; // Store a blank box for this variable

// Inventory variables
boolean invOpen, invClosing;
float invHeight, invMaxHeight, targetHeight, easing;
int woodCount, meatCount;
char invPrevScreen;

PImage ground;
PImage menu, howToPlay, gameOver, invBG;
PVector crosshair;

void setup() {
  size(500, 500);
  sanity = 0;

  // Inventory
  invOpen = false;
  invClosing = false;
  invMaxHeight = 300;
  invHeight = 0;
  easing = 0.2;
  woodCount = 0;
  meatCount = 0;
  invBG = loadImage("inventoryBG.png");

  // Friend
  friend = new Friend(width/2-60, height/2-40, width/2-80, height/2-15);

  // Buttons
  btnFriendBack = new Button("Back", 220, 125, 55, 40);
  btnInventoryBack = new Button("Back", 220, 125, 55, 40);
  btnInventory = new Button("Inventory", 220, 125, 100, 40);
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



  // Accuracy game variables
  targetSize = 50;
  shrinkingCircle = 200;
  // Set key options for pressing
  final char[] keyOptions = {'a', 's', 'd'};
  requiredKey = keyOptions[int(random(keyOptions.length))];
  birdX = 0; // Placeholder
  birdY = 0; // Placeholder

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
  for (int i = 0; i < 8; i++) {
    treesForest.add(new Tree(230, 230));
  }

  // Wood placement (placeholder)
  for (int i = 0; i < 8; i++) {
    woods.add(new Wood());
  }
}

void draw() {
  // If inventory is opening or closing, draw the previous screen first
  if (screen == 'i') {
    switch(invPrevScreen) {
    case 'r':
      mainRoomScreen();
      break;
    case 'f':
      forestRoomScreen();
      break;
    case 'w':
      waterfallScreen();
      break;
    case 'b':
      birdGame();
      break;
    }
    inventory(); // Draw inventory on top
    // If not, then draw normal screen
  } else {
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
    case 'i':
      inventory();
      break;
    case 'a':
      accuracyGame();
      break;
    case 'd':
      friendDialogueScreen();
      break;
    }
  }
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
  fill(0, 150);
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
  btnInventory.display(width-50, 40);
  btnInventory.clicked(mouseX, mouseY);

  // Display friends
  friend.display();
}

void forestRoomScreen() {
  // Refresh background
  background(0);
  imageMode(CENTER);
  ground.resize(width, height);
  image(ground, width/2, height/2);


  // Display randomized trees
  for (Tree t : treesForest) t.display();

  // Display randomized trees
  for (Wood w : woods) w.display();

  // Display and set clicked area for signs
  downSign.display();
  downSign.clicked(mouseX, mouseY);

  // Display and set clicked area for buttons
  btnPause.display(50, 40);
  btnPause.clicked(mouseX, mouseY);
  btnInventory.display(width-50, 40);
  btnInventory.clicked(mouseX, mouseY);
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
      // Spawn another bird
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
  btnInventory.display(width-50, 40);
  btnInventory.clicked(mouseX, mouseY);
}



void accuracyGame() {
  // Decrease circle by 2 pixels every frame
  shrinkingCircle -= 2;
  // Check for ending mini-game
  if (shrinkingCircle<=0) {
    // Check for failing if they never pressed a key
    if (selectedBird != null) {
      selectedBird.speed = 15; // Speed bird up
    }
    selectedBird = null;
    screen = 'b';
    return;
  }

  // Draw Circles
  pushStyle();
  noFill();
  // Target Circle
  stroke(255);
  ellipse(birdX, birdY, targetSize, targetSize);
  //Shrinking Circle
  stroke(150, 50, 50);
  ellipse(birdX, birdY, shrinkingCircle, shrinkingCircle);

  // Type text to say what key to press
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("Press: " + requiredKey, width/2, height/2 + 100);
  popStyle();

  checkKey();
}



void waterfallScreen() {
  btnInventory.display(width-50, 40);
  btnInventory.clicked(mouseX, mouseY);
}


void friendDialogueScreen() {
  friend.display();
  // Depending on sanity, show friend picture
  if (sanity > 700) friend.state = 'n';
  else if (sanity > 400) friend.state = 'l';
  else friend.state = 'v';
  btnFriendBack.display(width-30, height-30);
  btnFriendBack.clicked(mouseX, mouseY);
}


// -------------------- Forest Tree Randomization --------------------
void randomizeForestTrees() {
  for (Tree t : treesForest) {
    // Randomize placement
    t.update(int(random(width)), int(random(height)));
    // While t.y < 60, update it again
    do {
      t.update(int(random(width)), int(random(height)));
    } while (t.y < 60);
  }
}

// -------------------- Wood Randomization --------------------
void randomizeWood() {
  for (Wood w : woods) {
    // Randomize placement
    w.update(int(random(width)), int(random(height)));
    // While t.y < 60, update it again
    do {
      w.update(int(random(width)), int(random(height)));
    } while (w.y < 60);
  }
}

// -------------------- Check key for accuracy game --------------------
void checkKey() {
  if (!keyPressed) return;
  // Wrong key, speed up bird
  if (key != requiredKey) {
    if (selectedBird != null) {
      selectedBird.speed = 15;
    }
    selectedBird = null;
    screen = 'b';
    return;
  }
  // Float for distance between 2 circles
  float distance = abs(shrinkingCircle - targetSize);

  // Check if any key pressed is the right key
  if (keyPressed && (key == requiredKey)) {
    // Check if success
    if (distance <= 20) {
      // Add meat to inventory
      meatCount ++;

      // Remove specific bird
      if (selectedBird != null) {
        birds.remove(selectedBird);
        selectedBird = null; // Reset selected bird for next game
        // Spawn another bird
        birds.add(new Bird());
      }
      // Reset everything
      selectedBird = null;
      screen = 'b';
    } else {
      // Bad timing, speed up bird
      if (selectedBird != null) {
        selectedBird.speed = 15;
      }
      // Reset everything
      selectedBird = null;
      screen = 'b';
    }
  }
}

// -------------------- Inventory --------------------
void inventory() {

  // Set targetHeight variable
  if (invOpen) {
    targetHeight = invMaxHeight;  // Panel is opening → target is full height
  } else {
    targetHeight = 0;             // Panel is closing → target is zero
  }

  // Moves inventory and eases off until finished
  invHeight += (targetHeight - invHeight) * easing;

  // Only draw if worth it, so no drawing when height is extremely small
  if (invHeight > 0.5) {
    // Draw background panel
    imageMode(CENTER);
    image(invBG, width/2, height/2, width-25, invHeight);

    // Drawn text and counters with shrinking effect
    pushStyle();
    fill(255);
    // Scalefactor float that tells how open the panel is from 0: closed, to 1: fully open
    float scaleFactor = invHeight/ invMaxHeight;
    textSize(60*scaleFactor);
    text("Inventory:", width/2, 200);
    textSize(45*scaleFactor);
    text("Sticks: " + woodCount, 160, 280);
    text("Meat: " + meatCount, 335, 280);
    popStyle();

    // Button to go back to gameplay
    btnInventoryBack.display(width/2, height-100);
    btnInventoryBack.clicked(mouseX, mouseY);
  }

  // When the inventory finishes closing, go to previous screen
  if (invClosing == true && invHeight < 0.5) {
    screen = invPrevScreen;
    invClosing = false;
  }
}
// -------------------- Mouse interaction --------------------
void mousePressed() {
  // Prevent any mouse press from interrupting accuracy game
  if (screen == 'a') return;
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
  } else if ((btnPause.clicked(mouseX, mouseY)) && (screen == 'r' || screen == 'f' || screen == 'w' || screen == 'b')) {
    prevScreen = screen;
    screen = 'u';
    return;
  } else if ((btnInventory.clicked(mouseX, mouseY)) && (screen == 'r' || screen == 'f' || screen == 'w' || screen == 'b')) {
    invPrevScreen = screen;
    invOpen = true;
    invClosing = false;
    screen = 'i';
    return;
  } else if (btnInventoryBack.clicked(mouseX, mouseY) && screen == 'i') {
    invOpen = false;
    invClosing = true;
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
      randomizeWood();
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

    for (int i = woods.size()-1; i>=0; i--) {
      Wood w = woods.get(i);
      if (w.clicked(mouseX, mouseY)) {
        woodCount++;
        woods.remove(i);
        return;
      }
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

  // ------------------- Bird interaction -----------------------
  if (screen == 'b') {
    for (int i = birds.size()-1; i>=0; i--) {
      Bird b = birds.get(i);
      if (b.clicked(mouseX, mouseY)) {
        birdX = b.x;
        birdY = b.y;

        // Keep track of this bird
        selectedBird = b;

        // Start accuracy game
        shrinkingCircle = 150; // Reset shrinkingcircle
        final char[] keyOptions = {'a', 's', 'd'};
        requiredKey = keyOptions[int(random(keyOptions.length))];

        // Change screen to accuracy game
        screen = 'a';
        return;
      }
    }
  }


  // ------------------- Friend interaction -----------------------
  // Friend interaction based on sanity
  if (friend.clicked(mouseX, mouseY) && friend.state == 's' && screen == 'r') {
    screen = 'd';
    return;
  }
  
  if (btnFriendBack.clicked(mouseX, mouseY) && screen == 'd') {
    friend.state = 's';
    screen = 'r';
    return;
  }
}
