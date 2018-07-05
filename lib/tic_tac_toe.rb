WIN_COMBINATIONS = [
  [0,1,2], # Top row [0]
  [3,4,5], # Middle row [1]
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # Second column
  [2,5,8], # Third column
  [0,4,8], # Top Left diagonal
  [2,4,6] # Top Right diagonal [8]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index = user_input.to_i - 1
end

def move(board, index, character)
  board[index]= character
end

def position_taken?(board, index)
  board[index] != " " && board[index] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  character = current_player(board)
  if valid_move?(board, index)
    move(board, index, character)
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
  else turn_count(board).odd?
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[0]] != " "
  end
end

def full?(board)
  board.all? do |letter|
    if letter == "X" || letter == "O"
      true
    else
      false
    end
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  if draw?(board)|| won?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  status = won?(board)
  if status.nil?
    nil
  else
    board[status[0]]
  end
end

def play(board)
  num_turns = 0
  while num_turns < 9 && !over?(board)
    turn(board)
    num_turns += 1
  end
  if draw?(board)
    puts "Cat's Game!"
  else
    puts "Congratulations #{winner(board)}!"
  end
end
