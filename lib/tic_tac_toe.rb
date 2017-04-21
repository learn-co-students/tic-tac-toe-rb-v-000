
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
def move(board, index, player_token)
  board[index] = player_token
end
#original
# def move(board, position, player_token)
#   board[position] = player_token
# end

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
  if index.to_i.between?(0,8) && !position_taken?(board, index.to_i) # for occupied position
    true
  else  # for empty position
    false
  end
end



#Turn method with helper methods
def turn(board)
  puts "Please enter 1-9:"
  index = input_to_index(gets.chomp)
  if valid_move?(board, index)
    player_token = current_player(board)
    move(board, index, player_token)
    display_board(board)
  else
    turn(board)
  end
end

#Original
# def turn(board)
#   puts "Please enter 1-9:"
#   index = input_to_index(gets.chomp)
#     puts "#{index}"
#   if valid_move?(board, index)
#     move(board, index)
#     puts display_board(board)
#   else
#     turn(board)
#   end
# end

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
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end


def won?(board)
WIN_COMBINATIONS.detect do |win_combination|

board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]] && position_taken?(board, win_combination[0])

  end
end


def full?(board)
  board.all? do|index|
    index == "X" || index == "O"
  end
end



 def draw?(board)
   !won?(board) && full?(board)
 end
#original
 # def draw?(board)
 #   !won?(board)
 # end


def over?(board)
  draw?(board) || won?(board) || full?(board)
end
#original
# def over?(board)
#   !draw?(board) || won?(board) || full?(board)
# end


def winner(board)

  if won?(board)
    winning_index_array = won?(board) #=> [0,1,2]
    board[winning_index_array[0]]
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
