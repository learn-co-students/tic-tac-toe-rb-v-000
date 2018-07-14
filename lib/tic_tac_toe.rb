# WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], # top row win
    [3,4,5], # middle row win
    [6,7,8], # bottom row win
    [0,3,6], # left column win
    [1,4,7], # middle column win
    [2,5,8], # right column win
    [0,4,8], # left-top-to-right-bottom diagonal win
    [2,4,6]  # left-bottom-to-right-top diagonal win  
  ]

# DISPLAY_BOARD
def display_board(board)
  border = "-----------"
  row1 = " #{board[0]} " + "| #{board[1]} |" + " #{board[2]} "
  row2 = " #{board[3]} " + "| #{board[4]} |" + " #{board[5]} "
  row3 = " #{board[6]} " + "| #{board[7]} |" + " #{board[8]} "
  
  puts row1
  puts border
  puts row2
  puts border
  puts row3
  
end

board = [" "," "," "," "," "," "," "," "," "]

display_board(board)

#INPUT_TO_INDEX
def input_to_index(user_input)
  converted_input = user_input.to_i
  converted_input - 1
end
 
#MOVE
def move(board, index, player_token)
 
 index = input_to_index(user_input)
 
 board[index] = player_token
end

#POSITION_TAKEN
def position_taken?(board, index)
   !(board[index] == " " || board[index] == "" || board[index] == nil)
end


#VALID_MOVE
def valid_move?(board, index)
  index.between?(0,9) && board[index] == " "
end     


#TURN
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
 
  if valid_move?(board, index)
    move(board, index, player_token)
  else
    turn(board)
  end
    display_board(board)
end

#TURN_COUNT
def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn.downcase == "x" || turn.downcase == "o"
      counter += 1
      return "#{counter}"
    end
  end
  counter
end

#CURRENT_PLAYER
def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

#WON?
def won?(board)
WIN_COMBINATIONS.detect do |combo|

  board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
  
  end
end

#FULL?
def full?(board)
  board.none? {|index| index == " "}
end

#DRAW?
def draw?(board)
  full?(board) && !won?(board)
end

#OVER?
def over?(board)
  draw?(board) || won?(board)
end

#WINNER
def winner(board)
  if !won?(board)
    return nil
  else 
    return board[won?(board)[0]]
  end
end

#PLAY
def play(board)
  puts "Where would you like to go?"

  user_input = gets.strip

  index = input_to_index(user_input)

  move(board, index, player_token)

  display_board (board)
    loop do
     counter = 0
     while counter < 9
        turn = 1
        turn(board)
        counter += 1
      end
      if counter >= 9
        break
      end
    end
  end
end


