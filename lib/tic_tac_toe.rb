#///////// VARIABLES AND CONSTANTS /////////#

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3 ,6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

# ///////// METHOD DEFINITIONS /////////#

# DEFINE TURN METHOD AND HELPER METHODS #

def display_board(board) #this method displays the board
  puts row1 = " #{board[0]} " + "|" + " #{board[1]} " + "|" + " #{board[2]} "
  puts row2 = "-----------"
  puts row3 = " #{board[3]} " + "|" + " #{board[4]} " + "|" + " #{board[5]} "
  puts row2 = "-----------"
  puts row5 = " #{board[6]} " + "|" + " #{board[7]} " + "|" + " #{board[8]} "
end

def move(board, position, value="X") 
#this method marks selects a position on the board. It uses the board array, a positon (which
# is translated into an index of the array), and a value to mark on the board. 
  board[position.to_i - 1] = value
end

def position_taken?(board, position)
  !(board[position.to_i] == " " || board[position.to_i].nil?)
end

def valid_move?(board, position)
  !position_taken?(board, position.to_i-1) && position.to_i.between?(1, 9)
end

def turn_count(board)
  board.count{|x| x != " "}
end

def current_player(board)
  if turn_count(board) % 2 == 1
    "O"
   else
    "X"
  end
end

def turn(board)
# combine the #display_board, #move, #valid_move?, and #position_taken? methods to create a full turn
  print "It's #{current_player(board)}\'s move. "
  puts "Please enter 1-9:"
  input = gets.chomp.strip.to_i
  until valid_move?(board, input) == true #keep asking the player to make a move until they make a valid selection
    print "That's not a valid move. "
    puts "Please enter 1-9:"
    input = gets.chomp.strip.to_i
    valid_move?(board, input)
    if input == "exit"
      return
    end
  end
  value = current_player(board) #find out who the current player is, then pass it to #move
  move(board, input, value)
  display_board(board)
end

# DEFINE OTHER GAME METHODS #

def full?(board) #check if the board is full
  board.each_with_index do |position, index|
    if position_taken?(board, index) == false 
      return false
    end
  end
  return true
end

def won?(board) #check if a player won  the game by comparing the board to win combinations
  WIN_COMBINATIONS.each do |combo| #for each win combination, check if the number located at combo[index] is occuped on the board
    if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
      return combo
    elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
      return combo
    else
      false
    end
  end
  return false
end 

def draw?(board) #check if there is a draw
  won?(board) == false && full?(board)
end

def over?(board) #check if the game is over
  won?(board) != false || draw?(board)
end 

def winner(board) #return the winner
  if won?(board) != false
    combo = won?(board)
    board[combo[0]]
  end
end


# DEFINE THE PLAY METHOD, WHICH ENCAPSULATES ALL METHODS #

def play(board)
  display_board(board)
  until over?(board)
    turn(board)
  end
  if won?(board) != false
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cats Game!"
    else
      nil
  end
  #replay
end


# The following method, #replay works but causes an infinite loop when running the test suite, 
# as I have not figured out how to correctly build a test or stub user input.

=begin
def replay 
puts "Would you like to play again? Y/n"
input = ""
  until input.downcase == "y" || input.downcase == "n" || input.downcase == "exit"
    input = gets.chomp.strip
    if input.downcase == "y"
      board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      play(board)
    elsif input.downcase == "n" || input.downcase == "exit"
      puts "Thanks for playing!"
      return
    else
      print "Please type a a valid command. "
      puts "Would you like to play again? Y/n"
    end
  end
end
=end




