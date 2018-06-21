WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2],
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, position, value)
  board[position] = value
end

def position_taken?(board, position)
  ![nil, " "].include?(board[position])
end

def valid_move?(board, position)
  highest_possible_position = 8
  lowest_possible_position = 0

  position <= highest_possible_position &&
  position >= lowest_possible_position &&
  !position_taken?(board, position)
end

def turn(board)
  puts "Please enter 1-9:"

  input = gets.strip
  index = input_to_index(input)

  if valid_move?(board, index)
    # TODO put current player here
    move(board, index, "X")
    display_board(board)
  else
    turn(board)
  end

end

# TODO this feels really messy. Lots of mutable state...
def turn_count(board)
  turn_counter = 0
  (board.length).times do |i|
    if position_taken?(board, i)
      turn_counter += 1
    end
  end

  return turn_counter
end
