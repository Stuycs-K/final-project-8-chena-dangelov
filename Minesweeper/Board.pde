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
        if(Math.random() < 0.16){
          gameBoard[x][y].setType();
          mineCount++;
        }
      }
    }
    
  }
  
  public boolean done(){
    return spacesCleared == gameBoard.length * gameBoard.length[0] - mineCount;
  }
  
  public boolean clearSpace(int x, int y){
    if(gameBoard[x][y].getType() == false){
      // flaw in logic
      gameBoard[x][y].cleared();
      return true;
    }
    return false;
  }
  
  public void placeFlag(int x, int y){
    if(gameBoard[x][y].getCleared() == false){
      if(gameBoard[x][y].getFlagged()){
        gameBoard[x][y].setFlagged(true);
      }
      else{
        gameBoard[x][y].setFlagged(false);
      }
    }
  }
}
