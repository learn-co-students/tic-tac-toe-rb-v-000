# board = ["O", " ", " ", " ", "X", " ", " ", " ", "X"]
#boardwonX = [" ", "O", "O", "X", "X", "X", "X", " ", "O"]
#boardwonO = ["O", "X", "O", " ", "O", "X", "O", " ", "X"]
#boarddraw = ["X", "O", "X", "X", "O", "O", "O", "X", "X" ]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left column
  [1,4,7],  # middle column
  [2,5,8],  # right column
  [0,4,8],  # left diagnonal
  [2,4,6]   # right diagonal
]
def input_to_index(input) # convert user input 1-9 to integer 0-8
  input.to_i - 1
end

# inserts player's move, a board array index number,
# to X or O token string character
def player_move(board, index, token)
   board[index] = token
end

# checks if player's move position in board array is already occupied
def position_taken? (board, index)
  index = index.to_i
  board[index] != " " && board[index] != nil
end

# move is valid if: player enters index within 9-cell board array and
# that cell not already occupied
def valid_move?(board, index)
   if index.between?(0,8) && !position_taken?(board,index)
     true
   end
end

def turn_count(board)
  count = 0
  board.each do |move|
    if move == "X" || move == "O"
    count += 1
    end
  end
  count
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
  # puts "Player #{current_player}'s turn"
  # return current_player
end

#def current_player(board)
#  if turn_count(board) % 2 == 0
#    current_player = "X"
#    else current_player = "O"
#    end
#   puts "Player #{current_player}'s turn"
#   return current_player
#end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
    if valid_move?(board,index)
        player_move(board,index,current_player(board))
        display_board(board)
    else
        turn(board)
    end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board,combo[0])
  end
end

def full?(board)
  board.all? do |cell|
    cell == "X" || cell == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) ? true : false
end

def winner(board)
  if won?(board)
    token = won?(board)[0]
    winner = board[token]
    # puts "Congratulations! The winner is player #{winner}"
    winner
  elsif won?(board) == nil
    # puts "Please continue playing"
     nil
  end
end

=begin
until the game is over
  take turns
end
if the game was won
  congratulate the winner
else if the game was a draw
  tell the players it has been a draw
end
=end


def play(board)
  while !over?(board)
    turn(board)
  end

  if draw?(board)
      puts "Cat's Game!"
  elsif won?(board)
      puts "Congratulations #{winner(board)}!"
  end
end
