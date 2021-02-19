# Helper Methods
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

def move(board, index, current_player)
  board[index] = current_player
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
  board.count {|count| count == "X" || count == "O"}
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

  # Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], #Top Row
  [3,4,5], #Middle Row
  [6,7,8], #Bottom Row
  [0,4,8], #Diagonal Right
  [2,4,6], #Diagonal Left
  [0,3,6], #Left Column
  [1,4,7], #Middle Column
  [2,5,8]  #Right Column
]

def won?(board)
WIN_COMBINATIONS.detect do |combo|
    position_1 = board[combo[0]] # load the value of the board at win_index_1
    position_2 = board[combo[1]] # load the value of the board at win_index_2
    position_3 = board[combo[2]] # load the value of the board at win_index_3
    position_1 == position_2 && position_2 == position_3 && position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? {|element| element == "X" || element == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  board[won?(board)[0]] if won?(board)
end

def play(board)
  turn(board) until over?(board)
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
