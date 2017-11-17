
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Left column
  [1, 4, 7], # Middle column
  [2, 5, 8], # Right column
  [0, 4, 8], # Diagonal upper-left lower-right
  [2, 4, 6]  # Diagonal upper-right lower-left
]

# Define a method display_board that prints a 3x3 Tic Tac Toe Board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your input_to_index and move method here
def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index_position, token)
  board[index_position] = token
end

def position_taken?(board, index)
  board[index] != " "
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

# def turn(board)  -- OLD TURN METHOD WITH DEFAULT ARGUMENT FOR MOVE
#   puts "Please enter 1-9:"
#   user_input = gets.strip
#   index = input_to_index(user_input)
#   if valid_move?(board, index)
#     token = "X"
#     move(board, index, token)
#     display_board(board)
#   else
#     turn(board)
#   end
# end

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

def turn_count(board)
  count = 0
  board.each do |game_spot|
    if game_spot != " "
      count += 1
    end
  end
  count
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    position_taken?(board, win_combo[0]) &&
    board[win_combo[0]] == board[win_combo[1]] &&
    board[win_combo[0]] == board[win_combo[2]]
  end
end

def full?(board)
  board.all? do |index|
    index != " "
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if game_pos = won?(board)
    board[game_pos[1]]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
