# Define your WIN_COMBINATIONS constant
# Array of the indexes of all possible winning combinations
# for a given token
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
# Define display_board that accepts a board and prints
# out the current state.
def display_board (board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# converts the user input [1-9] into an array index [0,8].
def input_to_index (user_input)
  index = user_input.to_i-1
end

# player's move
def move(board, index, character)
  board[index] = character
end

# returns true if position is taken.
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# returns true if the move is valid.
def valid_move? (board, index)
  if (index).between?(0,8) && !position_taken?(board, index)
    true
  else
    false
  end
end

# A single complete turn
def turn(board)
  #ask for move
  puts "Please enter 1-9:"
  #receive user input
  input = gets.strip
  #convert user input to an index
  user_index = input_to_index(input)
  # if valid move > move and display
  # otherwise ask again for a valid move
  if (valid_move?(board, user_index))
    move(board, user_index, current_player(board))
    display_board(board)
  else
    user_index = turn(board)
  end
end

# returns turns have been played.
def turn_count(board)
  turns_array = board.select { |token| token == "X" || token == "O"}
  turns_array.length
end

# returns the current player (X or O).
def current_player(board)
  turn_count(board)%2 == 1? "O":"X"
end

# returns false/nil if no win_combination.
# returns win_combination indexes array if there is a win_combination.
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if win_combination.all? {|win_index| board[win_index] == "X" } || \
       win_combination.all? {|win_index| board[win_index] == "O" }
       return win_combination
    end
  end
 false
 end

# returns true if board is full with X and O.
def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end

# returns true if the game is full an there is no win_combination
# returns false if board is not full and no win_combination and
# if the board is won.
def draw?(board)
  !won?(board) && full?(board)
end

# returns true if the board has been won, is a draw, or is full.
def over?(board)
  won?(board) || draw?(board) || full?(board)
end

# returns "X" or "O" that has won the game.
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    nil
  end
end

# main method of TTT
def play (board)
    # loop till turn_count
    while (!full?(board) && !over?(board))
      turn(board)
    end
    if winner(board)
      puts "Congratulations #{winner(board)}!"
    else
      puts "Cats Game!"
    end
end
