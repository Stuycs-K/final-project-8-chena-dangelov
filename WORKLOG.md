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

### 5/26/23

Today, my focus was to examine and improve previous methods. I first tested the game a few times and it seemed to be working great, as in playable. However, I did realize that the work I did yesterday was not the best. In short, when a player clears a empty space, all the nearby empty spaces should also be cleared and the bordering spaces that contain numbers. However, my code yesterday did not clear the bordering spaces that contain numbers. And so today I spent my time working to make that happen. The game is more than playable now and at the rate that we are going, we can get plenty much done (I hope) !

### 5/27/23

Today, my work involved entirely of flags. Something that had always bothered me was the flag design and today, I gave myself the opportunity to give flags in our game a makeover. I examined the design of the flag in other minesweeper games, and settled on one that in my opinion is rather classic. The new flag design looks really cool and in my opinion, it drastically boosts user experience. 

### 5/28/23

Today I took more of a perspective role. In terms of code, I had nothing written today but rather I looked over what was already written and made sure everything was running as it should. A few of the changes I'd like to make are a bigger play again button and a high score setting (all of which I will do tomorrow). On top of this, I hope I can implement multiple diffculties soon.

### 5/29/23

Today I met the goals that I had set for myself yesterday. These goals included creating a bigger play again button and a high score setting. Moreover, I hoped to implement multiple difficulties soon. And in light of that, I added comments to every single class to help make the process easier. On top of that, in some of my comments, I talked about ways the program can be improved and possible alternatives to certain things that we have done. In addition, I also talked about errors that we have been seeing in our program. I hope that these comments can make the problems that we have much clearer and allow us to better make improvements. And last but not least, while looking through the code, I cleaned up some of the existing code. 

### 5/30/23

Today I implemented additional difficulties (easy, medium, hard) and modified our existing code to suit this change. This includes modifying corresponding board sizes, adding new instance variables (private String difficulty in Minesweeper class), and modifying particular methods. However, as of now, as there is no real way to change between difficulties, the keys 'e' (easy) 'm' (medium) and 'h' (hard) will be used to toggle in between difficulties. This modification is in absolutely no way permanent and will be replaced in the future by a more user-friendly option that allows the user to more clearly change in between difficulties.

### 5/31/23

Today I further implemented difficulties into our program. More specifically, I added a more user friendly way to toggle between difficulties. Now instead of having to press specific keys, it is easier for players to switch between game modes. In addition, I fixed some errors regarding difficulties that include allowing users to change difficulties in midst of a game, and resetting time everytime difficulty is changed. Moreover, I also added some additional comments to help outline what is happening in our code. On top of this, today I modified how endScreen() method works. Instead of placing winner/loser text on the top left hand corner, that text has been moved to the top right hand corner. 

### 6/1/23

Today I spent half an hour testing all the features of the game to ensure that everything functions as it should. And from my tests, I found some parts of our program that needed modification. These modifications included changing the background color of the timer to have it blend in with the heading, and deleting unnecessary comments. In addition, I realized that there was an error in best time settings. I had it so that best time simply displayed when we revealed our debug program. However, best time is not displayed otherwise after winning a game. I changed that. I also made best time into three different variables, easyBestTime mediumBestTime and hardBestTime, so that based off of difficulty, there would be a different best time. 

### 6/2/23

Today not much progress was made. However, I did start on adding the flagsLeft feature that displays the number of flags left (indicative of how many mines are left unmarked on the board). I added an integer called flagsLeft in Board class and when it is initalized, it is set to the number of mines on the board. I also have a method that returns flagsLeft so Minesweeper class can display it on the actual program. This weekend I will finish this feature and some notable aspects that I'll have to implement alongside this include decrementing flagsLeft everytime a flag is placed (Board class), incrementing flagsLeft everytime a flag is removed (Board class), making difficulty settings smaller to make space for flagsLeft feature (Minesweeper class), and displaying flagsLeft on the actual program (Minesweeper class).

### 6/3/23

