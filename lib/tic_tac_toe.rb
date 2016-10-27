WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]

]


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(position)
  position.to_i - 1
end

def move(board, index, letter)
  board[index] = letter
end

def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
  index.between?(0,8)  && !position_taken?(board, index)
end



def turn(board)
  puts "Choose a number between 1- 9. 1 signifies the top left corner and 9 signifies the bottom right corner"
  position = gets.strip
index = input_to_index(position)
  if valid_move?(board, index)
    move(board, index, current_player(board))
      display_board(board)
  else
    turn(board)
  end
end


def turn_count(board)
  counter = 0
 board.each do|element|
   if element== "X" || element == "O"
     counter+=1
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
  WIN_COMBINATIONS.detect do |combo|
  board[combo[0]] == board[combo[1]] &&
  board[combo[1]] == board[combo[2]] &&
  position_taken?(board, combo[0])
 end
end

def full?(board)
  board.all?{|letter| letter == "X" || letter == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end


def play(board)
until over?(board)
index = gets.strip
  turn(board)
end
if won?(board)
  "Congratulations #{winner(board)}!"
elsif draw?(board)
  print "Cats Game!"



 end
end
