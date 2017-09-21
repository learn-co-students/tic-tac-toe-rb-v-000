# define the various win combinations in a nested array
WIN_COMBINATIONS=[
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Left diagonal
  [6,4,2] # Right diagonal
  ]

  #Output the contents of the current board
  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

#Convert users input to a valid board index
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  #Identify the index position that will be filled and which user is up
  def move(board, index, current_player)
  board[index] = current_player
end

#Check to see if the position chosen by the user is already taken
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

#Check to make sure they user has chosen a valid position in the board
#and that the position is free
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

# Define the play method - Make sure the game is not over (ie nobody won and the board isn't full.) Then go to turn
def play(board)
  # board == ['X','X','X', , , ,,  , ]Remember that the Spec test passes a winning board!
  until over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
     puts "Cats Game!"
  end

end


#Ask the user where they want to move, check their input and convert it to an index
#and check to see if valid. If valid, make the move and display the board. If not,
#ask for a new position until a valid move is given by the user.
def turn (board)
puts "Please enter 1-9:"
user_input=gets.strip

  index=input_to_index(user_input)

 if valid_move?(board,index)
    move(board,index,current_player(board))
    display_board(board)

 else turn(board)
end
end

#Check the board to see how many turns have been played
def turn_count (board)
9 - board.count(" ")
end

#After identifying how many turns have been played, determine whether it is X or O's turn
def current_player(board)
  if turn_count(board).even?
    "X"
  else
   "O"
  end
end

#Check the board and see if there are any matches between the Win_Combinations
def won?(board)
    WIN_COMBINATIONS.detect do |winarr|
      board[winarr[0]] == board[winarr[1]] &&
      board[winarr[1]] == board[winarr[2]] &&
      position_taken?(board, winarr[0]) # Check to make sure that if the elements that match within an array are not " " or nil
    end
  end

  #If the board is full (ie every index is filled then return True)
  def full?(board)
  board.all? {|chip| chip == "X" || chip == "O"}  end

#If the board has not been won (ie there is NO match with Win_Combinations then return True, False
# if the board is not won and the board is not full, and fals if the board is won)
def draw? (board)
   !won?(board) && full?(board)
end

#Return True if the board has been won, is a draw, or is full. Since a draw implies a full board only test for draw.
# Note that the Spec Test is specific about first testing for a won board, then draw/full so stack it this way when You
#code it
def over? (board)
  won?(board)||draw?(board)
end

#Returns an X or O to indicate who won the game given a winning board
def winner (board)

if who_won=won?(board)
  board[who_won.first]
  end
end
