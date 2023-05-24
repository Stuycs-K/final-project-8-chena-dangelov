class Minesweeper{
  private Board gameBoard;
  
  public Minesweeper(){
    gameBoard = new Board();
  }
  
  void draw(){
  }
  
  void setup(){
  }
  
  void drawBoard(){
  }
  
  void endScreen(boolean outcome){
    textSize(120);
    background(0);
    textAlign(CENTER);
    if(outcome){
      text("winner !", width/2, height/2); 
    }
    else{
      text("winner !", width/2, height/2); 
    }
  }
}
