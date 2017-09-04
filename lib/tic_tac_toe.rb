WIN_COMBINATIONS = [
 [0, 1, 2], # top row
 [3, 4, 5], # middle row
 [6, 7, 8], # bottom row
 [0, 3, 6], # left column
 [1, 4, 7], # middle column
 [2, 5, 8], # bottom column
 [0, 4, 8], # left diagonal
 [2, 4, 6]] # right diagonal
 board = [" "," "," "," "," "," "," "," "," "]
 def display_board(board)
 puts " #{board[0]} | #{board[1]} | #{board[2]} "
 puts "-----------"
 puts " #{board[3]} | #{board[4]} | #{board[5]} "
 puts "-----------"
 puts " #{board[6]} | #{board[7]} | #{board[8]} "
 end
 def input_to_index(input)
   input.to_i - 1
 end
 def move(board, index, player)
   board[index]= player
 end
 def position_taken?(board, index)
   if board[index] == " " || board[index] == "" || board[index] == nil
     taken = false
   elsif board[index] == "X" || board[index] == "O"
       taken = true
   end
 end
 def valid_move?(board, index)
   if index.between?(0, 8) && !position_taken?(board, index)
     taken = true
   end
 end
 def turn(board)
   puts "Please enter 1-9:"
   input = gets.strip
   index = input_to_index(input)
   if !valid_move?(board,index)
     turn(board)
   else
     move(board,index,current_player(board))
   end
   display_board(board)
  end
  def turn_count(board)
    counter = 0
    board.each do |player|
      if player == "X" || player == "O"
        counter += 1
      end
  end
  return counter
  end
  def current_player(board)
    if turn_count(board)%2 ==0
       current_player = "X"
     else
       current_player = "O"
     end
     return current_player
   end
   def won?(board)
     WIN_COMBINATIONS.each do |win|
   if win.all?{|y| board[y] == "X"}
     return win
   elsif win.all?{|y| board[y] == "O"}
     return win
     end
   end
   return false
   end
   def full?(board)
     board.all? do |postion|
       postion == "X" || postion == "O"
     end
   end
   def draw?(board)
     !(won?(board)) && full?(board)
   end
   def over?(board)
     if won?(board) || draw?(board) || full?(board)
       return true
     end
       return false
     end
   def winner(board)
     if (draw?(board) || !full?(board)) && !won?(board)
       return nil
     elsif (board[won?(board)[0]] == "X")
       return "X"
     elsif (board[won?(board)[0]] == "O")
       return "O"
       end
     end
def play(board)
  while !over?(board) && !won?(board) && !draw?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  end
  if draw?(board)
    puts "Cat's Game!"
  end
end
