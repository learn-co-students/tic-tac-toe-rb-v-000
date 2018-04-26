# #play loops over #turn, repeating until the game is won
def play(board)

  # Play until someone wins or there is a draw
  until over?(board) do
    turn(board)
  end
  # Congratulate the winner


  if won?(board)
    puts "Congratulations #{winner(board)}!"
    #puts "Congratulations, player #{winner(board)}. You won the game."
  else
    puts "Cat's Game!"
  end
=begin
  puts "Would you like to play again? (Y or N)"
  ans = gets.strip
  if ans.downcase == "y" || ans.downcase == "yes"
    play
  else
    puts "Goodbye!"
  end
=end

end

# #turn gets the player's move, checks that the move is valid, then updates the board with the new move and finally displays the board.
# Called by #play
def turn(board)
  c_p = current_player(board)
  puts "Player #{c_p}, please enter a number 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, c_p)
    display_board(board)

  else
    turn(board)
  end
end

# #input_to_index converts the player's choice of position to the corresponding index in the board array.
# Called by #turn
def input_to_index(input)
  input.to_i - 1
end

# #valid_move? checks to see if current player's move choice is both available and a position on the board (has an index between 0-8)
# Called by #turn
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

# #position_taken? checks to see if a position on the board is already occupied by an "X" or "O".
# Called by #valid_move
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# #move update the board array with the current player's valid move choice
# Called by #turn
def move(board, index, current_player)
  board[index] = current_player
end

# #display_board displays an ascii Tic Tac Toe board.
# Called by #turn
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# #current_player checks which turn it is to determine if it's X or O's turn
# Called by #turn
def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

# #turn_count keeps track of the number of turns that have been taken
# Called by #current_player
def turn_count(board)
  counter = 0
  board.each do |index|
    if index == "O" || index == "X"
      counter += 1
    end
   end
   return counter
end

# WIN_COMBINATIONS holds 8 possible winning combinations of 3 board positions
WIN_COMBINATIONS = [
  #Board layout
  # 0 | 1 | 2
  #-----------
  # 3 | 4 | 5
  #-----------
  # 6 | 7 | 8

  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left col
  [1,4,7],  # Middle col
  [2,5,8],  # Right col
  [0,4,8],  # Diagnol 1
  [2,4,6]  # Diagnol 2
]

# #won? checks to see if a winning combination exists
def won?(board)
  a = WIN_COMBINATIONS.find{
    |combo|
    board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
  }
  b = WIN_COMBINATIONS.find{
    |combo|
    board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
  }
  return a || b
end

# #full? checks to see if the board is full, ie no empty spaces remain
def full?(board)
  return !board.any?{|x| x == "" || x == " "}
end

# #draw? checks to see if the board is full, but there is no winning combination
def draw?(board)
  return !won?(board) && full?(board)
end

# #over? checks to see if the game has been won or is a draw. If so, the game is over.
def over?(board)
  return won?(board) || draw?(board)
end

# #winner checks to see who got a winning combination, if one exists
def winner(board)
  a = won?(board)
  if a
    if board[a[0]] == "X"
      "X"
    else
      "O"
    end
  else
    nil
  end
end
