# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0,1,2], # Top row
[3,4,5], # Middle row
[6,7,8], # Bottom row
[0,3,6], # Left column
[1,4,7], # Middle column
[2,5,8], # Right column
[0,4,8], # Left diagonal
[2,4,6]  # Right diagonal
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

def move(board, place, current_player)
  board[place] = current_player

end

# Helper Method

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
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
    counter += 1
    end
  end
  return counter
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"

end

def won?(board)
  WIN_COMBINATIONS.find{ |win|
  board[win[0]] == board[win[1]] &&
  board[win[1]] == board[win[2]] &&
  position_taken?(board,win[0])
}
end

def full?(board)
board.all? {|full| full == "X" || full == "O" }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
  return board[won?(board)[0]]
  end
end

# Define your play method below

def play(board)
  until over?(board)
  turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
