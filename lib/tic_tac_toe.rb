WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [0,4,8],
  [2,5,8],
  [6,4,2]
]

board = [" "," "," "," "," "," "," "," "," "]

def display_board(board)
 puts " #{board[0]} | #{board[1]} | #{board[2]} "
 puts "-----------"
 puts " #{board[3]} | #{board[4]} | #{board[5]} "
 puts "-----------"
 puts " #{board[6]} | #{board[7]} | #{board[8]} "
 end

def input_to_index(user_input)
   user_input = user_input.to_i - 1
 end

def move(board, index, value)
board[index] = value
end

def position_taken?(board, index)
if board[index] == " " || board[index] == "" || board[index] == nil
  return false
else true
  end
end

def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0, 8)
    return true
  end
  false
end

def turn(board, index)
  puts "Enter a number 1-9"
  user_input = gets.strip
  input_to_index(user_input)
  if valid_move(board, index)
    move(board, index, value)
    display_board(board, index)
  else
    turn(board, index)
  end
end
