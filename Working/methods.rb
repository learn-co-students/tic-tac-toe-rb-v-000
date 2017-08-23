# Helper Method
def turn(board)

  # display board
  display_board(board)

  #ask for input
  puts "Please enter 1-9:"

  #get input
  user_input = gets.strip

  #convert input to index
  index = input_to_index(user_input)

  # check if index is valid
	if valid_move?(board, index)
    #make the move for index
  	move(board, index, value = "X")
  else
    #ask for input again until you get a valid input
    turn(board)
	end
	#show the board
	display_board(board)
end

# Helper Method
#INPUT_TO_INDEX

#convert input to index
def input_to_index(user_input)
  index = user_input.to_i - 1
end

#VALID_MOVE?
#Should accept a board and an index from the user and return true if the index is within the correct range of 0-8 and is currently unoccupied by an X or O token.
#Hint: While not explicitly required by this lab, you might want to encapsulate the logic to check if a position is occupied in its own method, perhaps #position_taken?

def valid_move?(board, index)
  if index.between?(0, 8)
  # re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
  def position_taken?(board, index)
    if board[index] == " "
      !false
    elsif board[index] == ""
      !false
    elsif board[index] == nil
      !false
    elsif board[index] == "X" || board[index] == "O"
      !true
    end
  end
  position_taken?(board, index)
end


#MOVE
#This method should accept a board, an index from the user (which was converted from their raw input with input_to_index), and a token to mark that position with (you can give that argument a default value of 'X'––we're not worrying about whose turn it is yet). The method should set the correct index value of that position within the board equal to the token.

def move(board, index, value)
  board[index] = value
end

#TURN
def turn(board)

  # display board
  display_board(board)

  #ask for input
  puts "Please enter 1-9:"

  #get input
  user_input = gets.strip

  #convert input to index
  index = input_to_index(user_input)

  # check if index is valid
	if valid_move?(board, index)
    #make the move for index
  	move(board, index, value = "X")
  else
    #ask for input again until you get a valid input
    turn(board)
	end
	#show the board
	display_board(board)
end

# Helper Method
def play(board)
	# display board
  display_board(board)

  #ask for input
  puts "Please enter 1-9:"

  #get input
  user_input = gets.strip

  #convert input to index
  index = input_to_index(user_input)
end

# Helper Method
describe '#turn' do
  it 'makes valid moves' do
    board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

    allow($stdout).to receive(:puts)

    expect(self).to receive(:gets).and_return("1")

    turn(board)

    expect(board).to match_array(["X", " ", " ", " ", " ", " ", " ", " ", " "])
  end

  it 'asks for input again after a failed validation' do
    board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

    allow($stdout).to receive(:puts)

    expect(self).to receive(:gets).and_return("invalid")
    expect(self).to receive(:gets).and_return("1")

    turn(board)
  end
end

``` I reordered your code to make it easier to follow.
So unless you have an input_to_index(input) method defined somewhere else
in your program your make_index(choice) method will
fail for any strings and be an invalid array index for any numbers not in the
range of integers 1...9
```


```
# Helper Method
def input_to_index(user_input)
  user_input.to_i - 1
end
# Helper Method
def move(board, index, current_player)
  board[index] = current_player
end

# Helper Method
def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end
```
