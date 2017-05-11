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
  if !valid_move?(board, index)
    turn(board)
  end
  move(board, index, current_player(board))
  display_board(board)
end

def turn_count(board)
  board.count{|token| token != " "}
end

def current_player(board)
  if turn_count(board).even?
  "X"
  else
  "O"
  end
end
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,4,8], #diagonal 1
  [2,4,6], #diagonal 2
  [0,3,6], #first column
  [1,4,7], #second column
  [2,5,8]  #third column
]
def won?(board)
  # top row win consist of board[0], board[1], board[2]
  # if top row win is "X", "X", "X", or "O", "O", "O"
  # think of when the elements are all " "
  WIN_COMBINATIONS.detect{|index| board[index[0]] == board[index[1]] && board[index[1]]  == board[index[2]] && position_taken?(board, index[0])}
end
# won?(board)[0]
def full?(board)
  !board.any?{|index| index == " "}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
    if won?(board)
      board[won?(board)[0]]
    end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if winner(board)
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cats Game!"
  end
end
