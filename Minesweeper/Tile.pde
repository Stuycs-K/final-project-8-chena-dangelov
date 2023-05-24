public class Tile {
  private boolean mine, cleared, flagged;
  private int surrounding;

  public Tile() {
    mine = false;
    cleared = false;
    flagged = false;
    surrounding = 0;
  }

  boolean getType() {
    return mine;
  }

  boolean setType() {
    if (mine == true) {
      return false;
    } else {
      mine = true;
      return true;
    }
  }

  boolean getCleared() {
    return cleared;
  }

  void cleared() {
    cleared = true;
  }

  boolean getFlagged() {
    return flagged;
  }

  void setFlagged(boolean flag) {
    flagged = flag;
  }

  int getSurrounding() {
    return surrounding;
  }

  void addSurrounding() {
    surrounding++;
  }
}
