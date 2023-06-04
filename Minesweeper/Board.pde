public class Board {
  Tile[][] gameBoard;
  int flagsPlaced, spacesCleared, mineCount, flagsLeft;

  public Board(int x, int y, int size) {
    gameBoard = new Tile[size][size];
    randomlyClearArea(x, y);
    placeMines();
    flagsLeft = mineCount;
  }

  // designate the area around where the player clicked to be clear of mines
  void randomlyClearArea(int x, int y) {
    
    // instantiate the tiles in the gameBoard
    for (int i = 0; i < gameBoard.length; i++) {
      for (int j = 0; j < gameBoard[i].length; j++) {
        gameBoard[i][j] = new Tile();
      }
    }
 
    // designates a 3x3 box around the player's click to be clear of mines
    int k = -1;
    while (k < 2) {
      int l = -1;
      while (l < 2) {
        if (x+k >= 0 && y+l >= 0 && x+k < gameBoard.length && y+l < gameBoard[0].length)gameBoard[x+k][y+l].makeDefaultCleared();
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
          
          // add to the surrounding mine counts of all the surrounding tiles
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
    print(mineCount);
  }

  boolean done() {
    return spacesCleared >= gameBoard.length * gameBoard[0].length - mineCount;
  }

  // left click
  boolean clearSpace(int x, int y) {
    if (!gameBoard[x][y].isMine() && !gameBoard[x][y].cleared() && !gameBoard[x][y].flagged()) {
      gameBoard[x][y].toClear();
      spacesCleared++;
    }
    return !gameBoard[x][y].isMine() || gameBoard[x][y].flagged();
  }

  // right click
  void placeFlag(int x, int y) {
    if (!gameBoard[x][y].cleared()) {
      if (!gameBoard[x][y].flagged()) {
        gameBoard[x][y].setFlagged(true);
        flagsPlaced++;
        flagsLeft--;
      } else {
        gameBoard[x][y].setFlagged(false);
        flagsPlaced--;
        flagsLeft++;
      }
    }
  }
  
  int getFlagsLeft(){
    return flagsLeft;
  }
}
