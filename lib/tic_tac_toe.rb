WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Left diagonal
  [2,4,6]  # Right diagonal
]

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

def move(board,index, value)
  update_array_at_with(board, index, value)
end

def update_array_at_with(array, index, value)
  array[index] = value
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

# def position_taken?(board, index)
#   if board[index] == " "
#     false
#   elsif board[index] == ""
#     false
#   elsif board[index] == nil
#     false
#   else board[index] == "X" || board [index] == "O"
#     true
#   end
# end

def valid_move?(board, index)
if index.between?(0,8) && !position_taken?(board, index)
  true
else
  false
end
end

def turn(board)
  puts "Please enter 1-9:"  #asks for an input
  input = gets.strip  #gets the input
  index = input_to_index(input) #convert the input to index
  if valid_move?(board, index) #if the move is valid
    value = current_player(board) #value = "X"
    move(board, index, value)  #make the move for the index
    display_board(board) #show the board
  else
    turn(board) #otherwise, ask for input again
  end
end

def turn_count(board)
  occupied_spaces = 0
    #if there is an X or an O, then the space is occupied. If there is nothing, then it is unoccupied. Each time a space is occupied, add one to the counter.
    #we want to repeat this same procedure for every element in the board array
    board.each do |space|
      if space == "X" || space == "O"
        occupied_spaces += 1
    #  else occupied spaces remain the same and it loops again.
      end
    end
    #when the process is done, show the number of occupied spaces
    occupied_spaces
end

def current_player(board)  #defines a method current_player and passes it the argument board
  if turn_count(board) % 2 == 0  #to determine if turn is an even number, then X gets displayed, otherwise O gets displayed.
    current_player = "X"
  else
    current_player = "O"
  end
end

def won?(board)  #defining the method won? and passing the argument board
  WIN_COMBINATIONS.detect do |match_array|
    position_taken?(board, match_array[0]) &&
    board[match_array[0]] == board[match_array[1]] &&  #the value in the first index and the second index are the same value and
    board[match_array[1]] == board[match_array[2]]     #the value in the second index and the third index are the same value
    # each time the top row, [0,1,2] all have "Xs" or all have "Os", then it is a won? = true
  end
end

def full?(board)  #if all the positions on the board has a value, then the board is full.
board.all?{|i| i=="X" || i=="O"} #using the iterator #all? to check that ALL the indexes on the BOARD has a value of either "X" or "O"
end

def draw?(board)
  !won?(board) && full?(board) #returns true if the board has not been won and if the board is full
        #anything else returned is false
end

def over?(board)
  won?(board) || draw?(board) || full?(board)  # returs true if the board has been won or if there is a draw or if the board is full.
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
else draw?(board)
    puts "Cats Game!"
  end
end
