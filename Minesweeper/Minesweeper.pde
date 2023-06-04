private Board gameBoard;
private int SQUARE_SIZE, countdown, countdownHelpScreen, timer, easyBestTime, mediumBestTime, hardBestTime;
private String difficulty;
private boolean isGameOver, isHelpScreen;
private final color[] colors = {#363AE8, #107109, #E0194E, #C640C0, #ACAF65, #67F9FF, #B7BEBF, #FA9223};

void setup() {
  size(800, 850);
  isGameOver = true;

  // game defaults to medium difficulty
  difficulty = "medium";
  SQUARE_SIZE = width/16;

  easyBestTime = -1;
  mediumBestTime = -1;
  hardBestTime = -1;

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

  // best time settings
  textAlign(LEFT);
  textSize(40);
  fill(0);
  if (difficulty.equals("easy")) {
    if (easyBestTime == -1) {
      text("Best Time : --", 50, 40);
    } else {
      text("Best Time : "+easyBestTime, 50, 40);
    }
  }
  if (difficulty.equals("medium")) {
    if (mediumBestTime == -1) {
      text("Best Time : --", 50, 40);
    } else {
      text("Best Time : "+mediumBestTime, 50, 40);
    }
  }
  if (difficulty.equals("hard")) {
    if (hardBestTime == -1) {
      text("Best Time : --", 50, 40);
    } else {
      text("Best Time : "+hardBestTime, 50, 40);
    }
  }

  // difficulty selector
  textSize(40);
  fill(0);
  textAlign(LEFT);
  text("Difficulty : ", 465, 40);
  fill(#76D85C);
  rect(640, 5, 40, 40);
  fill(#EFF063);
  rect(680, 5, 40, 40);
  fill(#F75339);
  rect(720, 5, 40, 40);
  fill(0);
  textAlign(CENTER);
  if (difficulty.equals("easy")) {
    text("X", 660, 40);
  } else if (difficulty.equals("medium")) {
    text("X", 700, 40);
  } else if (difficulty.equals("hard")) {
    text("X", 740, 40);
  }

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
        drawTile(row, col);
      }
    }
  }
  isHelpScreen = false;
}

void draw() {

  if (countdownHelpScreen>0)countdownHelpScreen--;

  // difficulty change
  if (mousePressed && mouseButton == LEFT && mouseY >= 5 && mouseY <= 45) {
    if (mouseX >= 640 && mouseX <= 680) {
      difficulty = "easy";
      SQUARE_SIZE = width/8;
      drawBoard();
      gameBoard = null;
      isGameOver = true;
      timer = 0;
    }
    if (mouseX >= 680 && mouseX <= 720) {
      difficulty = "medium";
      SQUARE_SIZE = width/16;
      drawBoard();
      gameBoard = null;
      isGameOver = true;
      timer = 0;
    }
    if (mouseX >= 720 && mouseX <= 760) {
      difficulty = "hard";
      SQUARE_SIZE = width/20;
      drawBoard();
      gameBoard = null;
      isGameOver = true;
      timer = 0;
    }
  }

  // clicking on the hamburger button
  if (mousePressed && mouseButton == LEFT && mouseY >= 22 && mouseY <= 41 && mouseX >= 7 && mouseX <= 32 && countdownHelpScreen == 0) {

    if (isHelpScreen) {
      removeHelpScreen();
    } else {
      fill(200);
      rect(0, 50, 400, 400);
      fill(0);
      isHelpScreen = true;
    }
    countdownHelpScreen+=15;
  }


  // clicking on the board when the help screen is displayed
  if (mousePressed && isHelpScreen && mouseY >= 50  && !(mouseX <= 400 && mouseY >= 50 && mouseY <= 450) ) {
    removeHelpScreen();
  }




  if (isGameOver) {
    if (mousePressed && (mouseButton == LEFT)) {



      // game one
      if (gameBoard == null && mouseY > 50) {
        if (!isHelpScreen || !(mouseX <= 400 && mouseY >= 50 && mouseY <= 450)) {
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

    // countdown used as a timer for placing flags
    if (countdown > 0)countdown--;

    // timer
    if (frameCount % 60 == 0 && (!isHelpScreen || !(mouseX <= 400 && mouseY >= 50 && mouseY <= 450) || !isGameOver)) {
      fill(200);
      noStroke();
      rect(width/2-50, 5, 100, 40);
      textSize(40);
      fill(0);
      text(timer, width/2, 40);
      timer++;
      stroke(0);
    }

    // the mouse click registers when either the help box is not displayed or if the click is outside the help screen 
    if (mousePressed && (!isHelpScreen || !(mouseX <= 400 && mouseY >= 50 && mouseY <= 450))) {
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
                if (easyBestTime == -1) {
                  easyBestTime = timer;
                } else if (timer < easyBestTime) {
                  easyBestTime = timer;
                }
              }

              if (difficulty.equals("medium")) {
                if (mediumBestTime == -1) {
                  mediumBestTime = timer;
                } else if (timer < mediumBestTime) {
                  mediumBestTime = timer;
                }
              }

              if (difficulty.equals("hard")) {
                if (hardBestTime == -1) {
                  hardBestTime = timer;
                } else if (timer < hardBestTime) {
                  hardBestTime = timer;
                }
              }
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
        }
      }
    }
  }
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
  textAlign(CENTER);
  fill(#FFFFFF);

  // displays winner or loser depending on game outcome
  if (outcome) {
    text("time : "+timer, 150, 40);
    text("winner !", 626, 40);
  } else {
    text("loser !", 625, 40);


    if (difficulty.equals("easy")) {
      textSize(30);
    } else if (difficulty.equals("medium")) {
      textSize(18);
    } else if (difficulty.equals("hard")) {
      textSize(14);
    }

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
      }
    }
  }

  // play again button
  textAlign(CENTER);
  fill(#B9BCF7);
  rect(width/2-75, 0, 150, 50);
  textSize(30);
  fill(0);
  text("play again", width/2, 35);
}

void keyPressed() {
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
        if (easyBestTime == -1) {
          easyBestTime = timer;
        } else if (timer < easyBestTime) {
          easyBestTime = timer;
        }
      }

      if (difficulty.equals("medium")) {
        if (mediumBestTime == -1) {
          mediumBestTime = timer;
        } else if (timer < mediumBestTime) {
          mediumBestTime = timer;
        }
      }

      if (difficulty.equals("hard")) {
        if (hardBestTime == -1) {
          hardBestTime = timer;
        } else if (timer < hardBestTime) {
          hardBestTime = timer;
        }
      }

      endScreen(true);
    }
  }
}
