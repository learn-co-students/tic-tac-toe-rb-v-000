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

def input_to_index(string)
  string.to_i - 1
end

def move(board, space, char)
  board[space] = char
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    true
  end
end

def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0,8)
    true
  else
    false
end
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
  count = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      count += 1
    end
end
count
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combinations|
    index_1 = combinations[0]
    index_2 = combinations[1]
    index_3 = combinations[2]

    position_1 = board[index_1]
    position_2 = board[index_2]
    position_3 = board[index_3]

    position_1 == position_2 && position_2 == position_3 && position_3 != " "
  end
end

def full?(board)
  board.all? do |complete|
    complete != " "
  end
end

def draw?(board)
!won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  won = won?(board)
if won
board[won[0]]
end
end

def play(board)
  until over?(board)
    turn(board)
  end
if won?(board)
  puts "Congratulations " + winner(board) + "!"
else 
  puts "Cat's Game!"
end
end
