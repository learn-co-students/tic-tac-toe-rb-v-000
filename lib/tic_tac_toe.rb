require 'pry'
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
    index = input.to_i - 1
  end

def move(board,index,char)
      board[index] = char
  end

def position_taken? (board, index)
     if board[index]=="X" || board[index]=="O"
       true
     else
       false
     end
   end

def valid_move? (board,index)
   if index >= 0 && index-1 <= 8 && position_taken?(board,index) == false
     true
   else
    false
   end
end

def turn(board)
  #puts "Please enter 1-9:"
  input=gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    move(board,index,current_player(board))
    puts display_board(board)
  else
    turn (board)
 end
end

def turn_count (board)
  counter = 0
  board.each do |turn|
      if turn == "X" || turn == "O"
      counter += 1
      end
    end
  counter
  end

def current_player (board)
  if turn_count(board).even?
   "X"
 else
   "O"
end
end

def won? (board)
  WIN_COMBINATIONS.each do |win_combination|
   if win_combination.all? {|win_index|board[win_index] == "X"}
    return win_combination
  elsif win_combination.all? {|win_index|board[win_index] == "O"}
   return win_combination
    end
  end
  false
end

def full? (board)
  board.all? do |move|
    move == "X" || move == "O"
  end
end

def draw? (board)
  if won?(board) == false && full?(board) == true
    true
  else
    false
  end
end

def over?(board)
  if won?(board) != false || full?(board) == true || draw?(board) == true
    true
  else
    false
  end
end

def winner (board)
  WIN_COMBINATIONS.each do |win_combination|
   if win_combination.all? {|win_index|board[win_index] == "X"}
    return "X"
  elsif win_combination.all? {|win_index|board[win_index] == "O"}
   return "O"
 else
   nil
    end
  end
  nil
end

def play(board)
  while over?(board) == false
    turn(board)
  end
  if won?(board) != false && winner(board) == "X"
    puts "Congratulations X!"
  elsif won?(board) != false && winner(board) == "O"
    puts "Congratulations O!"
  elsif draw?(board) == true
    puts "Cats Game!"
  end
end
