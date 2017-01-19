#WIN_COMBINATIONS
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

#DISPLAY_BOARD
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} " "|" " #{board[1]} " "|" " #{board[2]} "
  puts "-----------"
  puts " #{board[3]} " "|" " #{board[4]} " "|" " #{board[5]} "
  puts "-----------"
  puts " #{board[6]} " "|" " #{board[7]} " "|" " #{board[8]} "
end

#INPUT_TO_INDEX
def input_to_index(input = gets.chomp)
  input.to_i - 1
end

#MOVE
def move(array, index, char)
  array[index] = char
end

#POSITION_TAKEN
def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
      return true
  else
    return false
  end
end

#VALID_MOVE
def valid_move?(board, index)
  index.between?(0,8) && !(position_taken?(board, index))
end

#TURN_COUNT
def turn_count(board)
  board.count{|space| space == "X" || space == "O"}
end

#CURRENT_PLAYER
def current_player(board)
  current_player = turn_count(board) % 2 == 0 ? "X" : "O"
end

#TURN
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    char = current_player(board)
    move(board, index, current_player(board))
  else
    turn(board)
  end
end

#GAME STATUS
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    board[win_combination[0]] == board[win_combination[1]] &&
    board[win_combination[1]] == board[win_combination[2]] &&
    position_taken?(board, win_combination[0])
  end
end

def full?(board)
  board.all?{|char| char == "X" || char == "O"}
end

def draw?(board)
  !(won?(board)) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end


#WINNER
def winner(board)
  if win_combo = won?(board)
    board[win_combo.first]
  end
end

#PLAY
def play(board)
  while !(over?(board))
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
