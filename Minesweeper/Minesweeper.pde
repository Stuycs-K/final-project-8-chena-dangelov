private Board gameBoard;
private int SQUARE_SIZE, countdown, timer, bestTime;
private String difficulty;
private boolean isGameOver;
private final color[] colors = {#363AE8, #107109, #E0194E, #C640C0, #363AE8, #67F9FF, #B7BEBF, #FA9223};

void setup() {
  isGameOver = true;
  gameBoard = null;
  size(800, 850);
  // SQUARE_SIZE changes depending on difficulty (implemented later)
  SQUARE_SIZE = width/16;
  bestTime = -1;
  drawBoard();
  print(colors[0]);
}

void drawBoard() {
  //noStroke();
  background(200);

  // best time settings
  textAlign(LEFT);
  textSize(40);
  fill(0);
  if (bestTime == -1) {
    text("Best Time : --", SQUARE_SIZE, 40);
  } else {
    text("Best Time : "+bestTime, SQUARE_SIZE, 40);
  }
  fill(#B9BCF7);

  fill(#76D85C);
  rect(640, 5, 40, 40);
  fill(#EFF063);
  rect(680, 5, 40, 40);
  fill(#F75339);
  rect(720, 5, 40, 40);

  stroke(0);
  for (int row = 0; row < width; row += SQUARE_SIZE) {
    for (int col = 50; col < height; col += SQUARE_SIZE) { // adjustment
      fill(#26C627);
      square(row, col, SQUARE_SIZE);
    }
  }
}

void changeDifficulty(String d) {
  difficulty = d;
}

void draw() {

  if (mousePressed && mouseButton == LEFT && mouseY >= 5 && mouseY <= 45) {
    if (mouseX >= 640 && mouseX <= 680) {
      changeDifficulty("easy");
      SQUARE_SIZE = width/8;
      drawBoard();
      gameBoard = null;
    }
    if (mouseX >= 680 && mouseX <= 720) {
      changeDifficulty("medium");
      SQUARE_SIZE = width/16;
      drawBoard();
      gameBoard = null;
    }
    if (mouseX >= 720 && mouseX <= 760) {
      changeDifficulty("hard");
      SQUARE_SIZE = width/20;
      drawBoard();
      gameBoard = null;
    }
  }






  if (isGameOver) {



    if (keyPressed) {
      if (key == 'e') {
        changeDifficulty("easy");
        SQUARE_SIZE = width/8;
        drawBoard();
        gameBoard = null;
      }
      if (key == 'm') {
        changeDifficulty("medium");
        SQUARE_SIZE = width/16;
        drawBoard();
        gameBoard = null;
      }
      if (key == 'h') {
        changeDifficulty("hard");
        SQUARE_SIZE = width/20;
        drawBoard();
        gameBoard = null;
      }
    }


    if (mousePressed && (mouseButton == LEFT)) {

      // game one
      if (gameBoard == null && mouseY > 50) {
        gameBoard = new Board(mouseX / SQUARE_SIZE, (mouseY-50) / SQUARE_SIZE, width/SQUARE_SIZE); // adjustment
        isGameOver = false;
      }

      // game n, n is an integer other than one
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
    if (frameCount % 60 == 0 ) {
      fill(#cccccc);
      noStroke();
      //rect(width/2-SQUARE_SIZE, 5, SQUARE_SIZE*2, SQUARE_SIZE*4/5);
      rect(width/2-50, 5, 100, 40);
      textSize(40);
      fill(0);
      text(timer, width/2, 40);
      timer++;
      stroke(0);
    }

    if (mousePressed) {
      int row = mouseX / SQUARE_SIZE;
      int col = (mouseY-50) / SQUARE_SIZE; // adjustment
      int x = row*SQUARE_SIZE;
      int y = col*SQUARE_SIZE+50; // adjustment

      // left click == clear space
      if (mouseButton == LEFT) {

        // this condition prevents index out of bounds errors
        if (mouseX < 800 && mouseX >= 0 && mouseY < 850 && mouseY >= 50) { // adjustment
          boolean gameOutcome = gameBoard.clearSpace(row, col);
          if (gameOutcome) {
            drawTile(x, y);
          }

          // the game ends when either the game is complete or a player clears a mine (gameOutcome == false)
          if (gameBoard.done() || !gameOutcome) {

            // if the player wins the game, a bestTime is calculated
            if (gameOutcome) {
              if (bestTime == -1) {
                bestTime = timer;
              } else if (timer < bestTime) {
                bestTime = timer;
              }
            }

            // this part of the code will be changed to have the gameOutcome appear on the top heading instead
            endScreen(gameOutcome);
          }
        }
      }

      // right click == place flag
      else if (mouseButton == RIGHT) {

        // this condition prevents index out of bounds error and checks countdown
        // NOTE : there is an error related to placing flags
        if (mouseX < 800 && mouseX >= 0 && mouseY < 850 && mouseY >= 50 && countdown == 0) { // adjustment
          gameBoard.placeFlag(row, col);
          drawTile(x, y);
          countdown+=10;
        }
      }
    }
  }
}

void drawTile(int row, int col) {
  Tile t = gameBoard.gameBoard[row / SQUARE_SIZE][(col-50) / SQUARE_SIZE]; // adjustment

  // if the space has been cleared, a cleared tile is drawn
  if (t.cleared()) {
    fill(#CAD1CA);
    square(row, col, SQUARE_SIZE);
    textSize(SQUARE_SIZE / (6/5));
    textAlign(CENTER);
    if (t.getSurrounding() != 0) {
      fill(colors[t.getSurrounding() - 1]);
      text(t.getSurrounding(), row + SQUARE_SIZE * 0.5, col + SQUARE_SIZE * 0.8);
    }

    // if the space that has been cleared has no surrounding mines, the tiles that non-diagonally surround it, are recursively cleared
    else {
      int x = row / SQUARE_SIZE;
      int y = (col-50) / SQUARE_SIZE; // adjustment
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
    }
  }

  // if the space is not cleared, then the method was called because... (of what)
  else {

    // if the space was flagged, a flag is drawn
    // Note : a helper method for this might be created in the future
    if (t.flagged()) {
      fill(#000000);
      rect(row + (SQUARE_SIZE / 6), col + (SQUARE_SIZE - SQUARE_SIZE / 10), SQUARE_SIZE - 2 * (SQUARE_SIZE / 6), SQUARE_SIZE / 10);
      rect(row + (SQUARE_SIZE / 4), col + (SQUARE_SIZE - SQUARE_SIZE / 5), SQUARE_SIZE - 2 * (SQUARE_SIZE / 4), SQUARE_SIZE / 10);
      rect(row + 9 * SQUARE_SIZE / 20, col + SQUARE_SIZE / 5, SQUARE_SIZE / 10, 3 * SQUARE_SIZE / 5);
      fill(#CE3636);
      triangle(row + 9 * SQUARE_SIZE / 20, col + SQUARE_SIZE / 5, row + 9 * SQUARE_SIZE / 20, col + SQUARE_SIZE / 2, row + 9 * SQUARE_SIZE / 10, col + 7 * SQUARE_SIZE / 20);
    }

    // when is this ever called ????
    else {
      fill(#26C627);
      square(row, col, SQUARE_SIZE);
    }
  }
}

// endScreen method is temporarily. a loser / winner display on the heading will be implemented in the future
void endScreen(boolean outcome) {
  isGameOver = true;
  textSize(30);
  //<<<<<<< HEAD
  //=======
  fill(0);
  //>>>>>>> 2c5036c588c14044c6125bfcad0bcb81a0826e44
  rect(0, 0, width, 50);
  textAlign(CENTER, CENTER);
  fill(#FFFFFF);
  if (outcome) {
    text("winner ! time: "+timer, width/4, 20);
  } else {
    text("loser !", width/4, 20);
    textSize(15);
    //<<<<<<< HEAD
    //=======
    //    fill(0);
    //>>>>>>> 2c5036c588c14044c6125bfcad0bcb81a0826e44
    for (int i = 0; i < gameBoard.gameBoard.length; i++) {
      for (int j = 0; j < gameBoard.gameBoard[0].length; j++) {
        Tile t = gameBoard.gameBoard[i][j];
        if (t.isMine() && !t.flagged()) {
          //<<<<<<< HEAD
          fill(0);
          text("mine", (i*SQUARE_SIZE)+SQUARE_SIZE/2, (j*SQUARE_SIZE)+SQUARE_SIZE*0.8+50); // adjustment
          //=======
          fill(#E81E1E);
          circle((i*SQUARE_SIZE)+SQUARE_SIZE/2, (j*SQUARE_SIZE)+50+SQUARE_SIZE/2 - 5, SQUARE_SIZE*.6); // adjustment
          //>>>>>>> 2c5036c588c14044c6125bfcad0bcb81a0826e44
        }
      }
    }
  }
  fill(#B9BCF7);
  rect(width/2-75, 0, 150, 50);
  textSize(25);
  fill(0);
  text("play again", width/2, 20);
}

void keyPressed() {
  if (!isGameOver) {
    if (key == 'w') {
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
      if (bestTime == -1) {
        bestTime = timer;
      } else if (timer < bestTime) {
        bestTime = timer;
      }
      endScreen(true);
    }
  }
}
