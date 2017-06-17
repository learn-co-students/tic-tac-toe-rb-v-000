# defines a constant WIN_COMBINATIONS with arrays for each win combination
WIN_COMBINATIONS = [
  # Top row win
  [0, 1, 2],

  # Middle row win
  [3, 4, 5],

  # Bottom row win
  [6, 7, 8],

  # Left column win
  [0, 3, 6],

  # Middle column win
  [1, 4, 7],

  # Right column win
  [2, 5, 8],

  # Diagonal win 1
  [0, 4, 8],

  # Diagonal win 2
  [2, 4, 6]
]

# #display_board
# prints arbitrary arrangements of the board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# #input_to_index
# converts a user_input to an Integer
# subtracts 1 from the user_input
# returns -1 for strings without integers
def input_to_index( user_input )
  user_input = user_input.to_i
  user_input -= 1
end

# #move
# does not allow for a default third argument
# takes three arguments: board, position, and player token
# allows "X" player in the bottom right and "O" in the top left
def move ( board, index, character)
  board[index] = character
end

# #position_taken
# returns true/false based on position in board
def position_taken?( board, index )
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else
    return true
  end
end

# #valid_move
# returns true/false based on position
def valid_move?( board, index )
  if position_taken?( board, index ) == true || !index.between?(0,9)
    return false
  else
    return true
  end
end

# #turn
# makes valid moves
# asks for input again after a failed validation
def turn( board )
  puts "Please enter 1-9:"
  user_input = gets.chomp
  user_input = input_to_index( user_input )
  if valid_move?( board, user_input ) == true
    puts "Valid move was made"
    character = current_player( board )
    move( board, user_input, character )
    display_board( board )
  else
    while valid_move?( board, user_input ) == false
      puts "Please enter a valid move: "
      user_input = gets.chomp
      user_input = input_to_index( user_input )
    end
    if valid_move?( board, user_input ) == true
      puts "Valid move was made"
      character = current_player( board )
      move( board, user_input, character )
      display_board( board )
    end
  end
end

# #turn_count
# counts occupied position
def turn_count( board )
  counter = 0
  board.each do |positions|
    if positions == "X" || positions == "O"
      counter += 1
    end
  end
  counter.to_i
end

# #current_player
# returns the correct player, X, for the third move
def current_player( board )
  if turn_count( board ) % 2 == 0
    return "X"
  else
    return "O"
  end
end


# #won?
# returns false for a draw
# returns true for a winner
def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    combo.all? {|c| position_taken?(board, c) && board[c] == board[combo[0]] }
  end
end

# #full?
# returns true for a draw
# returns false for an in-progress Game
def full?( board )
  board.all? do |position|
    position != " "
  end
end

# #draw
# calls won?
# calls full?
# returns true for a draw
# returns false for a won game
# returns false for an in-progress game
def draw?( board )
  if !won?( board ) && full?( board )
    return true
  else
    return false
  end
end

# #over?
# returns true for a draw
# returns true for a won game
# returns false for an in-progress game
def over?( board )
  if draw?( board ) || won?( board )
    return true
  else
    return false
  end
end

# #winner
# return X when X won
# returns O when O won
# returns nil when no winner
def winner( board )
  if won?( board )
    return board[ won?( board )[0] ]
  else
    return nil
  end
end

# #player
# asks for players input on a turn of the game
# checks if the game is over after every turn
# plays the first turn of the game
# plays the first few turns of the game
# checks if the game is won after every turn
# checks if the game is draw after every turn
# stops playing is someone has won
# congratulates the winner X
# congratulates the winner O
# stops playing in a draw
# prints "Cats Game!" on a draw
# plays through an entire game
def play( board )
  while !over?( board )
    turn( board )
  end
  if won?( board )
    puts "Congratulations #{ winner( board ) }!"
  else draw?( board )
    puts "Cats Game!"
  end
end
