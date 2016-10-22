require 'pry'

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

def move(board, index, playa)
  board[index] = playa
end

WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Left column
  [1, 4, 7], # Middle column
  [2, 5, 8], # Right column
  [2, 4, 6], # Diagonal 1
  [0, 4, 8]  # Diagonal 2
]

def valid_move?(gameboard, position)
  if position.between?(0,8)
    if !position_taken?(gameboard, position)
      return true
    end
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(arg)
  counter = 0
  arg.each do |n|
    if n == "X" || n == "O"
      counter += 1
    end
  end
  counter
end

def current_player(arg)
  placeholder = turn_count(arg)
  placeholder % 2 == 0 ? "X" : "O"
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.detect do |wincombo|
    board[wincombo[0]] == board[wincombo[1]] &&
    board[wincombo[1]] == board[wincombo[2]] &&
    position_taken?(board, wincombo[0])
  end
end

def full?(board)
  board.all? do |megatron|
    megatron == "X" || megatron == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  winface = won?(board)
  if won?(board)
    return board[winface[0]]
  else
    return nil
  end
end


def play(board)
 until over?(board)
    turn(board)
 end
 if won?(board)
   winface = winner(board)
   puts "Congratulations #{winface}!"
 elsif draw?(board)
   puts "Cats Game!"
 end
end
