
WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[2,4,6],
]






def display_board(board)
    cell = "   "
    separator = "-----------"
    row1 = " #{board[0]} " + "|" + " #{board[1]} " + "|" + " #{board[2]} "
    row2 = " #{board[3]} " + "|" + " #{board[4]} " + "|" + " #{board[5]} "
    row3 = " #{board[6]} " + "|" + " #{board[7]} " + "|" + " #{board[8]} "
    puts row1
    puts separator
    puts row2
    puts separator
    puts row3
  end

	def input_to_index(user_input)
	   (user_input.to_i)-1
	end

	def move(board,player_to_fill,player_token)
	  board[player_to_fill]=player_token
	end

	def position_taken?(board, index)
		if board[index] == " " || board[index] == "" || board[index] == nil
			 false
		 else
			 true
		end
	end


	def valid_move?(board, index)
		index.between?(0,8) && !position_taken?(board, index)
	end

	def turn(board)
	  puts "Please enter 1-9:"
	  user_input = gets.strip
	  index = input_to_index(user_input)
	  if valid_move?(board, index)
	    move(board, index, current_player(board))
	    display_board(board)
	  else
	    turn(board)
	  end
	end

	def turn_count(board)
	counter = 0
	board.each do |player|
		if player == "X" || player == "O"
		 counter +=1
	elsif
		counter +=0
	end
	end
	return counter
	end

	def current_player(board)
	  if turn_count(board) % 2 == 0
		return "X"
	elsif turn_count(board) % 2 != 0
			return "O"
	end
	end

	def won?(board)

	board_collection_X = board.each_index.select {|i| board[i] == "X"}
	board_collection_O = board.each_index.select {|i| board[i] == "O"}
	WIN_COMBINATIONS.each do |element|
	  return element if (element-board_collection_X).empty? || (element-board_collection_O).empty?

	end
	return false
	end

	def full?(board)
	  if board.include?(" ")
	return false
	else
	  return true
	end
	end

	def draw?(board)
	  !won?(board) && full?(board)
	end



	def over?(board)
	  won?(board) || draw?(board)
	end

	def winner(board)
	  if winner_X_Y = won?(board)
	    board[winner_X_Y.first]
	  end
	end

	def play(board)
		while !over?(board)
			turn(board)
		end
		if won?(board)
			puts "Congratulations #{winner(board)}!"
		elsif draw?(board)
			puts "Cats Game!"
		end
	end
