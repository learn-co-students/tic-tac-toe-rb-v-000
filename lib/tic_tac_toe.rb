WIN_COMBINATIONS=[[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

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

def move(board, index, character)
  board[index] = character
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
    move(board, index, character = current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |count|
    if count == "O" || count == "X"
    counter += 1
    end
  end
  return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  elsif turn_count(board) % 2 != 0
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_taken?(board, win_index_1) && position_2 == position_1 && position_3 == position_2
      return win_combination 
    end     
  end
  return false
end

def full?(board)
  board.all? do |board_array|
    board_array == "X" || board_array == "O"
  end
end

def draw?(board)
  full?(board) == true && won?(board) == false
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  win = won?(board)
  if win 
    board[win.first]
  end
end


def play(board)
  until over?(board)
    turn(board)
    if won?(board) || draw?(board)
      break
    end
  end
  
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
   puts "Congratulations O!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
