require 'pry'

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

 def input_to_index(user_input)
   user_input.to_i - 1
 end

 def move (board,index,value)
   board[index] = value
 end

 def position_taken?(board,index)
   if board[index] == " " || board[index] == "" || board[index] == nil
     false
   elsif board[index] == "X" || "O"
     true
 end
 end

 def valid_move?(board,index)
   if !position_taken?(board,index) && index.between?(0,8)
       true
   else
       false
   end
 end

 def turn(board)
   puts "Please enter 1-9:"
   input = gets.strip
   num = input_to_index(input)
   if valid_move?(board,num)
     move(board,num,current_player(board))
   else
     turn(board)
   end
 end

 def turn_count(board)
   counter = 0
   board.each do |i|
     if i == "X" || i == "O"
       counter += 1
     end
   end
   return counter
 end

 def current_player(board)
   if turn_count(board) % 2 == 0
     "X"
   else
     "O"
 end
 end

 def position_taken?(board, index)
   !(board[index].nil? || board[index] == " ")
 end

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

 def won?(board)

   WIN_COMBINATIONS.each do |win_combo|
     win_index_1 = win_combo[0]
     win_index_2 = win_combo[1]
     win_index_3 = win_combo[2]

     position_1 = board[win_index_1]
     position_2 = board[win_index_2]
     position_3 = board[win_index_3]

     if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
       return win_combo

     end

   end
return false
end

 def full? (board)
   board.all? {|i| i == "X" || i == "O"}
   end

 def draw? (board)
   if !won?(board) && full?(board)
     true
   end
 end

 def over? (board)
   if won?(board) || draw?(board)
     true
   end
 end

 def winner(board)
    if win_combo = won?(board)
      board[win_combo[1]]
    end
 end

def play(board)
  until over?(board)
    turn(board)
  end

  if winner(board) == "X"
     puts "Congratulations X!"
  elsif winner(board) == "O"
     puts "Congratulations O!"
  elsif draw?(board)
     puts "Cat's Game!"
  end
end
