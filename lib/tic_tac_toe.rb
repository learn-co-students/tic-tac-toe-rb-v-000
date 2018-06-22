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
    move(board, index, current_player(board))
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

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  # confirm that there are three of the same token at the indices defined in win combinations
  WIN_COMBINATIONS.detect do |combination|
    position_1 = board[combination[0]]
    position_2 = board[combination[1]]
    position_3 = board[combination[2]]

    # TODO look at on 6/21 and consider to refactoring
    ([position_1, position_2, position_3].all? { |elt| elt == "X"} ||
    [position_1, position_2, position_3].all? { |elt| elt == "O"})

  end
end

# TODO Bad Style
def full?(board)
  i = 0
  board.all? do |position|
    result = position_taken?(board, i)
    i += 1
    result
  end
end

# is the board full and there is no winner
def draw?(board)
  full?(board) && !won?(board)
end

# returns true if the board has been won, is a draw, or is full
def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if winning_positions = won?(board)
    first_winning_board_element = board[winning_positions[0]]
  end
end

def congratulate(winner)
  puts "Congratulations #{winner}!"
end

def draw_message
  puts "Cat's Game!"
end

# currently on the play loop
def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    congratulate(winner(board))
  elsif draw?(board)
    draw_message
  end

end
