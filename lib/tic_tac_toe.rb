# Define WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Left diagonal
  [2,4,6] # Right diagonal
]

# Define display_board that accepts a board and prints
# out the current state.
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Take the user's input, convert to integer and subtract 1 to get index
def input_to_index(input)
  input.to_i - 1
end

# Set the space on the board chosen by the user equal to the user's character
def move(board, input, char)
  board[input] = char
end

# Check to see if the position chosen by the user is already taken by an X or O
def position_taken?(board, index)
  if board[index] == "" || board[index] == " " || board[index] == nil
    return false
  elsif board[index] == "X" || board[index] == "O"
    return true
  end
end

# Check whether the position chosen exists on the board and is available
def valid_move?(board, index)
  if index.between?(0,8) && position_taken?(board, index) == false
    return true
  else
    return false
  end
end

# Ask user for input, convert to index, check if move is valid, display board, or ask for input again if invalid
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip.to_i
  index = input_to_index(input)
  if valid_move?(board, index)
    char = current_player(board)
    move(board, index, char)
    display_board(board)
  else
    turn(board)
  end
end

# Return number of turns that have been played
def turn_count(board)
  counter = 0
  board.each do |index|
    if index == "X" or index == "O"
      counter += 1
    end
  end
  return counter
end

# Return character of the current player
def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

# Return true if a player has won
def won?(board)
  WIN_COMBINATIONS.detect do |win_array|
    board[win_array[0]] == board[win_array[1]] && board[win_array[1]] == board[win_array[2]] && position_taken?(board, win_array[0])
  end
end

# Return true there are no slots remaining
def full?(board)
  board.none? do |slot|
    slot == " " || slot == ""
  end
  end

# Return true if board is full and not won
  def draw?(board)
    if full?(board) && !won?(board)
      return true
    end
  end

# Return true if game is won, ends in draw, or board is full
  def over?(board)
    if won?(board) || draw?(board) || full?(board)
      return true
    end
  end

# Check if game is won, set variable equal to winning array, then set variable equal to one element in the winning array
# and return that variable
  def winner(board)
    if win_array = won?(board)
      win = board[win_array[0]]
      return win
    end
  end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    win = winner(board)
    puts "Congratulations #{win}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
