# HELPER METHODS

# prints the current board representation based on the board argument passed to the method.
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#nested array filled with the index values for the various win combinations in tic tac toe.
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]


#This method takes the user_input (which is a string), converts it to an Integer, and subtracts
#1. Remember that, from the player's point of view, the board contains spaces 1-9.
# But, an array's indexes start their count at 0.
def input_to_index(string)
  string.to_i - 1
end

#The move method must take in three arguments: 1) the board array,
#2) the index in the board array that the player would like to fill out with an "X" or and "O", and
#3) the player's character (either "X" or "O")
def move(board, index, token)
  board[index] = token
end



#The #position_taken? method will be responsible for evaluating the position selected by the user against the Tic Tac Toe board and
#checking to see whether or not that index on the board array is occupied. If the user would like to fill out position 1,
#our #position_taken? method will check to see if that board index is vacant or if it contains an "X" or an "O".
#If the position is free, the method should return false (i.e. "not taken"), otherwise it will return true.
def position_taken?(board, index)
    !(board[index] == " ")
end


#valid_move? that accepts a board and an index to check and returns true if the move is valid and false or nil if not.
#A valid move means that the submitted position is: Present on the game board. Not already filled with a token.
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

#The turn method to encapsulate the logic of a single complete turn composed of the following routine:
#Asking the user for their move by position 1-9.
#Receiving the user input. Convert user input to an index
#If the move is valid, make the move and display board.
#Otherwise (that is, if the move is invalid) ask for a new position until a valid move is received.

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
     move(board, index, current_player(board))
     display_board(board)
  else
    turn(board)
  end
end

##TURN_COUNT method takes in an argument of the board array and returns the number of turns that have been played.
def turn_count(board)
   9 - board.count(" ")
end


#The current_player method should take in an argument of the game board and use the #turn_count method to determine if it is "X"'s turn or "O"'s.
def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

#The #won? method should accept a board as an argument and return false/nil if there is no win combination present in the board and
#return the winning combination indexes as an array if there is a win. Use your WIN_COMBINATIONS constant in this method.
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    board[win_combination[0]] == board[win_combination[1]] &&
     board[win_combination[1]] == board[win_combination[2]] &&
     position_taken?(board, win_combination[0])
  end
end

#The #full? method should accept a board and return true if every element in the board contains either an "X" or an "O".
def full?(board)
  board.all? {|token| token == "X" || token == "O"}
end

#The draw? method accepts a board and returns true if the board has not been won and is full and
#false if the board is not won and the board is not full, and false if the board is won.
def draw?(board)
  full?(board) && !won?(board)
end

# The over? method accepts a board and returns true if the board has been won, is a draw, or is full.
def over?(board)
  won?(board) || draw?(board) || full?(board)
end

#The winner method should accept a board and return the token, "X" or "O" that has won the game given a winning board.
def winner(board)
 if win_combo = won?(board)
   board[win_combo.first]
 end
end

def play(board)
  while !over? (board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
