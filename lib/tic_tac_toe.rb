
# Define a constant and set it equal to a nested array filled with the index
# values for the various win combinations in tic tac toe.
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [2,4,6], #first diagonal
  [0,4,8] #second diagonal
]

# Define a method that prints the current board representation based on the board argument passed to the method.
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

display_board(board)

#Add a helper method that will convert the user input into a board index.

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

#returns true if position is not taken and is a valid position on the board
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

#returns true if the position is not tajen and is a valid position on the board.
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

#This method encapsulates the logic of a sigle complete turn --asking user for input,
# receiving that input, converting it to an index, confirming that the move is valid and then making
# it and displaying the board, otherwise asking for new input until a valid move is received.
# Note that much of the logic for these procedures has been defined and encapsulated in methods already built.
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

# This method takes in an argument of the board array and returns the number of turns that have been played.
def turn_count(board)
  #returns # of turns that have been played. odd turns are 'x' and even are 'o'
  counter = 0
    board.each do |turn|
      if turn == "X" || turn == "O"
        counter += 1
      end
    end
  return counter
end

#Uses #turn_count to determine whose turn it is -- X or O
def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

#Returns false/nil if there's no win, returns winning combination indexes as an
# array if there is a win. Iterates over the possible wining combinations, detects
# first matching pattern on board (first that evaluates to true, as per #detect)
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

        position_1 == position_2 && position_1 == position_3 && position_taken?(board, win_index_1)
  end
end

#returns true if the board is full
def full?(board)
  board.all? do |token|
    token == "X" || token == "O"
  end
end

#returns true if the board has not been won and is full. False if board has been won.
def draw?(board)
  full?(board) && !won?(board)
end

#returns true if game if over (won, or draw).
def over?(board)
  draw?(board) || won?(board)
end

#If board has been won, returns winning token.
def winner(board)
  board[won?(board)[0]] if won?(board)
  #don't need hard returns-- ruby will return implicitly. Also don't need an else-- by default,
  # will return nil if the condition you posed evaulates to false. So, only need if statement without
  # else/false-- this is how you would do that, in one line.
end

# The main method of the application; resposible for the game loop. Must allow players to take turns, checking
# if the game is over after every turn, and if the game terminates, determining if it is a win or a draw.
#Then reports outcome of the game.
def play(board)
  # input = gets
  #while !over?, take turns
  while !over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end
