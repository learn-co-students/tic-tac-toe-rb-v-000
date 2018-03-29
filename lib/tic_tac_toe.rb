# WIN_COMBINATIONS
# Each array (inside the first container) represents a winning combination.

WIN_COMBINATIONS = [
  [0, 1, 2], #toprow
  [3, 4, 5], #middlerow
  [6, 7, 8], #bottomrow
  [0, 3, 6], #column1
  [1, 4, 7], #column2
  [2, 5, 8], #column3
  [0, 4, 8], #diagonal1
  [2, 4, 6]  #diagonal2
]

# display_board
# Arguments: This method accepts board as an argument.
# Purpose: Print a 3x3 board and interpolates the current state of each position from the board array.

def display_board(board)
  print " #{board[0]} " "|" " #{board[1]} " "|" " #{board[2]} \n"
  print "-----------\n"
  print " #{board[3]} " "|" " #{board[4]} " "|" " #{board[5]} \n"
  print "-----------\n"
  print " #{board[6]} " "|" " #{board[7]} " "|" " #{board[8]} \n"
end

# input_to_index
# Arguments: This method accepts input as an argument
# Purpose: Converts user input to an integer. Then, it subtracts 1 (because computers start counting at 0). Lastly, returns the new value.

def input_to_index(input)
  input_one = input.to_i
  input_two = input_one - 1
  return input_two
end

# turn_count
# arguments: board
# logic:
#   1) set variable counter = 0
#   2) for each position in the board array: If the position is not filled, do nothing. If it is filled, increment the counter by 1.

def turn_count(board)
  counter = 0
  board.each do |spot|
    if spot.strip == ""

    else
      counter += 1
    end
  end
  counter
end

# current_player
# arguments: board
# logic:
#   1) set variable "val" to the returned value from turn_count
#   2) if "val" is even, then return X. Else, return O.

def current_player(board)
  val = turn_count(board)
  if val % 2 == 0
    return "X"
  else
    return "O"
  end
end


# move
# Arguments: This methods accepts an array, and index, and a value
# Purpose: Changes the value of a position in an array to the user's character (X or O).

def move(array, index, value)
  array[index] = value
end

# position_taken?
# Arguments: board, index
# Purpose: Checks to see if the position is taken.
# Returns: True, if taken. False, if free.

def position_taken?(board, index)
  if board[index] == nil
    false
  elsif board[index].strip == ""
    false
  else
    true
  end
end

# valid_move?
# Arguments: board, index
# Purpose: Checks to see if the user's input is a valid move.
# Logic:
#   1) Converts index to an integer. Stores it as the variable val.
#   2) Value must be between 0-8
#   3) Position must not be taken.
# Returns: True, if valid move. False, if invalid move.

def valid_move?(board, index)
  val = index.to_i
  if val < 0 || val > 8
    false
  elsif position_taken?(board, index) == true
    false
  else
    true
  end
end

# turn
# Arguments: board
# Purpose: Runs the logic for an entire turn
# Logic:
#   1) Asks user for a number between 1-9
#   2) Stores the stripped input as variable "input"
#   3) Runs the #input_to_index method, and stores the returned value as index
#   4) If move is valid,
#     --run the #move method (which updates the board array)
#     --run the #display_board (which displays the current state of the board to the player)
#      If move is invalid,
#     -- run the turn method again, which prompts the user for another number.

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  character_turn = current_player(board)
  if valid_move?(board, index)
    move(board, index, character_turn)
    display_board(board)
  else
    turn(board)
  end
end

# won?
# Arguments: board
# Purpose: To determine whether a game has been won.
# Logic:
#   1) Set the winning_combo variable to 0.
#   2) For each of the winning combinations in the array, do the following.
#    -- Each combination contains three values (which represent an index). Store these indexes in three variables (win_index_1,2,3)
#    -- Get the state of each position in the board array using the above indexes, and store the value of these positions in three variables (position_1,2,3)
#    -- If the state of position_1,2,3 are all X (or X), set the winning_combo to the apprpriate value. Then, end this loop.
#   3) If winning_combo does not equal 0 (meaning that it's value was changed -- presumably to the winning combo), then return the combo. Else, return false.
# Returns: True, if won. False, if not won.

def won?(board)
  winning_combo = 0
  WIN_COMBINATIONS.each do |combo_array|
    win_index_1 = combo_array[0]
    win_index_2 = combo_array[1]
    win_index_3 = combo_array[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      winning_combo = combo_array
      winning_person = "X"

    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      winning_combo = combo_array
      winning_person = "O"
    end
  end
  if winning_combo != 0
    return winning_combo
  else
    return false
  end
end

# full?
# Arguments: accepts board
# Purpose: Checks to see if the board is full.
# Logic:
#   1) Creates a a variable called, all_full
#   2) Checks to see if all of the items in the board array are filled (with X's and O's).
# Returns: True, if full. False, if not full.


def full?(board)
  all_full = board.all? do |value|
    value.include?("X") || value.include?("O")
  end
end

# draw?
# Arguments: accepts board
# Purpose: Checks to see if there is a draw.
# Logic:
#   1) If the full? method returns true AND the won? method returns false:
#   2) Return true (there is a draw). Else, return false (there is not a draw)
# Purpose: True, if draw. False, if not draw.

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

# over?
# Arguments: accepts board
# Purpose: Checks to see if the game is over.
# Logic:
#   1) If the game is won, then it's over.
#   2) Else, if the game is a draw, then it's over.
#   3) Otherwise, it's not over.
# Returns: True, if over. False, if not.

def over?(board)
  if won?(board) != false
    return true
  elsif draw?(board) == true
    return true
  else
    return false
  end
end

# winner_function
# Arguments: board
# Purpose: Contains the logic from won?, but returns the winning person.

def winner_function(board)
  winning_combo = 0
  winning_person = 0
  WIN_COMBINATIONS.each do |combo_array|
    win_index_1 = combo_array[0]
    win_index_2 = combo_array[1]
    win_index_3 = combo_array[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      winning_combo = combo_array
      winning_person = "X"

    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      winning_combo = combo_array
      winning_person = "O"
    end
  end
  if winning_combo != 0
    return winning_person
  else
    return false
  end
end

# winner
# Arguments: winner
# Purpose: Checks to see if the game has been won. If so, then it returns the winner.

def winner(board)
  store_person = winner_function(board)
  store_combo = won?(board)
  if store_combo == false
    return nil
  elsif store_person == "X"
    return "X"
  elsif store_person == "O"
    return "O"
  else
    return false
  end
end

def play(board)

  while over?(board) == !true
    turn(board)
  end

  if winner(board) == "X" || winner(board) == "O"
    winning_char = winner(board)
    puts "Congratulations #{winning_char}!"
  elsif draw?(board) == true
    puts "Cat's Game!"
  end
end
