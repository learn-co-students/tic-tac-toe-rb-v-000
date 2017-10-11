WIN_COMBINATIONS=
[[0,1,2], [3,4,5], [6,7,8,], #Horizontal Wins
[0,3,6], [1,4,7], [2,5,8], #Vertical Wins
[0,4,8], [6,4,2]] #Diagonal Wins

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index (user_input)
  index = user_input.to_i - 1
  index
end

def move (board, index, current_player)
  board[index]= current_player
end

def position_taken? (board, index)
  if board[index] == " "
    return false
  elsif board[index] == ""
    return false
  elsif board[index] == "X"
    return true
  elsif board[index] == "O"
    return true
  else
    false
  end
end

def valid_move? (board, index)
  #this is saying if our value is between 0 and 8 AND our position is empty ==> this is a valid move
  if index.to_i.between?(0, 8) && position_taken?(board, index) == false
    return true
  #if the above  values are not met then this is an invalid move
  else
    return false
  end
end

def turn(board)
#This is the initial prompt telling our user to input
  puts "Please enter 1-9:"
#this gets our user input
  user_input= gets.strip
#I set the index variable for later methods to = the outcome of the input to index method
  index = input_to_index(user_input)
#If the outcome of the valid move method is true then run the board method and display the board
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
    display_board(board)
#if not run the turn method again
  else
    turn(board)
  end
end

#Counts positions number of positions on the board array
def turn_count(board)
  counter = 0
  board.each do |position|
    #If a position on the board array is an x or a o we will incrment the counter by 1
    if position == "X" || position == "O"
      counter = counter + 1
  end
end
 return counter
end

#Keep track of current player
#The counter for player 1 will always be odd while the counter for player 2 will always be even
def current_player(board)
  if turn_count(board)%2 == 0
    current_player = "X"
  else
    current_player = "O"
  end
  return current_player
end
#Method to determine if a user has won
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
#Searches for if the X player won the game
     if position_1 == "X" && position_2 == "X" && position_3 == "X"
       return win_combination
#Searches for if O player won the game
     elsif position_1 == "O" && position_2 == "O" && position_3  == "O"
       return win_combination
#If neither X nor O won the game board is either empty full or still in progress
     else
       false
     end
   end
end
#Describes if our board is full
def full?(board)
  #If there is a blank space in the board array are board is not full (False) else are board is full
  if board.detect {|square| square == " " || square == nil}
    return false
  else
    return true
  end
end
#Describes method to determine if game is a draw
def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end
#Method to determine if game is over
def over?(board)
  if won?(board) || draw?(board)
    return true
  else
    return false
  end
end
#method to define winnner
def winner(board)
  if win_combination = won?(board)
    board[win_combination.first]
  end
end
#Play the game method
def play(board)
  until over?(board)
    current_player(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end
