public class Board {
  Tile[][] gameBoard;
  private int flagsPlaced, spacesCleared, mineCount;

  public Board() {
    gameBoard = new Tile[16][16];
    flagsPlaced = 0;
    spacesCleared = 0;
    mineCount = 0;
    placeMines(gameBoard);
  }

  void placeMines(Tile[][] board) {
    for (int x = 0; x < gameBoard.length; x++) {
      for (int y = 0; y < gameBoard[x].length; y++) {
        gameBoard[x][y] = new Tile();
      }
    }

    while (mineCount < 40) {
      int x = (int)(Math.random() * gameBoard.length);
      int y = (int)(Math.random() * gameBoard[0].length);
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

  boolean done() {
    return spacesCleared >= gameBoard.length * gameBoard[0].length - mineCount;
  }

  boolean clearSpace(int x, int y) {
    if (gameBoard[x][y].getType() == false) {
      if (gameBoard[x][y].getCleared() == false) {
        gameBoard[x][y].cleared();
        spacesCleared++;
        return true;
      }
    }
    return false;
  }
  void placeFlag(int x, int y) {
    if (gameBoard[x][y].getCleared() == false) {
      if (gameBoard[x][y].getFlagged() == false) {
        gameBoard[x][y].setFlagged(true);
        flagsPlaced++;
      } else {
        gameBoard[x][y].setFlagged(false);
        flagsPlaced--;
      }
    }
  }
}
