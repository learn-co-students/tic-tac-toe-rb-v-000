#WIN_COMBINATIONS constant--------------------#
WIN_COMBINATIONS =[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

#DISPLAY_BOARD-------------------------------#
# prints the current board representation based on the board argument passed to the method
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#INPUT_TO_INDEX-------------------------------#
# Takes the user_input (a string), converts it to an Integer, and subtracts 1. The board contains spaces 1-9. But, an array's indexes start their count at 0.
def input_to_index(user_input)
  user_input.to_i - 1
end

#MOVE----------------------------------------#
# takes in 3 arguments: the board, the position on board that player wants to enter an X or O and  the player's token(either "X" or "O").
def move(board, position, token)
  board[position] = token
end

#POSITION_TAKEN-----------------------------#
# Confirm that that position is not already filled with an "X" or an "O"
#Evaluates user's input against board. If position is free, the method returns false; otherwise - return true
def position_taken?(board, position)
  if board[position] == " " || board[position] == "" || board[position] == nil
    false
  else
    true
  end
end

#VALID_MOVE---------------------------------#
# Accepts a board and an index to check if valid move. Returns true, false, or nil
def valid_move?(board,position)
  if position_taken?(board, position) == false && position.between?(0,8) == true
    true
  else
    false || nil
  end
end

#TURN--------------------------------------#
# Ask user for their move by position 1-9. Converts user input to an index.
# If move is valid, make the move and display board. If move is invalid ask for a new position until a valid move is received.
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  position = input_to_index(input)#this is a previously created method
  if valid_move?(board, position)
    token = current_player(board)
    move(board, position,token)
    display_board(board)
  else
    turn(board)#recursive
  end
end

#PLAY--------------------------------------#
def play(board)
 for i in 1..9 do
    turn(board)
  end
end

#TURN_COUNT---------------------------------#
# counts occupied positions
#Will tell us, (return),how many turns have been played.
def turn_count(board)
  counter = 0
  board.each do |token|
    if token == "X" || token == "O"
    counter += 1
    end
  end
  counter
end

#CURRENT_PLAYER-----------------------------#
# Will return, based on #turn_count, an `"X"` or an '"O"' and this will tell us whose turn it is.
def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

#WON?---------------------------------------#
# The first return of 3 tokens in a row (in any direction) will determine someone has won.
# position_taken? determines if a match is one of empty or occupied matches. Return false if no, return 'win_combo' if yes
def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    if board[win_combo[0]] == board[win_combo[1]] && board[win_combo[1]]== board[win_combo[2]] && position_taken?(board, win_combo[0])
       true
    else
       false
    end
  end
end

#FULL?---------------------------------------#
# returns true for a draw, returns false for an in-progress game
def full?(board)
  board.all? do |square|
    square == "X" || square == "O"
 end
end

#DRAW?---------------------------------------#
# calls won?, calls full?
# returns true for a draw, returns false for a won game, returns false for an in-progress game
def draw?(board)
    full?(board) && !won?(board)
end

#OVER?---------------------------------------#
# returns true for a draw, returns true for a won game ,returns false for an in-progress game
def over?(board)
  won?(board) ||  draw?(board)
end

#WINNER---------------------------------------#
# return X when X won, returns O when O won, returns nil when no winner
def winner(board)
  won?(board) && board[won?(board)[0]]
end
