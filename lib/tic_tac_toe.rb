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

def move(board, index, value)
  board[index] = value
end

def input_to_index(input)
  input.to_i - 1
end

def position_taken? (board, index)
  if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
    return true
  else
    return false
end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
if
  valid_move?(board, index)
  move(board, index, current_player(board))
  display_board(board)
else
  turn(board)
end
end

def turn_count(board)
counter = 0

board.each do |turn|
  if turn == "X" || turn == "O"
  puts "#{counter}"
  counter += 1
end
end
counter
end

def current_player(board)
if turn_count(board) % 2 == 0
  "X"
else
  "O"
end
end

def won?(board)
WIN_COMBINATIONS.each do |combinations|
  if board[combinations[0]] == "X" && board[combinations[1]] == "X" && board[combinations[2]] == "X"
    return combinations
  elsif board[combinations[0]] == "O" && board[combinations[1]] == "O" && board[combinations[2]] == "O"
    return combinations
  end
end
false
end

def full?(board)
board.all? do |input|
input == "X" || input == "O"

end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
end
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  # won?(board) is going to return a 3 index'd array like [0,1,2]
  # won?(board) returns false if there is no winner. So validate won before using the index.
  if won?(board)
    board[won?(board)[0]]
  end

  # WIN_COMBINATIONS.each do |combinations|
  #   if board[combinations[0]] == "X" && board[combinations[1]] == "X" && board[combinations[2]] == "X"
  #     return "X"
  #   elsif board[combinations[0]] == "O" && board[combinations[1]] == "O" && board[combinations[2]] == "O"
  #     return "O"
  #   end
  # end
  # nil
end


def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
else
puts "Cats Game!"
end
end
