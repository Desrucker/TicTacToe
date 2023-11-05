-- Initialize the tic-tac-toe board as a 2D table
local board = {}

-- Clear the board by setting all positions to an empty space
function clear_board()
  for i = 1, 3 do
    board[i] = {}
    for j = 1, 3 do
      board[i][j] = " "
    end
  end
end

-- Display the current state of the board to the console
function display_board()
  print("   1  2  3 ") -- Column headers
  for i = 1, 3 do
    print(i.." ["..board[i][1].."]["..board[i][2].."]["..board[i][3].."]") -- Display each row with row number
  end
end

-- Check if the board is full (no empty spaces left)
function board_full()
  for i = 1, 3 do
    for j = 1, 3 do
      if board[i][j] == " " then
        return false
      end
    end
  end
  return true
end

-- Check if there's a winning move on the board, return the winning player's symbol or nil if none
function check_winner()
   -- Check rows
   if board[1][1] ~= " " and board[1][1] == board[1][2] and board[1][2] == board[1][3] then return board[1][1] end
   if board[2][1] ~= " " and board[2][1] == board[2][2] and board[2][2] == board[2][3] then return board[2][1] end
   if board[3][1] ~= " " and board[3][1] == board[3][2] and board[3][2] == board[3][3] then return board[3][1] end
   -- Check columns
   if board[1][1] ~= " " and board[1][1] == board[2][1] and board[2][1] == board[3][1] then return board[1][1] end
   if board[1][2] ~= " " and board[1][2] == board[2][2] and board[2][2] == board[3][2] then return board[1][2] end
   if board[1][3] ~= " " and board[1][3] == board[2][3] and board[2][3] == board[3][3] then return board[1][3] end
   -- Check diagonals
   if board[1][1] ~= " " and board[1][1] == board[2][2] and board[2][2] == board[3][3] then return board[1][1] end
   if board[1][3] ~= " " and board[1][3] == board[2][2] and board[2][2] == board[3][1] then return board[1][3] end

   return nil
end

-- Initialize game variables
local player = "X"     -- Start with player X
local move = 1         -- Track the current move number
local game_over = false

-- Clear the board at the start of the game
clear_board()

-- Main game loop
while not game_over do
  display_board()

  print("Enter the row you want to place the symbol "..player..": ")
  local row_to_play = io.read("*n")
  print("Enter the col you want to place the symbol "..player..": ")
  local col_to_play = io.read("*n")

  -- Check if the chosen position is already taken
  if board[row_to_play][col_to_play] ~= " " then
    print("Invalid! Please select an empty position.")
  else
    -- Make the move
    board[row_to_play][col_to_play] = player

    -- Toggle between X and O
    if move % 2 == 0 then
      player = "X"
    else
      player = "O"
    end

    -- Increment move count
    move = move + 1

    -- Check for a winner or if the game is a tie
    local winner = check_winner()
    if winner ~= nil then
      display_board()
      print("Game Over! The winner is "..winner)
      game_over = true
    elseif board_full() then
      print("Game Over! Tie.")
      game_over = true
    end
  end
end
