WIN_COMBINATIONS = [
						        [0,1,2],
						        [3,4,5],
						        [6,7,8],
						        [0,3,6],
						        [1,4,7],
						        [2,5,8],
						        [0,4,8],
						        [6,4,2]]

def display_board(board)
  puts " #{board[0]} " "|" " #{board[1]} " "|" " #{board[2]} "
  puts "-----------"
  puts " #{board[3]} " "|" " #{board[4]} " "|" " #{board[5]} "
  puts "-----------"
  puts " #{board[6]} " "|" " #{board[7]} " "|" " #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
	!(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end

# Helper Method
def turn(board)

  # display board
  display_board(board)

  #ask for input
  puts "Please enter a number between 1-9:"

  #get input
  user_input = gets.strip

  #convert input to index
  index = input_to_index(user_input)

  # check if index is valid
	if valid_move?(board, index)
    #make the move for index
  	move(board, index, current_player(board))
  else
    #ask for input again until you get a valid input
		puts "Whoops that is not a valid move!"
    turn(board)
	end
	#show the board
	display_board(board)
end

def turn_count(board)
	board.count{|token| token == "X" || token == "O"}
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
	WIN_COMBINATIONS.find do |win|
	 board[win[0]] == board[win[1]] && board[win[0]] == board[win[2]] && board[win[0]] != " "
 end
end

def full?(board)
 !board.include?(" ") || board.include?("")
end

def draw?(board)
	full?(board) && !won?(board)
end

def over?(board)
	draw?(board) || won?(board)
end

def winner(board)
	if won?(board)
		winning_combo = won?(board)
		board[winning_combo[0]]
	end
end

def play(board)
  until over?(board)
  	turn(board)
  end
  if won? (board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end
