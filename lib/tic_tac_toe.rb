board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(move)
 index = move.to_i - 1
 index
end

def move(board, index, character)
   board[index] = character
   return board
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
   if index.between?(0,8) && !position_taken?(board, index)
     return true
   else
     return false
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
   board.each do |move|
    if move == "X" || move == "O"
    counter += 1
  end
end
return counter
end

def current_player(board)
   if turn_count(board) % 2 == 0
     return "X"
   else
     return "O"
   end
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8],
]

def won?(board)

   WIN_COMBINATIONS.detect do |win_combination|
     win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]
     position_1 = board[win_index_1]
     position_2 = board[win_index_2]
     position_3 = board[win_index_3]
     if position_1 == "X" && position_2 == "X" && position_3 == "X"
       return win_combination
     elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
       return win_combination
     else
       false
     end
   end
end

def full?(board)
   if board.any?{|space| space==" "}
     return false
   else
     return true
  end
end

def draw?(board)
 if full?(board) == true && !won?(board) == true
   return true
 else
   return false
 end
end

def over?(board)
 if full?(board) == true
   return true
 elsif !won?(board) == false
   return true
 elsif draw?(board) == true
   return true
 else
   return false
 end
end

def winner(board)
  if win_combination = won?(board)
    board[win_combination.first]
 end
end

def play(board)
  until over?(board)
    current_player(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end
