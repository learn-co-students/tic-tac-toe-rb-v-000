WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
]
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
def move(board, position, current_player)
  board[position] = current_player;
end
def position_taken?(board, index)
    if board[index] == "" or board[index] == " " or board[index] == nil
      return false
    end
    return true
  end
def valid_move?(board, index)
!position_taken?(board, index) && index.between?(0, 8)
end
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end
def turn_count(board)
turns = 0
  board.each do |space|
    if space == "X" || space == "O"
  turns += 1
end
end
turns
end
def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
    end
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
  full?(board) && !won?(board)
end
def over?(board)
  won?(board) || full?(board)
end
def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
def play(board)
  turn_count = 0
while turn_count <9
  turn(board)
  turn_count += 1
end
end
