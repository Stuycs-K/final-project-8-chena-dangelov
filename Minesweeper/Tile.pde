class Tile{
  private boolean mine, cleared, flagged;
  private int surrounding;
  
  public Tile(){
    mine = false;
    cleared = false;
    flaggged = false;
    surround = 0;
  }
  
  public boolean getType(){
    return mine;
  }
  
  public void setType(boolean type){
    mine = type;
  }
}
