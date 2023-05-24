
private Board gameBoard;
private int SQUARE_SIZE;

void draw() {
  if (mousePressed && (mouseButton == LEFT)) {
    boolean gameOutcome = gameBoard.clearSpace(mouseX / SQUARE_SIZE, mouseY / SQUARE_SIZE);
    if (!(!gameBoard.done() && gameOutcome)  ) {
      //gameBoard.endScreen(gameOutcome);
    }
  }
  if (mousePressed && (mouseButton == RIGHT)) {
    gameBoard.placeFlag(mouseX / SQUARE_SIZE, mouseY / SQUARE_SIZE);
  }
  background(#BCBABA);
  drawBoard();
}

void setup() {
  gameBoard = new Board();
  size(800, 800);
  SQUARE_SIZE = width/16;
  drawBoard();
}

void drawBoard() {
  int i = 0;
  int ii = 0;
  stroke(0);
  for (int row = 0; row < width; row+= SQUARE_SIZE) {
    ii=0;
    if (ii < gameBoard.gameBoard.length) {
      for (int col = 0; col < height; col += SQUARE_SIZE) {
        Tile place = gameBoard.gameBoard[i][ii];
        if (place.isFlagged()) {
          fill(#EA6050);
          square(row, col, SQUARE_SIZE);
        } else {
          if (place.isCleared() == false) {
            fill(#26C627);
            square(row, col, SQUARE_SIZE);
          } else {
            //fill(#CAD1CA);
            //square(row, col, SQUARE_SIZE);
            textSize(SQUARE_SIZE / (6/5));
            if (place.getSurrounding() != 0) {
              fill(0);
              text(place.getSurrounding(), row-1 + SQUARE_SIZE * (1/5), col-1);
            }
          }
        }
        ii++;
      }
      i++;
    }
  }
}


void endScreen(boolean outcome) {
}
