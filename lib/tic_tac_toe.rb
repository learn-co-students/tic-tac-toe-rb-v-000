
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
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
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |space|
   # puts "You have played #{counter} times."
 if space == "X" || space == "O"
 counter += 1
end
end
counter
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[2])
  end
end

def full?(board)
  board.all? do |space| 
    space == "X" || space == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end
  
def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
 if won?(board) 
    board[won?(board)[0]]
  else 
   nil
  end
end


def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
  puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
  puts "Cat\'s Game!"
  end
end

