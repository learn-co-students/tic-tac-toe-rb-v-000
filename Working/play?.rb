def play(board)
  turn(board)
  while !over?(board)
  turn(board)
  end
  if won? (board)
    winner(board)
    puts "Congratulations, #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end

#OLD Code
def play(board)
	turn(board)
	if over?(board)
		winner(board)
	else
	turn(board)
	end
binding.pry
end
