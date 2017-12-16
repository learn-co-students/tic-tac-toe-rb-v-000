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

board = [" "," "," "," "," ","  "," "," "," "]

# Helper Method
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#INPUT_TO_INDEX
# Once the user inputs where they would like to go on the board, we then have to convert this to the board index
# multiple times. Instead of doing that in a lot of places, we can remove this repetitive code and put it in this
# helper method. This method takes the user_input (which is a string), converts it to an Integer, and subtracts 1.
# Remember that, from the player's point of view, the board contains spaces 1-9. But, an array's indexes
# start their count at
def input_to_index(user_input)
  user_input = user_input.to_i       # converts string into integer
  index = user_input - 1             # Change user input to array index.
end

# MOVE
# Your #move method must take in three arguments: 1) the board array, 2) the index in the board array that the player
# would like to fill out with an "X" or and "O", and 3) the player's character (either "X" or "O"). We previously
# had you write this method with a default argument of "X" for the third argument, but that is no longer needed.
def move(board, index, token)
  board[index] = token
  display_board(board)
end

# POSITION_TAKEN?
# The #position_taken? method will be responsible for evaluating the position selected by the user against the Tic
# Tac Toe board and checking to see whether or not that index on the board array is occupied. If the user would
# like to fill out position 1, our #position_taken? method will check to see if that board index is vacant or if it
# contains an "X" or an "O". If the position is free, the method should return false (i.e. "not taken"), otherwise
# it will return true.
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# VALID_MOVE?
# Build a method valid_move? that accepts a board and an index to check and returns true if the move is valid and false
# or nil if not. A valid move means that the submitted position is:
# 1. Present on the game board.
# 2. Not already filled with a token.
def valid_move?(board, index)
  !position_taken?(board, index) &&  index.between?(0, 8)
end

#TURN
#Build a method #turn to encapsulate the logic of a single complete turn composed of the following routine:

# 1. Asking the user for their move by position 1-9.
# 2. Receiving the user input.
# 3. Convert user input to an index
# 4. If the move is valid, make the move and display board.
# 5. Otherwise (that is, if the move is invalid) ask for a new position until a valid move is received.
def turn(board)
  valid_move  = false
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  valid_move = valid_move?(board, index)
  if valid_move
    token = current_player(board)
    move(board, index, token)
  else
    turn(board)
  end
end

# TURN_COUNT
# This method takes in an argument of the board array and returns the number of turns that have been played.
def turn_count(board)
  counter = 0
  board.each do |board_element|
    if board_element == "X" || board_element == "O"
       counter += 1
      # puts "Board element is: #{board_element}. Occupied elements are #{counter}"
    end
  end
  return counter
end

# CURRENT_PLAYER
# The #current_player method should take in an argument of the game board and use the #turn_count method to determine
# if it is "X"'s turn or "O"'s.
def current_player(board)
  counter = turn_count(board)
  if counter % 2 == 0
    return "X"
  else
    return "O"
  end
end

# PLAY
# The play method is the main method of the tic tac toe application and is responsible for the game loop. A
# tic tac toe game must allow players to take turns, checking if the game is over after every turn, and at the
# conclusion of the game, whether because it was won or because it was a draw, reporting to the user the
# outcome of the game. You can imagine the pseudocode:
def play(board)
  counter = turn_count(board)
  until over?(board)  || counter >  10
    turn(board)
    over?(board)
    counter = turn_count(board)
  end

  # Check if game is draw or won, returns X if X won else return O if O won
  if won?(board)
    winner_char = winner(board)
    puts  "Congratulations #{winner_char}!"
  else
    puts  "Cat's Game!"
  end
end

# WON?
# Your #won? method should accept a board as an argument and return false/nil if there is no win combination
# present in the board and return the winning combination indexes as an array if there is a win. Use your
# WIN_COMBINATIONS constant in this method.
def won?(board)
   WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

# FULL?
# The #full? method should accept a board and return true if every element in the board contains either an "X" or an "O".
def  full?(board)
    board.none?{|x| x == "" || x == " " || x = nil}
end

#DRAW?
# Build a method #draw? that accepts a board and returns true if the board has not been won and is full and false if the
# board is not won and the board is not full, and false if the board is won.
def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
end

# OVER?
# Build a method #over? that accepts a board and returns true if the board has been won, is a draw, or is full
def over?(board)
  if (won?(board) || full?(board) || draw?(board))  || (won?(board) && !full?(board))
    return true
  else
    return false
  end
end

# WINNER
# The #winner method should accept a board and return the token, "X" or "O" that has won the game given a winning board.
def winner(board)
  if winner_array = won?(board)
    return board[winner_array[0]]
  else
    return nil
  end
end
