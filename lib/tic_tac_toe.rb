require 'pry'
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  (user_input).to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  if board[index] == " "
    false
  elsif board[index] == ""
    false
  elsif board[index] == nil
    false
  elsif board[index] == "X" || board[index] == "O"
    true
  end
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0, 8)
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
 board.count do |space|
   space == "X" || space == "O"
 end
end



def current_player(board)
  if turn_count(board).even?
   "X"
  else turn_count(board).odd?
   "O"
  end
end

def won?(board)
WIN_COMBINATIONS.detect do |win_combinations|
  index_1 = win_combinations[0]
  index_2 = win_combinations[1]
  index_3 = win_combinations[2]
  
  position_1 = board[index_1]
  position_2 = board[index_2]
  position_3 = board[index_3]
  
  position_1 == position_2 && position_2 == position_3 && position_taken?(board, index_1)
  
end
end

def full?(board) 
 board.all?{|space| space =="X"|| space =="O"}
end 
 
def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) 
end

def winner(board)
  if winc = won?(board)
    board[winc.first]
  end
end

#def play
  
def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
   puts "Congratulations #{winner(board)}!" 
 elsif draw?(board)
   puts "Cat's Game!"
 end
 end


