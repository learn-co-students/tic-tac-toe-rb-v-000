board = [" "," "," "," "," "," "," "," "," "]

def display_board (board)
  puts  " #{board[0]} | #{board[1]} | #{board[2]} "
  puts  "-----------"
  puts  " #{board[3]} | #{board[4]} | #{board[5]} "
  puts  "-----------"
  puts  " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input = user_input.to_i
  user_input -= 1
  return user_input
end

def move(board, index, character = "X")
  board[index] = character
  return board
end

def on_board?(num)
  if num.between?(0, 8) == true
    return true
  else
    return false
  end
end

def position_taken?(board, index)
  if (board[index] ==  " " || board[index] == "" || board[index] == nil)
    false
  elsif (board[index] == "X"|| board[index] == "O")
    true
end
end

def valid_move?(board, index)
  if index.between?(0,8) && !(position_taken?(board, index))
    true
  else
    false
  end
end

def turn (board)
  puts "Please enter 1-9:"
  num = gets.chomp
  index = input_to_index(num)
  if valid_move?(board, index) == true
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
  turn = 0
  while turn < 9
    turn(board)
    turn += 1
  end
end

def play(board)
  input = gets
end

def turn_count(board)
  counter = 0
  board.each do |token|
    if token == "X" || token == "O"
      counter +=1
    end
  end
  counter
end


def current_player(board)
  if turn_count(board).even?
    player = "X"
  else
    player = "O"
return player
end
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Right column
  [1,4,7],  # Middle column
  [2,5,8],  # Left column
  [0,4,8],  # Left diagonal
  [2,4,6]  # Right diagonal
]

##def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 =="O" && position_2 == "O" && position_3 == "O"
      return win_combination
else
  false
end
end

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  end
end

def over?(board)
  if  won?(board) || draw?(board) || full?(board)
    return true
  end
  end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
