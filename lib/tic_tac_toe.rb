require 'pry'
# code all game methods here

# Define WIN_COMBINATIONS constant with arrays for each win combo
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # LT to RB diagonal
  [6,4,2] # LB to RT diagonal
  ]

#prints current board based on board argument
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#converts the number user_input to an integer
def input_to_index(user_input)
  user_input.to_i - 1
end

#move method
def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:" # ask for input
  input = gets.strip # get input
  index = input_to_index(input) # convert the number input to index
  if valid_move?(board, index) # if move is valid
    move(board, index, current_player(board)) # make move
    display_board(board) # show updated board
  else # if move is not valid ask for a new position until valid move is received
    turn(board)
  end
 end

def turn_count(board)
  board.count do |position|
    position != " "
  end
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    board[win_combo[0]] == board[win_combo[1]] && board[win_combo[1]] == board[win_combo[2]] && position_taken?(board, win_combo[0])
  end
end

def full?(board)
  board.all? { |position| position != " " }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end
# winner(board) => token of winner "X" or "O" and nil
def winner(board)
  if win_combo = won?(board)
    board[win_combo.first]
  else
    nil
  end
end

def play(board)
  until over?(board) # until the game is over
    turn(board) #   take turns
  end # end

  if won?(board) # if the game was won
    puts "Congratulations #{winner(board)}!" #   congratulate the winner
  else  # else if the game was a draw
    puts "Cat's Game!" #   tell the players it has been a draw
  end
end
