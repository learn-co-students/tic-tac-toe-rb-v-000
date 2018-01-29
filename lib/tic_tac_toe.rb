
# helper Methods
WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],
  [0,3,6],[1,4,7],[2,5,8],
  [0,4,8],[2,4,6]
]

#display board method
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
board = [" "," "," "," "," "," "," "," "," "]
#input to index methods
def input_to_index(user_input)
  user_input.to_i - 1
end
#move method
def move(board, index, current_player)
  board[index] = current_player
end
#position taken checker
def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end
# valid move
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end
# dealing with the CLI
def turn(board)
  puts "please enter number from 1-9"
  user_input = gets.strip
  index = input_to_index(user_input)
  player = current_player(board)
  if valid_move?(board, index)
      move(board, index, player)
      display_board(board)
    else
      puts "Not a valid move"
      turn(board)
  end
end
# turn count
def turn_count(board)
  count = 0
  board.each do|index|
    if index != " " || index == nil
      count += 1
    end
  end
  count
end
# determine the current player
def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end
# won method
def won?(board)
  WIN_COMBINATIONS.each do|win_array|
    win_position_x = win_array.all? do|index|
      board[index] == "X" # identifying the X win
    end
    win_position_o = win_array.all? do|index|
      board[index] == "O" # identifying the O win
    end
    if win_position_x || win_position_o
      return win_array
    end
  end
  false
end
# full method
def full?(board)
  if board.detect {|token| token == " " || token == nil}
    return false
  else
    return true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  end
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else
    nil
  end
end

def play(board)
  until over?(board)
    current_player(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end
