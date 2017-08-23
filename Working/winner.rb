def winner(board)
	if over?(board)
		current_player(board)
	else
		nil
	end
end
