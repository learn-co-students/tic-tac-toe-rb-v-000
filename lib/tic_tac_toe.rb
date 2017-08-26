
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

 board= [" "," "," "," "," "," "," "," "," "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


puts display_board(board)

def input_to_index(user_input)
  (user_input).to_i - 1
end

character = ["X","0"]

def move (board1,position,character)
  board1[position] = character
end

def position_taken? (board, index)
   if board[index] == "X" || board[index] == "O"
     true
   else board[index] != "   "
     false
   end
end

def valid_move? (board, index)
  if position_taken?(board, index)==false && index.between?(0, 8)
     true
  else
     false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
if valid_move?(board, index)==false
  puts "That is not a valid move."
  turn(board)
else
    move(board, index, current_player(board))
     display_board(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |place|
    if place == "X" || place == "O"
  counter += 1
    end
    end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end


def won?(board)
    WIN_COMBINATIONS.find do |place|
      board[place[0]]=="X" && board[place[1]]=="X" && board[place[2]]== "X" && position_taken?(board, place[0]) ||
      board[place[0]]=="O" && board[place[1]]=="O" && board[place[2]]== "O" && position_taken?(board, place[0])
    end
  end

def full?(board)
  board.all? do |spot|
    spot== "X" || spot=="O"
    end
  end

def draw?(board)
  !won?(board) && full?(board)
end

def over? (board)
  won?(board) || full?(board) || draw?(board)
end

def winner (board)
  won?(board) ?   board[won?(board)[0]]    : nil

  # won?(board) === [1, 2, 3]
  # won?(board)[0] === 1
  # board[won?(board)[0]] === board[1]
  # "X"
end

def play(board)
  while over?(board)==false
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
      puts "Cats Game!"
  end
end
