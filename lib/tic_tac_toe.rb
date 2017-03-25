# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8], # <-- Horizontal win
  [0, 3, 6], [1, 4, 7], [2, 5, 8], # <-- Vertical win
  [0, 4, 8], [2, 4, 6] # <-- Diagonal win
]

# Define the method that prints the board with a board argument
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "

end

# Define input_to_index which converts user input to a board index
def input_to_index(user_input)
  user_input.to_i - 1
end

# Define move method that takes three parameters
def move(board, index, current_player)
  board[index] = current_player
end

# Define for validation of the move method
def position_taken?(board, index)
if board[index] == "X" || board[index] == "O"
  true

else
  false

  end
end

# Define for checking moves - accepts board, index and returns true if correct range and not occupied
def valid_move?(board, index)
  if index.between?(0,8) && ! position_taken?(board, index)
    true

  else
    false

  end
end

# Define method to handle invalid input and ask for input again
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)

  until valid_move?(board, index)
    puts "Invalid Move! Try again."
    user_input = gets.strip
    index = input_to_index(user_input)

  end

  move(board, index, current_player(board))
  display_board(board)

end

# Define two methods - one to count turns & the other to determine whose turn it is

# Define how many turns have been played
def turn_count(board)
  counter = 0
  board.each do |position|

    if position == "X" || position == "O"
  counter += 1
    end

  end
 counter
end

# Determine if current_player is an X or an O
def current_player(board)
  turn_count(board).even? ? "X" : "O"

end

# Define won? needs WIN_COMBINATIONS to work. 8 ways to win. inspect returns a human readable array value.
# try to iterate over the combo to check if it has X or O at the indicies to win. define in terms of winner X or winner O
def won?(board)

  WIN_COMBINATIONS.each do |current_combo|

    win_x = current_combo.all? { |position| board[position] == "X" }
    win_o = current_combo.all? { |position| board[position] == "O"}

    if win_x || win_o
      return current_combo

    end
  end
    false
end

# Define full? the all enumerator wants every value to return true or it will automatically return false. so, if all combo is full, then true.
def full?(board)
  if board.all? {|value| !value.nil? && value != " "}
    true
  else
    false
  end
end

# I added empty? to balance out the full? method - just seemed to make sense to have both.
def empty?(board)
  board.all? {|value| value.nil? || value == " " }
end

# Define draw? position_taken but not won = draw. if empty or full win then not draw. !empty is in progress.
def draw?(board)
  if won?(board)
    false
  elsif full?(board)
    true
  else
    false

  end

end

# Define over? if either of these return true, it will be true else false. != or could return an array.
def over?(board)
  won?(board) != false || draw?(board)
end

#Define winner - need board position for winning combo
def winner(board)
  win_combo = won?(board)
  if !win_combo
    nil
  else
    board[win_combo[0]]

    end
end

# Define your play method below
def play(board)

  while !over?(board)
    turn(board)
  end

    if won?(board)
      puts "Congratulations #{winner(board)}!"

    elsif draw?(board)
      puts "Cats Game!"

    end

end
