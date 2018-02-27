

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


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(user_input)
  user_input = user_input.to_i
  user_input = user_input - 1
end

def move(array, index, value)
  array[index] = value
end

def position_taken?(board, index)
  if board[index] == " "
   false
  elsif board[index] == ""
    false
  elsif board[index] == nil
    false
  else
    true
  end
end

def valid_move?(board, index)
  if index.between?(0,8) == true && position_taken?(board, index) == false
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |square|
    if square == "X" || square == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board).even?
     "X"
  else
     "O"
  end
end

def won?(board)
  win_array = false
  WIN_COMBINATIONS.each do |array|
    if board[array[0]] == "X" && board[array[1]] == "X" && board[array[2]] == "X" || board[array[0]] == "O" && board[array[1]] == "O" && board[array[2]] == "O"
      win_array = array
    end
  end
  win_array
end

def full?(board)
  all_board = board.all? do |space|
    space == "X" || space == "O"
  end
  all_board
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  else
    false
  end
end

def over?(board)
  if won?(board)  || full?(board) || draw?(board)
    true
  else
    false
  end
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
    puts "Cat's Game!"
  end
end
