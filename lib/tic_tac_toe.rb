# WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5,],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]

# display_board 
def display_board(board)
  puts "   ""|""   ""|""   "
  puts "-----------"
  puts "   ""|""   ""|""   "
  puts "-----------"
  puts "   ""|""   ""|""   "
end

board = ["X", "X", "X", "X", "O", "O", "X", "O", "O"]


# rspec spec/01_tic_tac_toe_spec.rb