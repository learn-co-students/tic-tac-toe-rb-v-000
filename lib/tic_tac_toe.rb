# Define your WIN_COMBINATIONS constant
require 'pry'
WIN_COMBINATIONS =
[
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Left to right diagonal
  [2,4,6], # Right to left diagonal
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input_int = input.to_i
  input_int - 1
end

def move(board, index_to_play, char)
  board[index_to_play] = char
end

# code your #valid_move? method here
def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
    true
  else
    false
  end
end

# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  move = gets.strip
  index = input_to_index(move)
  valid = valid_move?(board,index)
  if valid
    if turn_count(board).even?
      move(board, index, "X")
    else
      move(board, index, "O")
    end
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  num_occupied = 0
  board.each do |spot|
    if spot != " "
      num_occupied += 1
    end
  end
  num_occupied
end

def current_player(board)
  if turn_count(board).even?
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

    char_at_position_1 = board[win_index_1]
    char_at_position_2 = board[win_index_2]
    char_at_position_3 = board[win_index_3]

    if char_at_position_1 == "X" && char_at_position_2 == "X" && char_at_position_3 == "X"
      return win_combination
    elsif
      char_at_position_1 == "O" && char_at_position_2 == "O" && char_at_position_3 == "O"
      return win_combination
    end
  end
  false
end

def full?(board)
  !board.any? {|x| x == " "}
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  (won?(board) || draw?(board))
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else
    nil
  end
end

# Define your play method below
def play(board)
  until over?(board)
    turn(board)
  end

  win_combination = won?(board)
#  puts "win_combination: #{win_combination}"
  if win_combination
  #  binding.pry
  #  puts "Class of win_combination: #{win_combination.class}"
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end
