
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # middle row
  [6,7,8],  # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8],
  [6,4,2],
   ]


   board = [" ", " ", " ", " ", "X", " ", " ", " ", " "]

   def display_board(board)
     puts " #{board[0]} | #{board[1]} | #{board[2]} "
     puts "-----------"
     puts " #{board[3]} | #{board[4]} | #{board[5]} "
     puts "-----------"
     puts " #{board[6]} | #{board[7]} | #{board[8]} "
   end

 def input_to_index(user_input)
     index = user_input.to_i-1
 end

 def move(board, index, a_value)
     board[index] = a_value
 end

 def position_taken?(board,index)
  if board[index] == " "
    false
  elsif board[index] == ""
    false
  elsif board[index] == nil
    false
  elsif board[index] == "X" || "O"
    true
  else index = 4
    true
  end
end

def valid_move?(board, index)
  if index.between?(0,3) == true
    true
  elsif index.between?(5,8) == true
    true
  elsif index.between?(0,8) == false
    false || nil
  elsif position_taken?(board,index) == false
    true
  else position_taken?(board,index) == true
    false || nil
  end
end

def turn(board)
     puts "Please enter 1-9:"
     user_input = gets.strip
     index = input_to_index(user_input)
  if valid_move?(board, index) == true
     move(board, index, a_value = "X")
     display_board(board)
  else
    until valid_move?(board, index) == true
      puts "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
    end
  end
end

def turn_count(board)
   counter = 0
  board.each do |turn|
   if turn == "X" || turn == "O"
   counter += 1
  end
end
  return counter
end


def current_player(board)
  counter = turn_count(board)
   if counter %2 == 0
     return "X"
   else counter%2 == 1
     return "O"
   end
 end

 def won?(board)
   WIN_COMBINATIONS.each {|win_combo|
     index_0 = win_combo[0]
     index_1 = win_combo[1]
     index_2 = win_combo[2]

     position_1 = board[index_0]
     position_2 = board[index_1]
     position_3 = board[index_2]

     if position_1 == "X" && position_2 == "X" && position_3 == "X"
       return win_combo
     elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
       return win_combo
     end
   }
   return false
 end

 def full?(board)
   board.all? {|index| index == "X" || index == "O"}
 end

 def draw?(board)
   if !won?(board) && full?(board)
     return true
   else
     return false
   end
 end

 def over?(board)
   if won?(board) || full?(board) || draw?(board)
     return true
   else
     return false
   end
 end

 def winner (board)
   index = []
   index = won?(board)
   if index == false
     return nil
   else
     if board[index[0]] == "X"
       return "X"
     else
       return "O"
     end
   end
 end

 def play(board)
  user_input = gets.string
  return "1"
  input = gets
  $stdout.to receive(:puts)
  3. times over?(board)
  return false, false, true
  while over?(board) == true
     turn(board)
  if won?(board) == true && if board[index[0]] == "X"
    puts "Congratulations X!"
  if won?(board) == true && if board[index[0]] == "O"
      puts "Congratulations O!"
  else draw?(board) == true
    puts "No winner, Cat's Game!"
   end
  end
 end
