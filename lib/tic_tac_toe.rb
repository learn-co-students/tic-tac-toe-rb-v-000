require 'pry'

# Define your WIN_COMBINATIONS constant - an array for each win combination
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # bottom row
  [0,3,6], # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [2,4,6], # right diagonal
  [0,4,8] # left diagonal
]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# until the game is over
#   take turns
# end
#
# if the game was won
#   congratulate the winner
# else if the game was a draw
#   tell the players it has been a draw
# end

def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts 'Cat\'s Game!'
  else
    puts 'do something'
  end
end



def turn(board)
  puts "Please enter 1-9:"
  a_user_input = gets.strip
  index=input_to_index(a_user_input)
  if valid_move?(board, index)
     move(board, index, current_player(board))
     display_board(board)
   else
     turn(board)
 end
end


# code your #valid_move? method here
def valid_move?(board, index)
  move = nil
  if index.between?(0, 8) && !position_taken?(board, index)
    #do_something
    move = true
  else
    #do_something_else
    move = nil || move = false
  end
end

# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
def position_taken?(board, index)
    taken = nil
    if (board[index] ==  " " || board[index] == "" || board[index] == nil)
      taken = false
    else
      taken = true
    end
    taken
end


def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def turn_count(board)
  # board.count{|token| token == "X" || token == "O"}

  turns = 0
    board.each do |token|
      if token == "X" || token =="O"
        turns+=1
      end
  end
  turns
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end


#def win?(board)
def won?(board)
  # binding.pry
  WIN_COMBINATIONS.find do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
  end
end
#end # =>if lose -  false/nil
     # => return the winning combination (array) if there is a win.

#def full?(board)
def full?(board)
  answer = true
  board.each do |token|
    if token != "X" && token != "O"
      answer = false
    end
  end
	answer
    # other solution - board.all?{|token| token == "X" || token == "O"}
end
#end # => (true) if board is full with either x or an o
    # => (false) if board is not full - some blank spaces not filled with o's or x's \\ board.include?("")

def draw?(board)
  (full?(board)) && !(won?(board))
end # => (true) if the board has not been won but is full
     # => (false) if the board is not won and the board is not full, and false if the board is won.

def over?(board)
  won?(board) || draw?(board) || full?(board)
end # (true) if the board has been won, is a draw, or is full

def winner(board)
if winning_combination = won?(board)
board[winning_combination[0]]
end
end # => the token, "X" or "O" - from the winning board
