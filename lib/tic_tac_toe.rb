WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5],
  [6, 7, 8], [0, 3, 6],
  [1, 4, 7], [2, 5, 8],
  [0, 4, 8], [2, 4, 6]
]

def display_board(board)
  puts " #{board[0]} " "|" " #{board[1]} " "|" " #{board[2]} "
  puts "-----------"
  puts " #{board[3]} " "|" " #{board[4]} " "|" " #{board[5]} "
  puts "-----------"
  puts " #{board[6]} " "|" " #{board[7]} " "|" " #{board[8]} "
end

def input_to_index(i)
  i.to_i - 1
end

def move(board, pos, token)
  board[pos] = token
end

def position_taken?(board, pos)
  return board[pos] == "X" || board[pos] == "O"
end

def valid_move?(board, pos)
  if(position_taken?(board, pos) || (pos < 0 || pos >= board.length))
     false
   else
     true
   end
 end

 def turn(board)
   token = current_player(board)
   puts "Please enter 1-9:"
   input = gets.strip
   index = input_to_index(input)
   if(valid_move?(board, index))
     move(board, index, token)
     display_board(board)
   else
     turn(board)
   end
 end

 def turn_count(board)
   turns = 0
   board.each do |pos|
     if pos == "X" || pos == "O"
       turns += 1
     end
   end
   turns
 end

 def current_player(board)
   turns = turn_count(board)
   turns % 2 == 0 ? "X" : "O"
 end

 def won?(board)
   WIN_COMBINATIONS.each do |win_combination|
     tokens = []
     win_combination.each do |pos|
       tokens << board[pos]
     end
     if (tokens.all?{|t| t == "X"} || tokens.all?{|t| t == "O"})
       return win_combination
     end
   end
   false
 end

 def full?(board)
   !(board.include?(" "))
 end

 def draw?(board)
   if(!(won?(board)) && full?(board))
     true
   else
     false
   end
 end

 def over?(board)
   if(draw?(board) || won?(board))
     true
   else
     false
   end
 end

 def winner(board)
   winner = won?(board)
   winner == false ? nil : board[winner[0]]
 end

 def play(board)
   until(over?(board))
     turn(board)
   end

   if(won?(board))
     puts "Congratulations #{winner(board)}!"
   elsif(draw?(board))
     puts "Cats Game!"
   end
 end
