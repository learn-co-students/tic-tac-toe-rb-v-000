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

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player#(board)
end

#def position_taken?(board, location)
  #board[location] != " " && board[location] != ""
#end

def position_taken?(board, index)
  if board[index] ==  "X" || board[index] == "O" #|| board[index] == "O"
    return true
  elsif board[index] == " " || board[index] == "" || board[index] == nil
    return false
  end
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)# && !position_taken?(board, index, "O")
end

def turn(board)
  loop do
    puts "Please enter 1-9:"
    index = gets.to_i
    index = input_to_index(index)
    if valid_move?(board, index)
      move(board, index, current_player(board))
      display_board(board)
      break
    end
  end
end

# This method takes in an argument of the board array and returns the number of
# turns that have been played
def turn_count(board)
  # We need a variable that establishes an initial value, otherwise, it won't
  # know where to start
  counter = 0
  board.each do |character|
    if character == "X" || character == "O"
    counter += 1
    else
    end
  end
# This return is necessary because methods NEED to return something (tell us what
# it is doing, instead of just telling us it does know the answer)
  return counter
end


def current_player(board)
  if turn_count(board) % 2 == 0
    character = "X"
  else
    character = "O"
  end
  return character
end


# Your #won? method should accept a board as an argument and return false/nil if
# there is no win combination present in the board and return the winning
# combination indexes as an array if there is a win.
def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end


# The #full? method should accept a board and return true if every element
# in the board contains either an "X" or an "O". The #full? method doesn't need
# to worry about draws or winning combinations, simply return false if there
# is an available position and true if there is not.
def full?(board)
    if board.include?(" " || "" || nil)
      return false
    else
      return true
    end
end


# Build a method #draw? that accepts a board and returns true if the board has
# not been won and is full and false if the board is not won and the board
# is not full, and false if the board is won.
def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end


# Build a method #over? that accepts a board and returns true if the board has
# been won, is a draw, or is full.
def over?(board)
  if won?(board) || full?(board)
    return true
  end
end


# The #winner method should accept a board and return the token, "X" or "O"
# that has won the game given a winning board.
def winner(board)
  if won?(board)
    win_combo=won?(board) # 3 indices - all x or all o
    return board[win_combo[0]]  # win_combo[0] has the first index of the winning combo
  else
    return nil
  end
end


def play(board)
  loop do
    if won?(board)
      puts "Congratulations #{winner(board)}!"
      break
    elsif draw?(board)
      puts "Cat's Game!"
      break
    elsif over?(board)
      break
    end
    turn(board)
  end


end
