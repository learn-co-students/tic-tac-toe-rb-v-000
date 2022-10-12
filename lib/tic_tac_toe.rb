# Helper Methods:

# Win combinations constant
WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Left column
  [1, 4, 7], # Middle column
  [2, 5, 8], # Right column
  [0, 4, 8], # Left Diagonal
  [2, 4, 6] # Right Diagonal
]

# Display board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Convert user input to an index on the board
def input_to_index(user_input)
  user_input.to_i - 1
end

# Player move
def move(board, index, current_player)
  board[index] = current_player
end

# Is the position taken?
def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

# Is the move valid?
def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end

# Completing a turn
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

# Number of turns that have been taken
def turn_count(board)
  turns = 0
  board.each do |space|
    if space == "X" || space == "O"
      turns += 1
    end
  end
  return turns
end

# Determine the current player
def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

# Was the game won?
def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
      board[combo[1]] == board[combo[2]] &&
      position_taken?(board, combo[0])
  end
end

# Is the board full?
def full?(board)
  board.all? { |position| position == "X" || position == "O" }
end

# Is the game a draw?
def draw?(board)
  full?(board) && !(won?(board))
end

# Is the game over?
def over?(board)
  draw?(board) || won?(board)
end

# Who was the winner?
def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

# End of Helper Methods

# Play Method
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