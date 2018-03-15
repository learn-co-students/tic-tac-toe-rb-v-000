# Win combinations constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right colum
  [0,4,8], # Left diagonal
  [2,4,6] # Right diagnoal
]

# Displays board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Converts user input to index
def input_to_index(user_input)
  user_input.to_i - 1
end

# Accepts move from player
def move(board, index, character)
  board[index] = character
end

# Evaluates whether position is taken
def position_taken?(board, index)
  board[index] != " " && board[index] != "" && board[index] != nil
end

# Evaluates whether move is valid
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

# Single player turn
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  player_character = current_player(board)
  if valid_move?(board, index)
    move(board, index, player_character)
    display_board(board)
  else
    turn(board)
  end
end

# Returns number of turns played
def turn_count(board)
  completed_turns = 0
  board.each do |board_space|
  if board_space == "X" || board_space == "O"
      completed_turns += 1
    end
  end
  completed_turns
end

# Determines current_player
def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

# Checks whether game has been won
def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    if board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X"
      return win_combo
    elsif board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
      return win_combo
    end
  end
    false
end

# Checks whether board is full
def full?(board)
  board.all? do |taken|
    taken != " "
  end
end

# Checks whether game has ended in a draw
def draw?(board)
  !won?(board) && full?(board)
end

# Checks whether game is over
def over?(board)
  won?(board) || draw?(board) || full?(board)
end

# Declares winner if game has been won
def winner(board)
  if won?(board)
    new_win_combo = won?(board)
      if board[new_win_combo[0]] == "X" && board[new_win_combo[1]] == "X" && board[new_win_combo[2]] == "X"
        return "X"
      elsif board[new_win_combo[0]] == "O" && board[new_win_combo[1]] == "O" && board[new_win_combo[2]] == "O"
        return "O"
      end
    end
end

# Plays game of Tic Tac Toe
def play(board)
  until over?(board)
    turn(board)
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
