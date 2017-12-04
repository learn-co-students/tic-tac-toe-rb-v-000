# Helper methods here
# Define your WIN_COMBINATIONS constant
 WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Buttom row
  [0,3,6],  # First column
  [1,4,7],  # Second column
  [2,5,8],  # Last column
  [0,4,8],  # Diagonal 1
  [2,4,6],  # Diagonal 2
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

def move(board, index, char)
  board[index] = char
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
    if index.between?(0,8) && !position_taken?(board, index)
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input.to_i - 1

  if !valid_move?(board, index)
    turn(board)
  end
  move(board, index, current_player(board))
  display_board(board)
end

def turn_count(board)
  board.count{|token| token == "X" || token == "O"}
end
def current_player(board)
 turn_count(board) % 2 == 0 ? "X" : "O"

end
def won?(board)
    WIN_COMBINATIONS.detect do |combo|
      board[combo[0]] == board[combo[1]] &&
      board[combo[1]] == board[combo[2]] &&
      position_taken?(board,combo[0])
    end
end
def full?(board)
  board.all? {|token| token == "X" || token == "O"}

end
def draw?(board)
  full?(board) && !won?(board)
end
def over?(board)
  won?(board) || full?(board) && !won?(board)
end
def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]

  end
end

# Define your play method below
def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
  puts "Congratulations, #{winner(board)}!"
elsif draw?(board)
  puts "Cat's Game!"
end
end
