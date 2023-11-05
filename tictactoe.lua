-- Tic-tac-toe game
-- @author Dominic Rucker

-- Define the game board
local board = {}

-- Initialize or reset the board to an empty state
function clear_board()
  for i = 1, 3 do 
    board[i] = { " ", " ", " " }  -- Each board cell initialized with a space
  end
end

-- Display the current state of the board
function display_board()
  print("   1  2  3 ")
  for i = 1, 3 do
      -- Using table.concat() to join cells with '][' delimiter
      print(i.." ["..table.concat(board[i], "][").."]")  
  end
end

-- Check if all board cells are occupied
function board_full()
  for i = 1, 3 do
      for j = 1, 3 do
          -- If any cell is empty, return false
          if board[i][j] == " " then 
            return false 
          end
      end
  end
  return true  -- All cells occupied
end

-- Check rows, columns, and diagonals for a winning move
function check_winner()
  -- Check rows and columns
  for i = 1, 3 do
      -- Check for horizontal and vertical wins
      if board[i][1] == board[i][2] and board[i][2] == board[i][3] and board[i][1] ~= " " then 
        return board[i][1] 
      end
      if board[1][i] == board[2][i] and board[2][i] == board[3][i] and board[1][i] ~= " " then 
        return board[1][i] 
      end
  end
  -- Check for diagonal wins
  if board[1][1] == board[2][2] and board[2][2] == board[3][3] and board[1][1] ~= " " then 
    return board[1][1] 
  end
  if board[1][3] == board[2][2] and board[2][2] == board[3][1] and board[1][3] ~= " " then 
    return board[1][3] 
  end
  return nil  -- No winner
end

-- Get user input for the next move
local function get_user_input(promt_message)
  count = 0
  number = 0
  repeat
    -- If invalid input, notify the user and prompt again
    if (count > 0) then
      print("Try again")
    end
    print(player_labels[current_player].. ", ".. promt_message)
    number = io.read()
    if number:match("%a") or number:match("%p") then -- Check if the input contains letters or punctuation characters, if so, reset to 0
      number = 0                    
    else
      number = tonumber(number) 
    end
    count = count + 1
  until (number > 0 and number < 4)  -- Ensure the input is between 1 and 3 (inclusive)
  return number
end


-- Initialize game settings
current_player = "X"  -- Start with Player 'X'
player_labels = { X = "Player 1", O = "Player 2" }
local game_over = false  -- Track the game status

-- Initialize the game board
clear_board()

-- Main game loop
while not game_over do
  display_board()

  local row_to_play = get_user_input("Enter row: ")
  local col_to_play = get_user_input("Enter col: ")

  -- Check if the chosen cell is available
  if board[row_to_play][col_to_play] ~= " " then
      print("Cell occupied. Choose another.")
  else
      -- Make the move and switch to the next player
      board[row_to_play][col_to_play] = current_player
      current_player = current_player == "X" and "O" or "X"

      -- Check the board state for a winner or draw
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