WIN_COMBINATIONS = [[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[6,4,2]]

def display_board(board)

 puts" #{board[0]} | #{board[1]} | #{board[2]} "
 puts"-----------"
 puts" #{board[3]} | #{board[4]} | #{board[5]} "
 puts"-----------"
 puts" #{board[6]} | #{board[7]} | #{board[8]} "
 end

 def input_to_index(user_input)
   user_input = user_input.to_i
   index = user_input -1
 end

 def move(board,index,value)
   if index <= 9
   board[index] = value
 end
 end

 def position_taken?(board,index)
   board[index] == "X" || board[index]=="O"
 end


 def valid_move?(board,index)
   index.between?(0,10) &&  (board[index] == " " || board[index] == "")
 end


 def turn(board)
   puts "Please enter 1-9:"
   user_input = gets.strip
   index = input_to_index(user_input)
   if valid_move?(board,index)
     value = current_player(board)
     board = move(board,index,value)
     display_board(board)
   else
     turn(board)
   end
 end

 def turn_count(board)
   counter = 0
   board.each do |space|
     if space == "X" || space == "O"
       counter += 1
     end
 end
 turn_count = counter
 end


 def current_player(board)
 turn_count = turn_count(board)
 if turn_count % 2 != 0
     return "O"
 else
     return "X"
 end
 end

 def won?(board)
   WIN_COMBINATIONS.each do |combinations|
     if (board[combinations[0]]== "X" && board[combinations[1]]=="X" && board[combinations[2]]=="X") ||
       (board[combinations[0]] == "O" && board[combinations[1]]== "O" && board[combinations[2]]== "O")
     return combinations
   end
 end
 return false
 end


 def full?(board)
   board.all? do |value|
     value == "X" || value == "O"
   end
 end

 def draw?(board)
   !won?(board) && full?(board)
 end

 def over?(board)
   (board.all? {|value| value == "X" || value == "O" }) ||
     won?(board)
 end


 def winner(board)
   combinations = won?(board)
   if combinations
     board[combinations[0]]
   else
     nil
 end
 end

 def play(board)

   while (over?(board) == false || nil) && (draw?(board)== false||nil) do
     turn(board)
   end

   if won?(board) != false
     puts "Congratulations #{winner(board)}!"
   else
     puts "Cats Game!"
   end
 end
