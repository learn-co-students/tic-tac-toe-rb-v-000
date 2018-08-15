





WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]] 

def won?(board)
   WIN_COMBINATIONS.each do |winner_array|
    puts winner_array.inspect
    win_index_1 = winner_array[0]
    win_index_2 = winner_array[1]
    win_index_3 = winner_array[2]
  
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
   
       if position_1 == "X" && position_2 == "X" && position_3 == "X"
         return winner_array
       elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
         return winner_array
       else 
         false
       end
   end
   false
end


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

def move(board,index,player_charcter)

  board[index] = player_charcter
end

def position_taken?(board,index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board,index)
  !position_taken?(board,index) && index.between?(0,8) 
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  
   if valid_move?(board,index)
     move(board,index,current_player(board))
     display_board(board)
   else
     turn(board)
   end
 end
 
def turn_count(board)
  turn = 0
  board.each do |token|
    if token == "X" || token == "O"
       turn += 1
      end
     end
       return turn
end

def current_player(board)
  player_turn = turn_count(board)
  if player_turn % 2 == 0
    "X"
  elsif player_turn % 2 == 1
  "O"
   end 
end

def full?(board)
    board.all? do |token|
    token == "X" || token == "O"
    end
end

def draw?(board)
    full?(board)  &&  !won?(board)
end

def over?(board)
    full?(board)  ||  won?(board)
end

def winner(board)
  if won?(board)
     board[won?(board)[0]]
  else
     nil
  end
end

def play(board)
  until over?(board)
    puts current_player(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board) + "!"}"
  else draw?(board)
  puts "Cat's Game!"


end
end
