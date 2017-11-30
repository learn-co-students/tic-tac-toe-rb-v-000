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
  input.to_i - 1
end

def move(board, position, token)
   board[position] = token
end

def position_taken?(board, position)
  if board[position] == "X" || board[position] == "O"
    true
  else
    false
  end
end

def valid_move?(board, position)
  position.between?(0,8) && !position_taken?(board, position)
end

def turn(board)
  puts "Please enter 1-9"
   input = gets.strip
  input = input_to_index(input)
  if valid_move?(board,input)
    move(board, input, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
    counter = 0
  board.each do |position|
    if position == "X" || position == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  if !turn_count(board).even?
    "O"
  else
    "X"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combinations|
    win_index_1 = win_combinations[0]
    win_index_2 = win_combinations[1]
    win_index_3 = win_combinations[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combinations
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combinations
    else
       false
    end
  end
end

def full?(board)
  board.each do |positions|
    if positions == " "
      return false
    else
      true
    end
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    false
  end
end

def over?(board)
  if draw?(board) || full?(board) || won?(board)
    return true
  else
    false
  end
end

def winner(board)
  if win_combination = won?(board)
    board[win_combination[0]]
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
