# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# display_board displays the Tic Tac Toe board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# input_to_index converts user input to array index value
def input_to_index(input)
  input.to_i - 1
end

# #move method
def move(board, index, token)
  board[index] = token
end


# #valid_move? method determins if the user input is:
#   1) a valid position on the board
#   2) not taken

def valid_move?(board, index)
  if index.between?(0,8)
    !position_taken?(board, index)
  else
    false
  end
end

# #current_player - determine the current player (X or O)
def current_player(board)
  player = ""
  if turn_count(board) % 2 == 0
    player= "X"
  else
    player = "O"
  end
  player
end

# #turn_count method - determine number of turns
def turn_count(board)
  count = 0
  board.each do |element|
    if !(element == " " || element == "" || element.nil?)
      count += 1
    end
  end
  count
end

def turn(board)
  puts "Please enter 1-9:"
  index = gets.to_s
  index = input_to_index(index)

  player = current_player(board)

  if valid_move?(board,index)
    move(board,index,player)

    display_board(board)
  else
    turn(board)
  end
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

# #won? method determines if the game has been won by a player
# returns array of win_combination if true or nil if false
def won?(board)
WIN_COMBINATIONS.detect do |win_combination|
    #Load each win index into a variable
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    #Load the token (if any) at index position into a variable
    position_1 = board[win_index_1].upcase
    position_2 = board[win_index_2].upcase
    position_3 = board[win_index_3].upcase

    # Determine whether positions contain winning X (or O) combination
    (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
  end
end

# #full? method determines if there are any open positions left on the board
def full?(board)
  board.none? do |position|
    position == " " || position == "" || position.nil?
  end
end

# #draw? determines if there is a draw
# a draw occurs when the board is full and there are no winners
def draw?(board)
  if full?(board) && !(won?(board))
    true
  else
    false
  end
end

# #over? method determines if any of the following has occured:
#   1. A player has won
#   2. The game is a draw
def over?(board)
  if won?(board) || draw?(board)
    true
  else
    false
  end
end

# #winner method determines which player won (X or O)
def winner(board)
  if won?(board)
    winning_index = won?(board)[0]
    winning_token = board[winning_index]
  else
    nil
  end
end

def play(board)
  until over?(board)
    turn(board)
  end

winner = winner(board)
  if won?(board)
    puts "Congratulations #{winner}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end

end
