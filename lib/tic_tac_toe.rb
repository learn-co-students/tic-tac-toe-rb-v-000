require 'pry'
WIN_COMBINATIONS =
[[ 0, 1, 2 ], #top row
[ 3, 4, 5 ], #middle row
[ 6, 7, 8 ], #bottom row
[ 0, 3, 6 ], #first column
[ 1, 4, 7 ], #second column
[ 2, 5 , 8], #third column
[ 0, 4, 8 ], #first diagonal
[ 6, 4, 2 ] #second diagonal
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your input_to_index and move method here!
#
#

def input_to_index(input)
  user_input=input.to_i
  user_input - 1
end

def move (array, index, player)
#binding.pry
array[index]=player
end

def position_taken?(board, index)
#binding.pry
#index=input_to_index(index)
  !(board[index].nil? || board[index] == " ")

end

def valid_move?(board, index)
  #  binding.pry
  check=index
  board.any do |check|
    board[check] == " "
  end

    end
=begin if position_taken?(board, index) == true
   return false
# elsif position_taken?(board, position)==nil
#   return true
elsif position_taken?(board, index) == false
  return true
 end
binding.pry
=end
end
