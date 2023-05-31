public class Board {
  Tile[][] gameBoard;
  int flagsPlaced, spacesCleared, mineCount;

  public Board(int x, int y, int size) {
    gameBoard = new Tile[size][size];
    flagsPlaced = 0;
    spacesCleared = 0;
    mineCount = 0;
    randomlyClearArea(x, y);
    placeMines();
  }

  void randomlyClearArea(int x, int y) {
    for (int i = 0; i < gameBoard.length; i++) {
      for (int j = 0; j < gameBoard[i].length; j++) {
        gameBoard[i][j] = new Tile();
      }
    }

    int k = -1;
    while (k < 2) {
      int l = -1;
      while (l < 2) {
        if (x+k >= 0 && y+l >= 0 && x+k < 16 && y+l < 16)gameBoard[x+k][y+l].makeDefaultCleared();
        l++;
      }
      k++;
    }
  }


  void placeMines() {
    while (mineCount < gameBoard.length * gameBoard[0].length * 0.16) {
      int x = (int)(Math.random() * gameBoard.length);
      int y = (int)(Math.random() * gameBoard[0].length);
      if (!gameBoard[x][y].getDefaultCleared()) {
        if (gameBoard[x][y].setType()) {
          if (x - 1 >= 0 && y - 1 >= 0) {
            gameBoard[x-1][y-1].addSurrounding();
          }
          if (x - 1 >= 0) {
            gameBoard[x-1][y].addSurrounding();
          }
          if (x - 1 >= 0 && y + 1 < gameBoard[x].length) {
            gameBoard[x-1][y+1].addSurrounding();
          }
          if (y - 1 >= 0) {
            gameBoard[x][y-1].addSurrounding();
          }
          if (y + 1 < gameBoard[x].length) {
            gameBoard[x][y+1].addSurrounding();
          }
          if (x + 1 < gameBoard.length && y - 1 >= 0) {
            gameBoard[x+1][y-1].addSurrounding();
          }
          if (x + 1 < gameBoard.length) {
            gameBoard[x+1][y].addSurrounding();
          }
          if (x + 1 < gameBoard.length && y + 1 < gameBoard[x].length) {
            gameBoard[x+1][y+1].addSurrounding();
          }
          mineCount++;
        }
      }
    }
  }

  boolean done() {
    return spacesCleared >= gameBoard.length * gameBoard[0].length - mineCount;
  }

  boolean clearSpace(int x, int y) {
    if (!gameBoard[x][y].isMine() && !gameBoard[x][y].cleared() && !gameBoard[x][y].flagged()) {
      gameBoard[x][y].toClear();
      spacesCleared++;
    }
    return !gameBoard[x][y].isMine() || gameBoard[x][y].flagged();
  }

  void placeFlag(int x, int y) {
    if (!gameBoard[x][y].cleared()) {
      if (!gameBoard[x][y].flagged()) {
        gameBoard[x][y].setFlagged(true);
        flagsPlaced++;
      } else {
        gameBoard[x][y].setFlagged(false);
        flagsPlaced--;
      }
    }
  }
}
