board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(array, index, value) 
  array[index] = value
end

def position_taken?(board, value)
  if board[value] == " " || board[value] == "" || board[value] == nil
    false
  else
    true
  end
end

def valid_move?(board, index)
 if index.between?(0, 8) && !position_taken?(board, index) 
   true
 else 
   false
 end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  value = current_player(board)
  if valid_move?(board, index)
    move(board, index, value) 
    display_board(board)
  else 
    turn(board)
  end
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
  if turn_count(board).even?
    "X"
  else 
    "O"
end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[2]] == board[combo[1]] && position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? {|cell| cell=="X" || cell=="O"}
end

def draw?(board)
 full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
 if won?(board)
   index = won?(board)[0]
   board[index]
 end
end

def play(board)
  until over?(board)
    turn(board)
  end
  
  if won?(board) 
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board) 
    puts "Cat's Game!"
  end
end
