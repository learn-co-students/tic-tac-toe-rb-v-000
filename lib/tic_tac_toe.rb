
WIN_COMBINATIONS = [ # Constant stores ordered list (nested array) with index values representing tic tac toe winning combinations.

  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Middle row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Diagnol left
  [6,4,2] # Diagnol right
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


def move(board, index, position)
  board[index] = position
end


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0,8)
end


def turn(board)
  puts "Welcome to Tic Tac Toe! Please enter 1-9:"
  input = gets.strip.to_i
  index = input_to_index(input)
  position = current_player(board)

  if valid_move?(board, index)
    move(board, index, position) && display_board(board)
  else
    puts "Invalid move, try again!"
    turn(board)
  end
end


def turn_count(board)
  count = 0
  board.each do |b|
  if count <= 9 &&  b == "X" || b == "O"
    count += 1
  end
end
  count
end


def current_player(board)
  turn_count(board).even? ? board = "X" : board = "O"
end


def won?(board)
  WIN_COMBINATIONS.detect do |w|
  board[w[0]] == board[w[1]] && board[w[2]] == board[w[0]] && position_taken?(board, w[0])
  end
end


def full?(board)
  board.all? do |b|
  b == "X" || b == "O"
  end
end


def draw?(board)
  full?(board) && !won?(board)
end


def over?(board)
  full?(board) || draw?(board) || won?(board)
end


def winner(board)
  if b = won?(board)
    board[b.first]
  end
end


def play(board)
  until over?(board)
    turn(board)
  end
  if winner(board)
    puts "Congratulations X!"
    puts "Congratulations O!"
  else draw?(board)
    puts "Cat's Game!"
  end
end
