WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left Col
  [1,4,7], # Mid Col
  [2,5,8], # Right Col
  [0,4,8], # NW-SE Diag
  [2,4,6]  # NE-SW Diag
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

def move(board, index, x_or_o)
  board[index] = x_or_o
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0, 8)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  spot = input_to_index(input)
  x_or_o = current_player(board)
  if (valid_move?(board, spot))
    move(board,spot,x_or_o)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turn_count = 0
  board.each do |square|
    if (square == "X" || square == "O")
      turn_count += 1
    end
  end
  turn_count
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? do |square|
  !(square.nil? || square == " ")
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if (won?(board) == nil)
    return nil
  else
    board[won?(board).first]
  end
end

def play(board)
  until over?(board) || draw?(board)
    turn(board)
  end
  if (won?(board) != nil)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
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
