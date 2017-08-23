#### `#over?`Build a method `#over?` that accepts a board and returns true if
#the board has been won, is a draw, or is full.
# Helper Method
def over?(board)
	draw?(board) || won?(board)|| !full?(board)
end

#DRAW?
#Build a method #draw? that accepts a board and returns true if the board has not
#been won and is full and false if the board is not won and the board is not full,
#and false if the board is won.
# Helper Method
def draw?(board)
	!won?(board) && full?(board) || !won?(board) && !full?(board) || won?(board)
end
