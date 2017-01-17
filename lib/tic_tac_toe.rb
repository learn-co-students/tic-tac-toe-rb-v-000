WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # center row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # center column
  [2,5,8], # right column
  [0,4,8], # diagonal (top left to bottom right)
  [6,4,2]  # diagonal (bottom left to top right)
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Converts user input to integer, then subtracts "1" to match board index
def input_to_index(user_input)
  user_input.to_i - 1
end

# Places player token in the position (board index 0-8) the user selected
def move(board, position, player_token)
  board[position] = player_token
end

# If position equals to "nil" and " " then it returns true, but we want
# it to return false.
def position_taken?(board, position)
  board[position] != nil && board[position] != " "
end

# Did user enter a valid move, 1-9 (index 0-8) and position NOT taken?
def valid_move?(board, position)
  position.between?(0,8) && !position_taken?(board, position)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  input = input_to_index(user_input)
  if valid_move?(board, input)
    move(board, input, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
 counter = 0
 board.each do |index_taken|
  if index_taken == "X" || index_taken == "O"
    counter += 1
  end
 end
 counter
end

def current_player(board)
#  if turn_count(board).even?
#  else return "O"
#  end
  turn_count(board).even? ? "X" : "O"
# above ternary operator replaces if/else
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_index| # "detect" will only return the first element that makes the block true
# puts win_index[0]  # returns 0,3,6,0,1,2,0,6
#  (all 0 index values in WIN_COMBINATIONS[0][0],[1][0],[2][0],[3][0],[4][0],[5][0],etc.)
# puts win_index[1]  # returns 1,4,7,3,4,5,4,4
#  (all 1 index values in WIN_COMBINATIONS[0][1],[1][1],[2][1],[3][1],[4][1],[5][1],etc.)
# puts win_index[2]  # returns 2,5,8,6,7,8,8,2
#  (all 2 index values in WIN_COMBINATIONS[0][2],[1][2],[2][2],[3][2],[4][2],[5][2],etc.)
# only need three [0,1,2] "win_index[]" because that is the length of child arrays
# now check the board to see if indexes contain "X" or "O"
   board[win_index[0]] == "X" &&
   board[win_index[1]] == "X" &&
   board[win_index[2]] == "X" ||
   board[win_index[0]] == "O" &&
   board[win_index[1]] == "O" &&
   board[win_index[2]] == "O" &&
# You can also code the following. "X" or "O" are placed across all indexes
#   board[win_index[0]] == board[win_index[1]] &&
#   board[win_index[1]] == board[win_index[2]] &&
   position_taken?(board, win_index[0])
# position_taken? checks if win_index[0] is not nil or not equal to " "
  end
end

def full?(board)
  board.all? { |full| full == "X" || full == "O"}
  # Evaluates board indexes to true if "all" are equal to "X" or "O"
end

def draw?(board)
  !won?(board) && full?(board)
  # Returns true if the board is full and not won,
  # or false if the board is not full
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
  # Returns true if board has been won, is a draw, or is full
end

def winner(board)
#  if who_won = won?(board)
#    board[who_won.first]
#  end
  winner = won?(board) # assign above Method to a local variable
     if winner == nil # if no winner, return "nil"
        nil
     elsif board[winner[0]] == "X" # if return values equal to "X", return "X"
        "X"
     else board[winner[0]] == "O" # if return values equal to "O", return "O"
        "O"
     end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
   puts "Congratulations #{winner(board)}!"
  else draw?(board)
   puts "Cats Game!"
  end
end
