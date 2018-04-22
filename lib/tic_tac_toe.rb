# Define your WIN_COMBINATIONS constant
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
  
#display_board method
  
def display_board(board)
  puts " "+board[0]+" " +"|"+" "+board[1]+" " + "|"+" "+board[2]+" "
  puts "-----------"
  puts " "+board[3]+" " +"|"+" "+board[4]+" " + "|"+" "+board[5]+" "
   puts "-----------"
  puts " "+board[6]+" "+"|"+" "+board[7]+" " + "|"+" "+board[8]+" "
end

#input_to_index method

def input_to_index(user_input)
  user_input.to_i - 1
end

# move method 

def move(board, index, char)
  board[index]=char
  return board
end

def position_taken?(board, index)
    if(board[index]=="X" || board[index]=="O")
      return true
    elsif(board[index]=="" || board[index]==" " || board[index]==nil)
      return false
    end
end


# valid_move? method

def valid_move?(board, index)
  if(index.between?(0,8) && !position_taken?(board, index))
    return true
  else
    return false
  end
end

# turn method

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  
  index = input_to_index(input)
  
  if(valid_move?(board, index))
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

# turn_count

def turn_count(board)
  count = 1
  index = 0
  while(index < 8) do
   if(position_taken?(board, index))
     count += 1
   end
   index = index + 1
  end
  return count
end


=begin
def turn_count(board)
  pos = 0
  board.each do |count|
     if(count=="X" || count =="O")
        pos = pos + 1
     end
    end
return pos
end

=end
#current_player method 

def current_player(board)
  if(turn_count(board).even?)
    return  "O"
  else
    return "X"
  end
end

#won? method 

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|

     win_index_1  = win_combination[0]
     win_index_2  = win_combination[1]
     win_index_3  = win_combination[2]

     position_1 = board[win_index_1]
     position_2 = board[win_index_2]
     position_3 = board[win_index_3]


      if(position_1=="X" && position_2=="X" && position_3=="X")
          return win_combination
        elsif(position_1=="O" && position_2=="O" && position_3=="O")
          return win_combination
      end
  end

  return false

end


#full? method

def full?(board)
	index=8
	while(index>=0)
    if(position_taken?(board, index))
	  	index-=1
	  else
	  	return false
  	end
  end
  return true
end

#draw? method 

def draw?(board)
  if(!won?(board) && full?(board))
      return true
    else
      return false
    end
end

#over method

def over?(board)
  if(won?(board) || draw?(board) || full?(board))
    return true
  else
    return false
  end
end

#winner method 

def winner(board)
  if(won?(board))
       win_arr = won?(board)
       if(board[win_arr[0]]=="X")
            return "X"
       else
            return "O"
       end
  else
      return nil
  end
end

#play method

def play(board)
  
if(turn_count(board)==0)
  puts "Please enter 1-9:"
  input = gets.strip
  turn(board)
end
  
  
  until(over?(board)) do
       turn(board)
  end
  
  if(won?(board))
    puts "Congratulations #{winner(board)}!"
  elsif(draw?(board))
    puts "Cat's Game!"
  end  
  

end


