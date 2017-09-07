# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # bottom row
  [0,4,8], # diagonal
  [2,4,6], # diagonal
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def input_to_index(input)
 (input.to_i) - 1
end

def move(board, index, player_character)
  board[index] = player_character
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  player_character = current_player(board)
  if valid_move?(board, index)
    move(board, index, player_character)
    display_board(board)
  else
    turn(board)
end
end

def turn_count(board)
counter = 0
board.each do |turn|
  if turn != " "
counter += 1
  end
end
counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  elsif turn_count(board) % 2 == 1
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
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
  board.all? {|position| position == "X" || position == "O"}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
end
end

def over?(board)
  if draw?(board) || won?(board) ||  full?(board)
    return true
end
end

def winner(board)
  WIN_COMBINATIONS.each do |win_combination|

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X"
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
    end
  end
  nil
end

def play(board)
  until over?(board)
    turn(board)
    end
  if won?(board)
    winning_combo = won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
end
end
