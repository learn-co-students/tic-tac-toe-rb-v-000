WIN_COMBINATIONS = [[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[2,4,6]]

board = [" "," "," "," "," "," "," "," "," "]
def display_board
puts "   |   |   "
puts "-----------"
puts "   |   |   "
puts "-----------"
puts "   |   |   "
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input = (input.to_i-1)
end

def move(board, input_to_index, value)
  board[input_to_index] = value
end

def position_taken?(board, index_number)
  if board[index_number] == " "|| board[index_number] == "" || board[index_number] == nil
    false
  elsif board[index_number] == "X" || board[index_number] == "O"
    true
  end
end

def valid_move?(board, index)
  if index.between?(0,8) && position_taken?(board, index) == false
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    puts "Please enter 1-9:"
    gets.strip
end
end

def turn_count(board)
  counter = 0
 board.each do |char|
  if char == "X" || char == "O"
   counter += 1
 end
 end
 counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)

  WIN_COMBINATIONS.each do |win|

   win_index_1 = win[0]
   win_index_2 = win[1]
   win_index_3 = win[2]

   position_1 = board[win_index_1]
   position_2 = board[win_index_2]
   position_3 = board[win_index_3]

   if position_1 == "X"  && position_2 == "X" && position_3 == "X"
     return win
   elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
     return win
   end
 end
 false
 end

 def full?(board)
   board.all? do |space|
     space == "X" || space == "O"
    end
 end

def draw?(board)
  won?(board) == !
  full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end

def play(board)
 turn(board) until over?(board)
 if won?(board)
  puts "Congratulations #{winner(board)}!"
elsif draw?(board)
  puts "Cats Game!"
elsif over?(board)
end
end

#until the game is over
#  take turns
#end
#if the game was won
#  congratulate the winner
#else if the game was a draw
