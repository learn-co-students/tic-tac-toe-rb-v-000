
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top_row
  [3,4,5], # middle_row
  [6,7,8], # bottom_row
  [0,3,6], # left_column
  [1,4,7], # center_column
  [2,5,8], # right_column
  [0,4,8], # left_diagonal
  [6,4,2]  # right_diagonal
]

board = Array.new(9, " ")
#  same as board = [" "," "," "," "," "," "," "," "," "]



# OUTPUT BOARD
def display_board(board)

  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# CHANGE INFO TO INTERGER
def input_to_index (user_input)
# convert 1-9 move from string into integer and correlating array(index)
  index = user_input.to_i - 1
end

# MOVE ON BOARD
def move (board, position, token)
  board[position] = token
end

# CHECK FOR EMPTY SPACE
def position_taken?(board, index)
 !(board[index] == " " || board[index] == "" || board[index] == nil)
end

# MAKE TURN
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)

  if valid_move?(board, index)
    # puts 'valid move'
    move(board, index, current_player(board))
    display_board(board)
  else
    # puts 'try again'
    turn(board)
  end
  display_board(board)
end



# IS POSITION_# CORRECT & SPACE EMPTY
def valid_move? (board, index)
    if index.between?(0,8) && !position_taken?(board, index)
      return true # valid move
    else
      return false
    end
end

# COUNTER FOR PLAYER ASSESSMENT
def turn_count(board)
  # counter = 0
  # board.each do |count|
  #   if count == "X" || count == "O"
  #     counter += 1
  #   end
  # end
  # return counter

  9 - board.count(" ")
end

# WHICH PLAYER TURN
def current_player (board)
  if turn_count(board).even?
    current_player = "X"
  else
    current_player = "O"
  end
  return current_player
end



# BOARD STATUS - WON, DRAW,
def won? (board)
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo # return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo #
    end
  end
  return false
end

def full? (board)
  board.all? {|index|
    index == "X" or index == "O"
  }
end

def draw? (board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    puts "no keep going"
    return false
  end
end

def winner(board)
  index = []
  index = won?(board)
  if index == false
    return nil
  else
    if (board[index[0]] == "X")
      # puts "Congratulations X!"
      return "X"
    else
      # puts "Congratulations O!"
      return "O"
    end
  end
end

def play (board)
  while !over?(board)
    # puts 'turn'
    turn(board)
  end
  if won?(board)
    # winner(board) == "X" || winner(board) == "O"
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
