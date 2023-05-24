# Work Log

## Alberto Chen

### 5/22/23

Today, we introduced a Tile class. The Tile class would be utilized by the Board class (as our Board will be made up of Tiles) and would hold data regarding individual squares. This data includes whether or not the tile has been flagged, whether it is a mine, whether it has been cleared, and the numner of squares surround it (along with corresponding accessor and mutator methods). Moreover, I completed the entirety of Tile class and Board class (this includes the creation of instance variables, constructors, and methods of the classes). Though there may be still some error regarding the logic of how these two classes will function, I made sufficient progress in the completion of these classes. 

### 5/23/23

Today, I worked on Board class. My work composed of the working on method placeMines() and correcting a mistake I made previously regarding done() method. In addition, I completed the endScreen() method of Minesweeper class. Moreover, though Board and Tile class are fundamentally finished, I expect to add many more edits to these classes as problems arise. In short, beautiful progress has been made recently.

### 5/24/23




## Vincent D'Angelo

### 5/22/23

Today I altered the UML, method outline, and development phases of the prototype to reflect a new approach we have to the Minesweeper game, namely the introduction of a Tile class. These Tiles are each of the individual squares in the game board, and hold information like if they are mines are not, if they have been flagged by the viewer or not, etc.

### 5/23/23

Today I wrote much of the Minesweeper tab of the project. This is the tab that displays the board and everything else. I wrote the draw(), setup(), and drawBoard() methods. As we make further additions to the project, these methods will undoubtedly change, but they will fundamentally remain similar to what I have written today. There is still much debugging to be done with this branch, specifically involving responding to user input appropriately, but I have gotten it to a point where it can display the board and allows the user to place flags with no issues.
