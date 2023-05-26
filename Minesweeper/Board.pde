public class Board {
  Tile[][] gameBoard;
  int flagsPlaced, spacesCleared, mineCount;

  public Board(int x, int y) {
    gameBoard = new Tile[16][16];
    flagsPlaced = 0;
    spacesCleared = 0;
    mineCount = 0;
    randomlyClearArea(x,y);
    placeMines();
    
    
  }
  
  void randomlyClearArea(int x, int y){
    for (int i = 0; i < gameBoard.length; i++) {
      for (int j = 0; j < gameBoard[i].length; j++) {
        gameBoard[i][j] = new Tile();
      }
    }
    
    int k = -1;
    
    
    while(k < 2){
      int l = -1;
      while(l < 2){
        if(x+k >= 0 && y+l >= 0 && x+k < gameBoard.length && y+l < gameBoard.length)gameBoard[x+k][y+l].makeDefaultCleared();
        l++;
      }
      k++;
    }
    
    /*
    gameBoard[x-1][y-1].makeDefaultCleared();
    gameBoard[x-1][y].makeDefaultCleared();
    gameBoard[x-1][y+1].makeDefaultCleared();
    gameBoard[x][y-1].makeDefaultCleared();
    gameBoard[x][y].makeDefaultCleared();
    gameBoard[x][y+1].makeDefaultCleared();
    gameBoard[x+1][y-1].makeDefaultCleared();
    gameBoard[x+1][y].makeDefaultCleared();
    gameBoard[x+1][y+1].makeDefaultCleared();
    */
  }
  
  

  void placeMines() {
    while (mineCount < 40) {
      int x = (int)(Math.random() * gameBoard.length);
      int y = (int)(Math.random() * gameBoard[0].length);
      if(!gameBoard[x][y].getDefaultCleared()){
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
    }}
  }

  boolean done() {
    return spacesCleared >= gameBoard.length * gameBoard[0].length - mineCount;
  }

  boolean clearSpace(int x, int y) {
    if (!gameBoard[x][y].isMine()) {
      if (!gameBoard[x][y].cleared() && !gameBoard[x][y].flagged()) {
        gameBoard[x][y].toClear();
        spacesCleared++;
        //if (x - 1 >= 0 && !gameBoard[x-1][y].isMine() && gameBoard[x-1][y].getSurrounding() == 0) {
        //  clearSpace(x-1,y);
        //}
        //if (y - 1 >= 0 && !gameBoard[x][y-1].isMine() && gameBoard[x][y-1].getSurrounding() == 0) {
        //  clearSpace(x,y-1);
        //}
        //if (x + 1 < gameBoard.length && !gameBoard[x+1][y].isMine() && gameBoard[x+1][y].getSurrounding() == 0) {
        //  clearSpace(x+1,y);
        //}
        //if (y + 1 < gameBoard[x].length && !gameBoard[x][y+1].isMine() && gameBoard[x][y+1].getSurrounding() == 0) {
        //  clearSpace(x,y+1);
        //}  
      }
      return true;
    }
    return false;
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
