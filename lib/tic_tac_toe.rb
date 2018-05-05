WIN_COMBINATIONS = [
  
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Diagonal top left to right
  [2,4,6]  #Diagonal top right to left
  
  ]
  
def display_board (board)
  
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  return user_input.to_i - 1
end

def move(array, index, value)
  return update_array_at_with(array, index, value)
end

def update_array_at_with(array, index, value)
  array[index] = value
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move? (board, index)
  
  if index.between?(0, 8) == TRUE && position_taken?(board, index) == false
    TRUE
  else
    FALSE
  end
    
end

def turn (board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index) == false
    turn (board)
  else
    move(board, index, current_player(board))
    display_board(board)
  end
end

def turn_count (board)
  board.count { |value| value == "X" || value =="O" }
end

def current_player (board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  empty = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  winning_numbers = [] #store and return this

  WIN_COMBINATIONS.each do |array|
    if empty == board
      return false
    elsif array.all? { |value| board[value] =="X" } || array.all? { |value| board[value] =="O" }
      winning_numbers = array
      break
    else
      winning_numbers = nil
    end # end for If statements
  end # end for enumerations
  return winning_numbers #return this value
end #end for function won?

def full?(board)
 !board.detect { |x| x == " " }
end


=begin
def draw?(board)
  if won?(board) #if won, return false
    return false
  elsif !won?(board) && !full?(board) #not won AND not full, return false
    return false
  elsif !won?(board) && full?(board) #not won AND full, return true
    return true
  end
end
=end

def draw?(board)
  if won?(board)
    return false
  else
    if !full?(board)
      return false
    else
      return true
    end
  end
end


def over?(board)
  if draw?(board) || won?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  elsif board.any? { |x| x == " " } && !won?(board)
    return false
  end
end

=begin
def winner(board)
  if won?(board)
    the_winning_letter = won?(board)
    if the_winning_letter.detect { |value| board[value] == "X" }
      return "X"
      elsif the_winning_letter.detect { |value| board[value] =="O" }
      return "O"
    end
  else
    nil
end
=end

def winner(board)
  winner_return = won?(board)
  if winner_return == nil
    return nil
  else
    return board[winner_return.first]
  end
end

def play(board)
  while !over?(board)
    turn(board)
  end
  
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end











