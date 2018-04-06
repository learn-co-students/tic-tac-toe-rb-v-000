# This is an array of all of our index winning combinations inside the board
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

# This is our main display board which shows which moves are allowed and not
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# The functions below interacts with our user validates our user input==========
# This function converts our user input number into an index
def input_to_index(input)
  input.to_i - 1
end

# This fucntion declares moves into our display board
def move(board, index, character)
  if valid_move?(board, index)
    board[index] = character
  end
end

# This function verfies if our user input is valid
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

# This function verfies if our position is taken or not
def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end

# This function is invoked each time our user/s make a turn
def turn(board)
  puts "Please enter a valid move from 1-9:"
  input = gets.strip
  ind_move = input_to_index(input)

  if ind_move.between?(0,8)
    move(board, ind_move, current_player(board))
  else
    puts "invalid"
    turn(board)
  end
end

# This function counts how many turns have passed
def turn_count(board)
  turns = 0
  board.each{ |places| if places == "X" || places == "O" then turns += 1 end }
  turns
end

# This function shows us which players turn it is
def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

# The functions below verify if the game has won or not=========================
# This function verifies if the game has been won or not
def won?(board)
  WIN_COMBINATIONS.any? do |combo|
    combo.all? { |idx| board[idx] == "X" } || combo.all? { |idx| board[idx] == "O" }
  end
  # WIN_COMBINATIONS.each do |combo|
  #    if combo.all?{|i| board[i] == "X"}
  #      return true
  #    end
  #    if combo.all?{|i| board[i] == "O"}
  #      return true
  #    end
  # end
  # false
end

# This function verifies if our board is full
def full?(board)
  board.all?{ |moves| moves != " " }
end

# This function verifies if the game is a draw
def draw?(board)
  if full?(board) && !won?(board)
    puts "Cat's Game!"
  elsif won?(board)
    false
  end
end

# This function verifies if the game is over
def over?(board)
   if draw?(board) || full?(board)
     true
   elsif won?(board)
     true
   else
     false
   end
end

# This function declares our game winner
def winner(board)

  if won?(board)
    puts board.count{|move| move == "X"} > board.count{|move| move == "O"} ?
    "Congratulations X!" : "Congratulations O!"
  else
    nil
  end
end


# This function iterates inside of our main bin file
def play(board)
  until over?(board)
    turn(board)
    display_board(board)
  end
  winner(board)
end
