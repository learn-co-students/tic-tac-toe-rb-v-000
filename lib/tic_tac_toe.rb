

WIN_COMBINATIONS = [
  [0,1,2],
  [0,4,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [3,4,5],
  [6,7,8]]


def display_board(board)
	    puts " #{board[0]} | #{board[1]} | #{board[2]} "
	    puts "-----------"
	    puts " #{board[3]} | #{board[4]} | #{board[5]} "
	    puts "-----------"
	    puts " #{board[6]} | #{board[7]} | #{board[8]} "
	  end


def input_to_index(user_input)
  converted_input = user_input.to_i - 1 
end 


def move(board, index, token)
  board[index] = token
end


def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    return true
  elsif  board[index] ==  " " || board[index] == "" || board[index] == nil
     return false
    else  
      return "oops"
  end
end


def valid_move?(board, index)
  if index.between?(0,8) && position_taken?(board, index) == false
    return true
  else  
    return false
  end
end


def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end


def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  converted_input = input_to_index (user_input)

    if valid_move?(board, converted_input) 
    move(board, converted_input, current_player(board))
    display_board(board)
      else
        turn(board)
    end
end


def turn_count(board)
  counter = 0
  board.each do |board_position|
    if board_position == "X" || board_position == "O"
    counter += 1 
    end
  end
  return counter
end


def current_player(board)
  if turn_count(board) % 2 == 0 
    return "X"
  else  
    return "O"
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
 
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination 
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  end
end
else
    false
end


def full?(board)
  if board.include?(' ') || board.include?('')
    return false
else
    return true
  end
end


def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
end


def over?(board)
  if full?(board) || draw?(board)
    return true
    elsif won?(board)
      return true
  else  
    return false
  end
end


def winner(board)
 winning_combo = won?(board)
 if winning_combo
   return board[winning_combo[0]]
  end
end


def play(board) 
  while !over?(board)
    turn(board)
  end 
  
  if draw?(board)
    puts "Cat's Game!"
      
     elsif won?(board)
        puts "Congratulations #{winner(board)}!"
  end
end




