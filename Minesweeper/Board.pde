class Board{
  public Tile[][] gameBoard;
  private int flagsPlaced, spacesCleared, mineCount;
  
  public Board(){
    gameBoard = new Tile[16][16];
    flagsPlaced = 0;
    spacesCleared = 0;
    mineCount = 0;
    
  }
  
  public void placeMines(Tile[][] board){
    for(int x = 0; x < gameBoard.length; x++){
      for(int y = 0; y < gameBoard[x].length; y++){
        if(Math.random() < 0.16){
          gameBoard[x][y].setType();
          if(x - 1 >= 0 && y - 1 >= 0){
            gameBoard[x-1][y-1].addSurrounding();
          }
          if(x - 1 >= 0){
            gameBoard[x-1][y].addSurrounding();
          }
          if(x - 1 >= 0 && y + 1 < gameBoard[x].length){
            gameBoard[x-1][y+1].addSurrounding();
          }
          if(y - 1 >= 0){
            gameBoard[x][y-1].addSurrounding();
          }
          if(y + 1 < gameBoard[x].length){
            gameBoard[x][y+1].addSurrounding();
          }
          if(x + 1 < gameBoard.length && y - 1 >= 0){
            gameBoard[x+1][y-1].addSurrounding();
          }
          if(x + 1 < gameBoard.length){
            gameBoard[x+1][y].addSurrounding();
          }
          if(x + 1 < gameBoard.length && y + 1 < gameBoard[x].length){
            gameBoard[x+1][y+1].addSurrouding();
          }
          mineCount++;
        }
      }
    }
  }
  
  public boolean done(){
    return spacesCleared >= gameBoard.length * gameBoard.length[0] - mineCount;
  }
  
  public boolean clearSpace(int x, int y){
    if(gameBoard[x][y].getType() == false){
      if(gameBoard[x][y].getCleared() == false){
        gameBoard[x][y].cleared();
        spacesCleared++;
        return true;
      }
    }
    return false;
  }
  
  public void placeFlag(int x, int y){
    if(gameBoard[x][y].getCleared() == false){
      if(gameBoard[x][y].getFlagged() == false){
        gameBoard[x][y].setFlagged(true);
        flagsPlaced++;
      }
      else{
        gameBoard[x][y].setFlagged(false);
        flagsPlaced--;
      }
    }
  }
}
