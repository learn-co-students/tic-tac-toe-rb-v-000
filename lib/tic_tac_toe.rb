#Define WIN_COMBINATIONS and set equal to nested array filled with index values for various win combinations in ttt:
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [2,5,8],
  [0,4,8],
  [2,4,6],
  [1,4,7]
]
#This method prints current board based on (board) argument passed to method:
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
#This method takes user_input, converts it to Integer, and subtracts 1:
def input_to_index(user_input)
  user_input.to_i - 1
end
#This method takes in three arguments: 1) board, 2)index in board array and 3) player's character:
def move(board, index, current_player)
  board[index] = current_player
end
#This method evaluates position selected by user and checks whether or not index is occupied:
def position_taken?(board, index)
  board[index] != " " && board[index] != ""
end
#This method accepts a board and an index to check and returns true if move valid and false or nil if not:
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end
#This method encapsulates logic of a single complete turn:
def turn(board)
  #Asks the user for their move by position 1-9:
  puts "Please enter 1-9:"
  #Receives user input:
  input = gets.strip
  #Converts user input to an index:
  index = input_to_index(input)
  #If move valid, make move and display board:
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  #If move invalid, ask user for new position until valid move received:
  else
    turn(board)
  end
end
#This method takes argument board and returns number of turns played:
def turn_count(board)
  counter = 0
  board.each do |player|
    if player == "X" || player == "O"
      counter = counter + 1
    end
  end
  counter
end
#This method takes argument board and uses #turn_count to determine if its "X" turn or "O":
def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end
#This method accepts board as argument and returns false if no win combination present,
#and returns winning combination indexes as array if there is a win:
def won?(board)
  WIN_COMBINATIONS.each do|win_combination|
  position_1=board[win_combination[0]]
  position_2=board[win_combination[1]]
  position_3=board[win_combination[2]]
  if position_1=="X"&&position_2=="X"&&position_3=="X"||position_1=="O"&&position_2=="O"&&position_3=="O"
    return win_combination
  else
    false
  end
end
return false
end
#This method accepts a board and returns true if every element board contains an "X" or "O":
def full?(board)
  board.all? do|index|
    index == "X"||index=="O"
  end
end
#This accepts a board and returns true if board has not been won and full, false if board has not been won and not full,
# and false if board is won:
def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end
#This method accepts a board and returns true if board has been won, is a draw, or is full:
def over?(board)
  if won?(board) || draw?(board)
    true
  else
    false
  end
end
#This method accepts a board and returns token, "X" or "O", that has won the game given a winning board:
def winner(board)
  WIN_COMBINATIONS.each do|win_combination|
  position_1=board[win_combination[0]]
  position_2=board[win_combination[1]]
  position_3=board[win_combination[2]]
  if position_1=="X"&&position_2=="X"&&position_3=="X"
    return "X"
  else
    if position_1=="O"&&position_2=="O"&&position_3=="O"
      return "O"
    else
      false
    end
  end
end
return nil
end
def play(board)
  turn(board) until over?(board)
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
  puts "Cat's Game!"
  end
end
