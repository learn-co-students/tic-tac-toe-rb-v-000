require "pry"

WIN_COMBINATIONS = [[0,1,2],
  [3,4,5],[6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} 
-----------
 #{board[3]} | #{board[4]} | #{board[5]} 
-----------
 #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(array, position, value)
  array[position] = value
end

def position_taken?(board, index)
 !(board[index] == " " || board[index] == "" || board[index] == nil)
end

def valid_move?(board, index)
    index.between?(0, 8) && !position_taken?(board, index) 
 end
 
 def turn(board)
  puts "Please enter 1-9:"
 user_input = gets.strip
 index = input_to_index(user_input)
 value = current_player(board)
 if valid_move?(board, index) == true
   #binding.pry
   move(board, index, value)
 display_board(board)
 else 
   turn(board)
  end
end

def turn_count(board)
  board.count { |x| x !=" "}
end

def current_player(board)
  if 
    turn_count(board) % 2 == 0
"X"
else
  "O"
  end
end

def won?(board)
WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      false
    end
  end
  nil
end

def full?(board)
    !board.any? {|x|
      x == " "}
  end
  
def draw?(board)
    if
      won?(board)
    else
      full?(board)
  end
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if index = won?(board)
  board[index[0]]
end
end

def play(board)
  
  while !over?(board)
turn(board)
end
if winner(board) == "X"
  puts "Congratulations X!"
  elsif winner(board) == "O"
  puts "Congratulations O!"
else 
  puts "Cat's Game!"
end
end