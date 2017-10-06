# Possible Win Combos
WIN_COMBINATIONS = [
  [0,1,2], # Top Row Win
  [3,4,5], # Middle Row Win
  [6,7,8], # Bottom Row Win
  [0,3,6], # First Column Win
  [1,4,7], # Second Column Win
  [2,5,8], # Third Column Win
  [0,4,8], # Diagonal Win from Left
  [6,4,2]  # Diagonal Win from Right
]

# Display the Board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Change Input to Integar and Drop By One
def input_to_index(user_input)
  user_input.to_i - 1
end

# Move Your Piece
def move(board, index, current_player)
  board[index] = current_player
end

# Has the Position Been Taken?
def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

# Valid Move?
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

# Your Turn
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
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
    puts "Cat's Game!"
  end
end

# How Many Turns
def turn_count(board)
  # HOW MANY TURNS HAVE BEEN PLAYED?
  # turn count of 0 indicates no spaces have been filled on the board!!!
  moves = 0
  board.each do |char|
    if char == "X" || char == "O"
      moves += 1
    end
  end
  # RETURNS MOVES FOR THE FINAL VALUE
 moves
 # MORE VALID AND ABSTRACT METHOD BELOW, NOT ASKED FOR IN LESSON ~ Courtesy of Dakota
 # board.count do |char|
 #   char == "X" || char == "O"
 # end
end

# Current Player to Move
def current_player(board)
  # BASED ON THE #turn_count METHOD, ASSUMING "X" GOES FIRST, DETERMINE WHOSE TURN IT IS
  # to use binding.pry, type in "learn" in the terminal and it will come up. Type in "board" for example
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

# Won Game?
def won?(board)
  winning_combo = false
  if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    return false
  else
    WIN_COMBINATIONS.each do |wins|
      #wins = first thing in WIN_C
      #wins = 2nd thing in WIN_C
      char1 = "X"
      char2 = "O"
      if board[wins[0]] == char1 && board[wins[1]] == char1 && board[wins[2]] == char1 || board[wins[0]] == char2 && board[wins[1]] ==char2 && board[wins[2]] == char2
        winning_combo = wins
      end
    end
    winning_combo
  end
end

# Board Full?
def full?(board)
  board.none?{|spaces| spaces == " "}
end

# Board Full and No Winner?
def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  end
end

# Game Over?
def over?(board)
  if draw?(board)
    return true
  elsif won?(board)
    return true
  elsif full?(board)
    return true
  else
    return false
  end
end

# Who Won?
def winner(board)
  winning_combo = won?(board)
  if winning_combo
    index = winning_combo[0]
    return board[index]
  else
    return nil
  end
end
