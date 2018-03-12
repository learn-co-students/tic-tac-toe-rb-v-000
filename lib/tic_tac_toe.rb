# prints arbitrary arrangements of the board

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# defines a constant WIN_COMBINATIONS with arrays for each possible win combination

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

#converts user input to an integer
#subtracts 1 from the user input
#returns -1 for strings without integers

def input_to_index(user_input)
  user_input.to_i - 1
end

# sets the location the player chooses to their token, either X or O

def move(board, index, holder)
  board[index] = holder
end

# returns true/false based on whether the position given is taken yet

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# checks the user input to ensure it is a proper location on the board

def valid_move? (board, index)
  if index < 9 && index >= 0 && (position_taken?(board, index) == FALSE)
    TRUE
  else
    FALSE
  end
end

# prompts player to enter their chosen location

def turn(board)
  puts "Please enter 1-9:"
  num = gets.strip
  num = input_to_index(num)
  if valid_move?(board, num)
    holder = current_player(board)
    move(board, num, holder)
    display_board(board)
  else
    turn(board)
  end
end

# counts occupied locations

def turn_count (board)
  count = 0
  board.each do |pos|
    count += 1 if pos == "X" || pos == "O"
  end
  count
end

# returns the token of the current player (X or O)

def current_player(board)
  tally = turn_count(board)
  if ((tally % 2) == 0)
    then 
    return "X"
  else 
    return "O"
  end
end

# returns false for a draw or a game that isn't finished. returns true for a win

def won?(board)
  WIN_COMBINATIONS.detect do |spot|
    if (board[spot[0]] == "X" && board[spot[1]] == "X" && board[spot[2]] == "X") || (board[spot[0]] == "O" && board[spot[1]] == "O" && board[spot[2]] == "O")
      spot
    else 
      false
    end
  end
end

# returns true for a draw, returns false for a game that isn't finished

def full?(board)
  board.all? do |played|
    played == "X" || played == "O"
  end
end

# returns true if the board is full and no one has won

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

# returns true for a draw, or win

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

# returns the token of the winning player

def winner(board)
  if player = won?(board)
    return board[player.first]
  else 
    return nil
  end
end

# repeats turn until the game is over

def play(board)
  until over?(board)
    turn(board)
  end
  
  if won?(board)
    winner = winner(board)
    puts "Congratulations #{winner}!"
  else draw?(board)
    puts "Cat's Game!"
  end
end