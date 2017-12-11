WIN_COMBINATIONS = [
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8],
[0, 4, 8],
[2, 4, 6]
]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(index)
  index = index.to_i - 1
end

def move(board,index,current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    return true
  else
    return false
  end
end

def valid_move?(board,index)
  if (index.between?(0,8)) && !position_taken?(board,index)
    return true
  end
end

def turn(board)
  puts "Please enter 1-9"
  index = gets.strip
  index = input_to_index(index)
  if valid_move?(board,index)
    current_player = current_player(board)
    move(board, index, current_player)
  else
    puts "please enter 1-9"
    index = gets.strip
    index = input_to_index(index)
  end
end

def turn_count(board)
   count = 0
   turnk = 0
   while count <= 9
     if count == 9
       return turnk
       count += 1
     end
     if (board[count] == "X" || board[count] == "O")
       turnk += 1
       count += 1
     else
       count += 1
     end
   end
 end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
   WIN_COMBINATIONS.any? do |win_combination|
     win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]

     position_1 = board[win_index_1]
     position_2 = board[win_index_2]
     position_3 = board[win_index_3]

     if position_1 == "X" && position_2 == "X" && position_3 == "X"
       return win_combination
     elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
       return win_combination
     else
       false
     end
   end
 end


 def full?(board)
   board.none? do |i|
     i == " "
   end
 end

 def draw?(board)
   if (full?(board) && !won?(board))
     return true
   end
 end

 def over?(board)
   if (full?(board) || draw?(board) || won?(board))
     return true
   end
 end

 def winner(board)
 if won?(board)
   winning_index = won?(board)

     return board[winning_index[0]]
   end
 end

 def play(board)
   until over?(board)
     turn(board)
   end
   if won?(board)
     puts "Congratulations #{winner(board)}!"
   elsif draw?(board)
     puts "Cat's Game!"
   end
 end
