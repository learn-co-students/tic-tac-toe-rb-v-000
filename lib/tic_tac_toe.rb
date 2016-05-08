# Helper methods

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # first column
  [1,4,7], # second column
  [2,5,8], # third column
  [0,4,8], # right to left diagonal
  [2,4,6], # left to right diagonal
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, position, player_token) # default arg? player_token="X"?
  board[position.to_i - 1] = player_token
end

# If position not taken, returns false; otherwise true
def position_taken?(board, position)
  !(board[position.to_i] == " ") 
end

# returns true if move is valid, false or nil if not
def valid_move?(board, position, player_token="X")
  position.to_i.between?(1,9) && board[position.to_i - 1] == " "
end

# Get input, validate it, and moke move
def turn(board)
  puts "Please enter 1-9: "
  position = gets.chomp
  if valid_move?(board, position)
    move(board, position, current_player(board))
  else
    turn(board)
  end
  display_board(board)
end

# returns number of turns played
def turn_count(board)
  board.size - board.count(" ")
end

# Use turn_count to return current player
def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    location1 = win_combo[0]
    location2 = win_combo[1]
    location3 = win_combo[2]
    
    board[location1] == board[location2] && board[location2] == board[location3] && board[location1] != " "
  end
end

def full?(board)
  board.none? {|location| location == " "}
end

# draw = full board (R true) and not won (r nil)
def draw?(board)
  !won?(board) && full?(board)   
end

# over: won? (R true) or draw? (R true)
def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  winning_combo = won?(board)
  if winning_combo
    winning_location = winning_combo[0]
    board[winning_location]
  end
end  

def play(board)
   player_token = current_player(board)
  until over?(board)
    turn(board)
  end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    else
      puts "Cats Game!"
  end
end

