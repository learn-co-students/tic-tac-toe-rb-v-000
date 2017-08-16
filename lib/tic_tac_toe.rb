# Define WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Left diagonal
  [6,4,2]  # Right diagonal
]

# Define method DISPLAY_BOARD to print board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Define method INPUT_TO_INDEX
def input_to_index(user_input)
  user_input.to_i-1
end

# Define method MOVE
def move(board, index, current_player)
  board[index] = current_player
end

# Define method POSITION_TAKEN?
def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

# Define method VALID_MOVE?
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

# Define method TURN
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

# Define method turn_count
def turn_count(board)
  board.count("X")
  board.count("O")
  counter = board.count("X") + board.count("O")
end

# Define method current_player
def current_player(board)
  if turn_count(board).even?
    "X"
else
    "O"
  end
end

# Define method WON?
def won?(board)
  WIN_COMBINATIONS.detect do |win_index|
    board[win_index[0]] == board[win_index[1]] && board[win_index[1]] == board[win_index[2]] && position_taken?(board, win_index[0])
  end
end

# Define method FULL?
def full?(board)
  board.none? {|t| t == " "}
end

# Define method DRAW?
def draw?(board)
  full?(board) && !won?(board)
end

# Define method OVER?
def over?(board)
won?(board) || draw?(board)
  #board.none? {|t| t == " "}
end

# Define method WINNER
def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

# Define method PLAY
def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
else #draw?(board)
    puts "Cats Game!"
   end
 end
