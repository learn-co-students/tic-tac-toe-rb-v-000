
WIN_COMBINATIONS = [
  [0,1,2], # 1st row
  [3,4,5], # 2nd row
  [6,7,8], # 3rd row
  [0,3,6], # 1st column
  [1,4,7], # 2nd column
  [2,5,8], # 3rd column
  [0,4,8], # diagonal down
  [6,4,2]  # diagonal up

]

def display_board(board)
   puts " #{board[0]} | #{board[1]} | #{board[2]} "
   puts "-----------"
   puts " #{board[3]} | #{board[4]} | #{board[5]} "
   puts "-----------"
   puts " #{board[6]} | #{board[7]} | #{board[8]} "
 end

 # code your input_to_index and move method here!
  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(board,index,token)
    board[index] = token
  end

  # code your #valid_move? method here

   def valid_move?(board, index)
   if index.to_i >= 0 && index.to_i <8 && position_taken?(board, index) == false
     return true
   end
   end

   # re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
   def position_taken?(board, index)

   if board[index] == "X" || board[index] == "O"
     true
  elsif board[index] == " " || board[index] == "" || board[index] = "nil"
     false
  end
end


   def turn(board)
     index = 0
     again = false
     while (!again)
        puts "Please enter 1-9:" #ask for input
        input = gets.strip #get input
        index = input_to_index(input) #convert input to index
        again = valid_move?(board, index) #if move is valid_move
      end
      move(board, index, current_player(board)) #make the move for index
        display_board(board) #show the board
   end

def turn_count(board)
  turn_number = 0
  board.each do |value|
    if (value == "X" || value == "O")
      turn_number += 1
    end
  end
  turn_number
end

def current_player(board)
  (turn_count(board).even?) ? "X" : "O"
end

   def won?(board)
     board.all? {|i| i != " " || i != ""}
     winning_streak = WIN_COMBINATIONS.detect do |win_array|
       if win_array.all? {|index| board[index] == "X"} == true
         winning_streak.inspect
       elsif win_array.all? {|index| board[index] == "O"} == true
         winning_streak.inspect
       end
     end
   end

   def full?(board)
     board.each do |index|
       if index != "X" && index != "O"
         return false
       end
     end
     return true
   end

   def draw?(board)
     if !(won?(board)) && full?(board)
       return true
     else
       return false
     end
   end

   def over?(board)
     if won?(board) || draw?(board)
       return true
     else
       return false
     end
   end

   def winner(board)
     if won?(board)
       return board[won?(board)[0]]
     else
       return nil
     end
   end

def play(board)
  while !over?(board)
    turn(board)
  end
  if draw?(board)
    puts "Cats Game!"
  else
    puts "Congratulations #{winner(board)}!"
  end
end
