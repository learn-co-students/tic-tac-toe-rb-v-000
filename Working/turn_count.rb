def turn_count (board)
	board.count{|token| token == "x" || token == "O"}
end
