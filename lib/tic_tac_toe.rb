
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

# display board
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
   puts "-----------"
   puts " #{board[3]} | #{board[4]} | #{board[5]} "
   puts "-----------"
   puts " #{board[6]} | #{board[7]} | #{board[8]} "
 end

# user input & converting it to an integer
def input_to_index(user_input)
  index = user_input.to_i - 1
end

#move
def move(board, index, character)
  board[index] = character
end

#position_taken? to ensure player chose an open square
def position_taken?(board, index)
  if board[index] == "" || board[index] == " "
    return false
  else
    return true
  end
end

#valid_move to ensure player chose a square within the board
def valid_move?(board, index)
  if index.between?(0,8) && position_taken?(board, index) == false
    return true;
  else
    return false || nil
  end
end

# turn method to explain logic of a complete turn
def turn(board)
  puts "Please make a move. Enter a position 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
  else
    puts "That position is not valid."
    puts "Please make a move. Enter a position 1-9:"
      input = gets.strip
      index = input_to_index(user_input)
    end
end

#turn_count for the number of turns that have been played
def turn_count(board)
  counter = 0
  board.each do |index|
    if index == "X" || index == "O"
    counter += 1
  end
end
  return counter
end

#current_player to determine who's turn it is
def current_player(board)
  if turn_count(board).even? == true
    return "X"
  elsif turn_count(board).odd? == true
    return "O"
  end
end

#won? to find any winning combos currently on the board
def won?(board)
WIN_COMBINATIONS.detect do |win_index|
  win_index.all? {|position| board[position] == "X" } ||
   win_index.all? {|position| board[position] == "O" }

end
end

#full? to see if board is full
def full?(board)
  full_board = board.none? do |position|
    position == " " || position == ""
  end
end

#draw? to detect if no one has won.
def draw?(board)
  if won?(board) == nil && full?(board) == true
    return true
  else
    return false
  end
end

#over? to determine if the game is over
def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end

#winner to determine who won the game
def winner(board)
	winning_player = won?(board)

if !winning_player
		return nil
	end

	winning_player.each do |i|
		if board[i] == "X"
			return "X"
		elsif board[i] == "O"
			return "O"
		end
	end
end

# -------------------- part one complete ^

#play method - responsible for the game loop


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
