WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Last row
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]


def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
#
def input_to_index(user_input)
    user_input.to_i - 1
end

#
def move(board, index, player)
  board[index] = player
end
#
# code your #position_taken? method here!
def position_taken?(board, index)
  #!(board[index] == " " || board[index] == "" || board[index] == nil)
  board[index] != " "
end

def valid_move?(board,index)
  if index.between?(0,8)
     if !position_taken?(board, index)
       true
     end
   end
end

def won?(board)
  WIN_COMBINATIONS.detect do |location|
      (board[location[0]] == "X" && board[location[1]] == "X" && board[location[2]] == "X") ||
      (board[location[0]] == "O" && board[location[1]] == "O" && board[location[2]] == "O")
  end
end

def full?(board)
   board.all? {|space| space == "X" || space == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board)  || won?(board)  || full?(board)
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

# defines a turn
def turn(board)
  puts "Please enter 1-9:"
  input_1 = gets.strip
  index = input_to_index(input_1)
  player = current_player(board)
  if valid_move?(board, index)
    move(board, index, player)
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |token|
    if token == "X" || token =="O"
    counter += 1
    end
  end
  counter
end

def winner(board)
  if win_location = won?(board)
    board[win_location.first]
  end
end
