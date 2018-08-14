WIN_COMBINATIONS = [
  [0, 1 ,2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [0, 3, 6],
  [2, 4, 6],
  [1, 4, 7],
  [2, 5, 8]
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

def move(board, index, value)
  board[index] = value
  
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
    move(board, index, value = current_player(board))
    display_board(board)
  else
    turn(board)
  end     
end

def turn_count(board)
  counter = 0
  board.each do |space|
    if space != " "
      counter += 1
    end
  end
  counter
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
    board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? do |space|
    space != " " 
  end
end

def draw?(board)
  !won?(board) && full?(board)
 end

def over?(board)
 draw?(board) || won?(board) || full?(board) 
 
end

def winner(board)
  if win_combo = won?(board)
    board[win_combo.first] 

end
end

def play(board)
   input = 0 
   while input < 9 
   turn(board)
  input += 1 
  if over?(board)
    return winner(board) 
  else
  play(board)
  end
  end
end
