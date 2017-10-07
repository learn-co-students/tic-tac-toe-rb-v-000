def turn_count(board)
  counter = 0
  board.each do |position|
    unless position == "" || position == " "
      counter += 1
    end
  end
  counter
end

def current_player(board)
  unless turn_count(board) % 2 == 0
    "O"
  else
    "X"
  end
end
