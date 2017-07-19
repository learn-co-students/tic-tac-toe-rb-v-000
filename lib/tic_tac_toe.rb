# Define a WIN_COMBINATIONS constant: sets the index values for win combinations
WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [0,4,8],  # Left diagonal
  [6,4,2]   # Right diagonal
]

# Define a #DISPLAY_BOARD method: accepts a board array and prints board display
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def display_board(board)
  row = [" #{board[0]} | #{board[1]} | #{board[2]} ", "-----------", " #{board[3]} | #{board[4]} | #{board[5]} ", "-----------", " #{board[6]} | #{board[7]} | #{board[8]} "]
  puts row
end

# Define a #INPUT_TO_INDEX method: convert string to integer minus 1 (to start index at 1)
def input_to_index(user_input)
  user_input.to_i - 1
end

# Define a #MOVE method: takes in 3 arguments - board array, board index, player character
def move (array, index, player)
  array[index] = player
end

# Define a #POSITION_TAKEN? method: checks board to see if position is taken
def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    true
  end
end

# Define a #VALID_MOVE? method: accepts board and index, checks if the move is valid
def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0,8) == true
    true
  end
end

# Define a #TURN method: runs the turns for the players
def turn(board)
  # Ask user for their move, 1-9
  puts "Player #{current_player(board)}, enter position 1-9:"
  # Receive user input
  user_input = gets.strip
  # Convert user input to index
  index = input_to_index(user_input)
  # If move is valid, make move and display board
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
  # If move invalid, run #turn again
    puts "invalid"
    turn(board)
  end
end

# Define a #TURN_COUNT method: returns the number of turns played
def turn_count(board)
  counter = 0
  board.each do |player_turn|
    if player_turn == "X" || player_turn =="O"
      counter +=1
    end
  end
  counter
end

# Define a #CURRENT_PLAYER method: determines if it's X's or O's turn
def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

# Define a #WON? method: return winning combination if win, return false if no win
def won?(board)
  # Iteration for each win_combination in the WIN_COMBINATIONS constant
  WIN_COMBINATIONS.each do |win_combination|
    # win_combination is iterating over the WIN_COMBINATIONS indexes to check for 3 matches
    # Create a numbered index variable for every win_combination
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    # Create a numbered position variable to load the value of the board at each index
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    # Check if each position is equal to "X", then return win_combination indexes that won
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    # Check if each position is equal to "O", then return win_combination indexes that won
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  # Return false for an empty board or draw
  false
end

# Define a #FULL? method: checks if every board element is filled with X or O
def full?(board)
  # Check if every board position index contains "X" or "O" using #all?
  board.all? do |position|
    position == "X" || position == "O"
  end
end

# Define a #DRAW? method: checks if board is full and there's no win, then it's a draw
def draw?(board)
  # Game is a draw when #full? returns true AND #won? returns false
  full?(board) && !won?(board)
end

# Define a #OVER? method: checks if board is won, full, or draw, then game is over
def over?(board)
  # Game is over when #won? OR #full? OR #draw? returns true
  won?(board) || full?(board) || draw?(board)
end

# Define a #WINNER method: checks and returns which character won the game
def winner(board)
  # If winning_move is #won? that returns true
  if winning_move = won?(board)
    # Then return if #winner is "X" or "O" by checking the first array (which is 0) in winning_move
    board[winning_move[0]]
  end
end

# Define a #PLAY method: creates loop to run turn, checks #over?, checks won?
def play(board)
  # Run #turn while not #over?
  while !over?(board)
    turn(board)
  end
  # End game if #won?, print message
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  # End game if #draw?, print message
  elsif draw?(board)
    puts "Cats Game!"
  end
end
