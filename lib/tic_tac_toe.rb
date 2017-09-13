

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
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

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
  if board[index] == "" || board[index] == " " || board[index] == nil
    return false
  elsif  board[index] == "X" || board[index] == "O"
    return true
  end
end

def valid_move?(board, index)
  if position_taken?(board, index)
    return nil
  elsif index >= 0  && index <= 8
    return true
  else
    return nil
  end
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
   counter = 0
   board.each do |index|
     if index == "X" || index == "O"
     counter += 1
     end
   end
   return counter
 end




 def current_player(board)

   if (turn_count(board) % 2 == 0)
     return "X"
   else
     return "O"
   end
 end

 def won?(board)
   WIN_COMBINATIONS.detect do |path|
     board[path[0]] == board[path[1]] &&
     board[path[1]] == board[path[2]] &&
     position_taken?(board, path[0])
   end
 end


 def full?(board)
  board.all?{|mark| mark == "X" || mark == "O"}
 end

 def draw?(board)
   if won?(board)
     false
   elsif full?(board)
     true
   end
 end

 def over?(board)
   if draw?(board)
     true
   elsif won?(board)
     true
   else
     false
   end
 end

 def winner(board)
   if winning_combo = won?(board)
     board[winning_combo.first]
   end
 end

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
