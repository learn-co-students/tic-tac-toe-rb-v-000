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
board = ["X", "X", "X", "X", "X", "X", "X", "X", "X"]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# input_to_index 
def input_to_index(input)
   input.to_i - 1
end

# move
def move(board, index, current_player)
   board[index] = current_player
end

# valid_move? 
def valid_move?(board, index)
  if index < 0  || index > 8
    return false
  elsif board[index] == "X" || board[index] == "O"
    return false
  else
    true
  end
end

# position_taken? 
def position_taken?(board, index)
    if board[index] == " "
    return false
    elsif board[index] == "X" || "O" 
    return true 
 end
end

# turn 
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
  move(board, index)
  display_board(board)
  else 
    turn(board)  
  end
end


# rspec spec/01_tic_tac_toe_spec.rb