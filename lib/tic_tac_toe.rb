WIN_COMBINATIONS = [
  [0, 1, 2], #top row win
  [3, 4, 5], #Middle row win
  [6, 7, 8], #Bottom row win
  [0, 3, 6], #left column win
  [1, 4, 7], #middle column win
  [2, 5, 8], #right column win
  [0, 4, 8], #left diagonal win
  [2, 4, 6] #right diagonal win
]

def display_board(board)
   puts " #{board[0]} | #{board[1]} | #{board[2]} "
   puts "-----------"
   puts " #{board[3]} | #{board[4]} | #{board[5]} "
   puts "-----------"
   puts " #{board[6]} | #{board[7]} | #{board[8]} "
 end

 def input_to_index(input)
   num = input.to_i
   num = num -1
 end

 def move(board, index, character)
   board[index] = character

 end

 def position_taken?(board, index)
     if board[index] == " " || board[index] == ""
       return false
     elsif board[index] == nil
         return false
     else
       return true
     end
 end

 def valid_move?(board, index)
   if index.between?(0, 8) && !position_taken?(board, index)
     return true
   else
     return false
   end
 end

 def turn(board)
   puts "Please enter 1-9:"
   entry = gets
   num = input_to_index(entry)

   if valid_move?(board, num)
     move(board, num, current_player(board))
     display_board(board)
   else
     turn(board)
   end
 end


 def turn_count(board)
     i = 0
     board.each do |token|
       if token == "X" || token == "O"
         i += 1
       end # if
     end # each
     return i
 end # method turn_count

 def current_player(board)
   if turn_count(board).even? == true
     return "X"
   else
     return "O"
   end #if
 end

 def won?(board)
   WIN_COMBINATIONS.each do |win_combination|
       win_index_1 = win_combination[0]
       win_index_2 = win_combination[1]
       win_index_3 = win_combination[2]
       position_1 = board[win_index_1]
       position_2 = board[win_index_2]
       position_3 = board[win_index_3]

       if position_1 == "X" && position_2 == "X" && position_3 == "X"  || position_1 == "O" && position_2 == "O" && position_3 == "O"
           return win_combination
       end #if
       end #each
         return false
 end #won

 def full?(board)
    board.all?{|token| token == "X" || token == "O"}
 end

 def draw?(board)
   
  if  full?(board) && !(won?(board))
      return true
  elsif won?(board)
    return false
  end
 end

 def over?(board)
    won?(board) || draw?(board)
 end

 def winner(board)
   if winning_combo = won?(board)
     board[winning_combo.first]
   end
 end

def play(board)
    until over?(board)
        turn(board)
    end
    if draw?(board)
      puts "Cats Game!"
    else
      winner = winner(board)
      puts "Congratulations #{winner}!"
    end
 end
