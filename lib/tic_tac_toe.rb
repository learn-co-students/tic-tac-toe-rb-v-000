require 'pry'

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end




WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]

def input_to_index(user_input)
  converted_input = user_input.to_i - 1
end

def move(board, converted_input, player)
  board[converted_input] = player
end

def position_taken?(board, index)
 if board[index] == "X" || board[index] ==  "O"
   true
 else
   false
 end
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0, 8)
    true
  else
    false
  end
end


def turn_count(board)
  counter = 0
  board.count do |count|
  if count == "X" || count == "O"
  counter += 1
end
end
end

def current_player(board)
  if turn_count(board) % 2 == 0
  "X"
  else "O"
end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    board[index] = current_player(board)
    display_board(board)
  else
    turn(board)
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])

  end
end

def full?(board)
  board.all? {|square| square == "X" || square == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end


def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    player = won?(board)
    index = player.first
    board[index]
  else
    nil
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
