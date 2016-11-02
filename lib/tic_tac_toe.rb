WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

# display_board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# input_to_index
def input_to_index(user_input)
  user_input.to_i - 1
end

# move method
def move (board, index, new_player)
  board[index] = new_player
end

# position_taken? method
def position_taken?(board, index)
if board[index] == " "
  false
elsif board[index] == ""
    false
  elsif board[index] == nil
    false
  else board[index] == "X" || board[index] == "O"
    true
end
end

# valid_move? method here
def valid_move?(board,index)
if position_taken?(board,index) == false && index.between?(0,8) == true
  true # position on the board && position not taken
else
  false # return false or nil here for invalid move
end
end

# define turn method here
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
if valid_move?(board,index)
    move(board, index, current_player(board))
    display_board(board)
else
  turn(board)
end
end

# define turn_count here
def turn_count(board)
counter = 0
board.each do |occupied_spot|
   if occupied_spot != " "
  counter += 1
end
end
return counter
end

# define current_player here
def current_player(board)
if turn_count(board).even? == true
  return "X"
else
  return "O"
end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    board[win_combo[0]] == board[win_combo[1]] &&
    board[win_combo[1]] == board[win_combo[2]] &&
    position_taken?(board, win_combo[0])
  end
end

#define full here - every element on the board contains "X" or "O"
def full?(board)
  board.all? {
    |mark| mark == "X" || mark == "O"
  }
end

# define draw? here
def draw?(board)
  !won?(board) && full?(board)
end

# over? here - won, is a draw, or full
def over?(board)
  won?(board) || draw?(board) || full?(board)
end

# define winner here
def winner(board)
  if winner = won?(board)
    board[winner.first]
  end
end

# define #play here
def play(board)
until over?(board)  # until the game is over
turn(board)   #take turns
end

if won?(board)
  puts "Congratulations #{winner(board)}!"
else draw?(board)
  puts "Cats Game!"
end
end
