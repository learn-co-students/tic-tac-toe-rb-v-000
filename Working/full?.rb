#Helper Method
def full?(board)
 !board.include?(" ") || board.include?("")
end

#Previous
def full?(board)
	!board.include?( " " || nil )
end
