private Board gameBoard;
private int SQUARE_SIZE;

void draw() {
  if (mousePressed && (mouseButton == LEFT)) {
    int row = mouseX / SQUARE_SIZE;
    int col = mouseY / SQUARE_SIZE;
    int x = row*SQUARE_SIZE;
    int y = col*SQUARE_SIZE;
    boolean gameOutcome = gameBoard.clearSpace(row, col);
    //if (!(!gameBoard.done() && gameOutcome)  ) {
    if (gameBoard.done() || !gameOutcome) {
      //gameBoard.endScreen(gameOutcome);
    }
    if (gameOutcome) {
      drawTile(x, y);
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
        if (place.flagged()) {
          fill(#EA6050);
          square(row, col, SQUARE_SIZE);
        } else {
          if (place.cleared() == false) {
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

void drawTile(int row, int col) {
  Tile place = gameBoard.gameBoard[row / SQUARE_SIZE][col / SQUARE_SIZE];
  
  if(place.cleared()){
    fill(#CAD1CA);
    square(row, col, SQUARE_SIZE);
    textSize(SQUARE_SIZE / (6/5));
    if (place.getSurrounding() != 0) {
      fill(0);
      text(place.getSurrounding(), row-1 + SQUARE_SIZE * (1/5), col-1);
    }
  }
  else{
    if(place.flagged()){
      fill(#EA6050);
      square(row, col, SQUARE_SIZE);
    }
    else{
      fill(#26C627);
      square(row, col, SQUARE_SIZE);
    }
  }
}

//  if (place.flagged()) {
//    fill(#EA6050);
//    square(row, col, SQUARE_SIZE);
//  } else {
//    if (place.cleared() == false) {
//      fill(#26C627);
//      square(row, col, SQUARE_SIZE);
//    } else {
//      fill(#CAD1CA);
//      square(row, col, SQUARE_SIZE);
//      textSize(SQUARE_SIZE / (6/5));
//      if (place.getSurrounding() != 0) {
//        fill(0);
//        text(place.getSurrounding(), row-1 + SQUARE_SIZE * (1/5), col-1);
//      }
//    }
//  }
//}

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
