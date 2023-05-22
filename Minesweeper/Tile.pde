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
  
  public void setType(){
    mine = true;
  }
  
  public boolean getCleared(){
    return cleared;
  }
  
  public void cleared(){
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
