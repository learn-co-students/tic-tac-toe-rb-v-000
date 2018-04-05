require 'pry'
WIN_COMBINATIONS = [
  [0,1,2], #top row 
  [3,4,5], #middle row 
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
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

def move(board, index, player)
 # binding.pry
  board[index] = player 
  #binding.pry
end

def position_taken?(board, location)
  board[location] == "X" || board[location] == "O"
end    

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end


def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  #binding.pry
  if valid_move?(board, index)
   # binding.pry
    move(board, index, current_player(board))
    display_board(board)
  else
    #binding.pry
    #puts "Try again."
    turn(board)
  end
end

def turn_count(board)
 counter = 0
 board.each do |unit|
   if unit == "X" || unit == "O"
    counter += 1 
   end
 end
return counter 
end  

def current_player(board)
  if turn_count(board) % 2 == 0
    player = "X"
  else   
    player = "O"
  end 
# player
end

def won?(board)
  ex = WIN_COMBINATIONS.detect do |win_group|
    board[win_group[0]] == board[win_group[1]] && board[win_group[1]] == board[win_group[2]] && position_taken?(board, win_group[0]) 
  end 
  #binding.pry
  ex
end 

def full?(board)
  #binding.pry 
 board.all? {|idx| idx == "X" || idx == "O"}
end   

def draw?(board)
   #binding.pry 
   !won?(board) && full?(board)
end   

 
def over?(board)
  #binding.pry 
   won?(board) || draw?(board) 
end 

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end  
end  
    
  
# WIN_COMBINATIONS.each do |win_group|
#    if win_group.all? {|win_index| board[win_index] == "X"}
#      return "X"
#    elsif win_group.all? {|win_index| board[win_index] == "O"}
#      return "O"
#    else
#       nil 
#    end
#  end
#  nil 
#end   


def play(board)
  while !over?(board) #&& !won?(board) && !draw?(board)
  #binding.pry
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end

#display_board(board) 
#play(board)




 
 




