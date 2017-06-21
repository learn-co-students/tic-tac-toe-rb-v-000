require 'pry'
WIN_COMBINATIONS = [
  [0, 1, 2], # Top row win
  [3, 4, 5], # Middle row win
  [6, 7, 8], # Bottom row win
  [0, 3, 6], # First column win
  [1, 4, 7], # Middle column win
  [2, 5, 8], # Last column win
  [0, 4, 8], # Left diagonal win
  [2, 4, 6]  # Right diagonal win
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

def move(board, input_to_index, player)
  board[input_to_index] = player
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    true
  else board[index] == " " || board[index] == ""
    false
  end
end

def valid_move?(board, index)
  if index.between?(0,8) && position_taken?(board,index) == false
    true
  else
    false
  end
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
  counter = 0
  board.each do |cell|
    if cell == "X" || cell == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
  end
end

full_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

def full?(full_board)
  full_board.all?{|cell| cell == "X" || "O"}
  full_board.none?{|cell| cell == " "}
end

draw_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

def draw?(draw_board)
  !won?(draw_board) && full?(draw_board)
end

def over?(draw_board)
  won?(draw_board) || draw?(draw_board)
end

def winner(draw_board)
  if won?(draw_board)
    winning_combo = won?(draw_board)
    draw_board[winning_combo[0]]
  else
    nil
  end
end

def play(draw_board)
  while !over?(draw_board)
    turn(draw_board)
  end
  if draw?(draw_board)
    puts "Cats Game!"
  end
  if winner(draw_board) == "X"
    puts "Congratulations X!"
  else
    puts "Congratulations O!"
  end
end
