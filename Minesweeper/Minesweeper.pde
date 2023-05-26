private Board gameBoard;
private int SQUARE_SIZE;

void setup() {
  gameBoard = new Board();
  size(800, 800);
  SQUARE_SIZE = width/16;
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
  if (mousePressed && (mouseButton == LEFT)) {
    int row = mouseX / SQUARE_SIZE;
    int col = mouseY / SQUARE_SIZE;
    int x = row*SQUARE_SIZE;
    int y = col*SQUARE_SIZE;
    boolean gameOutcome = gameBoard.clearSpace(row, col);
    if (gameBoard.done() || !gameOutcome) {
      //endScreen(gameOutcome);
    }
    if (gameOutcome) {
      drawTile(x, y);



      //
      //if (gameBoard.gameBoard[row, col].getSurrounding() == 0) {
      //  if (row - 1 >= 0 && !gameBoard.gameBoard[row-1][col].isMine() && gameBoard.gameBoard[row-1][col].getSurrounding() == 0) {
      //    gameBoard.clearSpace(row-1, col);
      //  }
      //  if (col - 1 >= 0 && !gameBoard.gameBoard[row][col-1].isMine() && gameBoard.gameBoard[row][col-1].getSurrounding() == 0) {
      //    gameBoard.clearSpace(x, y-1);
      //  }
      //  if (row + 1 < gameBoard.gameBoard.length && !gameBoard[row+1][col].isMine() && gameBoard[row+1][col].getSurrounding() == 0) {
      //    gameBoard.clearSpace(x+1, y);
      //  }
      //  if (col + 1 < gameBoard.gameBoard[0].length && !gameBoard[x][y+1].isMine() && gameBoard[x][y+1].getSurrounding() == 0) {
      //    gameBoard.clearSpace(x, y+1);
      //  }
      //}
      //
    }
  }

  if (mousePressed && (mouseButton == RIGHT)) {
    int row = mouseX / SQUARE_SIZE;
    int col = mouseY / SQUARE_SIZE;
    int x = row*SQUARE_SIZE;
    int y = col*SQUARE_SIZE;
    gameBoard.placeFlag(row, col);
    drawTile(x, y);
  }
  //background(#BCBABA);
  //drawBoard();
}

void drawTile(int row, int col) {
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
    //  if (x - 1 >= 0 && gameBoard.gameBoard[x-1][y].cleared()) {
    //    drawTile(row - SQUARE_SIZE, col);
    //  }
    //  if (y - 1 >= 0 && gameBoard.gameBoard[x][y-1].cleared()) {
    //    drawTile(row, col - SQUARE_SIZE);
    //  }
    //  if (x + 1 < gameBoard.gameBoard.length && gameBoard.gameBoard[x+1][y].cleared()) {
    //    drawTile(row + SQUARE_SIZE, col);
    //  }
    //  if (y + 1 < gameBoard.gameBoard[x].length && gameBoard.gameBoard[x][y+1].cleared()) {
    //    drawTile(row, col + SQUARE_SIZE);
    //  } else {
      if (x - 1 >= 0 && !gameBoard.gameBoard[x-1][y].isMine() && gameBoard.gameBoard[x-1][y].getSurrounding() == 0 && !gameBoard.gameBoard[x-1][y].cleared()) {
        gameBoard.clearSpace(x-1, y);
        drawTile(row - SQUARE_SIZE, col);
      }
      if (y - 1 >= 0 && !gameBoard.gameBoard[x][y-1].isMine() && gameBoard.gameBoard[x][y-1].getSurrounding() == 0 && !gameBoard.gameBoard[x][y-1].cleared()) {
        gameBoard.clearSpace(x, y-1);
        drawTile(row, col - SQUARE_SIZE);
      }
      if (x + 1 < gameBoard.gameBoard.length && !gameBoard.gameBoard[x+1][y].isMine() && gameBoard.gameBoard[x+1][y].getSurrounding() == 0 && !gameBoard.gameBoard[x+1][y].cleared()) {
        gameBoard.clearSpace(x+1, y);
        drawTile(row + SQUARE_SIZE, col);
      }
      if (y + 1 < gameBoard.gameBoard[0].length && !gameBoard.gameBoard[x][y+1].isMine() && gameBoard.gameBoard[x][y+1].getSurrounding() == 0 && !gameBoard.gameBoard[x][y+1].cleared()) {
        gameBoard.clearSpace(x, y+1);
        drawTile(row, col + SQUARE_SIZE);
      }
      //}
      //
    }
  } else {
    if (place.flagged()) {
      fill(#EA6050);
      square(row, col, SQUARE_SIZE);
    } else {
      fill(#26C627);
      square(row, col, SQUARE_SIZE);
    }
  }
}

void endScreen(boolean outcome) {
  textSize(120);
  background(0);
  textAlign(CENTER);
  if (outcome) {
    text("winner !", width/2, height/2);
  } else {
    text("loser !", width/2, height/2);
  }
}
