WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First row up/down
  [1,4,7], # Second row up/down
  [2,5,8], # Third row up/down
  [0,4,8], # Digonal top left to bottom right
  [2,4,6]  # Digonal top right to bottom left
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
def player_move(board, index, token)
  board[index] = token
end
def position_taken?(board, index)
 !  (board[index] ==  " " || board[index] == "" || board[index] == nil)
  end
def position_taken?(board, index)
 board[index] !=  " " 
end
  def valid_move?(board, index)
       index.between?(0, 8) && !position_taken?(board, index)
  end
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    player_move(board, index, current_player(board))
    display_board(board)
   else
    puts "try again"
    turn(board)
  end
  display_board(board)
end
def turn_count(board)
  counter = 0 
  board.each do |token|
    if token == "X" || token == "O"
      counter +=1
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
  WIN_COMBINATIONS.each {|win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
  
  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
   if position_1 == "X" && position_2 == "X" && position_3 == "X"
     return win_combination
   elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
   return win_combination
 end
  }
  false 
  
end
def full?(board)
  board.all? {|index| index == "X" || index =="O"}
end
def draw?(board)
  if !won?(board) && full?(board)
    true 
  else
    false 
  end
end
def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end
def winner(board)
  index = won?(board)
  if index 
    return board[index[0]]
  end
end
def play 
  until over?(board)
  turn(board)
end
if won?(board)
  end
end




