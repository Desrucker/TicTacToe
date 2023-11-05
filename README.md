# Tic-tac-toe in Lua

A simple command-line implementation of the classic Tic-tac-toe game in Lua.

## Author

- Dominic Rucker

## Overview

This Tic-tac-toe game allows two players to take turns marking spots on a 3x3 grid. The first player to get three marks in a row (horizontally, vertically, or diagonally) wins the game. If all spots on the board are filled without any player getting three in a row, the game is declared a draw.

## Features

- Interactive command-line interface for players to input their moves.
- A board display that updates after each move.
- Checks to prevent players from marking an already occupied spot.
- Win condition checks for rows, columns, and diagonals.
- Notification when a player wins or the game is a draw.

## How to Play

1. Run the Lua script.
2. Players will take turns, starting with Player 1 (marked as `X`).
3. Each player will be prompted to enter a row number (1, 2, or 3) and a column number (1, 2, or 3) for their move.
4. The board will be updated and displayed after each move.
5. The game will continue until one player wins or all spots on the board are filled.

## Functions Overview

- `clear_board()`: Initializes or resets the board to an empty state.
- `display_board()`: Displays the current state of the board.
- `board_full()`: Checks if all board cells are occupied, returning true if full and false otherwise.
- `check_winner()`: Checks rows, columns, and diagonals to determine if there's a winner.
- `get_user_input(promt_message)`: Gets the user input for the next move, ensuring it's valid.

## Future Enhancements (Potential)

- Incorporate an AI opponent for single-player mode.
- Extend the game for larger board sizes, e.g., 5x5 or 7x7 grids.
- Add a graphical user interface for a more visual gameplay experience.