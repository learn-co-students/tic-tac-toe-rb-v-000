
#--------------------------------------------------------------

def play(board)

until over?(board) == true
  turn(board)
end

if draw?(board) == true
  puts "Cat's Game!"
#elsif won?(board) == false
#  puts "No one won but thanks for playing"
elsif winner(board) == "X"
  puts "Congratulations X!"
elsif winner(board) == "O"
  puts "Congratulations O!"
else
  puts "Thanks for playing"
end

end

#--------------------------------------------------------------

def turn(board)

puts "Please enter 1-9:"
user_input = gets
new_index = input_to_index(user_input)

if valid_move?(board, new_index) == false
  turn(board)
end

#puts "What move would you like to make?"
#position = gets.strip

#until position == "X" || position == "O"
#  puts "What move would you like to make?"
#  position = gets.strip
#end

move(board, new_index, current_player(board))
display_board(board)

end

#--------------------------------------------------------------

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#--------------------------------------------------------------

def input_to_index(input)
  input = input.to_i - 1
end

#--------------------------------------------------------------

def move(board, index, position)
  board[index] = position
end

#--------------------------------------------------------------

def valid_move?(board, index)

  if 0 <= index && index <= 8
    within_index = true
  else
    within_index = false
  end
  if position_taken?(board, index) == true
    occupied = true
  else
    occupied = false
  end
  if within_index == true && occupied == false
    return true
  else
    return false
  end

end

#--------------------------------------------------------------

def position_taken?(board, index)
  character = board[index]
  if character == "X" || character == "O"
    return true
  else
    return false
  end
end

#--------------------------------------------------------------

def turn_count(board)
  turns = 0
  board.each do | xoro |
    if xoro == "X" || xoro == "O"
      turns += 1
    end
  end
  return turns
end

#--------------------------------------------------------------

def current_player(board)
  turns = turn_count(board)
  if turns % 2 == 0
    return "X"
  else
    return "O"
  end
end

#--------------------------------------------------------------

def won?(board)

WIN_COMBINATIONS.each do |win_combo|
   win_index_1 = win_combo[0]
   win_index_2 = win_combo[1]
   win_index_3 = win_combo[2]

   position_1 = board[win_index_1]
   position_2 = board[win_index_2]
   position_3 = board[win_index_3]

   if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
   elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
   end
 end
  return false
end

#--------------------------------------------------------------

def full?(board)
  board.each do |i|
    if i == "" || i == " "
      return false
    end
  end
  return true
end

#--------------------------------------------------------------

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

#--------------------------------------------------------------

def over?(board)
  if draw?(board) == true
    return true
  elsif won?(board) != false
    return true
  elsif full?(board) == true
    return true
  elsif won?(board) == true && full?(board) == false
    return true
  else
    return false
  end
end

#--------------------------------------------------------------

def winner(board)

  if won?(board) == false
    return nil
  else
    winning_array = won?(board)
    index = winning_array[0]
    if board[winning_array[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

#--------------------------------------------------------------

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

#--------------------------------------------------------------
