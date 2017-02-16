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

#def play(board)
#  until over?(board)
#    turn(board)
#  end
#  if won?(board)
#    "Congratulations #{winner(board)}!"
#  elsif draw?(board)
#    "Cats Game!"
#  end
#end
def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

#def won?(board)
#  WIN_COMBINATIONS.detect do |combo| #changed
#    board[combo[0]] == board[combo[1]] &&
#    board[combo[1]] == board[combo[2]] &&
#    position_taken?(board, combo[0])
#  end
#end
def won?(board) # original
  WIN_COMBINATIONS.find do |win|
    board[win[0]] == board[win[1]] &&
    board[win[1]] == board[win[2]] &&
    position_taken?(board, win[0])
  end
end

def full?(board)
  #board.all?{|token| token == "X" || token == "O"} #changed
  !board.any?{|i| i == " "} # original
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
  #full?(board) || won?(board) #changed. passed "checks if the game is draw after every turn"
end

def input_to_index(input)
  input.to_i - 1
end

# below caused more failures (10 from 4)
#def input_to_position(user_input)
#  user_input.to_i - 1
#end

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
#def turn(board)
#  puts "Please enter 1-9:"
#  user_input = gets.strip
#  position = input_to_position(user_input)
#  if valid_move?(board, position)
#    move(board, position, current_player(board))
#    display_board(board)
#  else
#    turn(board)
#  end
#end

def position_taken?(board, index) # changed [position] to [index]
  #board[index] != " " && board[index] != "" #original_v2
  #board[position]== "X" || board[position] == "O" # changed [position] to [index]
  taken = nil #original
  if (board[index] ==  " " || board[index] == "" || board[index] == nil)
    taken = false
  else
    taken = true
  end
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def turn_count(board) # original
  count = 0
  board.each do |cell|
    if cell == "X" || cell == "O"
    count +=1
    end
  end
count
end
#def turn_count(board)
#  board.count{|token| token == "X" || token == "O"}
#end

def move(board, index, current_player)
  board[index] = current_player
end
#def move(board, position, player)
#  board[position] = player
#end

def winner(board)
  if win = won?(board)
    board[win[0]]
  end
end
#def winner(board)
#  if winning_combo = won?(board)
#    board[winning_combo.first]
#  end
#end
