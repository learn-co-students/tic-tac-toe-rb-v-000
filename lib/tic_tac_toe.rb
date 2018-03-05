# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

#starter board
board = [" "," "," "," "," "," "," "," "," "]

#WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # mid row
  [6, 7, 8], # bottom row
  [0, 3, 6], # left col
  [1, 4, 7], # mid col
  [2, 5, 8], # right col
  [0, 4, 8], # l-to-r diagonal
  [2, 4, 6] # r-to-l diagonal
]

#display ASCII board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#input to index
def input_to_index(user_input)
  "#{user_input}".to_i - 1
end

# move
def move(array, index, value)
  array[index] = value
end

# position taken?
def position_taken?(array, index_number)
  if array[index_number] == " " || array[index_number] == "" || array[index_number] == nil
    false
  else
    true
  end
end

# valid move?
def valid_move?(array, index_number)
  if index_number.between?(0, 8)
    if position_taken?(array, index_number)
      false
    else
      true
    end
  end
end

#TURN
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

#TURN_COUNT
#def turn_count(board)
#  if over?(board) == false
#    turns = board.count("X") + board.count("O")
#  end
#end

#TURN_COUNT
def turn_count(board)
    turns = board.count("X") + board.count("O")
end

#CURRENT_PLAYER
def current_player(board)
    "X"
    if turn_count(board).odd?
      "O"
    else
      "X"
    end
end

# did someone win?
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    if board[win_combination[0]] == board[win_combination[1]] && board[win_combination[0]] == board[win_combination[2]]
      if position_taken?(board, win_combination[0]) == true
        return win_combination
      end
    end
  end
end

# is the board full?
def full?(board)
  board.all? do |full_board|
    full_board == "X" || full_board == "O"
  end
end

# was there a draw?
def draw?(board)
  not won?(board) and full?(board)
end

# is the game over?
def over?(board)
  won?(board) or draw?(board)
end

# who won?
def winner(board)
  if set = won?(board)
    board[set[0]]
  end
end

#PLAY
def play(board)
  while over?(board) == false
    input = turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
