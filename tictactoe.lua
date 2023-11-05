-- Tic-tac-toe game
-- @author Dominic Rucker

-- Define the game board
local board = {}

-- Initialize or reset the board to an empty state
function clear_board()
  for i = 1, 3 do 
    board[i] = { " ", " ", " " }  -- Set each cell to a space
  end
end

-- Display the current state of the board
function display_board()
  print("   1  2  3 ")
  for i = 1, 3 do
      print(i.." ["..table.concat(board[i], "][").."]")  -- Join cells with ']['
  end
end

-- Check if all board cells are occupied
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

-- Check rows, columns, and diagonals for a win
function check_winner()
  -- Check rows and columns
  for i = 1, 3 do
      if board[i][1] == board[i][2] and board[i][2] == board[i][3] and board[i][1] ~= " " then 
        return board[i][1] 
      end
      if board[1][i] == board[2][i] and board[2][i] == board[3][i] and board[1][i] ~= " " then 
        return board[1][i] 
      end
  end
  -- Check diagonals
  if board[1][1] == board[2][2] and board[2][2] == board[3][3] and board[1][1] ~= " " then 
    return board[1][1] 
  end
  if board[1][3] == board[2][2] and board[2][2] == board[3][1] and board[1][3] ~= " " then 
    return board[1][3] 
  end
  return nil
end

-- Initialize game with Player 'X' (Player 1) going first
local current_player = "X"
local player_labels = { X = "Player 1", O = "Player 2" }
local game_over = false

-- Start with a clear board
clear_board()

-- Main game loop
while not game_over do
  display_board()

  local row_to_play, col_to_play = nil, nil
  local count = 0
  
  repeat
    -- Prompt player for move
    if (count > 0) then
      print("Try again")
    end
    print(player_labels[current_player] .. ", enter row:")
    row_to_play = io.read("*n")
    print(player_labels[current_player] .. ", enter col:")
    col_to_play = io.read("*n")

    count = count + 1
  until (row_to_play >=1 and row_to_play <=3 and col_to_play >=1 and col_to_play <=3)

  -- Ensure chosen cell isn't already occupied
  if board[row_to_play][col_to_play] ~= " " then
      print("Cell occupied. Choose another.")
  else
      -- Register move and toggle player
      board[row_to_play][col_to_play] = current_player
      current_player = current_player == "X" and "O" or "X"  -- Switch player

      -- Determine game outcome
      local winner = check_winner()
      if winner then
          display_board()
          print("Winner: " .. player_labels[winner])
          game_over = true
      elseif board_full() then
          print("Draw!")
          game_over = true
      end
  end
end