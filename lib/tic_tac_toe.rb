###TODO 
# Failed examples:

# rspec ./spec/01_tic_tac_toe_spec.rb:68 # ./lib/tic_tac_toe.rb #move does not allow for a default third argument
# rspec ./spec/01_tic_tac_toe_spec.rb:213 # ./lib/tic_tac_toe.rb #draw? returns false for a won game

# #display_board
# Should accept a board as an argument and print out the current state of the board for the user.
def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  

# #valid_move?
# Should accept a board and an index from the user and return true if the index is within the correct range of 0-8 and is currently unoccupied by an X or O token.
def valid_move?(board, index)
    if position_taken?(board, index) == true; false
    #elsif board[index] == "X" || board[index] == "O"; true
    elsif index > 9 || index < 0; false
    else; true
    end
  end
  
# Hint: While not explicitly required by this lab, you might want to encapsulate the logic to check if a position is occupied in its own method, perhaps #position_taken?
def position_taken?(board, index)
    !(board[index].nil? || board[index] == " ")
  end

# #move
# This method should accept a board, an index from the user (which was converted from their raw input with input_to_index), and a token to mark that position with (you can give that argument a default value of 'X'––we're not worrying about whose turn it is yet). The method should set the correct index value of that position within the board equal to the token.

def move(board, userinput, character)
    board[userinput] = character
    display_board(board)
  end
  
def input_to_index(userinput)
    userinput = userinput.to_i
    userinput - 1
  end

def turn(board)
        # ask for input
    puts "Please enter 1-9:"
        # get input
    index = gets.strip
        # convert input to index
    indexNum = input_to_index(index)
        # if index is valid
    if valid_move?(board, indexNum)
      true; move(board, indexNum, current_player(board))
    else
      false
      turn(board)
    end
end

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def won?(board)
  WIN_COMBINATIONS.each do |combo| #iterate over WIN_COMBINATIONS
    position_1 = board[combo[0]]
    position_2 = board[combo[1]]
    position_3 = board[combo[2]]
  if position_1 == position_2 && position_2 == position_3 && position_taken?(board, combo[0])
    return combo #it wants the indexes, not the board markers
  end
	#do not set an else, as otherwise you are forcing a return before the loop finishes. 
  end
  false
end

def full?(board)
  board.none? { |openMoves| openMoves == " "} 
end

def draw?(board)
    full?(board) && !won?(board)
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
end


def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

def play(board)
#   counter = 0
  until over?(board)
    turn(board)
    # counter += 1
  end

  if won?(board)
    winningPlayer = winner(board)
    puts "Congratulations #{winningPlayer}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end

def turn_count(board)
  counter = 0
	board.each do |character|
		if character === "X" || character === "O"
			counter += 1
		end
	end
	counter
end

def current_player(board)
	(turn_count(board) % 2 === 0) ? "X" : "O"
end