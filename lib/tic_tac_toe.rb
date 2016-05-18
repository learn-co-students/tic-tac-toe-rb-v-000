WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def display_board(board)
	puts " #{board[0]} | #{board[1]} | #{board[2]} "
	puts "-----------"
	puts " #{board[3]} | #{board[4]} | #{board[5]} "
	puts "-----------"
	puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, pos, char)
	pos = pos.to_i - 1
	board[pos] = char
end

def position_taken?(board, position)
	if board[position] == " " || board[position] == "" || board[position] == nil 
		return false
	else board[position] == "O" || "X"
		return true
	end
end

def valid_move?(board, position)
	position=position.to_i - 1
	#puts "position is #{position}"
	#puts "board is #{board}"
	#puts "spot #{position.between?(0,8)}"
	#puts "taken? #{!position_taken?(board, position)}" # showed the position_taken method was returning
							    #the opposite of what was expected.
	(position.between?(0,8) && !position_taken?(board, position))
end

def turn(board)
	#Get user input
	puts "Please enter 1-9:"
	input = gets.strip
	#validate the move
	x = "X"
	o = "O"
	if valid_move?(board, input) == true
		move(board, input, x)
	else
		turn(board)
	end
	display_board(board)
end

def turn_count(board)
	turns = []
	board.select do |marker|
		if marker == "O" || marker == "X"
			turns << marker
		end
	end
	return turns.length
end

def current_player(board)
	count = turn_count(board)
	puts "total turns is #{count} whcih is a #{count.class}"
	if count.odd?
		return "O"
	else
		return "X"
	end
end

def won?(board)
	WIN_COMBINATIONS.detect do |win_combination|
		board1 = win_combination[0]
		board2 = win_combination[1]
		board3 = win_combination[2]
		board[board1] == board[board2] && board[board2] == board[board3] && board[board3] != " "
	end
end

def full?(board)
	full_array = board.select do |position|
		position == "X" || position == "O"
	end
	if full_array.length == 9
		return true
	else
		return false
	end
end
def draw?(board)
	!won?(board) && full?(board)
end
def over?(board)
	won?(board) || full?(board) || draw?(board)
end
def winner(board)
	my_array = won?(board)
	if my_array.nil? == true
		return
	else
		my_array.each do |position|
			pos = position[0]
			marker = board[pos]
			return marker
		end
	end
end
