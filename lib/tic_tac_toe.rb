
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

# Define a method display_board that prints a 3x3 Tic Tac Toe Board
def display_board
  puts "   |   |   "
  puts "-----------"
  puts "   |   |   "
  puts "-----------"
  puts "   |   |   "
end



# Define display_board that accepts a board and prints
# out the current state.
#board = [" ", " ", " ", " ", "X", " ", " ", " ", " "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end



# code your input_to_index and move method here!
#move passed
def move(board, position, char="X")
  board[position] = char
end

#input_to_index passed
def input_to_index(user_input = "1" - "9")
  user_input.to_i - 1
end


# code your #position_taken? method here!
def position_taken?(board, index)
  if board[index] == " " || board[index] == ""
    false
  elsif board[index] == nil
    false
  elsif board[index] == "X" || board[index] == "O"
    true
  end
end



# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
# code your #valid_move? method here
def valid_move?(board, index)
  if position_taken?.between?(0,8) == false
    true
  else
    false
  end
end



#Turn method with helper methods
def turn(board)
  puts "Please enter 1-9:"
  index = input_to_index(gets.chomp)
    puts "#{index}"
  if valid_move?(board, index)
    move(board, index)
    puts display_board(board)
  else
    turn(board)
  end
end

#turn_count method
def turn_count(board)
  counter = 0
  board.each do |token|
    if token == "X" || token == "O"
      counter += 1
    end
  end
  return counter
end

#current player method
def current_player(board)
  if turn_count(counter).even?
    puts "X"
  else
    puts "O"

  end
end



# Define your play method below

def play(board)
  turns = 0
  until turns == 9
    turn(board)
    turns += 1
  end
end
