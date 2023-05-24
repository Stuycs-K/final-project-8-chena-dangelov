class Tile{
  private boolean mine, cleared, flagged;
  private int surrounding;
  
  public Tile(){
    mine = false;
    cleared = false;
    flagged = false;
    surrounding = 0;
  }
  
  public boolean isMine(){
    return mine;
  }
  
  public void setMine(){
    mine = true;
  }
  
  public boolean isCleared(){
    return cleared;
  }
  
  public void clear(){
    cleared = true;
  }
  
  public boolean isFlagged(){
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
