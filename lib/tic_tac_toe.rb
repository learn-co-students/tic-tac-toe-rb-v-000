WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8], [0,4,8],[2,4,6]]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  integer =  input.to_i
  index = integer - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && (position_taken?(board, index) == false)
    return true
  else
  end
end


def position_taken?(board, index)
  if board[index] == " " || board[index] == ""|| board[index] == nil
    return false
  else
    return true 
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  until valid_move?(board, index) == true
    puts "Please enter 1-9:"
    input = gets.strip
    input_to_index(input)
    index = input_to_index(input)
  end
  move(board, index, current_player(board))
  display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |position|
    if position == "O" || position == "X"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X" 
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if position_taken?(board, combo[0]) == true && (board[combo[0]] == board[combo[1]]) && (board[combo[1]] == board[combo[2]])
      return combo
    end
  end
  false
end

def full?(board)
  board.all? { |position| position == "X" || position == "O"}
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
end
return false
end

def over?(board)
  if ((won?(board) != false) && (full?(board) == false)) || draw?(board) == true || ((won?(board) != false) && (full?(board) == true))
    true
  end
end

def winner(board)
  if won?(board) != false
    array = won?(board)
    return board[array[0]]
  end
end

def play(board)
  until over?(board) == true
   turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end