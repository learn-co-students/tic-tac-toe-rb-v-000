#defining the winning combinations
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

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
  board[index] != " " && board[index] != "" && board[index] != nil
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.chomp.to_i
  position = input_to_index(user_input)
  if valid_move?(board, position)
    move(board, position, current_player(board))
    display_board(board)
  elsif position_taken?(board, user_input)
    puts "That spot has already been taken."
    turn(board)
  else
    puts "That isn't a real move, yo."
    turn(board)
  end
end

def turn_count(board)
  num_of_turns = 0
  board.each do |spot|
    if spot == "X" || spot == "O"
      num_of_turns += 1
    end
  end
  return num_of_turns
end

def current_player(board)
  num_of_turns = turn_count(board)
  num_of_turns.even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |combination|
    board[combination[0]] == board[combination[1]] &&
    board[combination[1]] == board[combination[2]] &&
    position_taken?(board, combination[0])
  end
end

def full?(board)
  board.all? {|token| token == "X" || token == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  else
    puts "Something messed up..."
  end
end
