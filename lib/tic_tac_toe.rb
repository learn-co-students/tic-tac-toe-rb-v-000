# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, location, current_player = "X")
  board[location.to_i-1] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  player = current_player(board)
  if valid_move?(board, input)
    move(board, input, player)
  else
    turn(board)
  end
  display_board(board)
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

def won?(board)
  WIN_COMBINATIONS.detect do |win_array|
    board[win_array[0]] == "X" && board[win_array[1]] == "X" && board[win_array[2]] == "X" or board[win_array[0]] == "O" && board[win_array[1]] == "O" && board[win_array[2]] == "O"
  end
end

def isvalid?(index)
  index == "X" or index == "O"
end

def full?(board)
  board.all?{|index| isvalid? index}
end

def draw?(board)
  won?(board) == nil && full?(board)
end

def over?(board)
  won?(board) or full?(board) or draw?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def turn_count(board)
  count = 0
  board.each do |turn|
    if turn == "X" or turn == "O"
    count += 1
    end
  end
  count
end

# Define your play method below
def play(board)
  until over?(board)
    turn_count(board)
    turn(board)
    current_player(board) 
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!" 
  end
end





