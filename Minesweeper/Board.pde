class Board{
  private Tile[][] gameBoard;
  private int flagsPlaced, spacesCleared, mineCount;
  
  public Board(){
    gameBoard = new Tile[16][16];
    flagsPlaced = 0;
    spacesCleared = 0;
    mineCount = 0;
  }
  
  public boolean done(){
  }
  
  public boolean clearSpace(int x, int y){
  }
  
  public void placeFlag(int x, int y){
  }
}
