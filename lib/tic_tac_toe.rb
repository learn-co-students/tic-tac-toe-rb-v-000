WIN_COMBINATIONS = [
   [0,1,2], # Top row
   [3,4,5],  # Middle row
   [6,7,8],  # Bottom row
   [0,3,6],  #First column
   [1,4,7],  #Second column
   [2,5,8],  #Third column
   [0,4,8],  #diagonal1
   [2,4,6]  #diagonal2
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

 def move(board, index, value)
 board[index] = value
 end

 def position_taken? (board, index)
     if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
       return false
     else
       return true
     end
 end

 def valid_move?(board,index)
   if (index.between?(0, 8)) && (position_taken?(board,index) == false)
       return true
     else
       return false
     end
 end

 def turn(board)
   puts "Please enter 1-9:"
     user_input = gets.strip
     value = current_player(board)
   if valid_move?(board,index = input_to_index(user_input))
     move(board,index,value)
   else
     turn(board)
   end
   display_board(board)
 end

 def turn_count(board)
 turn = 0
 board.each do |cell|
   if (cell.include? "X") || (cell.include? "O")
 turn += 1
   end
 end
 return turn
 end

 def current_player(board)
   if turn_count(board) % 2 == 0
     return "X"
   else
     return "O"
   end
 end

 def won?(board)
   WIN_COMBINATIONS.detect do |combination|
     board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]] && position_taken?(board,combination[0])
   end
 end

 def full?(board)
   WIN_COMBINATIONS.all? { |combination| position_taken?(board,combination[0]) == true }
 end

 def draw?(board)
   incomplete_board = !full?(board)
   if won?(board) && full?(board) || incomplete_board
     return false
   else
     return true
   end
 end

 def over?(board)
   if won?(board) || full?(board) || draw?(board)
    return true
   else
    return false
   end
 end

 def winner(board)
   if won?(board)
     win_index = won?(board)[0]
     return board[win_index]
   end
 end

 def play(board)
   until over?(board) == true
     turn(board)
   end
   if draw?(board) == true
        puts "Cats Game!"
   else won?(board)
      puts "Congratulations #{winner(board)}!"
    end
 end