Today I completed much of the goals I set for myself yesterday. My work today included changing the size of difficulty settings to make space for flagsLeft feature, displaying flagsLeft, and implementing a flagsLeft setting on the heading of the program. I am almost done with this feature, however, I noticed that there is a bug in the program as sometimes, the game displays more flagsLeft there should be. I will debug this tomorrow.

### 6/4/23

Today I completed the flagsLeft feature. The bug I mentioned earlier had to do with bad math on my part on how many flags are in each difficulty. However, it is now fixed and in order of easy medium hard, the number of flags in each level are 10 40 and 64 respectively. 

### 6/5/23

Today I tried to implement a dropdown menu for difficulty. With this implementation, I moved around some features / settings in the heading and made alterations. I also added two new variables (boolean isDifficultyScreen and int countdownDifficultyScreen). I am not exactly sure how I want the dropdown menu to look but I have created the necessary methods and variblaes so I am prepared for however I decide I want it to look.  

### 6/6/23

Today I continued to work on the dropdown menu for difficulty. I ran into some setbacks while working on removeDifficultyScreen() method however, I think I have a general idea on how I want it to work. I want the space that the dropdown menu to take up to drawn back again and I will implement this idea tomorrow. Moreover, I still have to work on the selection of different difficulties. These are the goals I will set for myself to accomplish tomorrow, however, after meeting these goals, the dropdown menu feature for difficulty should be up and working !

### 6/7/23

Today I completed the dropdown menu for difficulty. My work today consisted of removeDifficultyScreen() method (a method that draws back the area taken over by the difficulty screen) and quite a lot of debugging. I ran into multiple issues with text alignment as for some reason text would be shifted to the left after the first game ends. On top of that, I ran into confusion on when removeDifficultyScreen() is called and isDifficultyScreen is true. This affected how the difficultyScreen functioned and I spent an embarassingly long time trying to figure out why difficultyScreen was not always functional. For the most part I am satisfied with what we have right now and am excited to move onto more cool additions to the game. 

### 6/8/23

Today I started to implement sound into the game. I found some really cool sounds for winner screen, loser screen, and clearing tiles and had them implemented. I learned about processing's sound class and it seems simple enough to use. However, one issue I am encountering is that the game takes a bit longer to set up but I guess that is a consequence of adding sound. Tomorrow I will add flag sounds (flag removing and adding) and clean up a lot of the code.

### 6/9/23

Today I completed the implementation of sound into the game. I hope that these improvements greatly improve the quality of gameplay. On top of that, I tested the game multiple times to make sure all the features of the game work well. And they do ! As we are nearing the end of the project, I don't think more changes will be made (except for maybe slight ones). Other than that, I think the next few days I will be working on updating our prototype to accompany for any changes we might not have included on there yet and making sure everything is ready to be submitted !

### 6/10/23

Today, other than adding some explanatory comments throughout the code, I worked mostly on the prototype document. I read over the entire prototype document and made sure all the changes we had made have been incorporated. However, it still looks like some changes need to be made. The method outline is mostly done except for some relatively new methods in Minesweeper class and our new controller class. On top of that, our UML diagram still has to accompany the changes we recently made. Other than that, everything else looks solid. 

### 6/11/23

Today is one of the final days of work. It has been a long journey but it is finally coming to an end. My work today consisted making any necessary changes to the prototype which included updating our method outline and development phases to include anything that we might have missed. I looked over the entirety of our code today as well to ensure that we did not miss anything, and after doing so, I have to admit that everything looks pretty solid.


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

### 5/27/23

Today I fixed the issue that prevented flags from being reliably placed by adding a countdown/timer, which ensured that the program would only register the user's right clicks as single clicks. However, a strange, lingering issue with the flags is that sometimes a flag is placed when the player left clicks. I believe this is because mouseButton, a built-in feature in Processing, is sometimes RIGHT when it should be LEFT, but I am still unsure. I also added the timer at the bottom of the screen, which updates every second and is displayed when the viewer wins the game. There are some more aesthetic changes I'd like to make to the timer so I have not merged those changes yet.

