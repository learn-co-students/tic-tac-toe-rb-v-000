# Helper Method
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
end

def move(board, index, token)
  board[index] = token
end

def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0,8)
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def turn_count(board)
  count = 9 - board.count(" ")
  return count
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  token = current_player(board)
  if valid_move?(board, index)
    move(board, index, token)
    display_board(board)
  else
    turn(board)
  end
end

# Define your WIN_COMBINATIONS constant
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

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
  end
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  full?(board) || draw?(board) || won?(board)
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

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
