WIN_COMBINATIONS = [                                # define the win combinations as constants
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def display_board(board)                            # displays the board
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)                      # converts what the user puts in to the index that we can use
user_input.to_i - 1
end

def move(board, index, player)                      # makes the move of X or O onto the board
board[index] = player
end

def position_taken?(board,index)                    # checks if position on the board is open or not
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board,index)                        # checks if the move is valid by calling position taken and checking index
  index.between?(0,8) && position_taken?(board,index) == false
end

def turn(board)
  puts "Please enter a move 1-9"
  input = gets.to_i                                 # ask user for input
  index = input_to_index(input)                     # converts input
  if valid_move?(board,index)                       # runs on the condition if valid move is true
    move(board, index, current_player(board))       # will call the next to methods to run
    display_board(board)
  else
    turn(board)                                      # condition proves false will have to repeat / recursion
end
end

def turn_count(board)                                # in charge of keeping count of how many turns were made
count = 0
board.each do |move|
  if move == "X" || move == "O"
count += 1
end
end
count
end

def current_player(board)                            # in charge of determining who the player is
if turn_count(board) % 2 == 0
  "X"
else
  "O"
end
end

def won?(board)                                         # determines a win
  WIN_COMBINATIONS.any? do |win_combo|                  # checks the constant winning combinations
                                                        # to see if there is a match with whats on the board
    if board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X"
      return win_combo
    elsif board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
      return win_combo
    else
      false
    end
  end
end

def full?(board)                                          # checks if the board has any spots open
!board.any? {|position| position == " "}
end

def draw?(board)                                          # defines what a draw is
  won?(board) == false && full?(board) == true            # draw is only true if no one won and board is full                                                          # if won is false
end

def over?(board)                                          # defines if a game is over using the conditions of draw? and won?
  draw?(board) || won?(board)
end

def winner(board)                                         # determines who the winner is and returns the first of the winning array
if win_combo = won?(board)
  return board[win_combo[0]]
end
end

def play(board)                                           # how to play the game
while over?(board) == false                               # first checks that if the game is not over
  turn(board)                                             # turns can continue to be made
end
if won?(board)                                            # when the game is over check if anyone won
  puts "Congratulations #{winner(board)}!"                # if so congratulate winner
elsif draw?(board)                                        # if won is false, check the next if statement of draw?
  puts "Cat's Game!"
end
end
