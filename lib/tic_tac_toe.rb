# Helper Methods for Tic Tac Toe

# 1 - WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Left column
  [1, 4, 7], # Middle column
  [2, 5, 8], # Right column
  [0, 4, 8], # 1st diagonal
  [2, 4, 6]  # 2nd diagonal
]

# 2 - DISPLAY_BOARD method

def display_board(board)
  row_1 = " #{board[0]} | #{board[1]} | #{board[2]} "
  row_2 = " #{board[3]} | #{board[4]} | #{board[5]} "
  row_3 = " #{board[6]} | #{board[7]} | #{board[8]} "
  dashes = "-----------"
  puts row_1
  puts dashes
  puts row_2
  puts dashes
  puts row_3
end

# 3 - INPUT_TO_INDEX method

def input_to_index(input)
  input = input.to_i
  input = input - 1
end

# 4 - MOVE method

def move(array, index, value)
  array[index] = value
end

# 5 - POSITION_TAKEN? method

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  elsif board[index] == "X" || board[index] == "O"
    true
  end
end

# 6 - VALID_MOVE? method

def valid_move?(board, index)
  if position_taken?(board, index) == false && board[index] != nil && index >= 0 && index <= 8
    true
  else
    false
  end
end

# 7 - TURN method

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

# 8 - TURN_COUNT method

def turn_count(board)
  turns = 0
  board.each do |board_position|
    if board_position == "O" || board_position == "X"
      turns += 1
    end
  end
  return turns
end

# 9 - CURRENT_PLAYER method

def current_player(board)
  number_of_turns = turn_count(board)
  if number_of_turns % 2 == 0
    return "X"
  else
    return "O"
  end
end

# 10 - WON? method

def won?(board)

  empty_board = board.all? do |position| # Iterate through items in board to check if the board is empty
    position == " "
  end

  if empty_board
    return false
  end

  WIN_COMBINATIONS.each do |combination|   # Iterate through each of the combinations in this array to check for winning combination

    winning_combination = []

    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      winning_combination = [win_index_1, win_index_2, win_index_3]
      return winning_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      winning_combination = [win_index_1, win_index_2, win_index_3]
      return winning_combination
    end
  end
  return false # If not an empty board and there's no winning combination, return false
end

# 11 - FULL? method

def full?(board)
  full_board = board.all? do |position| # Iterate through items in board to check if the board is full
    position == "X" || position == "O"
  end

  if full_board
    return true
  else
    return false
  end
end

# 12 - DRAW? method

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

# 13 - OVER? method

def over?(board)
  if draw?(board) == true || won?(board) != false
    return true
  else
    return false
  end
end

# 14 - WINNER method

def winner(board)
  WIN_COMBINATIONS.each do |combination|   # Iterate through each of the combinations in this array to check for winning combination

    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X"
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
    end
  end
  return nil # Return nil if neither X nor O is the winner
end

# End of Helper methods

# Main method = Play method

# Play method

def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
