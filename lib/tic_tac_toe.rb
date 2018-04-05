WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [2,4,6]
]
board = [" "," "," "," "," "," "," "," "," "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
def input_to_index(input)
  index = input.to_i - 1
end
def move(array, index, value)
  array[index] = value
end
def position_taken?(board, index_number)
if board[index_number] == " "
return false
elsif board[index_number] == ""
return false
elsif board[index_number] == nil
return false
elsif board[index_number] == "X" || "O"
return true
end
end
def valid_move?(board, index_number)
if position_taken?(board, index_number)
  return false
elsif index_number.between?(0, 8)
  return true
else
  return false
end
end
def turn_count(board)
  counter = 0
  board.each do |space|
    if space == 'X' || space == 'O'
    counter += 1
  end
end
return counter
end
def current_player(board)
  count = turn_count(board)
if count % 2 == 0
  return 'X'
else
  return 'O'
end
return counter += 1
end
def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    position_taken?(board, combo[1]) && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
  end
end
def full?(board)
board.all? do |full_board|
full_board == "X" || full_board == "O"
end
end
def draw?(board)
if !!full?(board) && !won?(board)
 true
else
  false
end
end
def over?(board)
if won?(board) || draw?(board) || full?(board)
  true
else
  false
end
end
def winner(board)
if !!won?(board)
board[won?(board)[0]]
end
end
def turn(board)
  puts "Please enter 1-9:"
  input = gets
index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
turn(board)
end
end
def play(board)
  until over?(board) == true
    turn(board)
  end
  if winner(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
end
end
