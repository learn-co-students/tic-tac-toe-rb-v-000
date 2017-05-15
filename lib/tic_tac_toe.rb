# ALl the possible win combinations
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,4,8], #left-right diagonal
  [2,4,6], #right-left diagonal
  [0,3,6], #first column
  [1,4,7], #middle column
  [2,5,8] #last column
]

# display the board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# convert the user's move to an index to use on the board
def input_to_index(user_input)
  user_input.to_i - 1
end

# set the correct index value of that position within the board equal to the token
def move(board, index, current_player)
  board[index] = current_player
end

# determine if the requested position is already occupied
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# is the move valid, ie on the board and not taken? this will be used in turn(board)
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

# ask and receive the player's turn
def turn(board)
  # get input
  puts "Please enter 1-9:"
  input = gets.strip
  # convert to index
  index = input_to_index(input)
  # if move is valid, make the move
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
    # if move is invalid, ask for move again
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |play|
    if play == "X"
      counter +=1
    elsif play == "O"
      counter +=1
    else
      counter += 0
    end
  end
  counter
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

# check to see if the game has been won
def won?(board)
  # iterate over the possible winning combinations and see if each index of the winning combo is the same valid character
  WIN_COMBINATIONS.each do |win_combination|
    if position_taken?(board, win_combination[0]) && board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]]
      return win_combination
    end
  end
  return false
end

# check and see if each position on the board has an X or O
def full?(board)
  board.all? do |board_move|
    board_move == "X" || board_move == "O"
  end
end

# check and see if the board is full and no one has run, therefore resulting in a draw
def draw?(board)
  !won?(board) && full?(board)
end

# check and see if the game is over by confirming someone won, or there was a draw, or the board is full
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
  return false
end

#check if someone has won and return the character that won (X or O)
def winner(board)
  if !won?(board)
    return nil
  else
    winner = won?(board)
    board[winner[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if draw?(board)
    puts "Cats Game!"
  elsif won?(board)
    puts "Congratulations #{winner(board)}!"
  end
end

# def play(board)
#   while !over?(board)
#     turn(board)
#   end
#   if won?(board)
#     puts "Congratulations #{winner(board)}!"
#   elsif draw?(board)
#     puts "Cats Game!"
#   end
# end
#================================================

# def play(board)
#   puts "Your turn"
#   until over?(board) == false
#     turn(board)
#   end
#   if draw?(board) == true
#     puts "Cats Game!"
#   elsif won?(board) == true
#     puts "Congratulations #{winer}!"
#   else nil
#   end
# end






#
#
#

#
# # Define your play method below
# def play(board)
#   counter = 0
#   while counter < 9
#     turn(board)
#     counter +=1
#   end
# end
#
#
