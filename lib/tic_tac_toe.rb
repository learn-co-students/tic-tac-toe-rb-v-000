require 'pry'
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
						        [0,1,2],
						        [3,4,5],
						        [6,7,8],
						        [0,3,6],
						        [1,4,7],
						        [2,5,8],
						        [0,4,8],
						        [6,4,2]]
# Helper Method
# Define display_board that accepts a board and prints
# out the current state.
def display_board(board)
  puts " #{board[0]} " "|" " #{board[1]} " "|" " #{board[2]} "
  puts "-----------"
  puts " #{board[3]} " "|" " #{board[4]} " "|" " #{board[5]} "
  puts "-----------"
  puts " #{board[6]} " "|" " #{board[7]} " "|" " #{board[8]} "
end

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

# Helper Method
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

###############################################################
##### GOOD CODE BELOW
# Helper Method
def turn_count(board)
	board.count{|token| token == "X" || token == "O"}
end

# Helper Method
def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

# Helper Method
def position_taken?(board, index)
	!(board[index].nil? || board[index] == " ")
end

# Helper Method
def is_empty?(board)
	index = 0
	while index < 9
		if position_taken?(board, index)
			 index =+ 1
		end
		break
	end
end

# Helper Method
def won?(board)
	WIN_COMBINATIONS.find do |win|
	 board[win[0]] == board[win[1]] && board[win[0]] == board[win[2]] && board[win[0]] != " "
 end
end

# Helper Method
def full?(board)
	!board.include?( " " || nil )
end

# Helper Method
def draw?(board)
	full?(board) && !won?(board)
end

# Helper Method
def over?(board)
	draw?(board) || won?(board) || full?(board)
end

# Helper Method
def winner(board)
	if over?(board)
		current_player(board)
	else
		nil
	end
end
