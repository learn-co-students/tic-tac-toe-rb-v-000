
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
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

def move(board, user_input, character)
  board[user_input] = character
end

def position_taken?(board,index)
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board,index)
  !position_taken?(board,index) && index.between?(0, 8)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip

  index = input_to_index(user_input) # input_to_index("1") => 0
  if valid_move?(board,index)
    move(board, index, current_player(board))
    display_board(board)
  else
    # recursion
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |move|
    if move == "X" || move == "O"
      count += 1
    end
  end
  count
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |winning_index|
    # check if there is a token at this position, and then check
    # if every other position is the same
    if position_taken?(board, winning_index[0]) && board[winning_index[0]] == board[winning_index[1]] && board[winning_index [1]] == board[winning_index[2]]
      return winning_index
    end
  end
  return false
end

def full?(board)
board.all? do |mark|

if mark == "X" || mark == "O"
  true
end
end
end

def draw?(board)
if full?(board) && !won?(board)

  true
end
end
def over?(board)
  if draw?(board) || won?(board)
    true
  end
end
def winner(board)

  if won?(board)
    return board[won?(board)[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  end
if !winner(board)
puts "Cats Game!"
end
end
