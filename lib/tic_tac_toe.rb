WIN_COMBINATIONS = [
  [0, 1 ,2], #top row [0]
  [3, 4, 5], #middle row [1]
  [6, 7, 8], #bottom row [2]
  [0, 3, 6], #left column [3]
  [1, 4, 7], #middle column [4]
  [2, 5, 8], #right column [5]
  [0, 4, 8], #left diagonal [6]
  [2, 4, 6]  #right diagonal [7]
  ] 
  
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, index, current_player)
  board[index] = current_player
end

def turn_count(board)
  counter = 0 
  board.each do |token|
    if token == "X" || token == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def input_to_index(user_input)
  user_input.to_i - 1
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
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
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
   
   if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
   end
   
 end
else 
  false
end

def full?(board)
  board.all? do |filled|
  filled == "X" || filled == "O"
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
 if win_combination = won?(board)
   board[win_combination.first]
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