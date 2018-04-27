WIN_COMBINATIONS = [
  
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Diagonal top left to right
  [2,4,6]  #Diagonal top right to left
  
  ]
  
def display_board (board)
  
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  return user_input.to_i - 1
end

def move(array, index, value)
  return update_array_at_with(array, index, value)
end

def update_array_at_with(array, index, value)
  array[index] = value
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move? (board, index)
  
  if index.between?(0, 8) == TRUE && position_taken?(board, index) != TRUE
    TRUE
  else
    FALSE
  end
    
end

def turn (board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index) == FALSE
    turn (board)
  else
    move(board, index, "X")
    display_board(board)
  end
end

def turn_count (board)
  board.count { |value| value == "X" || value =="O" }
end

def current_player (board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end