WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

def input_to_index(input)
input = (input.to_i) - 1
end

def move(board, index, value)
  board[index] = value
end

  def position_taken?(board, index)
if board[index] == " "|| board[index] == ""|| board[index] == nil
  return false
else
  return true
end
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0,8)
    return true
  else
    return false
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
  board.each do |token|
 if token == "X" || token == "O"
   counter += 1
  end
  end
  return counter
end

def current_player(board)
 if turn_count(board).even?
   return "X"
 elsif turn_count(board).odd?
   return "O"
end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combos|
       board[win_combos[0]] == board[win_combos[1]] && board[win_combos[1]] == board[win_combos[2]] && position_taken?(board, win_combos[0])
end
  end

  def full?(board)
WIN_COMBINATIONS.each do |elements|
    if !position_taken?(board, elements[0])
      return false
end
end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  if won?(board)  || draw?(board)||full?(board)
    return true
end
end

def winner(board)
if token = won?(board)
 return board[token[0]]
end
end

def play(board)

until over?(board)
  turn(board)
end
if draw?(board)
  puts "Cat's Game!"
elsif won?(board) && winner(board) == "O"
  puts "Congratulations O!"
elsif won?(board) && winner(board) == "X"
  puts "Congratulations X!"


end
end
