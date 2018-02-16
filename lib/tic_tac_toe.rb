# Write win combinations constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7],  # Middle column
  [2,5,8], # Right column
  [0,4,8], # Left diagonal
  [2,4,6]  # Right diagonal
]
# Define your play method
def play(board)
  # input = gets
  # Start a loop and call #turn
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
# Display board
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
# Convert user input to board index
def input_to_index(input)
  input.to_i - 1
end
# Decide who's move it is, X or O
# def move(board, index, user_marker)
#   board[index.to_i] = user_marker
# end
def move(board, index, player)
  board[index] = player
end
# Is the position on the board taken?
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
# Is that move valid?
board = []
index = 0
def valid_move?(board, index)
  if index.between?(0,8) == true && position_taken?(board,index) == false
    return true
  else
    return false
  end
end
# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
def position_taken?(board, index)
  board[index] != " "
  board[index] != ""
  board[index] == "nil"
  board[index] == "X" || board[index] == "O"
end
# ask for user to take a turn
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

# turn_count
def turn_count(board)
  # count the number of occupied spaces on the board
  count = 0
  board.each do |move|
    if move == "X" || move == "O"
      count += 1
    end
  end
  count
end
# current_player
def current_player(board)
  # if turn_count is an odd number then it's O's turn, even number then it's X's turn
  turn_count(board).even? ? "X" : "O"
end
# won?
def won?(board)
    # for each win_combination in WIN_COMBINATIONS, win_combination is a 3 element array of indexes that compose a win, [0,1,2]
   WIN_COMBINATIONS.detect do |win_combination|
#   # grab each index from the win_combination that composes a win.
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination # return the X win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination # return the O win_combination indexes that won.
    else
      false
    end
  end
end
# full?
def full?(board)
  if board.include?("") # => then not full
    return false
  elsif board.include?(" ") # => then not full
    return false
  else # => then full
    true
  end
end
# draw?
def draw?(board)
  !won?(board) && full?(board)
end
# over?
def over?(board)
  won?(board) || draw?(board)
end
# winner
def winner(board)
  if win_combination = won?(board)
    board[win_combination.first]
  end
end
