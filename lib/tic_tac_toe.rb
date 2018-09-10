def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
 return "#{input}".to_i - 1
end

def player_move(board, index, character)
  board[index] = character
  return board 
end

def position_taken?(board, index)
  if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
    return false 
  else
    return true 
  end 
end 

def valid_move?(board, index)
  if (position_taken?(board, index) == false) && (index.between?(0, 8))
    return true
  else
    return false 
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  
  index = input_to_index(input)
  character = current_player(board)

  if valid_move?(board, index) == true 
  player_move(board, index, character)
  display_board(board)
  else 
 turn(board)
  end 
end

def turn_count(board)
counter = 0
board.each do |turn|
  if turn == "X" || turn == "O"
    counter += 1
  else turn == " "
    counter 
  end
end
return counter
end

def current_player(board)
  if turn_count(board).even? == true 
   return "X"
 else 
 return "O"
end
end

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
  
def won?(board)
WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
end
end

def full?(board)
 board.all?{|position| position == "X" || position == "O"}
end

def draw?(board)
 !won?(board) && full?(board)
end 

def over?(board)
  if won?(board) || draw?(board)
    return true 
  end
end

def winner(board)
if winning_combo = won?(board)
board[winning_combo.first]
end
end

def play(board)
  while !over?(board)
    turn(board)
  end

  if draw?(board)
  puts "Cat's Game!"
else won?(board)
  puts "Congratulations #{winner(board)}!"
end 
end