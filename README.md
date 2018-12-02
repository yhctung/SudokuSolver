## SudokuSolver

### Description
This project solves sudoku puzzles in MATLAB using structures.

### Files
- TungSudokuSolver.m - implements my algorithm and takes in the input 
- sudoku.m - graphs the original sudoku game 
- unsudoku.m - graphs the solved entries
- doke.m - draws the sudoku grid 

### Algorithm Explanation
Input is a 9x9 matrix called game.
Box, row, and column arrays with 9 numbers each are formed from 'game' and put into a structure 's'. 
Then it runs through the "box process".

**Box Process**

Overall, this part makes a 3x3 matrix for possible locations for each missing number in each 3x3 box and updates. Here is what it does in detail:
+ checks if grid is full
+ makes a 3x3 binary matrix called tab of potential places the new numbers could go
+ finds the possible numbers for the box and in a structure, assigns tab to each possible number. 
+ starting at the first possible number, it cycles through each of the potential spots, comparing with the full rows and columns
+ updates the potential spots matrix for each number 

For the full grid, the box process is repeated for each box with the potential grids of the possible numbers saved in a structure inside another structure. This full grid process is repeated 3000 times or until the puzzle is solved. Once the program is stopped, it will output the puzzle with solved entries, some timing statistics, and whether or not it was successful.

##### Other Notes
This program was only able to solve some puzzles. There are definitely more algorithms I would like to implement when I have time. On average, it was able to solve 9 spaces on the ones it couldn't solve. 

