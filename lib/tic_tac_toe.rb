#Win Combinations
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #diagonal 1
  [2,4,6], #diagonal 2
  ]

#Display Board
def display_board(board)

puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#Input to Index
def input_to_index(input)
  input.to_i - 1
end

#Player Move
def player_move(board, index, value)
   board[index] = value
 end

#Position Taken?
def position_taken?(board,index)
  if board[index] == "" || board[index] == " " || board[index] == nil
    false
  else board[index] == "X" || board[index] == "O"
    true
  end
end

#Valid Move?
def valid_move?(board,index)
  index.between?(0,8) && !position_taken?(board,index)
end

#Turn
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    player_move(board,index,current_player(board))
    display_board(board)
  else
    turn(board)
end
end

#Turn count
def turn_count(board)
  spaces_taken = 0
  board.each do |space|
    if space == "X" || space == "O"
      spaces_taken += 1
end
end
spaces_taken
end

#Current Player
def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

#Won?
def won?(board)
    WIN_COMBINATIONS.detect do |combo|
      board[combo[0]] == board[combo[1]] && board[combo[2]] == board[combo[0]] && position_taken?(board,combo[0])
    end
  end
  
#Full?
def full?(board)
    board.all? do |positions|
      positions == "X" || positions == "O"
    end
end

#Draw?
def draw?(board)
  !won?(board) && full?(board)
end

#Over?
def over?(board)
  draw?(board) || won?(board)
end

#Winner
def winner(board)
 if won?(board)
   combo = won?(board)
   board[combo[0]]
 else
   nil
 end
end

#Play
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

