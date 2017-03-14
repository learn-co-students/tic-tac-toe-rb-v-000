#defines a constant WIN_COMBINATIONS with arrays for each win combination
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

#prints arbitrary arrangements of the board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#converts a user_input to an integer, subtracts 1 from the user_input, returns -1 for strings without integers
def input_to_index(user_input)
    user_input.to_i - 1
end

#does not allow for a default third argument, takes three arguments: board, position, and player token, allows "X" player in the bottom right and "O" in the top left
def move(board, index, player)
    board[index] = player
end

#returns true/false based on position in board
def position_taken?(board,position)
  if board[position] == " "
    false
    elsif board[position] == ""
    false
    elsif  board[position] == nil
    false
    else   board[position] == "X" || "O"
    true

  end
end

#returns true/false based on position
def valid_move?(board, index)
   if position_taken?(board, index)
     false
   elsif index.between?(0, 8)
    true
   else
     nil
   end
 end
