#All valid win combinations
WIN_COMBINATIONS = [
  [0,1,2], #top row win
  [3,4,5], #middle row win
  [6,7,8], #bottom row win
  [0,3,6], #left column win
  [1,4,7], #middle column win
  [2,5,8], #right column win
  [0,4,8], #diagonal win
  [6,4,2]  #other diagonal win
]

#Method to display board in the console
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#Method to convert user input to a board index (0-8)
def input_to_index(user_input)
  user_input.to_i - 1
end

#Method to determine a new move
def move(board, index, player)
  board[index] = player
end

#Method to see if an index is already filled
def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

#Method to check if the move is on the board and empty
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

#Method to ask user for their move
def turn(board)
  player = current_player(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, player)
    display_board(board)
  else
    turn(board)
  end
end

#Method to count the number of turns already made
def turn_count(board)
  turns_taken = 0
  board.each do |index|
    if index == "X" || index == "O"
      turns_taken += 1
    else
      turns_taken += 0
    end
  end
  return turns_taken
end

#Method to check whose turn it is
def current_player(board)
  if turn_count(board) % 2 == 0
    current_player = "X"
  else
    current_player = "O"
  end
  return current_player
end

# Method to determine which win combination caused a win
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      false
    end
  end
end

#Method to check if the board is full
def full?(board)
  board.none? do |index|
    index == "" || index == " "
  end
end

#Method to check for a draw/tie
def draw?(board)
  #full?(board) && !won?(board)
  !won?(board) && full?(board)
end

#Method to check if game is over
def over?(board)
  won?(board) || draw?(board)
end

#Method to check who the winner is "X" or "O"
def winner(board)
  win_combination = won?(board)
  if won?(board) == nil
    return nil
  end
  spot_1 = win_combination[0]
  spot_2 = win_combination[1]
  spot_3 = win_combination[2]

  spot_1_value = board[spot_1]
  spot_2_value = board[spot_2]
  spot_3_value = board[spot_3]

  if spot_1_value == "X" && spot_2_value == "X" && spot_3_value == "X"
    winner = "X"
  elsif spot_1_value == "O" && spot_2_value == "O" && spot_3_value == "O"
    winner = "O"
  else
    winner = nil
  end
  return winner
end

#Method to loop through an entire game
def play(board)
  until over?(board)
    turn(board)
  end
  if winner(board) == "O"
    puts "Congratulations O!"
  elsif winner(board) == "X"
    puts "Congratulations X!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
