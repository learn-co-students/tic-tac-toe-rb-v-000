### TIC TAC TOE ini Ruby
### HELPER methods

### WIN_COMBINATIONS constant ###
WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Left column
  [1, 4, 7], # Middle column
  [2, 5, 8], # Right column
  [0, 4, 8], # Diagonal
  [2, 4, 6], # Diagonal
]
#################################
### DISPLAY_BOARD method ###
#board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "

end
############################
### INPUT_TO_INDEX method ###
def input_to_index(user_input)
  user_input.to_i - 1
end
#############################
### MOVE method ###
def move(board, position, character)
#def move(board, index, character)
  board[position.to_i] = character
end
###################
### POSITION_TAKEN? method ###
def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  #else board[index] == "X" || board[index] = "O"
else true
end
end
##############################
### VALID_MOV? method ##############
def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0, 8) == true
    true
  else
    false
#  if valid_move?.between(0, 8)
  #  true
end
end
####################################
### TURN method ##############
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
index = input_to_index(user_input)
if valid_move?(board, index) == false
  #puts "Please enter 1-9:"
  #use recursion instead
  turn(board) #recursive
else
  move(board, index, character = "X")
  display_board(board)
end
end
##############################
### TURN_COUNT method ##############
def turn_count(board)
9 - board.count(" ")
end
####################################
### CURRENT_PLAYER method ##############
def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end
########################################
### WON? method ##############
def won?(board)
WIN_COMBINATIONS.detect do |win_combinations|
board[win_combinations[0]] == "X" && board[win_combinations[1]] == "X" && board[win_combinations[2]] == "X" || board[win_combinations[0]] == "O" && board[win_combinations[1]] == "O" && board[win_combinations[2]] == "O"
    end
  end
##############################
### FULL? method ##############
def full?(board)
#if board.none?{|player| player = " "}
if board.all?{|player| player == "X" || player == "O"}
true
else
  false
end
end
###########@###################
### DRAW? method ##############
def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
end
end
###############################
### OVER? method ##############
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
end
end
###############################
### WINNER method ##############
def winner(board)
if win_combinations = won?(board)
  board[win_combinations[0]]
end
end
################################
### PLAY method ##############
def play(board)
end
##############################
