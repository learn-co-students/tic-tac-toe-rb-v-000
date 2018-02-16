WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Left start diagonal
  [2,4,6]  #Right start diagonal
]

def display_board(board)
 
  puts" O | X | O "
  puts" O | X | X "
  puts"-----------"
  puts" X | O | X "
  puts" X | O | O "
  puts" X | X | X "
  
end 
   
def input_to_index(move)
   index = move.to_i - 1
   index
end
 
def move(board, index, token) 
   board[index] = token
end 

def position_taken?(board, index)
 !(board[index] == " " || board[index] == "" || board[index] == nil)
end
  

def valid_move?(board, index)
  if (board[index] == ""|| board[index] == " "||
    board[index] == " " || board[index] == " ")
    true   
  elsif
    true 
  elsif
  nil 
else
  false
end 
end 
  