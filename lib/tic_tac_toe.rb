board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index = user_input.to_i - 1 
end

def move(board, index, char)
    puts " #{board[index]=char} | #{board[index]=char} | #{board[index]=char} "
    puts "-----------"
    puts " #{board[index]=char} | #{board[index]=char} | #{board[index]=char} "
    puts "-----------"
    puts " #{board[index]=char} | #{board[index]=char} | #{board[index]=char} "

end 

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O" 
    return true 
  else 
    return false
  end 
end 

def valid_move?(board, index)
  if index.between?(0,8) && position_taken?(board,index) == false
    return true
  end 
end
  
def turn(board)
  puts "Please enter a number 1-9"
  user_input = gets.chomp
  index = user_input.to_i - 1 
  if valid_move?(board,index) 
    move(board, index, current_player(board))
  else
    turn(board)
  end
end 


def turn_count(board)
  i = 0 
  board.each do |count|
    if count == "X" || count == "O"
      i = i + 1 
    end
  end 
  return i 
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
   if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board,combo[0]) 
    return true 
   end
end
end 

def full?(board)
  board.all? do |i| 
   i == "X" || i == "O"
  end
end 

def draw?(board)
  if !won?(board)  && full?(board)
    return true
    
  end
end 

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    WIN_COMBINATIONS.detect do |combo|
      if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board,combo[0])
        return board[combo[0]]
      end
    end
  end
end

def play(board)
  until over?(board)
  turn(board)
end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end 

