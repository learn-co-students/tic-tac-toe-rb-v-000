

#HELPER METHODS
#constant that provides a library of possible win combinations
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # left-top to right-bottom diagonal
  [2,4,6], # right-top to left-bottom diagonal
]

#displays the board when called
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#changes user input to proper index
def input_to_index(user_input)
  user_input = user_input.to_i - 1
end

#takes in the input that the player would like to input onto the board
def move(array, index, value)
  array[index] = value
end

#checks to see if the selected position is available for user input
def position_taken?(board, index)
  position_checked = board[index]
  if (position_checked == " ") || (position_checked == "") || (position_checked == nil)
    false
  elsif (position_checked == "X") || (position_checked == "O")
    true
  end
end


#ensures that the players requested move is actually valid:
# present on theh game board and not already filled with a token
def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0,8)
    true
  elsif position_taken?(board, index) && index.between?(0,8) || index < 0
    false
  end
end

#encapsulates the logic to complete multiple turns
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  to_index = input_to_index(input)
  while valid_move?(board, to_index) == false
    puts "Please enter 1-9:"
    input = gets.strip
    to_index = input_to_index(input)
  end
    move(board, to_index, current_player(board))
    display_board(board)
  end

#counts the number of turns taken
def turn_count(board)
    counter = 0
    board.each do |plays|
      if (plays == "X") || (plays == "O")
        counter += 1
      end
    end
    counter
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

#checks to see if a player achieved a winning combination
def won?(board)
  win_combo = []
  # loops through the WIN_COMBINATION constant to grab each
  # winning combination so that they can be stored and checked
  # further down in this method against the board
  WIN_COMBINATIONS.select do |combo|
    combo_index_1 = combo[0]
    combo_index_2 = combo[1]
    combo_index_3 = combo[2]

    check_position_1 = board[combo_index_1]
    check_position_2 = board[combo_index_2]
    check_position_3 = board[combo_index_3]

    if (check_position_1 == "X" && check_position_2 == "X" && check_position_3 == "X") || (check_position_1 == "O" && check_position_2 == "O" && check_position_3 == "O")
      win_combo[0] = combo_index_1
      win_combo[1] = combo_index_2
      win_combo[2] = combo_index_3
      return win_combo
    else
      false
    end
  end
  false
end

#checks if the board has a game in progress or not full
# and checks if the board is full and a draw.
def full?(board)
  #check if there is an in-progress game
  if board.include?("X") && board.include?("O") && board.include?(" ")
    false
    #checks if the board is full and a draw
  elsif (!(board.include?(" "))) && board.include?("X") && board.include?("O")
    true
  end
end

#checks if the board is full without a winner
def draw?(board)
  full?(board) && !won?(board)
end

#checks if the game was won or a draw
def over?(board)
  won?(board) || draw?(board)
end

#checks if he game has a winner
def winner(board)
  if won?(board)
    winning_play = won?(board)
    first_play = winning_play[0]
    if board[first_play] == "X"
      "X"
    elsif board[first_play] == "O"
      "O"
    end
  else
    nil
  end
end
#END OF HELPER METHODS


#starts the game
def play(board)
  while !over?(board) do
    turn(board)
  end
  player_x_o = winner(board)
  if player_x_o
    puts "Congratulations #{player_x_o}!"
  else
    puts "Cat's Game!"
  end
end
