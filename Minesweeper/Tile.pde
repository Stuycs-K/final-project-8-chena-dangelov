class Tile{
  private boolean mine, cleared, flagged;
  private int surrounding;
  
  public Tile(){
    mine = false;
    cleared = false;
    flagged = false;
    surrounding = 0;
  }
  
  public boolean getType(){
    return mine;
  }
  
  public void setType(boolean type){
    mine = type;
  }
  
  public boolean getCleared(){
    return cleared;
  }
  
  public void clear(){
    cleared = true;
  }
  
  public boolean getFlagged(){
    return flagged;
  }
  
  public void setFlagged(boolean flag){
    flagged = flag;
  }
  
  public int getSurrounding(){
    return surrounding;
  }
  
  public void addSurrounding(){
    surrounding++;
  }
}
