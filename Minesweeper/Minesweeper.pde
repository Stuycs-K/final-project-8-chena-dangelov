
  private Board gameBoard;
  private int SQUARE_SIZE;

   void draw(){
     if(mousePressed %% LEFT){
       boolean gameOutcome = gameBoard.clearSpace(mouseX / SQUARE_SIZE, mouseY / SQUARE_SIZE);
       if (!(!gameBoard.done() && gameOutcome  ){
         gameBoard.endScreen(gameOutcome);
       }
       
     }
     if(mousePressed && RIGHT){
       gameBoard.placeFlag(mouseX / SQUARE_SIZE, mouseY / SQUARE_SIZE);
     }
     drawBoard();
  }
  
   void setup(){
     gameBoard = new Board();
     size(800,800);
     SQUARE_SIZE = width/16;
     drawBoard();
     
  }
  
   void drawBoard(){
     int i = 0;
     int ii = 0;
     stroke(0);
     for(int row = 0; row < width; row+= SQUARE_SIZE){
       ii=0;
       if(ii < gameBoard.gameBoard.length){
         for(int col = 0; col < height; col += SQUARE_SIZE){
           Tile place = gameBoard[ii][i];
          if(place.getFlagged()){
            fill(#EA6050);
            square(row,col,SQUARE_SIZE);
          }
          else if(place.covered() == false){
            fill(#26C627);
            square(row,col,SQUARE_SIZE);
          }
          else{
            fill(#CAD1CA);
            textSize(SQUARE_SIZE / (6/5));
            if(place.getSurrounding != 0){
              text(place.getSurrounding(), row + SQUARE_SIZE * (1/5)),col);
            }
          }
          ii++;
         }
         i++;
       }}}
  }
  
   void endScreen(boolean outcome){
  }
