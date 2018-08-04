# WIN_COMBINATIONS constant ###########################################################################

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

# won? method code ###################################################################################

def won?(board)
    
    if empty?(board)
      return false 
    end
  
    WIN_COMBINATIONS.each do |win_combo|
    windex_1 = win_combo[0]
    windex_2 = win_combo[1]
    windex_3 = win_combo[2]
    
    position_1 = board[windex_1] 
    position_2 = board[windex_2] 
    position_3 = board[windex_3] 
    
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" &&   position_2 == "O" && position_3 == "O") 
        return true
      end
    end 
  return false 
    
end

def empty?(board)
  board.each do |entry|
      if entry != " "
       return false 
     end
    end
  return true 
end

# full? method code #################################################################################

def full?(board)
  
   board.each do |entry|
      if entry == " "
       return false 
     end
    end
  return true 
end

# draw? method code #################################################################################

def draw?(board)
  
  if !won?(board) && full?(board) 
    return true
  else 
    return false 
  end
end 

# over? method code #################################################################################

def over?(board)
  
  if full?(board)  || draw?(board) || won?(board) 
    return true 
  else
    return false 
  end
end 

# winner method code #################################################################################

def winner(board)

    WIN_COMBINATIONS.each do |win_combo|
    windex_1 = win_combo[0]
    windex_2 = win_combo[1]
    windex_3 = win_combo[2]
    
    position_1 = board[windex_1] 
    position_2 = board[windex_2] 
    position_3 = board[windex_3] 
    
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") 
        return "X"
      elsif (position_1 == "O" &&   position_2 == "O" && position_3 == "O") 
        return "O"
      end
    end
    
    return nil 
 end

# display_board method code ############################################################################

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# move method code ############################################################################

def move(board, index, current_player)
  board[index] = current_player
end

# position_taken method code ############################################################################

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

# valid_move method code ############################################################################

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

# turn method code ############################################################################

def turn(board)
  puts "Please enter 1-9:"
  user_entry = gets.strip.to_i - 1
  
  if
    valid_move?(board,user_entry) == true 
    move(board,user_entry,current_player(board))
    display_board(board)
  else
      until valid_move?(board,user_entry) == true do
       puts "That is not a valid move. Please enter 1-9:"
        user_entry = gets.strip.to_i - 1
      end
      move(board,user_entry,current_player(board))
      display_board(board)
  end
end

# input_to_index method code ############################################################################

def input_to_index(entry)
  index = entry.to_i - 1
end

# turn_count method code ############################################################################

def turn_count(board)

  counter = 0 
  board.each do |entry|
    if entry != " "
      counter += 1
    end
  end
    return counter
end

# current_player method code ############################################################################

def current_player(board)
  player_turn = turn_count(board) + 1
  
  if player_turn % 2 == 0 
    return "O"
  else
    return "X"
  end
end

# play method code ############################################################################

def play(board)
  
  while over?(board) == false
    turn(board)
  end
    
  if won?(board) == true
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board) == true
    puts "Cat's Game!"
  end
end
