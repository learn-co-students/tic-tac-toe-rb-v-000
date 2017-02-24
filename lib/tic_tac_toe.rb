
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# an array of all positions taken by "X"
# an array of all positions taken by "O"
# compare both arrays to the WIN_COMBINATIONS
# if either arrays contain the #s of any of the WIN_COMBINATIONS,
# return the winning array

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Back diagonal
  [2,4,6]  # Front diagonal
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
board[win_index_1] == board[win_index_2] && board[win_index_2] == board[win_index_3] && board[win_index_1] != " "
  end
end

def full?(board)
  board.all? do |index|
    if index != " "
      true
  end
end
end

def draw?(board)
  # binding.pry
  !won?(board) && full?(board)
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  if won?(board)
    winning_array = won?(board)
    return board[winning_array[0]]
  end
end

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

def move(board, index, current_player)
board[index] = current_player
end

def position_taken?(board, location)
board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
  turn = 0
  board.each do |board_space|
    if board_space != " "
      turn += 1
  end
  end
      return turn
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
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

# Define your play method below
def play(board)
counter = 0
while counter < 9
  counter += 1
  if !over?(board)
    turn(board)
  elsif draw?(board)
    puts "Cats Game!"
  elsif won?(board)
    puts "Congratulations #{winner(board)}!"
  end
end
end
