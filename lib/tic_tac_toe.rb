# This is a tic-tac-toe game in CLI

# winning combinations
WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4 ,5], # middle row
  [6, 7, 8], # bottom row
  [0, 3, 6], # left column
  [1, 4, 7], # middle column
  [2, 5, 8], # right column
  [0, 4, 8], # main diagonal
  [2, 4, 6] # off diagonal
]

# display_board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# input_to_index
def input_to_index(input)
  index = input.to_i - 1
end

# move
def move(array, index, value)
  array[index] = value
end

# position_taken?
def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    return true
  end
  return false
end

# valid_move?
def valid_move?(board, index)
  if index.between?(0,8) && position_taken?(board, index) == false
    return(true)
  else
    return(false)
  end
end

# turn
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)

  until valid_move?(board, index) == true
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
  end

  move(board, index, value = current_player(board))
  display_board(board)
end

# turn_count
def turn_count(board)
  counter = 0
  board.each do |element|
      element == " " ? counter : counter += 1
  end
  return counter
end

# current_player
def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

# won?
def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X"
      return combination
    elsif board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
      return combination
    end
  end
  return false
end

# full?
def full?(board)
  board.none?{|i| i == " "}
end

# draw?
def draw?(board)
  full?(board) == true && !won?(board)
end

# over?
def over?(board)
  draw?(board) || won?(board)
end

# winner
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

# play
def play(board)
  while over?(board) == false
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
