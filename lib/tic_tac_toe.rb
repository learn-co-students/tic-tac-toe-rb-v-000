WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
]
def play(board)
  turn(board) until over?(board)
  if won?(board)
 puts "Congratulations #{winner(board)}!"
 elsif
   puts "Cat's Game!"
end
end


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

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
index =  input_to_index(user_input)
if valid_move?(board,index)
move(board,index, current_player(board))
display_board(board)
else
turn(board)
end
end



def position_taken?(board, index)
if board[index] == "X" || board[index] == "O"
  true
else
  false
end
end

def valid_move?(board,index)
  if index.between?(0,9) && !position_taken?(board,index)
    true
  else
    false
end
end

def turn_count(board)
  board.count { |token| token == 'X' || token == 'O'}
end

def current_player(board)
turn_count(board).even? ? 'X' : 'O'
end

def won?(board)
  WIN_COMBINATIONS.detect do |selection|
  board[selection[0]] == board[selection[1]] &&
  board[selection[1]] == board[selection[2]] &&
  position_taken?(board,selection[0])
end
end

def full?(board)
board.all? do |spot|
  spot == "X" || spot == "O"
end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def move(board,index,char)
board[index] = char
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo[0]]
end
end
