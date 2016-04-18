WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, location, value = "X")
	board[location.to_i-1] = value
end

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def valid_move?(board, location)
	(location.to_i-1).between?(0, 8) && !(position_taken?(board, location.to_i-1))
end

def turn(board)
	puts "Please enter 1-9:"
	input = gets.strip
	if valid_move?(board, input)
		move(board, input, value = current_player(board))
	elsif !valid_move?(board, input)
		turn(board)
	end
	display_board(board)
end

def turn_count(board)
	counter = 0
	board.each do |position|
		if position != " " && position != ""
		counter += 1
		end
	end
	counter
end

def current_player(board)
	turn_count(board).even? ? "X" : "O"
end

def won?(board)
	WIN_COMBINATIONS.select do |win_combination|
		if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
		return win_combination
		elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
		return win_combination	
		end
	end
	if board.all?{|position| position == " "}
		false
	end
end

def full?(board)
	board.none?{|position| position == " "}
end

def draw?(board)
	if full?(board) && !won?(board)
		true
	end
end

def over?(board)
	if draw?(board) || won?(board)
		true
	end
end

def winner(board)
	WIN_COMBINATIONS.select do |win_combination|
		if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
		return "X"
		elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
		return "O"
		end
	end
	if !won?(board)
		nil
	end
end

def play(board)
	until over?(board)
		turn(board)
	end
	if won?(board)
		puts "Congratulations #{winner(board)}!"
	elsif draw?(board)
		puts "Cats Game!"
	end
end
