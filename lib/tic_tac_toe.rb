WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # left column
  [1,4,7],  # middle column
  [2,5,8],  # Right column
  [0,4,8],  # Diagonal 1
  [2,4,6]  # Diagonal 2
  # ETC, an array for each win combination
]

def display_board(board)

puts " #{board[0]} ""|"" #{board[1]} ""|"" #{board[2]} "
puts "-----------"
puts " #{board[3]} ""|"" #{board[4]} ""|"" #{board[5]} "
puts "-----------"
puts " #{board[6]} ""|"" #{board[7]} ""|"" #{board[8]} "

end

def input_to_index(user_input)
  converted_input = user_input.strip.to_i - 1
end

def position_taken?(board, index)
 if board[index] == "X" || board[index] == "O"
   true
 else (board[index] != " ") || (board[index] != "") || (board[index] != nil)
   false
 end
end


def valid_move?(board, index)
  if index.to_i.between?(0, 9)
    true
  !position_taken?(board, index)
  end
end
#
# def move(display_board, converted_input, value)
#   display_board[converted_input] = "#{value}"
# end
def move(board, index, player)
  board[index] = player
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    token = current_player(board)
    move(board, index, token)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
9 - board.count(" ")
end

def current_player(board)
count = turn_count(board)
  if count % 2 == 0
   "X"
  else
   "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |winning_arrays|
  # binding.pry
  board[winning_arrays[0]] == board[winning_arrays[1]] && board[winning_arrays[1]] == board[winning_arrays[2]] && position_taken?(board, winning_arrays[0]) #because the values at each position - they're all the same
  end
end

def full?(board)
board.all? do |token|
  if token == "X" || token == "O"
    true
  else
    false
    end
  end
end

def draw?(board)
full?(board) && !won?(board)
end

def over?(board)
full?(board) || won?(board) || draw?(board)
end

def winner(board)
winning_player = ""
indexes = won?(board)
  if won?(board) != nil
   winning_player = board[indexes[0]]
   winning_player
end
end

def play(board)
  until over?(board)
   turn(board)
  end
  if won?(board)
    binding.pry
  puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
  puts "Cat's Game!"
  end
end