### 5/28/23

Today I made some changes to the timer. Firstly, I moved the whole board down, leaving a narrow empty strip at the top that will eventually display other things like the high score. Then, I moved the timer to the center of this strip, where it currently lies. Also, I created a play again button that displays when the player loses a game. This button, when clicked, completely resets the simulation (i.e. setting the gameBoard variable to null, resetting the timer to 0). Right now, clicking this button is equivalent to simply quitting the simulation and restarting it, but eventually this will change when we create a high score variable. 

### 5/29/23

Today I modified what is displayed when a player wins or loses a game. Instead of removing the screen entirely and just displaying a black screen, the endScreen() method now only makes the top banner black. This way, the player can see the gameBoard after the game. I also added a feature where all the remaining un-flagged mines are marked with the word "mine". I did this by simply adding a loop that searches the entire 2-d array for mines. It's likely we'll come back to these changes I made here and mix them up slightly for aesthetic purposes, but really this new aspect of the code won't change very dramatically. Really happy with the progress made this weekend.

### 5/30/23 

Today I added the keyPressed() method to the Minesweeper tab. Now, if the player clicks the ‘w’ key during their game, the game will immediately be won, with the board clearing all of the non-mine Tiles. This is mainly to help make our MVP presentation more fluid. I also added an array variable named colors which is used in drawTile() to display different colored numbers depending on the number of mines a Tile touches. I also made a new design for the mines, which is just a black circle.

### 5/31/23 

Call me a pesticide the way I've been taking care of these bugs. Firstly, I took care of a bug where choosing a difficulty before clicking the play again button broke the game. I did this by making sure that every time someone clicked a key to change the difficulty, the gameBoard was set to null so that a new gameBoard could be generated. Also, I added to the drawTile() method so now non-mine tiles that are diagonal to empty tiles are also cleared recursively (previously only the tiles that were adjacent to the cleared tiles were cleared). I also fixed an out of bounds error that was occurring for the easy mode upon the random generation of a board.

### 6/1/23

Today I just looked through the code and added comments to the Minesweeper and Board classes to explain methods and parts of methods in preparation for the Demo. I also cleaned up the code, moving around certain statements so that they only ran once instead of in three separate if statements, for example. In the Tile class, I removed the unused unMine() method, and I also removed the constructor. We don't need to write the constructor because the default constructor is sufficient for our needs. I also began the Instructions part of the README.

### 6/2/23

Today I made a pretty simple change to the game by making the default colors of the Tiles on the board alternate from a darker green to a slightly lighter green. I find this to be more visually appealing. Tomorrow I hope to do some more work, and I'd like to begin the process of making a How to Play screen. 

### 6/3/23

Today I began work on the How to Play button. The way I want to implement this is by making a pop-up menu that you can access by clicking on a little hamburger button icon, which right now is located in the top left of the screen. By clicking on this button, a gray square appears on the board, and eventually (probably tomorrow), I will fill this square with text and possibly other icons. But the goal of today was to just get its functionality working properly. The main objective was ensuring that opening the how to play screen did not end any games that were ongoing, but rather it temporarily obscured the player's view of the gameBoard. To do this, I made a method called removeHelpScreen() which, when called, redrew the tiles under the screen, creating the effect of the how to play screen simply being removed. There are two ways to close the how to play screen: the first is by clicking the hamburger button again, and the other is by clicking (right or left) elsewhere on the gameBoard. Tomorrow, I hope to add text to the how to play screen.

### 6/4/23

Today I fixed a minor bug where a flag would not be drawn correctly after the how to play box was opened and closed. I also made the box actually display some text, but I will edit this later on to better fit what we want. The text settings won't change, just the text itself. Minor changes today.

### 6/5/23

