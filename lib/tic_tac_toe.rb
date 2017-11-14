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

def play(board)
  while !over?(board)
    turn(board)
  end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, position)
  position.between?(0,8) && !position_taken?(board, position)
end
def input_to_position(user_input)
  user_input.to_i - 1
end
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
 position = input_to_position(user_input)
 if !valid_move?(board, position)
   turn(board)
 move(board, position, current_player(board))
  display_board(board)
end
def position_taken?(board, position)
  board[position]== "X" || board[position] == "O"
  # Creates a stop on RSpec
  # !(board[location].nil? || board[location] == "")
end
def move(board, position, player)
  board[position] = player
end
