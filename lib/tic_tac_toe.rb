
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], #ow row
  [0,3,6], #left column
  [1,4, 7], #mid coloumn
  [2,5,8],#ght column 
  [0, 4,8],
  [2,4,6]

# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
 

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
     puts "That is an invalid entry!"
    turn(board)
  end
end

# Define your play method below
def play(board) 

  input = 0
  puts "you only get x choices"
  while input <= 8 
  input += 1
  turn(board)
  
  
=======
  while index < 8 
 turn(board)
else
  puts "you only get x choices"
end
  
end


  # ETC, an array for each win combination
]
def won?(board)
WIN_COMBINATIONS.detect do |win_combo| 
  win_index_1 =  win_combo[0]
    win_index_2 =  win_combo[1]
      win_index_3 =  win_combo[2]
      
      position_1= board[win_index_1]
      position_2= board[win_index_2]
      position_3= board[win_index_3]
      
      position_1 == "X" && position_2 =="X" && position_3 == "X" || position_1 == "O" && position_2 =="O" && position_3 == "O"
      
    
    end  