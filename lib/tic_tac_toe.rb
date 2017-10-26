# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
                   [0,1,2], # top row
                   [3,4,5], # middle row
                   [6,7,8], # bottom row
                   [0,3,6], # left column
                   [1,4,7], # middle column
                   [2,5,8], # right column
                   [0,4,8], # left start diagonaly
                   [2,4,6] # right start diagonaly
                 ]
# Define display_board that accepts a board and prints
# out the current state.
def display_board(board)
  row_seperator = "-----------"
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts row_seperator
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts row_seperator
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your input_to_index and move method here!
def input_to_index(user_input)
  return index = user_input.to_i - 1
end

def move(board, index, value)
  board[index] = value
end

# code your #position_taken? method here!
def position_taken?(board, index)
  position_taken = nil
  if (board[index] == " " || board[index] == "" || board[index] == nil)
    position_taken = false
  else
    position_taken = true
  end
  # advanced solution w/ ternary operator
  # (board[index] == " " || board[index] == "" || board[index] == nil)?
  #false : true
end

# code your #valid_move? method here
def valid_move?(board, index)
  !(position_taken?(board, index)) && index.between?(0, 8)?
  true : false
end
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  value = current_player(board)
  if valid_move?(board, index)
    move(board, index,value)
    display_board(board)
  else
    turn(board)
  end
  #display_board(board)
end


def turn_count(board)
  counter = 0
  board.each do |move_count|
    if move_count == "X" || move_count == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  #if turn_count(board) % 2 == 0
  #  current_player = "X"
  #else
  #  current_player = "O"
  #end
  turn_count(board) % 2 == 0 ?
  "X" : "O"
end

#def won?(board)
#  WIN_COMBINATIONS.detect do |combo|
#    board[combo[0]] == board[combo[1]] &&
#    board[combo[1]] == board[combo[2]] &&
#    position_taken?(board, combo[0])
#  end
#end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  false
end

#def full?(board)
#  board.none? do |i|
#    i == " " || i.nil?
#  end
#end

def full?(board)
  board.all? { |occupied| occupied != " "  }
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
   draw?(board) || full?(board) || won?(board)
end

def winner(board)
  if won?(board)
    winner = board[won?(board)[0]]
  elsif !won?(board)
    return nil
  end
end

# Define your play method below
def play(board)
  until over?(board) == true || won?(board) != false
  #while !over?(board)
    turn(board)
  end
  if winner(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  else
    return nil
  end
end
