WIN_COMBINATIONS = [
	[0,1,2],
	[3,4,5],
	[6,7,8],
	[0,3,6],
	[1,4,7],
	[2,5,8],
	[0,4,8],
	[2,4,6]
]

def display_board(board)
	puts " #{board[0]} | #{board[1]} | #{board[2]} "
	puts "-----------"
	puts " #{board[3]} | #{board[4]} | #{board[5]} "
	puts "-----------"
	puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  elsif board[index] == "X" || board[index] == "O"
    true
  end
end

def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0, 8)
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, char)
  board[index] = char
end

def turn(board)
	puts "Please enter 1-9:"
	position = gets.strip
	index = input_to_index(position)
	if valid_move?(board, index)
		if turn_count(board).even?
			move(board, index, "X")
		else
			move(board, index, "O")
		end
		display_board(board)
	else
		turn(board)
	end
end

def turn_count(board)
	counter = 0
	board.each do |cell|
		if cell == "X" || cell == "O"
			counter += 1
		end
	end
	counter
end

def current_player(board)
	turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
	WIN_COMBINATIONS.each do |win_combination|
		win_index_1 = win_combination[0]
		win_index_2 = win_combination[1]
		win_index_3 = win_combination[2]

		position_1 = board[win_index_1]
		position_2 = board[win_index_2]
		position_3 = board[win_index_3]

		if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
			 (position_1 == "O" && position_2 == "O" && position_3 == "O")
			return win_combination
		else
			false
		end
	end
	false
end

def full?(board)
	board.all? do |position|
		position == "X" || position == "O"
	end
end

def draw?(board)
	!won?(board) && full?(board)
end

def over?(board)
	won?(board) || draw?(board) || full?(board)
end

def winner(board)
	if won?(board)
		win_combo = won?(board)
		board[win_combo[0]]
	else
		nil
	end
end

def play(board)
	loop do
		if over?(board)
			break
		end
		turn(board)
	end
	if won?(board)
		puts "Congratulations #{winner(board)}!"
	elsif draw?(board)
		puts "Cat's Game!"
	end
end