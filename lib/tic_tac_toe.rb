#create variable to hold all possible win combinations (all caps for use in all functions)
WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8],
  [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [2,4,6]
]

#declare #display_board, with board location array
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#declare #input_to_index
def input_to_index(user_input)
#transform user input to array notation
  user_input.to_i - 1
end

#declare #move
def move(board, index, player)
#allow player to imprint on board
  board[index] = player
end

#declare #position_taken? boolean
def position_taken?(board, index)
#true if board index is not taken or blank
  !(board[index].nil? || board[index] == " ")
end

#declare #valid_move? boolean
def valid_move?(board, index)
#true if player move is on board and #position_taken? is false
  index.between?(0,8) && !position_taken?(board, index)
end

#declare #turn
def turn(board)
  puts "Please enter 1-9:"
#create variable to store input from user
  input = gets.strip
#create variable for converting user input to array location
  index = input_to_index(input)
#check if #valid_move? is true, then run #move and #display_board
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
#if #valid_move? false, run #turn until true
    turn(board)
  end
end

def turn_count(board)
#declare starting turns count
  turns = 0
#iterator to loop over each position in array
  board.each do |player|
#check each position in array to see if holding X or O
    if player == "X" || player == "O"
#if either player is in position, add to turns count
      turns += 1
    end
#if not in position, loop to next position until all are checked
  end
#returns the total current turns count
  turns
end

#current_player with board argument
def current_player(board)
#takes #turn_count and checks if even, then(?) gives value of X, else(:) it is O
  turn_count(board) % 2 == 0 ? "X" : "O"
end

#defining a check if a player has won
def won?(board)
#Pass each array entry into a block (index), and find return of true
  WIN_COMBINATIONS.detect do |index|
  #search the board at index 0 and compare to board index 1 to see if true
    board[index[0]] == board[index[1]] &&
  #search the board at index 1 and compare to board index 2 to see if true
    board[index[1]] == board[index[2]] &&
  #run position_taken? method to see if true at index 0 of board
    position_taken?(board, index[0])
  end
end

#define full? to check if board is full
def full?(board)
#Return true if all positions on board are filled by X and/or O
  board.all?{|token| token == "X" || token == "O"}
end

#define draw? to see if there is a draw
def draw?(board)
#draw? == true if full? method is true and won? method is false
  full?(board) && !won?(board)
end

#define over? to see if game is over
def over?(board)
#over? == true if won? is true OR draw is true. There is no need to
#check for full, as a full board will happen if there is a draw..
  won?(board) || draw?(board)
end

#define winner
def winner(board)
#Check if #won? is true, and define to variable
  if winning_move = won?(board)
#return board with the first return of the won? method on the current board
    board[winning_move.first]
  end
end

#define play function
def play(board)
#loop on the board while the #over? is false, and run #turn
  while !over?(board)
    turn(board)
  end
#check if #won is true, put winner
  if won?(board)
    puts "Congratulations #{winner(board)}!"
#check if #draw? is true, put Cats game
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
