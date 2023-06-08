private Board gameBoard;
private int SQUARE_SIZE, countdown, countdownHelpScreen, countdownDifficultyScreen, timer, frameCountExplosion;
private String difficulty;
private boolean isGameOver, isHelpScreen, isDifficultyScreen, foundNearest, isNearestDisplayed;
private final color[] colors = {#363AE8, #107109, #E0194E, #C640C0, #ACAF65, #67F9FF, #B7BEBF, #FA9223};
private final int[] easyBestTimes = {-1, -1, -1, };
private final int[] mediumBestTimes = {-1, -1, -1, };
private final int[] hardBestTimes = {-1, -1, -1, };
private int[] explosionArr, findNearestArr;
Controller keyboardInput;



void keyReleased() {
  keyboardInput.release(keyCode);
  if(findNearestArr[0]!=-1){
     drawTile(findNearestArr[0] * SQUARE_SIZE, findNearestArr[1] * SQUARE_SIZE + 50);
     isNearestDisplayed = false;
  }
}

void setup() {
  keyboardInput = new Controller();
  findNearestArr = new int[]{-1, -1};

  size(800, 850);
  isGameOver = true;

  // game defaults to medium difficulty
  difficulty = "medium";
  SQUARE_SIZE = width/16;

  drawBoard();
}

void drawBoard() {
  background(200);

  // hamburger button
  noStroke();
  fill(255);
  rect(7, 22, 25, 3, 5);
  rect(7, 30, 25, 3, 5);
  rect(7, 38, 25, 3, 5);
  stroke(0);

  // difficulty selector
  noStroke();
  fill(220);
  rect(50, 20, 125, 24, 5);
  fill(0);
  textSize(20);
  textAlign(LEFT);
  text(difficulty, 65, 38);
  fill(150);
  triangle(170, 25, 150, 25, 160, 40);

  // best time settings
  //textAlign(LEFT);
  textSize(30);
  fill(0);
  if (difficulty.equals("easy")) {
    text("Best Time : "+bestTime(easyBestTimes[0]), 600, 40);
  }
  if (difficulty.equals("medium")) {
    text("Best Time : "+bestTime(mediumBestTimes[0]), 600, 40);
  }
  if (difficulty.equals("hard")) {
    text("Best Time : "+bestTime(hardBestTimes[0]), 600, 40);
  }

  // flagsLeft settings
  fill(200);
  textSize(30);
  fill(0);
  if (difficulty.equals("easy")) {
    text("10", 490, 40);
  }
  if (difficulty.equals("medium")) {
    text("40", 490, 40);
  }
  if (difficulty.equals("hard")) {
    text("64", 490, 40);
  }
  stroke(0);
  rect(520, 45, 25, 5);
  rect(530, 15, 5, 30);
  fill(#CE3636);
  triangle(530, 15, 530, 30, 555, 22.5);

  // board drawing
  stroke(0);
  for (int row = 0; row < width; row += SQUARE_SIZE) {
    for (int col = 50; col < height; col += SQUARE_SIZE) {
      if ((row/SQUARE_SIZE % 2 == 0 && (col-50)/SQUARE_SIZE % 2 == 0) || (row/SQUARE_SIZE % 2 != 0 && (col-50)/SQUARE_SIZE % 2 != 0)) {
        fill(#26C627);
      } else {
        fill(#23B419);
      }
      square(row, col, SQUARE_SIZE);
    }
  }
}

void removeHelpScreen() {
  if (gameBoard == null) {
    stroke(0);
    for (int row = 0; row < 400; row += SQUARE_SIZE) {
      for (int col = 50; col < 450; col += SQUARE_SIZE) {
        if ((row/SQUARE_SIZE % 2 == 0 && (col-50)/SQUARE_SIZE % 2 == 0) || (row/SQUARE_SIZE % 2 != 0 && (col-50)/SQUARE_SIZE % 2 != 0)) {
          fill(#26C627);
        } else {
          fill(#23B419);
        }
        square(row, col, SQUARE_SIZE);
      }
    }
  } else {
    for (int row = 0; row < 400; row += SQUARE_SIZE) {
      for (int col = 50; col < 450; col += SQUARE_SIZE) {
        if (gameBoard.gameBoard[row/SQUARE_SIZE][(col-50)/SQUARE_SIZE].flagged()) {
          if ((row/SQUARE_SIZE % 2 == 0 && (col-50)/SQUARE_SIZE % 2 == 0) || (row/SQUARE_SIZE % 2 != 0 && (col-50)/SQUARE_SIZE % 2 != 0)) {
            fill(#26C627);
          } else {
            fill(#23B419);
          }
          square(row, col, SQUARE_SIZE);
        }
        drawTile(row, col);
      }
    }
  }
  isHelpScreen = false;
}

void removeDifficultyScreen() {

  noStroke();
  fill(200);
  rect(50, 20, 130, 30);
  fill(220);
  rect(50, 20, 125, 24, 5);
  fill(0);
  textSize(20);
  text(difficulty, 65, 38);
  fill(150);
  triangle(170, 25, 150, 25, 160, 40);

  stroke(0);
  if (gameBoard == null) {
    for (int row = 0; row < 200; row += SQUARE_SIZE) {
      for (int col = 50; col < 150; col += SQUARE_SIZE) {
        if ((row/SQUARE_SIZE % 2 == 0 && (col-50)/SQUARE_SIZE % 2 == 0) || (row/SQUARE_SIZE % 2 != 0 && (col-50)/SQUARE_SIZE % 2 != 0)) {
          fill(#26C627);
        } else {
          fill(#23B419);
        }
        square(row, col, SQUARE_SIZE);
      }
    }
  } else {
    for (int row = 0; row < 200; row += SQUARE_SIZE) {
      for (int col = 50; col < 150; col += SQUARE_SIZE) {
        if (gameBoard.gameBoard[row/SQUARE_SIZE][(col-50)/SQUARE_SIZE].flagged()) {
          if ((row/SQUARE_SIZE % 2 == 0 && (col-50)/SQUARE_SIZE % 2 == 0) || (row/SQUARE_SIZE % 2 != 0 && (col-50)/SQUARE_SIZE % 2 != 0)) {
            fill(#26C627);
          } else {
            fill(#23B419);
          }
          square(row, col, SQUARE_SIZE);
        }
        drawTile(row, col);
      }
    }
  }
  isDifficultyScreen = false;
}

String bestTime(int time) {
  if (time < 0)return "--";
  return ""+time;
}

void explosion(int value) {
  int row = explosionArr[0];
  int col = explosionArr[1];

  fill(#FF150D, 0);
  stroke(#FF150D);
  strokeWeight(0.8);

  if (difficulty == "easy")circle(row+SQUARE_SIZE/2, col+SQUARE_SIZE/2 - 5, SQUARE_SIZE*.6 + value*15);
  if (difficulty == "medium")circle(row+SQUARE_SIZE/2, col+SQUARE_SIZE/2 - 5, SQUARE_SIZE*.6 + value*9);
  if (difficulty == "hard")circle(row+SQUARE_SIZE/2, col+SQUARE_SIZE/2 - 5, SQUARE_SIZE*.6 + value*7);

  stroke(0);
}

void changeDifficulty(String d) {
  difficulty = d;
  if (difficulty.equals("easy")) {
    SQUARE_SIZE = width/8;
  }
  if (difficulty.equals("medium")) {
    SQUARE_SIZE = width/16;
  }
  if (difficulty.equals("hard")) {
    SQUARE_SIZE = width/20;
  }

  gameBoard = null;
  drawBoard();
  isGameOver = true;
  timer = 0;
}

void draw() {

  if (explosionArr!=null) {
    if (frameCountExplosion == 0) {
      frameCountExplosion = frameCount;
    }
    if (frameCount - frameCountExplosion < 10) {
      explosion( frameCount - frameCountExplosion );
    } else {
      frameCountExplosion = 0;
      explosionArr = null;
    }
  }

  if (countdownHelpScreen>0)countdownHelpScreen--;
  if (countdownDifficultyScreen>0)countdownDifficultyScreen--;

  // difficulty change
  if (mousePressed && mouseButton == LEFT && mouseX >= 50 && mouseX <= 175 && mouseY >= 20 && mouseY <= 44 && countdownDifficultyScreen == 0 && get(2, 2) != -16777216 ) {


    if (isHelpScreen) {
      removeHelpScreen();
    }

    if (isDifficultyScreen) {
      removeDifficultyScreen();
    } else {

      stroke(0);
      fill(220);
      rect(50, 44, 125, 72, 5);
      noStroke();
      fill(0);
      textSize(20);
      textAlign(LEFT);
      text("easy", 65, 62);
      text("medium", 65, 86);
      text("hard", 65, 110);
      if (difficulty.equals("easy")) {
        text("X", 155, 62);
      }
      if (difficulty.equals("medium")) {
        text("X", 155, 86);
      }
      if (difficulty.equals("hard")) {
        text("X", 155, 110);
      }

      isDifficultyScreen = true;
    }
    countdownDifficultyScreen += 10;
  }

  if (mousePressed && mouseButton == LEFT && mouseX >= 50 && mouseX <= 175 && mouseY >= 44 && mouseY <= 116 && isDifficultyScreen && countdownDifficultyScreen == 0) {
    if (mouseY <= 62) {
      changeDifficulty("easy");
    } else if (mouseY <= 86) {
      changeDifficulty("medium");
    } else {
      changeDifficulty("hard");
    }
    isDifficultyScreen = false;
    countdownDifficultyScreen += 10;
  }


  // clicking on the hamburger button
  if (mousePressed && mouseButton == LEFT && mouseY >= 22 && mouseY <= 41 && mouseX >= 7 && mouseX <= 32 && countdownHelpScreen == 0  && get(2, 2) != -16777216 /*black*/ ) {

    if (isDifficultyScreen) {
      removeDifficultyScreen();
    }

    if (isHelpScreen) {
      removeHelpScreen();
    }

    // opening help screen
    else {
      isHelpScreen = true;
      fill(200);
      rect(0, 50, 400, 400);
      fill(0);

      // INSTRUCTIONS
      textAlign(LEFT);
      textSize(25);
      text("INSTRUCTIONS:", 5, 55+25);
      textSize(15);
      textLeading(20);
      text("Start the game by clicking any space on the map to initially carve out a board. Each Tile on the board is either a mine or not. If it isn't, it will display the number of mines it touches (if it touches no mines, nothing is displayed). The objective of the game is for players to uncover all Tiles that do not contain a mine while avoiding (or marking) all the mines by utilizing the clues provided by the numbers in the Tiles.\n\nLeft click to clear a Tile. Right click to place a flag, or to remove one.",
        5, 55+30, 400-10, 400-10);


      //PERSONAL BESTS
      textSize(25);
      text("PERSONAL BESTS:", 5, 270+45);
      textSize(20);
      text("EASY:", 5, 270+70);
      textSize(15);
      text("1:  " + bestTime(easyBestTimes[0])+"\n"+
        "2:  " + bestTime(easyBestTimes[1])+"\n"+
        "3:  " + bestTime(easyBestTimes[2])
        , 5, 270+90);
      textSize(20);
      text("MEDM:", 100, 270+70);
      textSize(15);
      text("1:  " + bestTime(mediumBestTimes[0])+"\n"+
        "2:  " + bestTime(mediumBestTimes[1])+"\n"+
        "3:  " + bestTime(mediumBestTimes[2])
        , 100, 270+90);
      textSize(20);
      text("HARD:", 200, 270+70);
      textSize(15);
      text("1:  " + bestTime(hardBestTimes[0])+"\n"+
        "2:  " + bestTime(hardBestTimes[1])+"\n"+
        "3:  " + bestTime(hardBestTimes[2])
        , 200, 270+90);
      //textAlign(CENTER);
    }
    countdownHelpScreen+=15;
  }


  // clicking on the board when the help screen is displayed removes the help screen
  if (mousePressed && isHelpScreen && mouseY >= 50  && !(mouseX <= 400 && mouseY >= 50 && mouseY <= 450) ) {
    removeHelpScreen();
  }

  if (isGameOver) {
    if (mousePressed && (mouseButton == LEFT)) {

      // game one
      if (gameBoard == null && mouseY > 50) {
        if ((!isHelpScreen  || !(mouseX <= 400 && mouseY >= 50 && mouseY <= 450)) && !isDifficultyScreen && countdownDifficultyScreen == 0) {
          gameBoard = new Board(mouseX / SQUARE_SIZE, (mouseY-50) / SQUARE_SIZE, width/SQUARE_SIZE);
          isGameOver = false;
        }
      }

      // game n, n>1
      else {
        if (mouseX >= width/2 - 75 && mouseX <= width/2 + 75 && mouseY >= 0 && mouseY < 50) {
          background(#cccccc);
          drawBoard();
          gameBoard = null;
          timer = 0;
        }
      }
    }
  } else {
  
    
    // if the player needs HELP!! HELP MEEE!!
    
   
    
    if (keyboardInput.isPressed(Controller.P1_LEFT)) {
      
      if (!foundNearest && !isNearestDisplayed && !gameBoard.gameBoard[mouseX / SQUARE_SIZE][(mouseY-50)/ SQUARE_SIZE].cleared() && !gameBoard.gameBoard[mouseX / SQUARE_SIZE][(mouseY-50)/ SQUARE_SIZE].flagged()) {
        
        boolean res = findNearest(mouseX, mouseY);
        //println(res);
        if(res){
          //println(""+findNearestArr[0]+" "+findNearestArr[1]);
          fill(#5C70DE);
          circle(findNearestArr[0]*SQUARE_SIZE+SQUARE_SIZE/2, findNearestArr[1]*SQUARE_SIZE+50+SQUARE_SIZE/2,20);
          fill(0);
          isNearestDisplayed = true;
        }
        foundNearest = true;
      }
    }

    // countdown used as a timer for placing flags
    if (countdown > 0)countdown--;

    if (frameCount % 60 == 0 ) {
      textAlign(CENTER);
      fill(200);
      noStroke();
      rect(320, 5, 60, 40);
      textSize(30);
      fill(0);
      text(timer, 350, 40);
      timer++;
      stroke(0);
    }

    // the mouse click registers when either the help box is not displayed or if the click is outside the help screen
    if ((mousePressed && (!isHelpScreen|| !(mouseX <= 400 && mouseY >= 50 && mouseY <= 450))) && !isDifficultyScreen) {
      int row = mouseX / SQUARE_SIZE;
      int col = (mouseY-50) / SQUARE_SIZE;
      int x = row*SQUARE_SIZE;
      int y = col*SQUARE_SIZE+50;

      // left click == clear space
      if (mouseButton == LEFT) {

        // this condition prevents index out of bounds errors
        if (mouseX < 800 && mouseX >= 0 && mouseY < 850 && mouseY >= 50) {
          boolean gameOutcome = gameBoard.clearSpace(row, col);
          if (gameOutcome) {
            drawTile(x, y);
          }

          // the game ends when either the game is complete (gameOutcome == true) or a player clears a mine (gameOutcome == false)
          if (gameBoard.done() || !gameOutcome) {

            // if the player wins the game, a bestTime is calculated
            if (gameOutcome) {
              if (difficulty.equals("easy")) {

                // check to see if the timer cracks the top three best times...
                for (int i = 0; i < 3; i++) {

                  if (timer < easyBestTimes[i] || easyBestTimes[i]==-1) {

                    // ...and if it does, move the values slower than it to the lower places in the list
                    for (int j = 2; j > i; j--) {
                      easyBestTimes[j]=easyBestTimes[j-1];
                    }
                    easyBestTimes[i] = timer;
                    i+=100;
                  }
                }
              }

              if (difficulty.equals("medium")) {
                for (int i = 0; i < 3; i++) {

                  if (timer < mediumBestTimes[i] || mediumBestTimes[i]==-1) {
                    for (int j = 2; j > i; j--) {
                      mediumBestTimes[j]=mediumBestTimes[j-1];
                    }
                    mediumBestTimes[i] = timer;
                    i+=100;
                  }
                }
              }

              if (difficulty.equals("hard")) {
                for (int i = 0; i < 3; i++) {

                  if (timer < hardBestTimes[i] || hardBestTimes[i]==-1) {
                    for (int j = 2; j > i; j--) {
                      hardBestTimes[j]=hardBestTimes[j-1];
                    }
                    hardBestTimes[i] = timer;
                    i+=100;
                  }
                }
              }
            }

            if (!gameOutcome) {
              explosionArr = new int[]{x, y};
            }

            endScreen(gameOutcome);
          }
        }
      }

      // right click == place flag
      else if (mouseButton == RIGHT) {

        // this condition prevents index out of bounds error and checks countdown
        if (mouseX < 800 && mouseX >= 0 && mouseY < 850 && mouseY >= 50 && countdown == 0) {

          gameBoard.placeFlag(row, col);
          drawTile(x, y);
          countdown+=10;
          fill(200);
          noStroke();
          rect(480, 5, 50, 40);
          textSize(30);
          fill(0);
          textAlign(LEFT);
          text(gameBoard.getFlagsLeft(), 490, 40);
          stroke(0);
          rect(520, 45, 25, 5);
          rect(530, 15, 5, 30);
          fill(#CE3636);
          triangle(530, 15, 530, 30, 555, 22.5);
        }
      }
    }
  }
}

boolean findNearest( int row, int col) {
  int x = row/SQUARE_SIZE;
  int y = (col-50)/SQUARE_SIZE;

  int i = 1;
  while ( i <= x || i <= y || i < gameBoard.gameBoard.length - x || i < gameBoard.gameBoard[0].length - y) {
    if ( !foundNearest && x-i >= 0 ) {
      if (gameBoard.gameBoard[x-i][y].isMine() && !gameBoard.gameBoard[x-i][y].cleared() && !gameBoard.gameBoard[x-i][y].flagged()) {
        findNearestArr = new int[]{x-i, y};
        foundNearest = true;
      }
    }
    if (!foundNearest && y-i >= 0 ) {
      if (gameBoard.gameBoard[x][y-i].isMine() && !gameBoard.gameBoard[x][y-i].cleared() && !gameBoard.gameBoard[x][y-i].flagged()) {
        findNearestArr = new int[]{x, y-i};
        foundNearest = true;
      }
    }
    if (!foundNearest &&  y+i < gameBoard.gameBoard.length ) {
      if (gameBoard.gameBoard[x][y+i].isMine() && !gameBoard.gameBoard[x][y+i].cleared() && !gameBoard.gameBoard[x][y+i].flagged()) {
        findNearestArr = new int[]{x, y+i};
        foundNearest = true;
      }
    }
    if (!foundNearest &&  x+i < gameBoard.gameBoard.length ) {
      if (gameBoard.gameBoard[x+i][y].isMine() && !gameBoard.gameBoard[x+i][y].cleared() && !gameBoard.gameBoard[x+i][y].flagged()) {
        findNearestArr = new int[]{x+i, y};
        foundNearest = true;
      }
    }
    if (!foundNearest &&  x+i < gameBoard.gameBoard.length && y-i >= 0 ) {
      if (gameBoard.gameBoard[x+i][y-i].isMine() && !gameBoard.gameBoard[x+i][y-i].cleared() && !gameBoard.gameBoard[x+i][y-i].flagged()) {
        findNearestArr = new int[]{x+i, y-1};
        foundNearest = true;
      }
    }
    if (!foundNearest &&  x-i >=0 && y-i >= 0 ) {
      if (gameBoard.gameBoard[x-i][y-i].isMine() && !gameBoard.gameBoard[x-i][y-i].cleared() && !gameBoard.gameBoard[x-i][y-i].flagged()) {
        findNearestArr = new int[]{x-i, y-1};
        foundNearest = true;
      }
    }
    if (!foundNearest &&  x-i >=0 && y+i < gameBoard.gameBoard.length ) {
      if (gameBoard.gameBoard[x-i][y+i].isMine() && !gameBoard.gameBoard[x-i][y+i].cleared() && !gameBoard.gameBoard[x-i][y+i].flagged()) {
        findNearestArr = new int[]{x-i, y+1};
        foundNearest = true;
      }
    }
    if (!foundNearest &&  x+i < gameBoard.gameBoard.length && y+i < gameBoard.gameBoard.length ) {
      if (gameBoard.gameBoard[x+i][y+i].isMine() && !gameBoard.gameBoard[x+i][y+i].cleared() && !gameBoard.gameBoard[x+i][y+i].flagged()) {
        findNearestArr = new int[]{x+i, y+1};
        foundNearest = true;
      }
    }
    if (foundNearest)i+=100;
    i++;
  }
  return foundNearest;
}

void drawTile(int row, int col) {
  Tile t = gameBoard.gameBoard[row / SQUARE_SIZE][(col-50) / SQUARE_SIZE];

  // if the space has been cleared, a cleared tile is drawn
  if (t.cleared()) {
    fill(#CAD1CA);
    square(row, col, SQUARE_SIZE);
    textSize(SQUARE_SIZE / (6/5));
    textAlign(CENTER);

    // if the space that has been cleared has surrounding mines, display the number of mines it touches
    if (t.getSurrounding() != 0) {
      fill(colors[t.getSurrounding() - 1]);
      text(t.getSurrounding(), row + SQUARE_SIZE * 0.5, col + SQUARE_SIZE * 0.8);
    }

    // if the space that has been cleared has no surrounding mines, the tiles that surround it are recursively cleared
    else {
      int x = row / SQUARE_SIZE;
      int y = (col-50) / SQUARE_SIZE;
      if (x - 1 >= 0 && !gameBoard.gameBoard[x-1][y].cleared()) {
        gameBoard.clearSpace(x-1, y);
        drawTile(row - SQUARE_SIZE, col);
      }
      if (x + 1 < gameBoard.gameBoard.length && !gameBoard.gameBoard[x+1][y].cleared()) {
        gameBoard.clearSpace(x+1, y);
        drawTile(row + SQUARE_SIZE, col);
      }
      if (y - 1 >= 0 && !gameBoard.gameBoard[x][y-1].cleared()) {
        gameBoard.clearSpace(x, y-1);
        drawTile(row, col - SQUARE_SIZE);
      }
      if (y + 1 < gameBoard.gameBoard[0].length && !gameBoard.gameBoard[x][y+1].cleared()) {
        gameBoard.clearSpace(x, y+1);
        drawTile(row, col + SQUARE_SIZE);
      }
      if (y + 1 < gameBoard.gameBoard[0].length && x + 1 < gameBoard.gameBoard.length && !gameBoard.gameBoard[x+1][y+1].cleared()) {
        gameBoard.clearSpace(x+1, y+1);
        drawTile(row + SQUARE_SIZE, col + SQUARE_SIZE);
      }
      if (y - 1 >= 0 && x + 1 < gameBoard.gameBoard.length && !gameBoard.gameBoard[x+1][y-1].cleared()) {
        gameBoard.clearSpace(x+1, y-1);
        drawTile(row + SQUARE_SIZE, col - SQUARE_SIZE);
      }
      if (y - 1 >= 0 && x - 1 >= 0 && !gameBoard.gameBoard[x-1][y-1].cleared()) {
        gameBoard.clearSpace(x-1, y-1);
        drawTile(row - SQUARE_SIZE, col - SQUARE_SIZE);
      }
      if (y + 1 < gameBoard.gameBoard[0].length && x - 1 >= 0 && !gameBoard.gameBoard[x-1][y+1].cleared()) {
        gameBoard.clearSpace(x-1, y+1);
        drawTile(row - SQUARE_SIZE, col + SQUARE_SIZE);
      }
    }
  }

  // if the space is not cleared, then the method was called because the space has either been flagged or unflagged
  else {

    // if the space was flagged, a flag is drawn
    if (t.flagged()) {
      fill(#000000);
      rect(row + (SQUARE_SIZE / 6), col + (SQUARE_SIZE - SQUARE_SIZE / 10), SQUARE_SIZE - 2 * (SQUARE_SIZE / 6), SQUARE_SIZE / 10);
      rect(row + (SQUARE_SIZE / 4), col + (SQUARE_SIZE - SQUARE_SIZE / 5), SQUARE_SIZE - 2 * (SQUARE_SIZE / 4), SQUARE_SIZE / 10);
      rect(row + 9 * SQUARE_SIZE / 20, col + SQUARE_SIZE / 5, SQUARE_SIZE / 10, 3 * SQUARE_SIZE / 5);
      fill(#CE3636);
      triangle(row + 9 * SQUARE_SIZE / 20, col + SQUARE_SIZE / 5, row + 9 * SQUARE_SIZE / 20, col + SQUARE_SIZE / 2, row + 9 * SQUARE_SIZE / 10, col + 7 * SQUARE_SIZE / 20);
    }

    // if the space is unflagged, the flag is removed
    else {
      if ((row/SQUARE_SIZE % 2 == 0 && (col-50)/SQUARE_SIZE % 2 == 0) || (row/SQUARE_SIZE % 2 != 0 && (col-50)/SQUARE_SIZE % 2 != 0)) {
        fill(#26C627);
      } else {
        fill(#23B419);
      }
      square(row, col, SQUARE_SIZE);
    }
  }
}

void endScreen(boolean outcome) {
  isGameOver = true;
  textSize(40);
  fill(0);
  rect(0, 0, width, 50);
  //textAlign(CENTER);
  fill(#FFFFFF);

  // displays winner or loser depending on game outcome
  if (outcome) {
    text("time : "+timer, 150, 40);
    text("winner !", 625, 40);
  } else {
    text("loser !", 625, 40);

    int sizeOfText = 1;
    if (difficulty.equals("easy")) {
      sizeOfText = 30;
      textSize(sizeOfText);
    } else if (difficulty.equals("medium")) {
      sizeOfText = 18;
      textSize(sizeOfText);
    } else if (difficulty.equals("hard")) {
      sizeOfText = 14;
      textSize(sizeOfText);
    }


    textAlign(CENTER);
    // displays all of the mines on the board that have not been flagged
    for (int i = 0; i < gameBoard.gameBoard.length; i++) {
      for (int j = 0; j < gameBoard.gameBoard[0].length; j++) {
        Tile t = gameBoard.gameBoard[i][j];
        if (t.isMine() && !t.flagged()) {
          fill(0);
          text("mine", (i*SQUARE_SIZE)+SQUARE_SIZE/2, (j*SQUARE_SIZE)+SQUARE_SIZE+50-SQUARE_SIZE*(1/15));
          fill(#E81E1E);
          circle((i*SQUARE_SIZE)+SQUARE_SIZE/2, (j*SQUARE_SIZE)+50+SQUARE_SIZE/2 - 5, SQUARE_SIZE*.6);
        }

        // removing misplaced flags
        if (t.flagged() && !t.isMine()) {
          t.setFlagged(false);
          drawTile(i*SQUARE_SIZE, j*SQUARE_SIZE+50);
          fill(#FA2C03);
          textSize(SQUARE_SIZE*2);
          text("x", i*SQUARE_SIZE+SQUARE_SIZE/2, j*SQUARE_SIZE+50+SQUARE_SIZE);

          // reset text size
          textSize(sizeOfText);
        }
      }
    }
  }

  // play again button
  //textAlign(CENTER);
  fill(#B9BCF7);
  rect(width/2-75, 0, 150, 50);
  textSize(30);
  fill(0);
  text("play again", width/2, 35);
}

void keyPressed() {

  if(keyCode == 'H'){
    foundNearest = false;
  keyboardInput.press(keyCode);
  }


  if (!isGameOver) {

    // press 'w' for automatic win
    if (key == 'w') {
      if (isHelpScreen)removeHelpScreen();
      for (int i = 0; i < gameBoard.gameBoard.length; i++) {
        for (int j = 0; j < gameBoard.gameBoard[0].length; j++) {
          Tile t = gameBoard.gameBoard[i][j];
          if (!t.isMine() && !t.cleared()) {
            if (t.flagged())t.setFlagged(false);
            t.toClear();
            drawTile(i*SQUARE_SIZE, j*SQUARE_SIZE+50);
          }
        }
      }

      if (difficulty.equals("easy")) {
        for (int i = 0; i < 3; i++) {

          if (timer < easyBestTimes[i] || easyBestTimes[i]==-1) {
            for (int j = 2; j > i; j--) {
              easyBestTimes[j]=easyBestTimes[j-1];
            }
            easyBestTimes[i] = timer;
            i+=100;
          }
        }
      }

      if (difficulty.equals("medium")) {
        for (int i = 0; i < 3; i++) {

          if (timer < mediumBestTimes[i] || mediumBestTimes[i]==-1) {
            for (int j = 2; j > i; j--) {
              mediumBestTimes[j]=mediumBestTimes[j-1];
            }
            mediumBestTimes[i] = timer;
            i+=100;
          }
        }
      }

      if (difficulty.equals("hard")) {
        for (int i = 0; i < 3; i++) {

          if (timer < hardBestTimes[i] || hardBestTimes[i]==-1) {
            for (int j = 2; j > i; j--) {
              hardBestTimes[j]=hardBestTimes[j-1];
            }
            hardBestTimes[i] = timer;
            i+=100;
          }
        }
      }

      endScreen(true);
    }
  }
}
