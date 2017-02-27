# We'll be getting user input via `gets` and a player will choose a position on the board by entering 1-9.
# Our program will then fill out the appropriate position on the board with the player's token.
# The term 'position' will refer to the spot on the board as the player sees it (1-9).
#
# We will keep track of which player's turn it is and how many turns have been played. We will check to see, at every
# turn, if there is a winner. If there is a winner, we'll congratulate them. If there is a tie, we will inform our
# players.
#
# ## Instructions
# ### Helper Methods
# Open up `lib/tic_tac_toe.rb`. You'll be coding your helper methods here. Run the tests for these methods by typing
# `rspec spec/01_tic_tac_toe_spec.rb` in the terminal. Use the test output, along with the guidelines below, to
# build these methods.
#
# #### `WIN_COMBINATIONS`
# Define a constant in `lib/tic_tac_toe.rb` `WIN_COMBINATIONS` and set it equal to a nested array filled with the
# index values for the various win combinations in tic tac toe.
#
WIN_COMBINATIONS =
[[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[2,4,6]]

#
# #### `#display_board`
# Define a method that prints the current board representation based on the `board` argument passed to the method.
def display_board(board)
puts " #{board[0]} | #{board[1]} | #{board[2]} \n-----------\n #{board[3]} | #{board[4]} | #{board[5]} \n-----------\n #{board[6]} | #{board[7]} | #{board[8]} "
return " #{board[0]} | #{board[1]} | #{board[2]} \n-----------\n #{board[3]} | #{board[4]} | #{board[5]} \n-----------\n #{board[6]} | #{board[7]} | #{board[8]} "
end

# #### `#input_to_index`
# Once the user inputs where they would like to go on the board, we then have to convert this to the board index
# multiple times. Instead of doing that in a lot of places, we can remove this repetitive code and put it in this
# helper method. This method takes the user_input (which is a string), converts it to an Integer, and subtracts 1.
# Remember that, from the player's point of view, the board contains spaces 1-9. But, an array's indexes start their
# count at 0.

#Take players 1-9 input and turn it into a board input 0-8
def input_to_index(input)
  return index = input.to_i - 1
end

# #### `#move`
# Your `#move` method must take in three arguments: **1)** the board array, **2)** the index in the board array that
# the player would like to fill out with an "X" or and "O", and **3)** the player's character (either "X" or "O").
# We previously had you write this method with a default argument of "X" for the third argument, but that is no
# longer needed.
# create a move for player
def move(board, index, character)
  board[index] = character
  turn_count(board)
  display_board(board)
end

# #### `#position_taken?`
# The `#position_taken?` method will be responsible for evaluating the position selected by the user against the
# Tic Tac Toe board and checking to see whether or not that index on the board array is occupied. If the user would
# like to fill out position 1, our `#position_taken?` method will check to see if that board index is vacant or if it
# contains an "X" or an "O". If the position is free, the method should return `false` (i.e. "not taken"), otherwise
# it will return `true`.
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# #### `#valid_move?`
# Build a method `valid_move?` that accepts a board and an index to check and
# returns `true` if the move is valid and `false` or `nil` if not. A valid move means that the submitted position is:
# 1. Present on the game board.
# 2. Not already filled with a token.
#Check for whether the input is a valid move
def valid_move?(board, index)
index.between?(0,8) && !position_taken?(board, index)
end

# #### `#turn`
# Build a method `#turn` to encapsulate the logic of a single complete turn composed of the following routine:
# 1. Asking the user for their move by position 1-9.
# 2. Receiving the user input.
# 3. Convert user input to an index
# 4. If the move is valid, make the move and display board.
# 5. Otherwise (that is, if the move is invalid) ask for a new position until a valid move is received.
#
# All these procedures will be wrapped into our `#turn` method. However, the majority of the
# logic for these procedures will be defined and encapsulated in individual methods which you've already built.
# You can imagine the pseudocode for the `#turn` method:
#
# ```
# ask for input
# get input
# convert input to index
# if move is valid
#   make the move for index and show board
# else
#   ask for input again until you get a valid move
# end
# ```
# def turn(board)
#   puts "Please enter 1-9:"
#   input = gets.chomp
#   index = input_to_index(input)
#   if valid_move?(board, index) == true
#   move(board, index, character)
#   puts display_board(board)
#   else
#   position_taken?(board, index)
#   turn(board)
#   end
# end

# def turn(board)
#   puts "Do you want to be X's or O's?"
#   character = gets.chomp
#   puts "Please enter 1-9:"
#   input = gets.strip
#   index = input_to_index(input)
#   m = valid_move?(board, index)
#   if m == true
#     move(board, index, character)
#   else m == false
#     until m == true
#       puts "Sorry, that was an invalid move. Please enter 1-9:"
#       display_board(board)
#       input = gets.strip
#       index = input_to_index(input)
#       m = valid_move?(board, index)
#       move(board, index, character)
#     end
#   end
# end

def turn(board)
  puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    m = valid_move?(board, index)
  if m == true
    character = current_player(board)
    move(board, index, character)
  else m == nil
    puts "Sorry, that was an invalid move. Please enter 1-9:"
    display_board(board)
    # turn(board)
    input = gets.strip
    index = input_to_index(input)
    m = valid_move?(board, index)
  end
end

# #### `#turn_count`
# This method takes in an argument of the board array and returns the number of turns that have been played.
#Take in argument of the board array and return the number of turns that have been played
def turn_count(board)
count = 0
board.each do |play|
  if play == "X" || play == "O"
  count += 1
  end
end
count
end

# #### `#current_player`
# The `#current_player` method should take in an argument of the game board and use the `#turn_count` method to determine if it is `"X"`'s turn or `"O"`'s.
def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

# #### `#won?`
# Your `#won?` method should accept a board as an argument and return false/nil if there is no win combination present in the board and return the winning combination indexes as an array if there is a win. Use your `WIN_COMBINATIONS` constant in this method.
def won?(board)
  WIN_COMBINATIONS.find do |win_combination|
    board[win_combination[0]] == board[win_combination[1]] && board[win_combination[0]] == board[win_combination[2]] && position_taken?(board, win_combination[0])
  end
end

# #### `#full?`
# The `#full?` method should accept a board and return true if every element in the board contains either an "X" or an "O".
def full?(board)
  board.none? do |i|
    i == " " || i.nil?
  end
end

# #### `#draw?`
# Build a method `#draw?` that accepts a board and returns true if the board has not been won and is full and false
# if the board is not won and the board is not full, and false if the board is won.
def draw?(board)
  won?(board) == nil && full?(board) == true
end

# #### `#over?`
# Build a method `#over?` that accepts a board and returns true if the board has been won, is a draw, or is full.
def over?(board)
  draw?(board) == true || won?(board) != nil
end

# #### `#winner`
# The `#winner` method should accept a board and return the token, "X" or "O" that has won the game given a winning board.
def winner(board)
  if won?(board) != nil
    winner = board[won?(board)[0]]
  end
end

# ### Putting it all together: the `#play` method
# #### `#play`
# The play method is the main method of the tic tac toe application and is responsible for the game loop.
# A tic tac toe game must allow players to take turns, checking if the game is over after every turn, and at the
# conclusion of the game, whether because it was won or because it was a draw, reporting to the user the outcome of
# the game. You can imagine the pseudocode:
#
# ```
# until the game is over
#   take turns
# end
#
# if the game was won
#   congratulate the winner
# else if the game was a draw
#   tell the players it has been a draw
# end
# ```
def play(board)
until over?(board) == true
  turn(board)
end
if draw?(board) == true
  puts "Cats Game!"
else won?(board)
  puts "Congratulations #{winner(board)}!"
end
end


# Run the tests for the `#play` method by typing `rspec spec/02_play_spec.rb` in your terminal.
#