Today I made some more work with the how to play box, which honestly I think now would be more appropriately called the "more info" box. Anyway, I added the rest of the instructions of the game here, and made sure to wrap the text so that they stayed in our box. I also added another feature to the box: a list of personal bests. Really, it's three lists, the top three fastest times that the player has achieved in each mode. I implemented this by changing the bestTime integer variables into arrays with a length of 3. I tried to use a heap, but processing wasn't letting me do that, so this probably took longer than it would have otherwise, and it is perhaps slightly less efficient than the heap algorithm (but I'd argue that does not matter too much as these arrays are very small).

### 6/6/23

Today I made it so that, upon losing the game, the board removes any flags that were not placed correctly (i.e. they were not placed on a mine), and replaces them all with a big red “x”. Also, I added a fun little animation. When the player clicks a mine, multiple rings of red circles emanate from the mine. This animation lasts for ten frames, and I created a method called explosion() for it. This way the specific mine the player messed up on is prioritized.

### 6/7/23

On this day I made some pretty cool additions. Firstly, I debugged some stuff. There was an issue with the two drop down menus where they were still clickable even when the "loser" or "winner" screens were displayed, in which case the hamburger button and the drop down menu for the difficulty were covered by a black screen. Now, it is only possible to click on these icons when they are displayed. Additionally, I made an addition where the player can actually see where the closest mine (or one of the closest mines) is to them on the map. This is done by clicking and holding the ‘h’ key (h for help), which will cause a blue circle to appear over the mine. This serves two purposes. Firstly, it can serve simply as a hint if the player needs it. But additionally, it prevents the situation that can occur in many online Minesweeper games where the player simply has to guess because the only option is to guess. I did this by creating a new tab (!!) for the controller, which processes the clicking and holding of a key. I also had a small debug session, and now I ensured that holding h is only effective if the game is ongoing. I hope to debug some more and add this new feature to the more info box tomorrow.

### 6/8/23

Today I did some debugging. Firstly I dealt with some lingering bugs from my “press h to help” addition yesterday, particularly how this could sometimes destroy the more info box / difficult selector if the closest mine was located in those respective regions. I also fixed a logical issue that caused this tool to not search for nearby mines that were not a knight-move away. Note that this tool doesn’t always return the exact nearest mine due to the way I’ve implemented it. Occasionally there will be slight discrepancies. But that was not the goal of this tool, as I did this just so that the player could find a nearby mine if they needed a hint. Next I moved onto bugs with the difficulty selector. Now, just like the more info box, clicking outside somewhere on the rest of the board will close the difficulty selector. Also, it is now much more unlikely to accidentally start a game right after choosing a new difficulty because of Processing registering one click from the user as multiple. Tomorrow, I hope to add more information to the more info box. 

### 6/9/23

Some more general things today. Firstly I wanted to increase the more info box to include information about what to do when the player was stuck. This took a surprising amount of time because of the new dimensions and the press 'h' for help tool, but I eventually got it working. In addition to that, I went through the draw() method and tried to include some explaining comments. Over the weekend I'm not too sure what else I'll do to the code. I'll definitely try to clean it up a bit. Today I also checked out Alberto's sounds, which are totally awesome.

### 6/10/23

Today I added what is probably going to be the last feature of our game: a mute button. It was generally easy but there were a couple of intricacies that took a little longer to get right. Firstly, the two longer audios (winnerSound and loserSound) had to be cut off if they were playing while the mute button was pressed. And adding onto that, if the player mutes while one of these sounds were playing, and then quickly unmutes, the sound had to continue as if the mute button was not clicked at all. These two features have been implemented. I also edited the Instructions tab in the Readme. Looking forward to the last day, tomorrow, I just plan to make the code more appealing and to add more explanatory comments. But the main thing is going to be working with the prototype, which we have been updating throughout the course of the project, but need to add finishing touches to for sure. 

### 6/11/23

Last day of work. Today was not a very code-heavy day, although I did make some changes. Firstly the program now mutes by toggling the volume, which I believe is much more efficient than starting and stopping the audios constantly. I also capped the timer at 999 seconds. The rest of the day was checking over the prototype, specifically with the UML, and also some minor work on the other parts as well. 
