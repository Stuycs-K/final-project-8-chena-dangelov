private Board gameBoard;
private int SQUARE_SIZE, countdown;
private boolean isGameOver;
public boolean boardGeneratedYet;

void setup() {
  //gameBoard = new Board();
  boardGeneratedYet = false;
  size(800, 800);
  SQUARE_SIZE = width/16;
  countdown = 0;
  isGameOver = false;
  drawBoard();
}

void drawBoard() {
  stroke(0);
  for (int row = 0; row < width; row+= SQUARE_SIZE) {
    for (int col = 0; col < height; col += SQUARE_SIZE) {
      fill(#26C627);
      square(row, col, SQUARE_SIZE);
    }
  }
}

void draw() {
  if (boardGeneratedYet == false) {
    if (mousePressed && (mouseButton == LEFT)) {
      gameBoard = new Board(mouseX / SQUARE_SIZE, mouseY / SQUARE_SIZE);
      boardGeneratedYet = true;
    }
  } else if (!isGameOver) {
    if (countdown > 0)countdown--;
    if (mousePressed) {
      int row = mouseX / SQUARE_SIZE;
      int col = mouseY / SQUARE_SIZE;
      int x = row*SQUARE_SIZE;
      int y = col*SQUARE_SIZE;
      if (mouseButton == LEFT) {
        if (mouseX < 800 && mouseX >= 0 && mouseY < 800 && mouseY >= 0) {
          boolean gameOutcome = gameBoard.clearSpace(row, col);
          if (gameOutcome) {
            drawTile(x, y);
          }
          if (gameBoard.done() || !gameOutcome) {
            endScreen(gameOutcome);
          }
        }
      }
      else if (mouseButton == RIGHT) {
        if (mouseX < 800 && mouseX >= 0 && mouseY < 800 && mouseY >= 0 && countdown == 0) {
          gameBoard.placeFlag(row, col);
          drawTile(x, y);
          countdown+=20;
        }
      }
    }
  }
}

void drawTile(int row, int col) {
  //if(!isGameOver){
  Tile place = gameBoard.gameBoard[row / SQUARE_SIZE][col / SQUARE_SIZE];

  if (place.cleared()) {
    fill(#CAD1CA);
    square(row, col, SQUARE_SIZE);
    textSize(SQUARE_SIZE / (6/5));
    textAlign(CENTER);
    if (place.getSurrounding() != 0) {
      fill(0);
      text(place.getSurrounding(), row + SQUARE_SIZE * 0.5, col + SQUARE_SIZE * 0.8);
    }
    //
    else {
      int x = row / SQUARE_SIZE;
      int y = col / SQUARE_SIZE;
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
  } else {
    if (place.flagged()) {
      fill(#000000);
      rect(row + (SQUARE_SIZE / 6), col + (SQUARE_SIZE - SQUARE_SIZE / 10), SQUARE_SIZE - 2 * (SQUARE_SIZE / 6), SQUARE_SIZE / 10);
      rect(row + (SQUARE_SIZE / 4), col + (SQUARE_SIZE - SQUARE_SIZE / 5), SQUARE_SIZE - 2 * (SQUARE_SIZE / 4), SQUARE_SIZE / 10);
      rect(row + 9 * SQUARE_SIZE / 20, col + SQUARE_SIZE / 5, SQUARE_SIZE / 10, 3 * SQUARE_SIZE / 5);
      fill(#CE3636);
      triangle(row + 9 * SQUARE_SIZE / 20, col + SQUARE_SIZE / 5, row + 9 * SQUARE_SIZE / 20, col + SQUARE_SIZE / 2, row + 9 * SQUARE_SIZE / 10, col + 7 * SQUARE_SIZE / 20);
    } else {
      fill(#26C627);
      square(row, col, SQUARE_SIZE);
    }
  }
}

void endScreen(boolean outcome) {
  isGameOver = true;
  textSize(127);
  background(0);
  textAlign(CENTER);
  fill(#FFFFFF);
  if (outcome) {
    text("winner !", width/2, height/2);
  } else {
    text("loser !", width/2, height/2);
  }
}
