WIN_COMBINATIONS = [
	[0,1,2], #toprow
	[3,4,5], #middlerow
	[6,7,8], #bottomrow
	[0,3,6], #col1
	[1,4,7], #col2
	[2,5,8], #col3
	[0,4,8], #diag1
	[6,4,2]
]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, location, current_player = "X")
  board[location.to_i-1] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(board, input)
    move(board, input)
  else
    turn(board)
  end
  display_board(board)
end
def turn_count(board)
	turn = 0
	board.each do |mark|
		if mark == "X" || mark == "O"
			turn += 1
		end
	end
	turn
end
def current_player(board)
	if turn_count(board) % 2 == 0
		return "X"
	else 
		return "O"
	end
end
def won?(board)
	WIN_COMBINATIONS.detect do |combo|
		if combo.all? {|position| board[position] == "X"}
			return combo
		elsif combo.all? {|position| board[position] == "O"}
			return combo
		else
			false
		end
	end
end 
def full?(board)
	board.each_index do |position|
		if !position_taken?(board, position.to_i)
			false
			break

		else
			true
		end
	end
end 

def draw?(board)
	if full?(board)
		 true
		if won?(board)
			false
		else
			true
		end
	else
		false
	end


end 

def over?(board)
	if full?(board) || won?(board) || draw?(board)
		true
	else
		false
	end
end

def winner(board)
	if won?(board)
		if board[won?(board)[0]] == "O"
			return "O"
		else
			"X"
		end
	end
end
def play(board)
	until over?(board)
		turn(board)
		current_player(board)
		turn_count(board)
	end
	if won?(board)
		puts "Congratulations #{winner(board)}!"
	elsif draw?(board)
		puts "Cats Game!"
	end
		
end

 
 



