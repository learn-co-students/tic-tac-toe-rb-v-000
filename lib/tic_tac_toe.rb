WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
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

  user_input.to_i-1
  
end

def move(board, index, player)
  board[index]=player
end

def position_taken?(board, index)
  board[index] != " "
end

def valid_move?(board, index)
  
   if index.between?(0,8)
   if !position_taken?(board, index)
   true
   end
   end
 end
 
 def turn_count(board)
  count = 0
  board.each do |token|
    if token == "X" || token =="O"
    count += 1 
     end
   end 
    return count
 end
 
 def current_player(board)
  count = turn_count(board)
  if count % 2 ==0 
    return "X"
  else return "O"
  end
end 
 
 def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
 
  index = input_to_index(input)
  if valid_move?(board, index)
    player_token = current_player(board)
    move(board, index, player_token)
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
    
    
    if position_1 =="X" && position_2 =="X" && position_3 =="X"
      return win_combination
    elsif position_1 =="O" && position_2 =="O" && position_3 =="O"
      return win_combination
    else #a board with no win 
       false
    end
  end
  false
end


def full?(board)
  if board.detect {|i| i == " " || i == nil}
    false
  else
    true
  end
end
    
    
def draw?(board)
  if !won?(board) && full?(board)
    true
  else false
  end
end  


def over?(board)
  if draw?(board)
    return true
  elsif won?(board) && full?(board)
    return true
  elsif won?(board) && !full?(board)
    return true
  else false
  end
end 

def winner(board)
  if winning_combo = won?(board) 
  board[winning_combo[0]] 
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
