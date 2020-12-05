require 'pry'

WIN_COMBINATIONS = [
		[0,1,2], # Top row win
		[3,4,5], # Middle row win
		[6,7,8], # Bottom row win
		[0,3,6], # Vertical left win
		[1,4,7], # Vertical middle win
		[2,5,8], # Vertical right win
		[0,4,8], # Diagonal win
		[6,4,2] # Diagonal win
	]

	def display_board(board)
		puts " #{board[0]} | #{board[1]} | #{board[2]} "
		puts "-----------"
		puts " #{board[3]} | #{board[4]} | #{board[5]} "
		puts "-----------"
		puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
		input.to_i.pred
end
	
def move(board, index, players_character)
		board[index] = players_character
		#binding.pry
end 

def position_taken?(board, index)
		!board[index] == " " || !board[index] == "" || !board[index] == nil || board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
		index.between?(0, 8) && !position_taken?(board, index)
		#position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
		#binding.pry
end

# first person to go is always X, so if turn count is even, then it is X turn, if turn count is odd, O turn
def current_player(board)
		turn_count(board).even? ? "X" : "O"
end 

# count the number of positions that are occupied on the board (i.e. in the board array)
#  by iterating over the board array and incrementing a count variable if a position is filled 
#  with an X or an O
def turn_count(board)
		i = 0
		count = 0
		while i <= 9
			if board[i] == "X" || board[i] == "O"
				count += 1
			end
			i += 1
		end
		count
end  

def turn(board)
		puts "Please enter 1-9:"
		input = gets.strip
		index = input_to_index(input)
# binding.pry
		if valid_move?(board, index)
				move(board, index, current_player(board)) 
				display_board(board)
		else turn(board)
		end
end

# Won Method accepts one argument of the Board
# And returns falsey for empty board or draw
# And returns array of matching indexes for wins
def won?(board)
		WIN_COMBINATIONS.detect do |combo|
		 board[combo[0]] == board[combo[1]] && 
		 board[combo[1]] == board[combo[2]] &&
		 position_taken?(board, combo[0])
		end
 end

 # full method returns true for a draw
# And False for an In-Progress Game
def full?(board)
		board.each do |fullBoard|
			return false if fullBoard.include? " "
		end
			return true
end

# Draw Method returns:
# -True for a draw
# -False for game won in First Row, Diagonaly,or In-Progress game
def draw?(board)
		#binding.pry
	if !won?(board) && full?(board)
		return true
	else 
		return false
	end 
end
 
 # Over Method returns:
 # -True for a draw, won game on full board, won game not full board
 # -False for In-Progress game
 def over?(board)
	 if won?(board) || draw?(board)
		 return true
		else false 
	 end
 end
 
 # Winner Method returs:
 # -"X" when X has won
 # -"O" when O has won
 # -nil when no winner
 def winner(board)
	 # using Won? method
	 win = won?(board)
	 if won?(board)
			board[win[0]]
	 end
end

# play method
# until the game is over 
def play(board)
	until over?(board)
		# take turns
		turn(board)
	#play(board)
	end
	# if the game is won
	if won?(board)
		# congratulate the winner
		puts "Congratulations #{winner(board)}!"
		# else if the game was a draw
		elsif draw?(board)
		# tell the players it has been a draw
		puts "Cat's Game!"
	end
end






