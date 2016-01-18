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
 
 def display_board(board)
   puts " #{board[0]} | #{board[1]} | #{board[2]} "
   puts "-----------"
   puts " #{board[3]} | #{board[4]} | #{board[5]} "
   puts "-----------"
   puts " #{board[6]} | #{board[7]} | #{board[8]} "
 end
 
 def move(board, input, value="X")
   board[input.to_i-1] = value
 end
 
 def position_taken?(board, position)
   if board[position] == " " || board[position] == "" || board[position] == nil
     return false
   else
     return true
   end
 end
 
 def position_taken_for_valid_move?(board, position)
   spot = position.to_i
   if board[spot-1] == " " || board[spot-1] == "" || board[spot-1] == nil
     return true
   else
     return false
   end
 end
 
 def valid_move?(board, position)
   spot = position.to_i
   if (spot-1).between?(0,8) && position_taken_for_valid_move?(board, position)
     true
   elsif (spot-1).between?(0,8) && position_taken_for_valid_move?(board, position) == false
     false
   end
 end
 
 def turn(board)
   if turn_count(board) % 2 == 0
     puts "Player X: please enter 1 - 9:"
     input = gets.strip
     if valid_move?(board, input)
       move(board, input, "X")
     else
       turn(board)
     end
   else
     if turn_count(board) % 2 == 1
       puts "Player O: please enter 1 - 9:"
       input = gets.strip
       if valid_move?(board, input)
         move(board, input, "O")
       else
         turn(board)
       end
     end
   end
   display_board(board)
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
   if turn_count(board) % 2 == 0
     return "X"
   else
     return "O"
   end
 end
 
 def won?(board)
   i = 0
   while i < 3
     if board[WIN_COMBINATIONS[i][0]] == "X" && board[WIN_COMBINATIONS[i][1]] == "X" && board[WIN_COMBINATIONS[i][2]] == "X"
       return WIN_COMBINATIONS[i]
     elsif board[WIN_COMBINATIONS[i][0]] == "O" && board[WIN_COMBINATIONS[i][1]] == "O" && board[WIN_COMBINATIONS[i][2]] == "O"
       return WIN_COMBINATIONS[i]
     end
     i += 1
   end
 
   i = 3
   while i < 6
     if board[WIN_COMBINATIONS[i][0]] == "X" && board[WIN_COMBINATIONS[i][1]] == "X" && board[WIN_COMBINATIONS[i][2]] == "X"
       return WIN_COMBINATIONS[i]
     elsif board[WIN_COMBINATIONS[i][0]] == "O" && board[WIN_COMBINATIONS[i][1]] == "O" && board[WIN_COMBINATIONS[i][2]] == "O"
       return WIN_COMBINATIONS[i]
     end
     i += 1
   end
 
   if board[WIN_COMBINATIONS[6][0]] == "X" && board[WIN_COMBINATIONS[6][1]] == "X" && board[WIN_COMBINATIONS[6][2]] == "X"
     return WIN_COMBINATIONS[6]
   elsif board[WIN_COMBINATIONS[6][0]] == "O" && board[WIN_COMBINATIONS[6][1]] == "O" && board[WIN_COMBINATIONS[6][2]] == "O"
     return WIN_COMBINATIONS[6]
     
   end
 
   if board[WIN_COMBINATIONS[7][0]] == "X" && board[WIN_COMBINATIONS[7][1]] == "X" && board[WIN_COMBINATIONS[7][2]] == "X"
     return WIN_COMBINATIONS[7]
   elsif board[WIN_COMBINATIONS[7][0]] == "O" && board[WIN_COMBINATIONS[7][1]] == "O" && board[WIN_COMBINATIONS[7][2]] == "O"
     return WIN_COMBINATIONS[7]
   end
 
   return false
 end
 
 def full?(board)
   board.all? do |spot|
     spot == "X" || spot == "O"
   end
 end
 
 def draw?(board)
   if won?(board) == false && full?(board) == true
     return true
   end
 end
 
 def over?(board)
   if won?(board) != false || draw?(board) == true || full?(board) == true
     return true
   end
 end
 
 def winner(board)
   if won?(board)
     if board[won?(board)[0]] == "X"
       return "X"
     elsif board[won?(board)[0]] == "O"
       return "O"
     end
   else
     return nil
   end
 end
 
 def play(board)
   while !over?(board) do
     turn(board)
   end
 
   if won?(board)
     if winner(board) == "X"
       puts "Congratulations X!"
     elsif winner(board) == "O"
       puts "Congratulations O!"
     end
   end
 
   if draw?(board)
     puts "Cats Game!"
   end
 end 
