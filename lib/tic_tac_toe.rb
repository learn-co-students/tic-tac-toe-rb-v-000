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
  
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index = user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  (board[index] == "X" || board[index] == "O") 
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
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
  board.count do |input| 
  input == "X" || input == "O"
  end
end

def current_player(board)
 number = turn_count(board)
 if number % 2 == 0
  return "X"
 else
  return "O"
 end
end

def won?(board)
  WIN_COMBINATIONS.find do |win_array|
    board[win_array[0]] == board[win_array[1]] && board[win_array[0]] == board[win_array[2]] && position_taken?(board, win_array[0])
  end
end

def full?(board)
  board.all? do |full_array|
  full_array == "X" || full_array == "O"
 end
end

def draw?(board)
  full?(board) && !won?(board) 
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board) 
  winner = board[won?(board)[0]]
  end
end

def play(board)
 until over?(board) 
 turn(board)
end
 if draw?(board) 
   puts "Cat's Game!"
 else won?(board)
   puts "Congratulations #{winner(board)}!"
 end
end


