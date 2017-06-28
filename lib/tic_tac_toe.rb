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

# Helper Method
def turn_count (board)
	board.count{|token| token == "x" || token == "O"}
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
# return X when X won (FAILED - 1)
# returns O when O won (FAILED - 2)
# returns nil when no winner (FAILED - 3)
def winner(board)
	if over?(board)
		current_player(board)
	else
		nil
	end
end
