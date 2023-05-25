public class Tile {
  private boolean mine, cleared, flagged;
  private int surrounding;

  public Tile() {
    mine = false;
    cleared = false;
    flagged = false;
    surrounding = 0;
  }

  boolean isMine() {
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

  boolean cleared() {
    return cleared;
  }

  void clear() {
    cleared = true;
  }

  boolean flagged() {
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
