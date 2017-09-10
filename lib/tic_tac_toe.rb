WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,4,8],
[2,4,6],
[0,3,6],
[2,5,8],
[1,4,7]
]

def display_board(board)
rows = Array.new
rows[0] = " #{board[0]} | #{board[1]} | #{board[2]} "
rows[1] = "-----------"
rows[2] = " #{board[3]} | #{board[4]} | #{board[5]} "
rows[3] = "-----------"
rows[4] = " #{board[6]} | #{board[7]} | #{board[8]} "

puts rows[0]
puts rows[1]
puts rows[2]
puts rows[3]
puts rows[4]
end

def input_to_index(input)
(input.to_i) - 1
end

def move(board, position, player_character)
board[position] = player_character
end

def position_taken?(board, index)
!(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
index.between?(0,8) && !position_taken?(board, index) ? true : false
end

def turn(board)
puts "Please enter 1-9:"
input = gets.strip.to_i - 1
input_to_index(input)
if valid_move?(board, input)
move(board, input, current_player(board))
display_board(board)
else
turn(board)
end
end

def turn_count(board)
board.select{|i| i == "X" || i == "O"}.length
end

def current_player(board)
turn_count(board)%2 == 0 ? "X" : "O"
end

def won?(board)
WIN_COMBINATIONS.each do |combo|
win_index_1 = combo[0]
win_index_2 = combo[1]
win_index_3 = combo[2]

position_1 = board[win_index_1]
position_2 = board[win_index_2]
position_3 = board[win_index_3]

if (position_1 == "X" && position_2 == "X" && position_3 == "X")
return combo
elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
return combo
else
false
end
end

if board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"] || board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
false
end
end

def full?(board)
board.select{|i| i =="X" || i == "O"}.length == 9
  end

  def draw?(board)
  !won?(board) && full?(board) ? true : false
  end

  def over?(board)
  won?(board) || draw?(board) || full?(board) ? true : false
  end

  def winner(board)
  if won?(board) != false
  board[won?(board)[0]] #returns the first element in the WIN_COMBINATIONS array as the index for the board
  end
  end


  def play(board)
  until over?(board)
  turn(board)
  end

  if won?(board)
  puts "Congratulations #{winner(board)}!"
  else
  puts "Cat's Game!"
  end

  end








 
