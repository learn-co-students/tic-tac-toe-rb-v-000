WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
  return index
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  if board[index] == " "
    false
  else
    true 
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && position_taken?(board, index) == false
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
  count = 0
  board.each do |token|
  if token == "X" || token == "O" 
   count += 1
  end
end
return count
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end


def full?(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
  if board.any? {|z| z == " "}
    false 
  else
    true
  end
end

def draw?(board)
  full?(board) && !(won?(board))
end

def over?(board)
  full?(board) || draw?(board) || won?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end  

def play(board)
  until over?(board)
  current_player(board)
  turn(board)
  end
  
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end


  
  