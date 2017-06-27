require 'pry'

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

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} \n
    -----------\n
     #{board[3]} | #{board[4]} | #{board[5]} \n
    -----------\n
     #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, position, player_token)
  board[position] = player_token
end

def position_taken?(board, position)
   !!/(X|O)/.match(board[position])
end

def valid_move?(board, position)
  position >= 0 && position < board.length && !position_taken?(board, position)
end

def turn(board)
  position = input_to_index(gets.chomp("enter your space"))
  while !valid_move?(board, position)
    position = input_to_index(gets.chomp)
  end
  move(board, position, "X")
end
