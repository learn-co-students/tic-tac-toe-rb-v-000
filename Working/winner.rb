def winner(board)
	if won?(board) != false
		won?(board).find do |winner|
			board[winner]
		end
	else
		return
	end
end

def winner(board)
	if over?(board)
		current_player(board)
	else
		nil
	end
end
