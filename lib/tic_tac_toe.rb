# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  #Top row
  [3,4,5],  #Middle row
  [6,7,8],  #Bottom row
  [0,3,6],  #First column
  [1,4,7],  #Second column
  [2,5,8],  #Third column
  [0,4,8],  #First diagonal
  [2,4,6],  #Second diagonal
]


# Board to be displayed
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#Takes user input and turns it into integer and substract 1 to find index
def input_to_index(user_input)
  user_input.to_i - 1
end

#Writes the move into the board
def move(board, index, current_player)
  board[index] = current_player
end

#Checks to see if the position is empty
def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

#Checks to see if move is within board and not already taken
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

#Prompts player for input and executes helper methods with input
def turn(board)
  print "Please enter 1-9: "
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

#Defines number of turns that have been played
def turn_count(board)
  counter = 0
  board.each do |turns|
    if turns == "X" || turns == "O"
      counter += 1
    end
  end
  counter
end

#Let's you know whose turn it is
def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end



# Using #detect will return the first item that is TRUE.
def won?(board)
  WIN_COMBINATIONS.detect do |combination|
    board[combination[0]] == board[combination[1]] &&
    board[combination[1]] == board[combination[2]] &&
    position_taken?(board, combination[0])
  end
end

#Checks to see if the entire board is full
def full?(board)
  board.all? do |char|
    char == "X" || char == "O"
  end
end

#Checks to see if the game is a draw
def draw?(board)
  !won?(board) && full?(board)
end

#Checks to see if the game is over
def over?(board)
  won?(board) || draw?(board)
end

#Checks to see who is the winner
def winner(board)
  if combination = won?(board)
    board[combination.first]
  end
end

#Play method that starts and finishes the game
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
