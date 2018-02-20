WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Left start diagonal
  [2,4,6]  #Right start diagonal
]

def display_board(board)
 
  puts" X | X | X "
  puts" X | X | X "
  puts"-----------"
  puts" X | O | O "
  puts" X | O | X "
  puts" O | X | X "
  puts" O | X | O "
end 
   
def input_to_index(move)
   index = move.to_i - 1
   index
end
 
def move(board, index, token) 
   board[index] = token
end 

def position_taken?(board, index)
 !(board[index] == " " || board[index] == "" || board[index] == nil)
end
  

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end


def turn(board)
    puts "Please enter 1-9:"
  user_input = gets.chomp 
  user_input = input_to_index(user_input)
 if valid_move?(board,index = user_input)
    move(board, index, current_player(board))
 else 
    turn(board)
  end 
    display_board(board)
  end 
  
  
    def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter +=1
  end
end
return counter
end
   
   
def current_player(board)
  if turn_count(board)%2 ==0
    current_player = "X"
  else 
    current_player = "O"
  end 
  return current_player
end 

 def won?(board)
  WIN_COMBINATIONS.each do |win_move|
  win_index_1 = win_move[0]
  win_index_2 = win_move[1]
  win_index_3 = win_move[2]
 
  position_1 = board[win_index_1] 
  position_2 = board[win_index_2]
  position_3 = board[win_index_3] 
 
  if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_move
  end 
  end
else 
  false 
end 


def full?(board)
    !board.any? { |x| x == " " }
  end
  
   def draw?(board)
    if  !won?(board) && full?(board)
    puts "the game has been won"
      return true 
    else 
      puts "the game has not been won"
  return false 
    end 
  end 
  
  def over?(board)
if  full?(board) || won?(board) || draw?(board)
  puts "Congratulations X!"
  puts "Congratulations O!"
  puts "Cat's Game!"
  return true  
else 
  puts "Cat's Game!"
  return false 
end 
end 

 def winner(board)
    if winner = won?(board)
      board[winner.first]
    end
  end
  
 
 def play(board) 
  while  over?(board) == false 
 turn(board)
  end 
 end 


  
