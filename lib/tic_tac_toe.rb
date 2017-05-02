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

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  (input.to_i) - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    true
  elsif board[index] != " " && board[index] != "" && board[index] != nil
    true
  else
    false
  end
end

def valid_move?(board, index)
  if index.between?(0,8) && position_taken?(board,index) != true
    true
 else
  false
 end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
      display_board(board)
    else turn(board)
  end
end

def turn_count(board)
counter = 0
  board.count do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
counter
end

def current_player(board)
turn_count(board)
  if turn_count(board).even? == true
    return "X"
  else return "O"
  end
end

def won?(board)
WIN_COMBINATIONS.find do |i|
  board[i[0]] == "X" && board[i[1]] == "X" && board[i[2]] == "X" || board[i[0]] == "O" && board[i[1]] == "O" && board[i[2]] == "O"
  end
end

def full?(board)
  board.none?{|i| i == " "}
end

def draw?(board)
!won?(board) && full?(board)
end

def over?(board)
  if won?(board) != nil || draw?(board) == true || full?(board) == true
    return true
  end
end

def winner(board)
  if index = won?(board)
    board[index[0]]
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
