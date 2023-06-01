public class Tile {
  // mine - true if tile contains a mine, false otherwise
  // cleared - true if tile has been cleared by user, false otherwise
  // flagged - true if tile is flagged, false otherwise
  // defaultCleared - true if tile (by default) is cleared ( - occurs when a player clears their first tiles of every new game), false otherwise
  // surrounding - the number of mines surrounding tile
  boolean mine, cleared, flagged, defaultCleared;
  int surrounding;
  
  boolean getDefaultCleared(){
    return defaultCleared;
  }
  
  void makeDefaultCleared(){
    defaultCleared = true;
  }
  
  boolean isMine() {
    return mine;
  }
  
  // returns false if tile has already been declared to contain a mine
  // otherwise, mine is set to true and method returns true
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

  void toClear() {
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
