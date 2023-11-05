# Tic-tac-toe Game

A simple terminal-based Tic-tac-toe game implemented in Lua.

## Author
Dominic Rucker

## Description

This game allows two players to take turns playing Tic-tac-toe. The game continues until a player wins or the board becomes full, resulting in a draw. The game displays the board state after every move and provides a clear indication of whose turn it is.

## Features

- Board initialization and display
- User input for row and column selection
- Validation to prevent overwriting occupied cells
- Checks for winning conditions (row, column, diagonals)
- Checks for draw condition (all cells occupied)

## How to Play

1. The game will start by displaying an empty board.
2. Player 1 (X) will be prompted to enter the row and column they wish to mark.
3. Player 2 (O) will be prompted next, and turns will alternate between players.
4. If a player tries to play in an already occupied cell, they will be prompted to choose another cell.
5. The game continues until a player wins or all cells are occupied (draw).
6. At the end, the game displays the winner or announces a draw.

## Code Overview

Here's a brief breakdown of the primary functions:

- `clear_board()`: Initializes or resets the game board.
- `display_board()`: Prints the current state of the game board to the terminal.
- `board_full()`: Checks if all cells on the board are occupied.
- `check_winner()`: Determines if a player has won based on rows, columns, or diagonals.
- The main game loop handles the player input, validates the moves, and checks the game's outcome after each move.

## Usage

Make sure you have the Lua interpreter installed. Then, run the game using: