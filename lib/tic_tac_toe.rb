# every method will take board as the argument, i.e. def method(board)
# a player will choose board position by entering 1-9
# get player input via gets
# convert that to a board position (0-8)
# fill out board position with player's token
# keep track of which player's turn it is
# keep track of how many turns have been played
# check for winner after every turn
# congratulate winner if winner
# inform of tie if tie

WIN_COMBINATIONS = [
  [0,1,2], #top-row win
  [3,4,5], #mid-row win
  [6,7,8], #bottom-row win
  [0,3,6], #left col win
  [1,4,7], #mid col win
  [2,5,8], #right col win
  [0,4,8], #left diag win
  [2,4,6]  #right diag win
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, player_token)
  board[index] = player_token
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  player_token = current_player(board)
  if valid_move?(board, index)
    move(board, index, player_token)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  board.count("X") + board.count("O")
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    win_combo.all? {|index| board[index] == "X"} ||
    win_combo.all? {|index| board[index] == "O"}
  end
end

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true #true if -- board has not been won and is full
  elsif won?(board) && full?(board)
    return false #false if -- board is won and is full
  else false #false if -- board has not been won and is NOT full (in progress game)
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else false
  end
end

def winner(board)
  if !won?(board)
    return nil
  else board[won?(board)[0]]
  end
end

def play(board)
 until over?(board)
   turn(board)
 end
 if over?(board) && draw?(board) #if over and full but no winner
   puts "Cat's Game!"
 elsif over?(board) && winner(board) #if over and full with winner
   puts "Congratulations #{winner(board)}!"
 end
end
