require 'pry'
WIN_COMBINATIONS = [
 [0,1,2], # Top row
 [3,4,5], # Middle row
 [6,7,8], # Bottom row
 [0,3,6], # First column
 [1,4,7], # Second column
 [2,5,8], # Third column
 [0,4,8], # Left diagonal
 [2,4,6]  # Right diagonal
]

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

def move(board, index, value)
  board[index] = value
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
   false
   elsif board[index] == "X" || board[index] == "O"
   true
  end
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    # value = current_player(board)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
    board.each do |turn_count|
      if turn_count == "X" || turn_count == "O"
      counter += 1
      end
    end
  counter
end

def current_player(board)
      if turn_count(board) % 2 == 0
        "X"
      else
        "O"
    end
end 

def won?(board)
  WIN_COMBINATIONS.find do |win_combo|
  board[win_combo[0]] == board[win_combo[1]] && board[win_combo[1]] == board[win_combo[2]] && position_taken?(board, win_combo[0])
  end
end

def full?(board)    
  board.all?{ |token| token == "X" || token == "O" }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  win_combo = won?(board)
  
  if(win_combo)
    board[win_combo[0]]
  end
end

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


  