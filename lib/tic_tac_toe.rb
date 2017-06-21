require "pry"


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  #bottom row
  [0,3,6],  #left column
  [1,4,7],  #middle column
  [2,5,8],  #right column
  [0,4,8],  #right diagonal
  [2,4,6]  #left diagonal
]

def won?(board)
  # find will find any element if the condition is met or return false
WIN_COMBINATIONS.any? do |win_combination|
  if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
    return win_combination
  elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
    return win_combination
  end
end
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, token)
  board[index] = token
end


def position_taken?(board, index)
  if
    board[index] == " " || board[index] == "" || board[index] == nil
    return false
  elsif board[index] == "X" || board[index] == "O"
    return true
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && position_taken?(board, index) == false
    return true
  else
    return false
  end
end

# def play(board)
#   turn_number = 0
#   until turn_number == 9
#     turn(board)
#     turn_number += 1
#   end
# end

def play(board)
  until over?(board)
    turn(board)
  end
if won?(board)
  puts "Congratulations #{winner(board)}!"
elsif draw?(board)
  puts "Cats Game!"

end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  position = input_to_index(user_input)

  if valid_move?(board, position) == true
     move(board, position, current_player(board))
   else
     puts "Please enter 1-9:"
     user_input = gets.strip
     position = input_to_index(user_input)
  end
   display_board(board)
 end


 def turn_count(board)
 counter = 0
   board.each do |space|
   if space == "X" || space == "O"
    counter +=1
   end
   end

   return counter
 end

 def current_player(board)
   turn_count(board) % 2 == 0? "X" : "O"
 end


 def full?(board)
   board.all? { |position| position == "X" || position == "O" }
 end

 def draw?(board)
   if !won?(board) && full?(board)
     return true
   end
 end

 def over?(board)
   # conditions automatically return true or false
   if draw?(board) || won?(board)
     true
   end
 end


 def winner(board)
   if won?(board)
     board[won?(board)[0]]
   end
  #  puts "Congratulations #{board[won?(board)[0]]}!"
 end
