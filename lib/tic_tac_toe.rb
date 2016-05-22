# WIN_COMBINATIONS constant defines all possible location combinations that win a game
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #left diagonal
  [2,4,6] #right diagonal
]

# display_board accepts board as an argument, returns a graphical representation of the active board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# input_to_index accepts a player's string input and converts it to an integer
def input_to_index(user_input)
  index=user_input.to_i - 1
end

# move accepts arguments of board, index of the position in the board array that the player wants to play, and player token (X or O)
def move(board,index,token)
  board[index]=token
end

# position taken? accepts board and player's input for location, checks that player's desired location is empty/available to be played.  If the position is free, method returns false
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# valid_move? accepts board and index, returns true if move is on the board and not already occupied
def valid_move?(board,index)
    index.between?(0, 8) && !(position_taken?(board,index))
end

# turn defines the logic of a single turn of tic-tac-toe-rb
def turn(board)
  #asks for user input, converts input to integer
  puts "Enter the position you like to play (1-9): "
  user_input = gets.strip
  index=input_to_index(user_input)

  #if move is valid, accepts move as index and displays new board
  if valid_move?(board, index)
    token=current_player(board)
    move(board,index,token)
    display_board(board)
  else
    puts "Enter the position you would like to play (1-9): "
    turn(board)
  end
end

# turn_count accepts the board as an array and keeps track of the number of turns
def turn_count(board)
  board.count{|value| (value=="X" || value=="O")}
  #counter = 0
  #board.each do |value|
  #  if value =="X" || value == "O"
  #    counter+=1
  #  end
  #end
  #counter
end

# current_player keeps track of whether current move is X or O
def current_player(board)
  turn_count(board)%2==0 ? "X" : "O"
end

# won? accepts board as an argument, returns winning combination of tokens, if present
def won?(board)
   WIN_COMBINATIONS.any? do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_taken?(board,win_index_1) && position_1 == position_2 && position_2 == position_3
      #binding.pry
      return win_combo
    end
  end
end

# full? as board as an argument and  monitors board status, returns false if there is an available space to play
def full?(board)
  board.all? {|value| value == "X" || value =="O"}
end

# draw(board) monitors board status, returns true if board is full and the game can't be won
def draw?(board)
  !(won?(board)) && full?(board)
end

# over?(board) monitors game status, based on whether game is won or a draw
def over?(board)
  won?(board) || draw?(board)
end

# winner(board) returns the winning token, X or O, of a winning game
def winner(board)
  if winning_array = won?(board)
    board[winning_array[0]]
  end
end

# play is responsible for the game loop: it asks players to play until the game is won or is a draw.  If the game has a winner, #play congratulates the winner
def play(board)
  #move_count=0
  #while move_count<10 && !(over?(board))
  until over?(board)
    #move_count+=1
    turn(board)
  end
  if winner(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end
