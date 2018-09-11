# WIN_COMBINATIONS = [
#   [0,1,2],
#   [3,4,5],
#   [6,7,8],
#   [0,3,6],
#   [1,4,7],
#   [2,5,8],
#   [0,4,8],
#   [6,4,2]
# ]

# def display_board(board)
#   puts " #{board[0]} | #{board[1]} | #{board[2]} "
#   puts "-----------"
#   puts " #{board[3]} | #{board[4]} | #{board[5]} "
#   puts "-----------"
#   puts " #{board[6]} | #{board[7]} | #{board[8]} "
# end

# def input_to_index(user_input)
#   user_input.to_i - 1
# end

# def player_move(board, index, character)
#   board[index] = character
# end

# def position_taken?(board, index)
# !(board[index].nil? || board[index] == " ")
# end

# def valid_move?(board, index)
#   if index.between(1, 9)
#     board[index] == " " || nil
#   end
# end

# def turn()
#   puts "Please enter 1-9:"
#   user_input = gets.chomp
#   index = input_to_index(user_input)
#   if valid_move?(index)
#     board[index] == character
#   else
#     turn()
#   end
# end

# def turn_count(board)
#   board.count {|cell| cell == "X" || "O" }
# end

# def current_player(board)
#   turns = turn_count(board)
#   if turns.even?
#     "X"
#   else
#     "O"
#   end
# end

# def won?(board)
#   WIN_COMBINATIONS.detect do |combo|
#     board[combo[0]] == board[combo[1]] &&
#     board[combo[1]] == board[combo[2]] &&
#     position_taken?(board, combo[0])
#   end
# end

# def full?(board)
#   board.all?{|token| token == "X" || token == "O"}
# end

# def draw?(board)
#   full?(board) && !won?(board)
# end

# def over?(board)
#   won?(board) || full?(board)
# end

# def winner(board)
#   if winning_combo = won?(board)
#     board[winning_combo.first]
#   end
# end

# def play(board)
#   until over?(board)
#     turn()
#   end
  
#   if won?(board)
#     puts "Congratulations #{board[won?(board)[0]]}"
#   elsif draw?(board)
#     puts "Cats Game!"
#   end
# end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, position)
  position.between?(0,8) && !position_taken?(board, position)
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  position = input_to_index(user_input)
  if valid_move?(board, position)
    move(board, position, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def position_taken?(board, position)
  board[position]== "X" || board[position] == "O"
  # Creates a stop on RSpec
  # !(board[location].nil? || board[location] == "")
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def turn_count(board)
  board.count{|token| token == "X" || token == "O"}
end

def move(board, position, player)
  board[position] = player
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end