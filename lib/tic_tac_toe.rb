# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2],
]

#Define a method that prints the current board representation based on the board argument passed to the method.
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#This method takes the user_input (which is a string), converts it to an Integer, and subtracts 1. Remember that, from the player's point of view, the board contains spaces 1-9. But, an array's indexes start their count at 0.
def input_to_index(input)
  input.to_i - 1
end

#The move method must take in three arguments: 1) the board array, 2) the index in the board array that the player would like to fill out with an "X" or and "O", and 3) the player's character (either "X" or "O").
def move(board, index, char)
  board[index] = char
end

#The position_taken? method will be responsible for evaluating the position selected by the user against the Tic Tac Toe board and checking to see whether or not that index on the board array is occupied.
def position_taken?(board, index_number)
  if board[index_number] == "X" || board[index_number] == "O"
    return true
  else
    false
  end
end

#Build a method valid_move? that accepts a board and an index to check and returns true if the move is valid and false or nil if not
def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0,8)
    true
  else
    false
  end
end

#Build a method #turn to encapsulate the logic of a single complete turn.
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

#TURN_COUNT - This method takes in an argument of the board array and returns the number of turns that have been played.
def turn_count(board)
  counter = 0
  board.each do |count|
    if count == "X" || count == "O"
      counter += 1
    end
  end
  counter
end

#CURRENT_PLAYER method takes an argument of TURN_COUNT method to determine if it is x's turn or o's.
def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

#WON should accept a board as an argument and return false/nil if there is no win combination present in the board and return winning indexes as an array if there is a win.
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_combination.all? {|win_index| board[win_index] == "X" } ||
    win_combination.all? {|win_index| board[win_index] == "O" }
  end
end

#FULL should accept a board and return true if every element in the board contains either an "X" or an "O".
def full?(board)
  board.all? {|board_position| %w[X O].include?(board_position)}
end

#DRAW?
def draw?(board)
  !won?(board) && full?(board)
end

#OVER?
def over?(board)
  won?(board) || draw?(board) || full?(board)
end

#WINNER
def winner(board)
  won?(board) && board[won?(board)[0]]
end

#PLAY METHOD
def play(board)
  until over?(board) do
    turn(board)
  end
end
