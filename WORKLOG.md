# Work Log

## Alberto Chen

### 5/22/23

Today, we introduced a Tile class. The Tile class would be utilized by the Board class (as our Board will be made up of Tiles) and would hold data regarding individual squares. This data includes whether or not the tile has been flagged, whether it is a mine, whether it has been cleared, and the numner of squares surround it (along with corresponding accessor and mutator methods). Moreover, I completed the entirety of Tile class and Board class (this includes the creation of instance variables, constructors, and methods of the classes). Though there may be still some error regarding the logic of how these two classes will function, I made sufficient progress in the completion of these classes. 

### 5/23/23

Today, I worked on Board class. My work composed of the working on method placeMines() and correcting a mistake I made previously regarding done() method. In addition, I completed the endScreen() method of Minesweeper class. Moreover, though Board and Tile class are fundamentally finished, I expect to add many more edits to these classes as problems arise. In short, beautiful progress has been made recently.

### 5/24/23

Today, my focus was to improve the methods that were made previously. In Board class, I changed the way placeMines() method functioned as there was an issue regarding initialization and declaration of certain tiles. In that class, I also changed the way clearSpace() method functioned as I began to consider edge case situations. In Minesweeper class, I made significant progress in cutting down code / concision. I cut down non-useful code in drawBoard() method, draw() method, and drawTile() method. I also made slight changes to drawTile() method in which text is printed in the middle of each square / tile rather than above. I also changed endScreen() method as there was an error where it would print out text displaying "winner !" regardless of game outcome. In addition, I added comments to tile class. Overall everything seems to be going ahead of schedule and as of now, there only seems to be one last EXTREMELEY important thing that needs to be completed (how the game / program responds when the winner either wins or loses / clears a mine).

### 5/25/23

Today, I made it my mission to get clearSpace() method to be recursive. I ran into some errors along the way, including stackoverflow errors, however I managed to do it ! But instead of having clearSpace() method be recursive, I had drawTile() be recursive so I can have the drawing of the cleared Tile + the clearing of the tile in one method. I managed to complete my mission and the project overall looks good. Most of the code is done and only a few more additions are needed. It'll only be a matter of time till we have a satisfactory completed product (mood == hopeful) !!




## Vincent D'Angelo

### 5/22/23

Today I altered the UML, method outline, and development phases of the prototype to reflect a new approach we have to the Minesweeper game, namely the introduction of a Tile class. These Tiles are each of the individual squares in the game board, and hold information like if they are mines are not, if they have been flagged by the viewer or not, etc.

### 5/23/23

Today I wrote much of the Minesweeper tab of the project. This is the tab that displays the board and everything else. I wrote the draw(), setup(), and drawBoard() methods. As we make further additions to the project, these methods will undoubtedly change, but they will fundamentally remain similar to what I have written today. There is still much debugging to be done with this branch, specifically involving responding to user input appropriately, but I have gotten it to a point where it can display the board and allows the user to place flags with no issues.

### 5/24/23

Today I worked further on the Minesweeper class. I created the drawTile() method, separating the work so that the entire board does not have to be drawn every time draw() is called. After my edits, the project was able to run a simplified version of Minesweeper, where tiles could be cleared and flagged but there was no immediate loss after clicking a mine. Alberto edited the code further after these edits and made significant progress to the methods in the Minesweeper tab.

### 5/25/23

Today I made some minor adjustments to the code. Firstly, I fixed an error that arose when the player clicked and dragged out of the playing board. This action led to an out of bounds exception, and now, after some changes I made in draw that checks the validity of mouseX/Y, it does not. Also, I added a boolean called isGameOver in Minesweeper. This boolean ensures that draw() has no funcionality after the game ends (the player clicks on a mine or successfully clears the screen). I also made some adjustments to the UML and method outline to better reflect our current lab.

### 5/26/23

Today I implemented the part of Minesweeper where the player clicks on the empty board causing an area of cleared, empty squares to pop up around where the player clicked. This also fixed the issue that we were having where a player could immediately lose by having to guess where to click on the first few turns. Now, our Minesweeper should be as solvable as any Minesweeper online! I made this change by editing draw() and setup() so that the Minesweeper tab's gameBoard would not be initialized until the player clicked the screen. Then, I modified the Board constructor to take in two parameters, an x- and y-coordinate (where the player clicked), and used those parameters to call a new method called randomlyClearArea(int x, int y), which ensures that the area around where the player clicked has no mines. The only gameplay issues we have to resolve now involve the issue that Tiles that touch the corners of cleared spaces are not automatically recursively cleared, even though they should be. Also, there is an issue with flags; they are not always placed when a space is right-clicked (this may need a countdown/timer to resolve).
