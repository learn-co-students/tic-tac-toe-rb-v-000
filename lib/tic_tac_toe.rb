
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left row top to bottom
  [1,4,7], #Center row top to bottom
  [2,5,8], #Right row top to bottom
  [0,4,8], #Top left to bottom right
  [2,4,6], #Top right to bottom left
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

def move(board, index, value = "X")
  board[index] = value
end

def position_taken?(board, position)
  if board[position] == " "
    false
    elsif board[position] == ""
    false
    elsif board[position] == nil
    false
    else
    true
    end
end

def valid_move?(board, index)
  #if the position is not taken then it's valid & the move must be between 0 and 8.
  if !position_taken?(board, index) && index.between?(0,8) == true
  true
  end  
end

# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
#if position is filled with X or O the position is taken.
def position_taken?(board, position)
  if board[position] == "X" || board[position] == "O"
    true
    else
    false
    end
end

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

def valid_move?(board, index)
  #if the position is not taken then it's valid & the move must be between 0 and 8.
  if !position_taken?(board, index) && index.between?(0,8) == true
  true
  end  
end

# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
#if position is filled with X or O the position is taken.
def position_taken?(board, position)
  if board[position] == "X" || board[position] == "O"
    true
    else
    false
    end
end

def move(board, index, value)
  board[index] = value
end

def turn(board)
  puts "Please enter 1-9:"
  #gets the user input
  user_input = gets.strip
  #input to index
  index = input_to_index(user_input)
  
  #Validation Check
  if valid_move?(board,index)
    puts 'valid move'
    move(board, index, current_player(board))
    display_board(board)
   else
    puts 'try again'
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  counter = 0

  board.each do |space|
    if space == "X" || space == "O"
      counter += 1
    else
      false
    end
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    current_player = "X"
  else 
    current_player = "O"
  end
  return current_player
end

def won?(board)
  
  WIN_COMBINATIONS.find do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
  
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
  
    position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_3)
  
  end
end
    
def full?(board)
  !board.any? { |x| x == " " }
end

def draw?(board)
  if !won?(board) && full?(board)
    puts "Draw"
    return true
  end
end

def over?(board)
  if won?(board)
    true
  elsif draw?(board)
    true
  elsif full?(board)
    true
  else
    false
  end
end

def winner(board)
  if winning_index = won?(board)
    board[winning_index[0]]
  else
    nil
  end
end  

# until the game is over
#   take turns
# end
 
# if the game was won
#   congratulate the winner
# else if the game was a draw
#   tell the players it has been a draw
# end

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



