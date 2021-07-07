require 'pry'
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]

#display_board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} " #
  puts "---------------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} " #
  puts "---------------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} " #
end

#input_to_index
def input_to_index(position)
  index = position.to_i - 1
end

#move
def move(board, position, current_player)
  board[position] = current_player
end

#position_taken?
def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end

#valid_move?
def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index)
end

#turn_count
def turn_count(board)
  turn_count = 0 
  board.each do |index|
    if index == "X" || index == "O"
      turn_count += 1 
    end
  end
  turn_count  
end

#current_player
def current_player(board)
   if turn_count(board) % 2 == 0 
    "X"
   else
    "O"
  end
end

#turn 
def turn(board)
  puts "Please enter 1 - 9 "
  index = input_to_index(gets.strip)
  
  if valid_move?(board, index)
    token = current_player(board)
    move(board, index, token)
    display_board(board)
  else
    puts "Please enter a valid unused position."
    turn(board)
  end
end

#won?
def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    board[win_combo[0]] == board[win_combo [1]] && board[win_combo [1]] == board[win_combo[2]] && board[win_combo[0]] != " "
  end
end

#full?
def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end

#draw?
def draw?(board)
  !won?(board) && full?(board)
end

#over?
def over?(board)
  won?(board) || draw?(board) || full?(board)
end

#winner
def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

=begin
play is the actual game loop, allowing turns to alternate & tracks
game progress after each turn to see if anyone won, lost, or if game is
over due to a draw. 
=end
def play(board) 
  while !over?(board)
    turn(board)
  end  
  if won?(board)
    puts "Congratulations #{winner(board)}!" 
  else if draw?(board)
    puts "Cat's Game!"
  end
  end
end
