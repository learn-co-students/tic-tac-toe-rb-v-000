# build out your methods in this order
# WIN_COMBINATIONS
# display_board
# input_to_index
# move
# position_taken?
# valid_move?
# turn
# turn_count
# current_player
# won?
# full?
# draw?
# over?
# winner

# WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

# play method
def play(board)
  while !over?(board) && !draw?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end

# display_board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


#sample user_input to use until the CLI is built
user_input = "6"

# input_to_index
# convert user input into a integer, minus 1 because the array starts with zero

def input_to_index(user_input)
  user_input.to_i - 1
end

index = input_to_index(user_input)

# move method using array, index & X or O 
def move(board, index, value)
  board[index] = value
end

# position_take? method
def position_taken?(board, index)
  if board[index] == " " or board[index] == ""|| board[index] == NIL
    FALSE
  else
    TRUE
  end
end

# valid_move? method
def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
    TRUE
  else
    FALSE
  end
end

# turn method
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  value = current_player(board)
  if valid_move?(board, index)
    move(board, index, value)
    display_board(board)
else
    turn(board)
  end
end

# turn_count method
def turn_count(board)
  turns = 0
  board.each do |played|
    if played == "X" || played == "O"
      turns += 1
    end
  end
  turns
end

# method current_player
def current_player(board)
  if turn_count(board) % 2 == 0
  "X"
  else 
  "O"
  end
end  

# ternary operator for method current_player
# def current_player(board)
#   if turn_count(board) % 2 == 0 ? "X" : "O"

# won? method 
def won?(board)
  WIN_COMBINATIONS.find do |winning_combo|
    board[winning_combo[0]] == board[winning_combo[1]] &&
    board[winning_combo[1]] == board[winning_combo[2]] &&
    position_taken?(board, winning_combo[0])
  end
end

# full? method
def full?(board)
  board.all? do |board_space|
    board_space == "X" || board_space == "O"
  end
end  
    
# draw? method
def draw?(board)
  full?(board) && !won?(board)
end

# over? method
def over?(board)
  full?(board) || won?(board)
end

# winner method
def winner(board)
  if the_winner = won?(board)
    board[the_winner.first]
  else
    return nil
  end
end



