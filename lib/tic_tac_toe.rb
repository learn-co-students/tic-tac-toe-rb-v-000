require 'pry'

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


 board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(user_input)
  user_input.to_i-1
end


def move(board, user_input, character)
  board[user_input] = character
end


def position_taken?(board, index)
 if board[index] == " " || board[index] == "" || board[index] == nil
   return false
 else
   return true
 end
end


def valid_move?(board, index)
 if position_taken?(board, index)
   return false
 elsif index.between?(0, 8)
   return true
 elsif board[index] == "X" || board[index] == "O"
   return false
 else
   return false
end
end


def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)  # could use some help understanding this line of code better???
  if valid_move?(board, index)
    player = current_player(board)
    move(board, index, player) # question - why couldn't i have just character when i defined it in my move method as not having a default argument? the test was failing when it was just character but passed when it was character = X, and yet now my move method doesn't have a default value so there's a mismatch??
    display_board(board)
  else input = gets.strip
 end
end


def turn_count(board)
  counter = 0
  board.each do |count|
    if count == "X" || count == "O"
      counter += 1
   end
  end
  return counter
end


def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |winning|       # --> this gives it a condition and returns the first one that matches that
    board[winning[0]] == board[winning[1]] &&
    board[winning[1]] == board[winning[2]] &&
    position_taken?(board, winning[0])        # --> this called the helper method at the top and called the board and said if we detect a X in that position of O and if the 0 index and the 1 index and the 2 index all match then return an array of a winning board
 end  # --> carlo notes, declaritive vs. imperative code - two ways to write code, want to strive for delcarative code
end

def full?(board)
 board.all? { |position| position == "X" || position == "O" }  # --> carlo note / the |position | bars are they are binding essentially creating a local variable with scope to this block of code
end


def draw?(board)
  full?(board) && !won?(board)
end


def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won_game = won?(board)
    return board[won_game.first]
  end
 end

# notes for play method on 2/18 are #1: #i'm missing code here that references the won? method #2 I need to use gets somewhere like on the turn method in order to get the tests passing around receiving input for the board  #3 i might want to use the while or until loop for checking/allowing the game to take turns until it is over #4 or we might want a counter that keeps track of 9 different turns


# def play(board)
#   game_over = over?
#   until game_over == over?
#     turn(board)
#   end
# end

def play(board)
  turn(board) until over?(board)
  if won?(board)
    puts "Congratulations #{winner(board)}!"
    return
  else draw?(board)
    puts "Cat's Game!"   # the if statement was evaluating to true when it was the over method,
    return
  end
end


#   counter = 0
#   while counter < 9
#     turn(board)
#     counter += 1
#     if over?(board)
#       puts "Congratulations #{winner(board)}!"
#       return
#       #break
#     end
#   end
# end





  # if over?(board)
  #   puts "Congratulations #{winner(board)}!"
  # else draw?(board)
  #   puts "Cat's Game!"
  # end

# learn --fail-fast - this is how you can run just the first test that is failing and see only that failed test
# learn --fail-f - this is how you can run just the first test that is failing and see only that failed test
