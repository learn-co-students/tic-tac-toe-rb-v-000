# DISPLAYS BOARD
# puts the asci board
def display_board(board = [" "," "," "," "," "," "," "," "," "])
  horiz_line = "-----------"
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts horiz_line
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts horiz_line
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# IS THE MOVE VALID?
# checks whether the position has been taken and if the index is on the board
# returns true if move is valid
def valid_move?(board, index)
  if index.between?(0, 8) && position_taken?(board, index) == false
    return true
  else
    return false
  end
end

# CHANGE INPUT TO INDEX
# changes the gets value from the input (1-9) to an index (0-8)
# returns the index
def input_to_index(input)
  input_int = input.to_i
  index = input_int - 1
end

# MAKE THE MOVE
# given a board, the index and a player's character, changes the space on the
# board to the played character
# returns the updated board
def move(board, index, char)
  board[index] = char
  return board
end

# TAKE A TURN
# asks the user for their move, takes the input, conversts it to an index,
# evaluates the index for validity, if valid, makes the move and displays the
# board. If invalid asks for a new input (until input is valid), then makes the
# move and displays the board.
def turn(board)
  #determining the current player
  player_char = current_player(board)
  # NOTE: added the above line, which may cause problems?
  #asking the user for their move by position 1-9
  puts "Player #{player_char}, please enter 1-9:"
  #receiving the user input
  input = gets.strip
  index = input_to_index(input)
  #convert the position to an index
  if valid_move?(board, index) #reurns true if move is valid
    move(board, index, player_char)
    display_board(board)
  else
     loop do
      #ask for a new input & get new input
      puts "#{index + 1} is not a valid move."
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(board, index)
        move(board, index, player_char)
        display_board(board)
        break
      end
    end
  end
end

# TO COUNT TURNS
# iterate over the elements in the board array. If they are "" or " ", they
# are empty elements. If the element is not empty, the count of turns is
# incremented
def turn_count(board)
  turns = 0
  board.each do |space|
    if space != " " && space != ""
      turns += 1
    end
  end
  #return the number of turns that has been played
  return turns
end

# TO DETERMINE CURRENT PLAYER
# X goes first, thus if there is an odd number of non-empty elements in the
# array, it is O's turn. If there is an even number of non-empty elements in
# the array, it is X's turn.
def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

# TO SEE IF THE POSITION IS TAKEN
# this method determines whether a position on the board is already taken
# returns true if the position is taken
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# WIN_COMBINATIONS
# this constant is an array with children arrays that constitute all possible
# win conditions for the tic tac toe game.
WIN_COMBINATIONS = [
  [3,4,5],
  [0,1,2],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

# WAS THE BOARD WON BY A GIVEN PLAYER
# this method checks whether a given board was won by a given player
# returns the WIN_COMBINATIONS child array that won if there was a win
def won_var?(board, char = "X")
  WIN_COMBINATIONS.find do |win_combo|
    win_combo.all? {|win_index| board[win_index] == char}
  end # WIN_COMBINATIONS.find do block
end # def won?

# TO DETERMINE IF SOMEONE HAS WON
# this method checks whether X has won, then whether O has won
# returns the winning combination if there was a win and nil if there was not
def won?(board)
  if won_var?(board, "X") == nil
    won_var?(board, "O")
  else
    won_var?(board, "X")
  end
end # def won?

# IS THE BOARD FULL
# this method checks whether all spaces in the board are full
# returns true if the board is full
def full?(board)
  board.none? {|space| space == " "}
end

# IS THE BOARD A DRAW
# this method evaluates whether the board is full and if there was not a win (draw)
# returns true if there was a draw, false if there was not
def draw?(board)
  if won?(board) == nil && full?(board) == true
    return true
  else
    return false
  end
end

# IS THE GAME OVER
# this method evaluates whether the board has been won, is full or is a draw
# returns true if the game is over (any of above are true), false if the game is not over
def over?(board)
  if won?(board) == true || full?(board) == true || draw?(board) == true
    return true
  else
    return false
  end
end

# WHO WON
# determines who won
# returns the winning players character
def winner(board)
  if won_var?(board, "X") != nil
    return "X"
  elsif won_var?(board, "O") != nil
    return "O"
  else
    return nil
  end
end # def won?

# LETS PLAY
#
def play(board)
  # until the game is over or the game is won
  until over?(board) == true || won?(board) != nil
    turn(board)
  end
  if winner(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  else
    return nil
  end
end
