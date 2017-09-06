WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,4,8], # Diagonal Down Left To Right
  [2,4,6], # Diagonal Down Right To Left
  [0,3,6], # First Column
  [1,4,7], # Second Column
  [2,5,8], # Third Column
]

board = [" "," "," "," "," "," "," "," "," "]

win_combo1 = WIN_COMBINATIONS[0]
win_combo2 = WIN_COMBINATIONS[1]
win_combo3 = WIN_COMBINATIONS[2]
win_combo4 = WIN_COMBINATIONS[3]
win_combo5 = WIN_COMBINATIONS[4]
win_combo6 = WIN_COMBINATIONS[5]
win_combo7 = WIN_COMBINATIONS[6]
win_combo8 = WIN_COMBINATIONS[7]

def play(board)
  while !over?(board)
    turn(board)
  end
  WIN_COMBINATIONS.each do |option|
    if board[option[0]] == "X" && board[option[1]] == "X" && board[option[2]] == "X"
    puts "Congratulations X!"
    elsif
    board[option[0]] == "O" && board[option[1]] == "O" && board[option[2]] == "O"
    puts "Congratulations O!"
    elsif draw?(board)
    puts "Cat's Game!"
    end
  end
end

def turn_count(board)
  count = 0
  board.each do |space|
    if space == "X" || space == "O"
      count += 1
    end
  end
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
  if valid_move?(board, index)
    move(board, index, current_player(board))
  else
  turn(board)
  end
end

def input_to_index(location)
location.to_i - 1
end

def move(board, index, value)
board[index] = value
display_board(board)
end

def valid_move?(board, index)
index.between?(0,8) && !position_taken?(board, index)
end

def position_taken?(board, index)
  board[index] != " "
end

def display_board(board)
array_of_location = Array.new(board)
row1_square1 = array_of_location[0]
row1_square2 = array_of_location[1]
row1_square3 = array_of_location[2]
row2_square1 = array_of_location[3]
row2_square2 = array_of_location[4]
row2_square3 = array_of_location[5]
row3_square1 = array_of_location[6]
row3_square2 = array_of_location[7]
row3_square3 = array_of_location[8]
puts " #{row1_square1} | #{row1_square2} | #{row1_square3} "
puts "-----------"
puts " #{row2_square1} | #{row2_square2} | #{row2_square3} "
puts "-----------"
puts " #{row3_square1} | #{row3_square2} | #{row3_square3} "
end

def won?(board)
  WIN_COMBINATIONS.each do |option|
    if board[option[0]] == "X" && board[option[1]] == "X" && board[option[2]] == "X"
      true
      winner = "X"
      winner(winner)
      return option
    elsif
      board[option[0]] == "O" && board[option[1]] == "O" && board[option[2]] == "O"
      true
      winner = "O"
      winner(winner)
      return option
    end
  end
  false
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def full?(board)
  counter = 0
  board.each do |space|
    if space != " "
      counter += 1
    end
  end
  if counter == 9
    return true
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |option|
    if board[option[0]] == "X" && board[option[1]] == "X" && board[option[2]] == "X"
      return "X"

    elsif
      board[option[0]] == "O" && board[option[1]] == "O" && board[option[2]] == "O"
      return "O"
    end
  end
  return nil
end

def over?(board)
  if draw?(board)
    return true
  elsif full?(board) && won?(board)
    return true
  elsif won?(board)
    return true
  end
end
