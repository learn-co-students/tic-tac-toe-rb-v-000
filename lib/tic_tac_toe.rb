def display_board(board)
  print " #{board[0]} | #{board[1]} | #{board[2]} \n-----------\n #{board[3]} | #{board[4]} | #{board[5]} \n-----------\n #{board[6]} | #{board[7]} | #{board[8]} \n"
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  valid_move?(board, input = input_to_index(gets.chomp)) ? move(board, input, current_player(board)) : turn(board)
end


def turn_count(board)
  board.count { |space| space == "X" || space == "O"}
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect { |combo| combo.all? { |i| board[i] == "X" } || combo.all? { |i| board[i] == "O"} }
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  board[won?(board).first] if won?(board)
end


def play(board)
  turn(board) until over?(board)
  puts won?(board) ? "Congratulations #{winner(board)}!" : "Cat's Game!"
end
