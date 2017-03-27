
WIN_COMBINATIONS =
[
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], #left to right diagonal
  [2,4,6]  # right to left diagonal
]



def display_board(board)
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


###############input to index###########################

def input_to_index(user_input)
  user_input.to_i - 1
end

################ MOVE ###################################
def move(board, index, current_player)
  board[index] = current_player
end

################# position_taken #########################

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

##################### VALID MOVE ###########################

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

################ TURN #########################################

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

###################### TURN COUNT ############################

def turn_count(board)
#how many turns have been played?
turns = 0
board.each do |count|
if count == "X" || count == "O"
  turns += 1

  end
  end
  turns
end

################### CURRENT PLAYER ###########################

def current_player(board)
turn_count(board) % 2 == 0 || turn_count(board) == 0 ? "X" : "O"
end

################# WON ########################################

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|

       if (board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X") ||
          (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")
          return  win_combination
    end
  end
  return false
end

###################### FULL? #######################################

def full?(board)
  #use each or a higher level function
  board.none? do |board_check|
   board_check == " " || board_check == ""
  end
end

################# DRAW ################################

def draw?(board)
 !won?(board) && full?(board)
end

################### OVER? ###############################

def over?(board)
   won?(board) || draw?(board)
  #returns true if the board is won,full, or draw
  #compose using the above methods
end

################# WINNER ##############################

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

####################### play #################################

def play(board)

  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
    end
  end
