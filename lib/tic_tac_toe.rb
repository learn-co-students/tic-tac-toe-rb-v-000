#helper methods learn spec/01_tic_tac_toe_spec.rb
WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]       ]

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  board[index] != " " && board[index] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
  board.count("X") + board.count("O")
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  player = current_player(board)
#  turn_count(board)
#  current_player(board)
  if valid_move?(board, index)
    move(board, index, player)
    display_board(board)
  else
    puts "That is not a valid move."
    turn(board)
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[2]] == board[combo[1]] &&
    position_taken?(board,combo[0])
  end
end

# full
def full?(board)
   board.all? { |pos| pos != " "}
end
#draw
def draw?(board)
  !won?(board) && full?(board)
end
#over
def over?(board)
 won?(board) || draw?(board) || full?(board)
end
#winner
def winner(board)
  if !won?(board)
    nil
  else
    board[won?(board)[0]]
  end
end
# play method
def play(board)
  while !over?(board)
    turn(board)
  end
  if draw?(board)
    puts "Cats Game!"
  elsif won?(board)
    puts "Congratulations #{winner(board)}!"
  end
end

#   learn spec/02_play_spec.rb
