require 'pry'

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle row
  [2,5,8], #Right row
  [0,4,8], #Back-slash diagonal
  [6,4,2] #Forward-slash diagonal
]

# Define a method display_board that prints a 3x3 Tic Tac Toe Board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#converts user_input to an integer
def input_to_index(user_input)
  return user_input.to_i - 1
end

#Your #move method must take in three arguments: 1) the board array, 2) the index in the board array that the player would like to fill out with an "X" or and "O", and 3) the player's character (either "X" or "O"). We previously had you write this method with a default argument of "X" for the third argument, but that is no longer needed.
def move(board, index, token)
  board[index] = token
end

# The #position_taken? method will be responsible for evaluating the position selected by the user against the Tic Tac Toe board and checking to see whether or not that index on the board array is occupied. If the user would like to fill out position 1, our #position_taken? method will check to see if that board index is vacant or if it contains an "X" or an "O". If the position is free, the method should return false (i.e. "not taken"), otherwise it will return true.

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Build a method valid_move? that accepts a board and an index to check and returns true if the move is valid and false or nil if not. A valid move means that the submitted position is: Present or Not already filled
def valid_move?(board, index)
  if !index.between?(0,8) || position_taken?(board, index)
    #index.between?(0,8)
    #((0..8) === index)
    false
  else
    true
  end
end

#define the turn method.
def turn(board)
  puts "Please enter 1-9:"
  index = input_to_index(gets.strip)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    #binding.pry
    puts "That was an invalid entry."
    turn(board)

  end
end

#turncount - This method takes in an argument of the board array and returns the number of turns that have been played.
def turn_count(board)
  i = 0
  board.each do |position|
    if position == "X" || position == "O"
      i += 1
    end
  end
  return i
end

#The #current_player method should take in an argument of the game board and use the #turn_count method to determine if it is "X"'s turn or "O"'s.
def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  #iterate though the constant, WIN_COMBINATIONS
  WIN_COMBINATIONS.each do |win_combo|
    #Define index position on 'board' to be tested;
    index_1 = win_combo[0]
    index_2 = win_combo[1]
    index_3 = win_combo[2]

    # assign win_combo indices
    pos_1 = board[index_1]
    pos_2 = board[index_2]
    pos_3 = board[index_3]

    # test to see if win_combo is on the 'board'
    if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") ||
      (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
      # return the win_combo array if true and break out of the loop and method
      return win_combo
    end
  end
  # if there are no win_combinations, then return false and break out of the method
  return false
end

def full?(board)
  #The #full? method should accept a board and return true if every element in the board contains either an "X" or an "O".
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  #accepts a board and returns true if the board has not been won and is full
  # and false if the board is not won and the board is not full, and false if the board is won.
  # You should be able to compose this method solely using the methods you used above with some ruby logic.
  if !won?(board) && full?(board)
    return true
  end
end

def over?(board)
  #Build a method #over? that accepts a board and returns true if the board has been won, is a draw, or is full. You should be able to compose this method solely using the methods you used above with some ruby logic.

  if won?(board) || draw?(board) || full?(board)
    return true
  else
    false
  end
end

def winner(board)
  #The #winner method should accept a board and return the token, "X" or "O" that has won the game given a winning board.
  #The #winner method can be greatly simplified by using the methods and their return values you defined above.
  if won?(board)
    return board[won?(board)[0]]
  else
    nil
  end
end

def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
