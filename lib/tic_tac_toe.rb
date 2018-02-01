#-----------------------01_tic_tac_toe_spec------------------

WIN_COMBINATIONS = [
	[0,1,2],
	[3,4,5],
	[6,7,8],
	[0,3,6],
	[1,4,7],
	[2,5,8],
	[0,4,8],
	[2,4,6]
]

def display_board(board)
    	puts " #{board[0]} | #{board[1]} | #{board[2]} "
			puts "-----------"
			puts " #{board[3]} | #{board[4]} | #{board[5]} "
			puts "-----------"
			puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
			index = input.to_i - 1
end

def move(board, position, token)
			board[position] = token
      turn_count(board)
      display_board(board)
end

def position_taken?(board, index)
			board[index] == "X" || board[index] == "O"
end

def valid_move? (board, index)
			index.between?(0, 8) && position_taken?(board, index) == false
end

def turn(board)
			puts "Please enter 1-9:"
			input = gets.chomp
			index = input_to_index(input)
			if valid_move?(board, index)
				move(board, index, current_player(board))
			else
        puts "Invalid move, please enter 1-9:"
				turn(board)
			end
end

def turn_count(board)
			counter = 0
			board.each do |space|
				if space == "X" || space == "O"
				counter += 1
				end
			end
			counter
end

def current_player(board)
			if turn_count(board) % 2 == 0
				return "X"
			else
				return "O"
			end
end

def won?(board)
	WIN_COMBINATIONS.find do |combo|
			board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]] && position_taken?(board, combo[1])
	end
end

def full?(board)
	board.all?{ |i| i == "X" || i == "O" }
end

def draw?(board)
	!won?(board) && full?(board)
end

def over?(board)
	won?(board) != nil || draw?(board)
end

def winner(board)
	if won?(board)
		winner = board[won?(board)[0]]
	else
		return nil
	end
end


#----------------02_play_spec------------------
def play(board)
			until over?(board)
				turn(board)
			end
			if won?(board)
				puts "Congratulations #{winner(board)}!"
			else draw?(board)
				puts "Cat's Game!"
			end
end
