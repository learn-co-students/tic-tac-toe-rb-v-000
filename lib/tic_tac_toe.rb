WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 3, 6], # left column
  [1, 4, 7], # middle column
  [2, 5, 8], # right
  [0, 4, 8], # left diagonal
  [2, 4, 6]  # right diagonal
]


board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(x)
  x.to_i - 1
end


def move(board, index, token)
  board[index] = token
end


def position_taken?(board, index)
  board[index] == " " || board[index] == nil ? false : true
end


def valid_move?(board, index)
  index.between?(0, 8) && position_taken?(board, index) == false
end


def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  token = "X" || token = "O"
  if valid_move?(board, index) == true
    move(board, index, token)
  else
    turn(board)
  end
  display_board(board)
end


def turn_count(board)
  turn = 0
  board.each do |index|
    if index == "X" || index == "O"
      turn += 1
    end
  end
  turn
end


def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end


def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    board[win_combo[0]] == board[win_combo[1]] && board[win_combo[1]] == board[win_combo[2]] && position_taken?(board, win_combo[0])
  end
end


def full?(board)
  board.all?{|i| i == "X" || i == "O"}
end


def draw?(board)
  !won?(board) && full?(board)
end


def over?(board)
  won?(board) || draw?(board) || full?(board)
end


def winner(board)
  if won?(board) && board[won?(board)[0]] == "X"
    "X"
  elsif won?(board) && board[won?(board)[0]] == "O"
    "O"
  end
end


# def play(board)
#   turn(board).each do
#   end
#   # if !over?(board)
#   #   turn(board)
#   # end
#   # if draw?(board)
#   #   "Cat's Game!"
#   # end
#   # if winner?(board) == "X"
#   #   "Congratulations X!"
#   # elsif winner?(board) == "O"
#   #   "Congratulations O!"
#   # end
#
#   #need to use turn_count and current_player here somehow?
# end
