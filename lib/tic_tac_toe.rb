board = [" "," "," "," "," "," "," "," "," "]

# WIN_COMBINATIONS
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

# display_board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# input_to_index
def input_to_index(user_input)
  user_input.to_i - 1
end

# move
def move(board, position, char)
  board[position] = char
end

# position_taken
def position_taken?(board, index_i)
  if ((board[index_i] == "X") || (board[index_i] == "O"))
    true
  else
    false
  end
end

# valid_move
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

#turn
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, char)
    display_board(board)
  else
    turn(board)
  end
end

# turn_count
def turn_count(board)
  number_of_turns = 0
  board.each do |space|
    number_of_turns = 0
    if space == "X" || space == "O"
      number_of_turns += 1
    end
  end
end
