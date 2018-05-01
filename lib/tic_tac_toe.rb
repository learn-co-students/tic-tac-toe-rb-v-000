################################################
###### Harleigh Abel corrected May 1, 2018
###############################################

WIN_COMBINATIONS = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8],[2, 4, 6]]

def display_board(board = " ")
 line = "-----------"
 puts " #{board[0]} | #{board[1]} | #{board[2]} "
 puts line
 puts " #{board[3]} | #{board[4]} | #{board[5]} "
 puts line
 puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
 index = user_input.to_i - 1
end

def move(board, position, character)
 board[position] = character
 return board
end

def position_taken?(board, index)
  if board[index] == " " ||board[index] == "" || board[index] == nil
    return false
  else
    true
  end
end

def valid_move? (board, index)
  index.between?(0, 8) && !(position_taken?(board, index)) ? true : false
end  

def turn(board)
    puts "Please enter 1-9: "
    user_input = gets.strip
    index = input_to_index(user_input)
    
    if !valid_move?(board, index)
        turn(board)
    end    
    character = current_player(board)
    move(board, index, character)
    display_board(board)
end

def turn_count(board)
 counter = 0
 board.each do |value|
   if value == "X" || value == "O"
     counter += 1
   end
 end
 return counter
end


def current_player(board)
 counter = 0
 board.each do |value|
   if value == "X" || value == "O"
     counter += 1
   end
 end
 character = counter.even? ? "X" : "O"
end

def won?(board)
 # converts empty spaces for nil to string character for comparison
 board.each do |space|
   if space == "nil" || space == "" || space == " "
     space = "-"
   end
 end
 # iterate through each array of win combinations
 WIN_COMBINATIONS.each do |array|
   # create a string of board values for winning combinations
   win_combo = board[array[0]] + board[array[1]] + board[array[2]]
   # compare board string value to winning game values
   if win_combo == "XXX" || win_combo == "OOO"
     # return the win_combination indexes that won
     return array
   end
 end
 # return false for non-winning boards
 return false
end
def full?(board)
   board.each do |value|
     if value == "X" || value == "O"
       true
     else
       return false
     end
   end
 true
end

def draw?(board) # tested and working
 won = won?(board)
 full = full?(board)
  if won == false && full == true
     true
  end
end

def over?(board)
  won?(board) || draw?(board) || full?(board) ? true : false
end

def winner(board)
  WIN_COMBINATIONS.each do |array|
    win_combo = board[array[0]] + board[array[1]] + board[array[2]]
    return "X" if win_combo == "XXX"
    return "O" if win_combo == "OOO"
  end
  nil
end  

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end  
  