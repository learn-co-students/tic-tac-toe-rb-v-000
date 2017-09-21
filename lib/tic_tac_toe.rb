# BOARD ARRAY INDEX
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

#DISPLAY_BOARD: DISPLAYS EMPTY TIC TAC TOE BOARD
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#INPUT_TO_INDEX: USER INPUT (1-9) CONVERTED TO BOARD ARRAY INDEX
def input_to_index(input)
  (input.to_i) - 1
end

#MOVE: DEFINES USER MOVE
def move(board, index, value)
  board[index] = value
end

#POSITION_TAKEN?: VERIFIES WHETHER THE REQUESTED POSITION IS AVAILABLE
def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else
    true
  end
end

#VALID_MOVE?: VERIFIES WHETHER THE REQUESTED MOVE IS VALID
def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0, 8)
    return true
  else
    false
  end
end

#TURN_COUNT: RETURNS NUMBER MOVES THAT HAVE PLAYED
def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter +=1
    end
  end
  return counter
end

#CURRENT_PLAYER: RETURNS CURRENT PLAYER
def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

#TURN: PROCEDURE FOR COMPLETE TURN LOOP
def turn(board)
  puts "Make your move, enter a grid value from 1 - 9: "
  input = gets.strip
  index = input_to_index(input)
  value = current_player(board)
  if valid_move?(board, index)
    move(board, index, value)
  else
    turn(board)
  end
  display_board(board)
end

# POSSIBLE WINNING COMBINATIONS
WIN_COMBINATIONS = [
   [ 0, 1, 2 ], # top row
   [ 3, 4, 5 ], # middle row
   [ 6, 7, 8 ], # bottom row
   [ 0, 3, 6 ], # left column
   [ 1, 4, 7 ], # middle column
   [ 2, 5, 8 ], # right column
   [ 0, 4, 8 ], # diagonal top-bottom
   [ 2, 4, 6 ]  # diagonal bottom-top
 ]

#WON?: RETURNS IF WINNING COMBINATION IS PRESENT
def won?(board)
  WIN_COMBINATIONS.each do |combo|
    index_1 = combo[0]
    index_2 = combo[1]
    index_3 = combo[2]

    position_1 = board[index_1]
    position_2 = board[index_2]
    position_3 = board[index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combo
    end
  end
  false
end

#FULL?: RETURNS IF BOARD IS FULL
def full?(board)
  if board.all? {|value| value == "X" || value == "O"}
    return true
  else
    return false
  end
end

#DRAW?: RETURNS IF GAME IS A DRAW
def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  else
    return false
  end
end

#OVER?: RETURNS IF GAME IS OVER
def over?(board)
  if draw?(board) == true || full?(board) == true || won?(board)
    return true
  else
   return false
  end
 end

#WINNER: RETURNS WINNER OF GAME
def winner(board)
  if won?(board) != false
    return board[won?(board)[0]]
  end
end

#PLAY: EXECUTES GAME LOOP
def play(board)
  until over?(board) == true
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cat\'s Game!"
  end
end
