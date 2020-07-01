
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
  ]

def play(board)
  turn(board) until over?(board)
  won?(board) ? puts("Congratulations #{winner(board)}!") : puts("Cat's Game!")
end


def display_board(board)
 puts " #{board[0]} | #{board[1]} | #{board[2]} "
 puts "-----------"
 puts " #{board[3]} | #{board[4]} | #{board[5]} "
 puts "-----------"
 puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def won?(board)
  WIN_COMBINATIONS.find do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all?{|position| position == "X" || position == "O"}
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
  user_position = input_to_index(user_input)
  if valid_move?(board, user_position)
    character = current_player(board)
    move(board, user_position, character)
    display_board(board)
  else
    puts "Invalid Move!"
    turn(board)
  end
end

def position_taken?(board, user_position)
  board[user_position] == "X" || board[user_position] == "O"
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
  # if turn_count(board).even?
  #   board = "X"
  # else
  #   board = "0"
  # end
end

def turn_count(board)
  board.count{|position| position == "X" || position == "O"}
  # counter = 0
  # board.each do |position|
  #   counter += 1 if position != " "
  # end
  # return counter
end

def move(board, index, character)
  board[index] = character
end

# The #current_player method should take in an argument of the game board and
# use the #turn_count method to determine if it is "X"'s turn or "O"'s.

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
