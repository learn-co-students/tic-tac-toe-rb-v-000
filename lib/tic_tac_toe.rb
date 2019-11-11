require 'pry'
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6] 
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, position, token)
  board[position] = token
end

def position_taken?(board, position)
  board[position] == "X" || board[position] == "O"
end

def valid_move?(board, position)
  position.between?(0, 8) && !position_taken?(board, position)
end

def turn(board)
  puts "Choose a position (1-9):"
  position = input_to_index(gets.strip)
  valid_move?(board, position) ? move(board, position, current_player(board)) : turn(board)
end

def turn_count(board)
  board.count {|position| position_taken?(board, board.index(position))}
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    (board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X") ||
    (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O")
  end
end

def full?(board)
  turn_count(board) == 9
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  winning_combo = WIN_COMBINATIONS.select do |combo|
    (board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X") ||
    (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O")
  end
  !winning_combo.empty? ? board[winning_combo.first.first] : nil
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end