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
# Helper Methods
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

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
if valid_move?(board, index)
  move(board,index,current_player(board))
  display_board(board)
  else
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
  end
end

# Define your play method below
def play(board)
until over?(board) || won?(board) || draw?(board)
  turn(board)
end
  if winner(board)
    puts "Congratulations #{winner(board)}!"
  end
  if draw?(board)
    puts "Cats Game!"
end
end

def turn_count(board)
counter = 0
board.each do |pos|
if pos == "X" || pos == "O"
    counter += 1
  end
end
counter
end


def current_player(board)
if turn_count(board).even?
return "X"
else
  return "O"
end
end

def won?(board)
WIN_COMBINATIONS.detect do |win_combination|

win_index_1 = win_combination[0]
win_index_2 = win_combination[1]
win_index_3 = win_combination[2]

pos_1 = board[win_index_1]
pos_2 = board[win_index_2]
pos_3 = board[win_index_3]

if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
return win_combination
end
if pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
return win_combination
end
end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def winner(board)
  if won?(board)
    won?(board).select do |pos|
  if board[pos[0]] == "X"
    return "X"
  else board[pos[0]] == "O"
    return "O"
  end
  end
end
end
