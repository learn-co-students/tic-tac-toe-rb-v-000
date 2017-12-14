# The combinations that will result in a win
WIN_COMBINATIONS = [
  [ 0, 1, 2 ], # top row
  [ 3, 4, 5 ], # middle row
  [ 6, 7, 8 ], # bottom row
  [ 0, 3, 6 ], # left-most column
  [ 1, 4, 7 ], # middle column
  [ 2, 5, 8 ], # right-most column
  [ 0, 4, 8 ], # top right to bottom left diagonal
  [ 2, 4, 6 ], # top left to bottom right diagonal
]

## Displays the tic-tac-toe board depending on the array it is passed
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

## Converts the input to an integer and an index
def input_to_index(input)
  index = input.to_i - 1
  return index
end

## Places the character in the desired position
def move(board, index, token)
  board[index] = token
  return board[index]
end

## Checks to see if the position is already filled in with a token
def position_taken?(board, index)
  if (board[index] == nil) || (board[index] == "" || board[index] == " ")
    return false

  else
    return true
  end
end



## Checks to see if the move is valid
def valid_move?(board, index)

  if (position_taken?(board, index) == true)
    return false

  elsif (0 <= index && index <= 8)
    return true

  else
    return false
  end
end

## Fulfills the turn ********
def turn(board)
  puts "Please enter 1-9:"
  index = input_to_index(gets.strip)
  possible_tokens = ['X', 'O']
  token = current_player(board)

  if (valid_move?(board, index) == true)
    move(board, index, token)
    display_board(board)

  else
    turn(board)
  end
end

## Counts the number of turns
def turn_count(board)
  tokens = board.select {|token| token == 'X' || token == 'O'}
  token_count = tokens.length
  return token_count
end

## Determines whose turn it is
def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

## Determines if the game has been won
def won?(board)
  WIN_COMBINATIONS.any? do |win_combination|
    if win_combination.all? {|index| board[index] == 'X'} || win_combination.all? {|index| board[index] == 'O'}
      return true
    end
  end
end

## Checks to see if the board is full
def full?(board)
  full_board = board.all? {|position| position == 'X' || position == 'O'}

  if (full_board)
    return true

  else
    return false
  end
end

## Checks to see if the game is a draw
def draw?(board)
  full_board = full?(board) == true
  won = won?(board) != false

  if ( !won ) && (full_board) #full board and no one won
    return true

  elsif ( !won ) && ( !full_board ) #game still in progress
    return false

  elsif ( won ) #someone won
    return false
  end
end

## Checks to see if the game is over
def over?(board)
  full_board = board.all? {|position| position == 'X' || position == 'O'}
  won = won?(board) != false
  draw = draw?(board) == true

  if (won && full_board)
    return true

  elsif (won && !full_board)
    return true

  elsif (draw)
    return true

  else
    return false
  end
end

# Determines who the winner is
def winner(board)

  won = won?(board) != false

  all_X = board.select {|token| token == 'X'}
  all_O = board.select {|token| token == 'O'}
  number_of_X = all_X.length
  number_of_O = all_O.length

  if ( won )
    if (number_of_X > number_of_O)
      return"X"
    elsif (number_of_X < number_of_O)
      return "O"
    end
  else
    return nil
  end
end

# This method evaluates each turn
def play(board)
  while (over?(board) != true) do
    turn(board)
  end

  if (won?(board) != false)
    puts "Congratulations #{winner(board)}!"
    return

  elsif (draw?(board) == true)
    puts "Cat's Game!"
    return
  end

end
