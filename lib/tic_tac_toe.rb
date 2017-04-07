################################################
###### WORK IN PROGRESS 
###### failing tests
###### #play checks if the game is won after every turn
###### #play congratulates the winner X
###### #play congratulates the winner O
###### #play prints "Cats Game!" on a draw
###### functional during execution but not tests
###### Harleigh Abel April 6, 2017
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
 if index.between?(0, 8) && !(position_taken?(board, index))
   return true
 else
   return false
 end
end

def turn(board)
 move = " "
 index = -1
 character = current_player(board)
 valid_move?(board, index)
 until valid_move?(board, index) == true
   puts "Please enter an integer from 1-9: "
   move = gets.strip
   index = input_to_index(move)
   "invalid"
 end
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
 if winner(board) == "X" || winner(board) == "O" || full?(board) == true
   return true
 else
   false
 end
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
 while over?(board) == false
   turn(board)
   array = won?(board)
   puts array
   if winner(board) == "X"
       puts "Congratulations X!"

     elsif winner(board) =="O"
       puts "Congratulations O!"
       return array
     else
       false
     end

    if draw?(board) == true
     puts "Cat's Game!"
     return
    end
  end
end