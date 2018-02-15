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

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
count = 0
  board.each do |space|
    if space != " "
    count += 1
  end
end
count
# turns = 0
#   board.each do |token|
#     if token == "X" || token == "O"
#       turns += 1
#     end
#   end
#   turns
end

def current_player(board)
  turn_count(board)  % 2 == 0 ? "X" : "O"
end

def won?(board)

   WIN_COMBINATIONS.each do |win_combination|
  # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
  # grab each index from the win_combination that composes a win.
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination # return the win_combination indexes that won.
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
    end
 end
 false
end

def full?(board)
  board.all? do |position|
   position != " "
 end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || full?(board) || won?(board)
end

def winner(board)
  if won?(board)
  return board[won?(board)[0]]
 end
end

def play(board)
#   until the game is over
#   take turns
# end
#
# if the game was won
#   congratulate the winner
# else if the game was a draw
#   tell the players it has been a draw
# end
# input = gets
until over?(board)
  turn(board)
end

if won?(board)
  puts "Congratulations #{winner(board)}!"
elsif draw?(board)
  puts "Cat's Game!"
 end
end
