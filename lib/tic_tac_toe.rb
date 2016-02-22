
# An array of all possible win combinations
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
]

# display_board that accepts a board and prints
# out the current state.

def display_board(board)
  horiz_line = "-----------"
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts horiz_line
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts horiz_line
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your move method here!
def move(board , location , player_character = "X")
  location = location.to_i
  board[location-1] = player_character
  return board
end

# position_taken method
def position_taken?( board , position )
  if board[position] == " " || board[position] == "" || board[position] == nil
    false
  else
    true
  end
end

# takes the User input position i.e. Chars from 1 to 9
def valid_move?( board, position )
  position_int = position.to_i
  position_ary = position_int - 1
  if !(position_taken?( board, position_ary )) && position_ary.between?( 0, 8 )
    true
  else
    false
  end
end

# turn method prompts for user input, checks for valid move, and
# executes a turn using move()
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(board, input)
    player_character = current_player(board)
    move(board, input, player_character)
  else
    turn(board)
  end
  display_board(board)
end

# turn count
def turn_count( board )
  counter = 0
  board.each do |element|
    if element == " " || element == ""
      #
    else
      counter += 1
    end
  end
  counter
end

# current_player assumes that the first player was "X"
# it uses turn_count to calculate whose turn it is.
def current_player( board )
  num_moves = turn_count(board)
  # using ternary operator
  num_moves % 2 == 0 ? current_player = "X" : current_player = "O"
  current_player
end

# returns false or nil if no win, and the winning array combo if there is a win
def won?(board)
  WIN_COMBINATIONS.each do |combination| #iterate over WIN_COMBINATIONS
    if position_taken?(board, combination[0]) #only check for a win if the position is taken
      if board[combination[0]] == board[combination[1]] && board[combination[0]] == board[combination[2]]
        return combination
      end
    end
  end
  nil
end

def full?(board)
  board.all? do |marker|
    marker != " " && marker != nil
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  win_combo = won?(board)
  if win_combo
    return board[win_combo[0]]
  end
end

# main play method
def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    #congrats
    puts "Congratulations #{winner(board)}!"
  else
    # it was a draw
    puts "Cats Game!"
  end
end
