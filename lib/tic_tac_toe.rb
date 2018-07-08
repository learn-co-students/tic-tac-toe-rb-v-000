require 'pry'
# WIN_COMBINATIONS constant
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

# display_board 
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
    elsif board[index] == "X" || board[index] == "O" 
    return true 
 end
end

# move 
def move(board, index, current_player)
  board[index] = current_player
end

# turn 
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  
  if valid_move?(board,index)
  move(board, index, current_player(board))
  display_board(board)
  else 
    turn(board)
  end
end

# turn_count
def turn_count(board)
  counter = 0
  board.each do |board_var|
    if board_var == "X" || board_var == "O"
    counter += 1
  end
  end
  counter
end

# current_player
def current_player(board)
  if turn_count(board) % 2 == 0 
    return "X"
  else 
    return "O"
end
end

def won?(board)
  WIN_COMBINATIONS.detect do |winner|
  board[winner[0]] == board[winner[1]] && board[winner[2]] == board[winner[0]] && position_taken?(board,winner[0])
  end
end

def full?(board)
  board.all? do |full_var|
    full_var == "X" || full_var == "O"
  end
end


def draw?(board)
  if won?(board)
    return false
    elsif full?(board)  
      return true
  end
end

def over?(board)
    won?(board) || draw?(board)
end

def winner(board)
  index_array = won?(board)
  if index_array == nil 
    return nil
  end
  
  position = index_array[0]
    if board[position] == "X"
      return "X"
    elsif board[position] == "O"
      return "O"
  end 
end




# rspec spec/01_tic_tac_toe_spec.rb
# rspec spec/02_play_spec.rb

def play(board)
while !over?(board) 
  turn(board)
end
  if draw?(board)
  puts "Cat's Game!"
  elsif won?(board)
  puts "Congratulations #{winner(board)}!"
  end
end







