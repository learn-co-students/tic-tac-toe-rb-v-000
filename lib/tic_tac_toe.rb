#Helper Methods:

#constant with a nested array with winning combinations for tic tac toe
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

#Display Board
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#Input to Index to take player's number and translate it to an index to match
#the board
user_input = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
def input_to_index(user_input)
  index = (user_input).to_i - 1
end

#Move
def move(board, index, input)
  board[index] = input
end

#Position Taken?
def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else board[index] == "X" || board[index] == "O"
    true
  end
end

#Valid Move?
def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0,8)
    true
  end
end

#Turn
def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
  if valid_move?(board, index) == true
    move(board, index, input)
    display_board(board[index])
  else
    puts "Invalid entry. Please enter 1-9:"
    until valid_move?(board, index) == true
      input = gets.strip
      index = input_to_index(input)
      move(board, index, input)
      display_board(board[index])
    end
  end
end
