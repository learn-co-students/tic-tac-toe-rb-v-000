# current player and turn count

def turn_count(board)
  count = 0
board.each do |token|
    if token == "X" || token == "O"
    count += 1
  end
end
count
end

def current_player(board)
  # turn_count(board) % 2 == 0 ? "O" : "X"
  #  return "X"
   turn_count(board) % 2 == 0 ? "X" : "O"
#    return "O"

end
# game status
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], #Bottom row
  [0,3,6],  # Left horizontal row
  [1,4,7],#center horzontal row
  [2,5,8], #right horizontal row
  [0,4,8], #diagonal down left
  [2,4,6] #diagonal down right
  # ETC, an array for each win combination
]

def won?(board)
  WIN_COMBINATIONS.detect do |strategy|
    board[strategy[0]] == board[strategy[1]] &&
    board[strategy[1]] == board[strategy[2]] &&
    position_taken?(board, strategy[0])
  end
end

def full?(board)
  board.all? { |token| token == "X" || token == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if winner = won?(board)
    board[winner.first]
  end
end

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

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
puts "Please enter 1-9:"
user_input = gets.strip
index = input_to_index(user_input)
#  input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
    else turn(board)
  end
end
# Define your play method below
 def play(board)
   while !over?(board)
     turn(board)
   end
   if  won?(board)
     puts "Congratulations #{winner(board)}!"
   elsif draw?(board)
     puts "Cats Game!"
    end
 end
