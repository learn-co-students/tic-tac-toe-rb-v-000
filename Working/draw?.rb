#DRAW?
#Build a method #draw? that accepts a board and returns true if the board has not
#been won and is full and false if the board is not won and the board is not full,
#and false if the board is won.
# Helper Method
def draw?(board)
	!won?(board) && full?(board)
