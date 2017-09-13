require 'pry'

WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[2,4,6],
]
def display_board(board)
  puts " #{board[0]} " "|" " #{board[1]} " "|" " #{board[2]} "
  puts "-----------"
  puts " #{board[3]} " "|" " #{board[4]} " "|" " #{board[5]} "
  puts "-----------"
  puts " #{board[6]} " "|" " #{board[7]} " "|" " #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, position, token)
  board[position] = token
end

def valid_move?(board, index)
  index.between?(0, 8) && position_taken?(board, index) == false
end

def position_taken?(board, index)
  if ((board[index] == " ") || (board[index] == "") || (board[index] == nil))
    false
  elsif ((board[index] == "X") || (board[index] == "O"))
    true
 end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  input = input_to_index(input)
  token = current_player(board)
  if valid_move?(board, input)
    move(board, input, token)
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  turn = 0
  board.each do |space|
    if space == "X" || space == "O"
      turn += 1
    end
  end
  turn
end

def current_player(board)
   turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |win|
    position_taken?(board, win[0] ) && board[win[0]] == board[win[1]] && board[win[2]] == board[win[0]]
  end
end

def full?(board)
  board.all? do |space|
  space == "X" || space == "O"
  end
end

def draw?(board)
  if won?(board)
    false
  elsif full?(board)
    true
 end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
   true
 end
end

def winner(board)
  if won?(board)
  win_index = won?(board)[2]
  board[win_index]
 end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
