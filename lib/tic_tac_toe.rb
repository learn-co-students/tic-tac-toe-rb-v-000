
#############################################
#### WORK IN PROGRESS
#### Correct errors in turn and play methods
#############################################
#############################################

WIN_COMBINATIONS = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8],[2, 4, 6]]

def display_board(board = " ")
  line = "-----------"
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts line
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts line
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index = user_input.to_i - 1
end

def move(board, position, character)
  board[position] = character
  return board
end

def position_taken?(board, index)
 if board[index] == " " ||board[index] == "" || board[index] == nil
   return false
 else
   true
 end
end

def valid_move? (board, index)
  if index.between?(0, 8) && !(position_taken?(board, index))
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  move = " "
  move = gets.strip
  if move.to_i < 1 || move.to_i > 9
   puts "Please enter an INTEGER FROM 1 TO 9!"
   turn(board)
  end
  index = input_to_index(move)
  if valid_move?(board, index)
    character = current_player(board)
    move(board, index, character)
    display_board(board)
  else
    puts "Please enter a valid move by inputting an integer from 1-9\n"
    puts "to indicate your move to an empty board space.\n\n"
    turn(board)
  end
end


def turn_count(board)
  counter = 0
  board.each do |value|
    if value == "X" || value == "O"
      counter += 1
    end
  end
  return counter
end

#current_player
def current_player(board)
  counter = 0
  board.each do |value|
    if value == "X" || value == "O"
      counter += 1
    end
  end
  character = counter.even? ? "X" : "O"
end

def won?(board)
  # converts empty spaces for nil to string character for comparison
  board.each do |space|
    if space == "nil" || space == "" || space == " "
      space = "-"
    end
  end
  # iterate through each array of win combinations
  WIN_COMBINATIONS.each do |array|
    # create a string of board values for winning combinations
    win_combo = board[array[0]] + board[array[1]] + board[array[2]]
		# call winner method to determine winner
		winner(board)
    # compare board string value to winning game values
    if win_combo == "XXX" || win_combo == "OOO"
      # return the win_combination indexes that won
      return array
    end
  end
  # return false for non-winning boards
  return false
end
def full?(board)
    board.each do |value|
    if value == "X" || value == "O"
      true
    else
      return false
    end
  end
	true
end

def draw?(board) # tested and working
   won = won?(board)
   full = full?(board)
   if won == false && full == true
	    true
	 end
end

def over?(board)
  if won?(board) == true || full?(board) == true
    return true
  else
    false
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |array|
    win_combo = board[array[0]] + board[array[1]] + board[array[2]]
	  return "X" if win_combo == "XXX"
	  return "O" if	win_combo == "OOO"
  end
	nil
end

def play(board)
  while over?(board) == false
    turn_count(board)
    turn(board)
    over?(board)
  end
  if won?(board) == true
    if winner(board) == "X"
      return "Congratulations X!"
    elsif winner(board) =="Y"
      return "Congratulations Y!"
    else
      false
    end
  end
  if draw?(board) == true
    return "Cat's Game!"
  end
end
