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

def input_to_index(input)
  input.to_i - 1
end

def player_move(board, index, marker)
  board[index] = marker
end

def position_taken?(board, position)
  board[position] == "X" || board[position] == "O"
end

def valid_move?(board, index)
  input_to_index(index + 1).between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  if !valid_move?(board, index)
    turn(board)
  end
  if position_taken?(board, index)
    turn(board)
  else
    player_move(board, index, current_player(board))
  end
  display_board(board)
end

def turn_count(board)
  turn_count = 0
  board.each do |cell|
    if cell == "X" || cell == "O"
      turn_count += 1
    end
  end
  turn_count
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |var|
    board[var[0]] == board[var[1]] &&
    board[var[1]] == board[var[2]] &&
    position_taken?(board, var[0])
  end
end

def full?(board)
  board.all?{|marker| marker == "X" || marker == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if player_wins = won?(board)
    board[player_wins.first]
  end
end
