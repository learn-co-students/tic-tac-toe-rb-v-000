#Helper Methods:

#constant with a nested array with winning combinations for tic tac toe
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

#Display Board
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#Input to Index to take player's number and translate it to an index to match
#the board
user_input = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
def input_to_index(user_input)
  index = (user_input).to_i - 1
end

#Move method to put the piece or token in place
def move(board, index, piece)
  board[index] = piece
end

#Position Taken? medthod to see if a position had been taken on the board
def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else board[index] == "X" || board[index] == "O"
    true
  end
end

#Valid Move? using prior method and making sure the input is between index 0-8
def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0,8)
    true
  end
end

#Turn method to ask user to input 1-9, receive input, convert input while making sure of valid move.
def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
    display_board(board)
  else
    puts "Invalid entry. Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    until valid_move?(board, index) == true
      move(board, index, current_player(board))
      display_board(board)
    end
  end
end

#Turn count method takes in argument of board array and returns the number of turns played.
def turn_count(board)
  count = 0
  board.each do |index|
    if index != " "
      count += 1
    end
  end
  count
end

#Current player method to determine which is an X or O
def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

#Won method using WIN_COMBINATIONS method to determine if anyone won or not.
def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
  if (board[win_combo[0]]) == "X" && (board[win_combo[1]]) == "X" && (board[win_combo[2]]) == "X"
    return win_combo
  elsif (board[win_combo[0]])  == "O" && (board[win_combo[1]])  == "O" && (board[win_combo[2]]) == "O"
    return win_combo
  end
end
 false
end

#Full method determines if the board is full.
def full?(board)
  board.none? do |i|
    i == " " || i.nil?
  end
end

#Draw method uses both the 'not' won? method and is the board full? method
def draw?(board)
  !won?(board) && full?(board)
end

#Over method uses the won? and draw? methods to determine if game is over
def over?(board)
  won?(board) || draw?(board)
end

#Winner method determines who the winner is by each index filled in the board
def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

#Play method is a loop that while the game is not over it goes back to the turn method.
def play(board)
  while !over?(board)
    turn(board)
  end

  if winner(board)
    puts "Congratulations X!"
  end
  if winner(board)
    puts "Congratulations O!"
  end
  if draw?(board)
    puts "Cats Game!"
  end
end
