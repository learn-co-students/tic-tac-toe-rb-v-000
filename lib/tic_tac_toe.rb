WIN_COMBINATIONS= [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end 

def move(board,position,char="X")
  board[position.to_i-1]= char
end

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def valid_move?(board,position)
  if (position.to_i-1).between?(0,8) && position_taken?(board,position.to_i-1) == false
    true
  elsif position_taken?(board,position.to_i-1) == true
    false 
  else
    false
  end
end


def turn(board)
  puts "Please enter 1-9:"
  position= gets.chomp
  if valid_move?(board, position) == true
    move(board,position,current_player(board))
  else
    turn(board)
  end
puts display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |cell| 
   if cell == "X" || cell == "O"
    counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board).to_i.even?
    "X"
  else
    "O"
  end
end

def won?(board)
WIN_COMBINATIONS.detect do |position| 
  if board[position[0]] == "X" && board[position[1]] == "X" && board[position[2]] == "X"
    position
  elsif board[position[0]] == "O" && board[position[1]] == "O" && board[position[2]] == "O"
    position
  else
    false
  end
end 
end


def full?(board)
  board.all? do |cell|
  cell == "X" || cell == "O"
end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  elsif !won?(board) && !full?(board)
    false
  else won?(board)
    false
  end
end 

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
 if solution = won?(board)
  board[solution.first]
 else
  nil
 end
end 

def play(board)
while over?(board) == false
  turn(board)
end
 if won?(board)
 puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
  puts  "Cats Game!"
  end 
end