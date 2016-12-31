
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]



def play(board)
while (!over?(board))
    turn(board)
  end
  if (draw?(board))
 puts "Cats Game!"
else
puts "Congratulations #{winner(board)}!"
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
!(position_taken?(board, index) || ((index < 0 || index > 8)))
end

def won?(board)
WIN_COMBINATIONS.detect do |combo|
board[combo[0]] == board[combo[1]] &&
board[combo[1]] == board[combo[2]] &&
position_taken?(board, combo[0])
end
end

def full?(board)
board.all?{|position| position == "X" || position == "O"}
end

def draw?(board)
 !won?(board) && full?(board)
end

def over?(board)
won?(board) || draw?(board)
end


def input_to_index(user_input)
  user_input.to_i - 1
end

def turn(board)
  player = current_player(board)
  puts "Please enter 1-9:"
input = gets.strip
index = input_to_index(input)
if (valid_move?(board, index))
move(board, index, player)
else
 turn(board)
end
display_board(board)
end






def position_taken? (board, position)
  !(board[position] == " " || board[position] == "" || board[position] == nil)
  end

def current_player(board)
  if (turn_count(board) % 2 == 0)
 return "X"
else
return "O"
end
end

def turn_count(board)
board.count{|token| token == "X" || token == "O"}
end


def move(board, position, player)
  board[position] = player
end

def winner(board)
if winning_combo = won?(board)
board [winning_combo.first]
end
end
