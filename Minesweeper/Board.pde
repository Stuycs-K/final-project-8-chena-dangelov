class Board{
  private Tile[][] gameBoard;
  private int flagsPlaced, spacesCleared, mineCount;
  
  public Board(){
    gameBoard = new Tile[16][16];
    flagsPlaced = 0;
    spacesCleared = 0;
    mineCount = 0;
    
    for(int x = 0; x < gameBoard.length; x++){
      for(int y = 0; y < gameBoard[x].length; y++){
        gameBoard[x][y] = new Tile();
        if(Math.random() < 0.16){
          gameBoard[x][y].setMine();
          mineCount++;
        }
      }
    }
    
  }
  
  public boolean done(){
    return spacesCleared >= gameBoard.length * gameBoard[0].length - mineCount;
  }
  
  public boolean clearSpace(int x, int y){
    if(gameBoard[x][y].isMine() == false){
      if(gameBoard[x][y].isCleared() == false){
        gameBoard[x][y].clear();
        spacesCleared++;
        return true;
      }
    }
    return false;
  }
  
  public void placeFlag(int x, int y){
    if(gameBoard[x][y].isCleared() == false){
      if(gameBoard[x][y].isFlagged() == false){
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
