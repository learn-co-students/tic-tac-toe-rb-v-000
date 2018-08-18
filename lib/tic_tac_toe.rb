# rspec spec/02_play_spec.rb

WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left row
  [1,4,7], # vertical middle row
  [2,5,8], # right row
  [0,4,8], # top left diag
  [2,4,6]  # top right diag
  ]
  
  def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
end

def move(board, position, token)
  board[position] = token
  return board
end

def position_taken?(board, index)
  if board[index] != " " && board[index] != ""
    true
  else
    false
  end
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
    true
end
end

def turn(board)
  puts "Please enter move with 1-9"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
  else 
    turn(board)
  end
  display_board(board)
end
 
def turn_count(board)
  board.count{|token| token == "X" || token == "O"}
end

def current_player(board)
  if turn_count(board) %2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |winner|
  if board[winner[0]] == board[winner[1]] &&
       board[winner[1]] == board[winner[2]] && 
       position_taken?(board, winner[0])
       return winner
    end
end
false
end

def full?(board)
 board.any? do |empty|
   if empty == " "
     return false
  end
end
true
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board) == true
    return true
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
end
end

def play(board)
  until over?(board) == true 
  turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
end
end