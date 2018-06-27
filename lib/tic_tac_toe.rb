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

def valid_move?(board, index)
!position_taken?(board, index) && index.between?(0, 8)
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
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
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  current_player = current_player(board)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
   turn(board)
 end
end

def display_board(board)
horizontal_line = "-----------"
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts horizontal_line
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts horizontal_line
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, index, character)
  board[index] = character
  return board
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
     false
  else
     true
end
end

def turn_count(board)
  board.count{|token| token == "X" || token == "O"}
end

def current_player(board)
(turn_count(board).even?) ? "X" : "O"
end

def winner(board)
if won?(board)
  index = won?(board)[0]
  board[index]
else
  return nil
end
end
