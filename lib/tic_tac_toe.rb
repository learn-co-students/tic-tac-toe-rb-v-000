#WIN_COMBINATIONS
#Define a constant in `lib/tic_tac_toe.rb` `WIN_COMBINATIONS` and set it equal to a nested array
#filled with the index values for the various win combinations in tic tac toe.
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]
#display_board
#Define a method that prints the current board representation based on the `board` argument passed to the method.
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

#input_to_index
def input_to_index(input)
  input.to_i
  input.to_i - 1
end

#move
def move(board, index, player)
  board[index] = player
end

#position_taken?
def position_taken?(board, index)
if board[index] == "O"
  true
elsif board[index] == "X"
  true
else  board[index] == " " || "" || nil
  false
	end
end

#valid_move
def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0, 8)
    true
  else
    false
	end
end

#turn
def turn(board)
  puts "Please enter 1-9:"
  user_input=input_to_index(gets.strip)
  if valid_move?(board, user_input)
    move(board, user_input, player = "X")
    display_board(board)
  else
    turn(board)
  end
end

#turn_count
def turn_count(board)
  counter = 0
  board.each do |board|
    if board == "X" || board == "O"
      counter+=1
      else
      counter += 0
    end
  end
  counter
end

#current_player
def current_player(board)
  if turn_count(board) % 2 == 0
      "X"
  else
      "O"
end
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" || board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
  end
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  if  !won?(board) && full?(board)
      true
  else
    false
    end
  end
#Build a method #over? that accepts a board and returns true if the board has been won, is a draw, or is full.

def over?(board)
  if won?(board) || draw?(board) #BE CAREFUL! If you flipped this, the test wouldn't have passed because it wouldn't stopped after the fail
    true
  end
end

#The #winner method should accept a board and return the token, "X" or "O" that has won the game given a winning board.

def winner(board)
  result = won?(board)
  if result
    board[result[0]]
  end
end

#play method
"Welcome to Tic Tac Toe!"
def play(board)
  until over?(board)
    display_board(board)
    "Where would you like to go?"
    input = gets.strip
    index = input_to_index(input)
    move(board, index, current_player(board))
  end
  if draw?(board)
    puts "Cats Game!"
  elsif
    winner(board) == "X"
    puts "Congratulations X!"
  else winner(board) == "O"
    puts "Congratulations O!"
  end
end
  #A tic tac toe game must allow players to take turns,
  #checking if the game is over after every turn,
  #and at the conclusion of the game, whether because it was won or because it was a draw,
  #reporting to the user the outcome of the game.
