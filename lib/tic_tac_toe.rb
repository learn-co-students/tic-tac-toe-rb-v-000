
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[2,4,6],[0,4,8],[1,4,7],[0,3,6],[2,5,8]]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

def move(board, user_input, value)
  board[user_input] = value
  user_input = user_input.to_i - 1
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


def valid_move?(board, position)
  if position.to_i < 0 || position.to_i > 8
    return false
  elsif position_taken?(board, position)
    false
  else
    true
  end
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.chomp
 index = input_to_index(user_input)
 if valid_move?(board, index)
     move(board, index, current_player(board))
     display_board(board)
 else
     puts "Please enter 1-9:"
     user_input = gets.chomp
    index = input_to_index(user_input)
   end
 end


  def play(board)
 turn =0
 until turn == 9
   puts turn(board)
   turn += 1
 end
 end

 def turn_count(board)
   counter = 0
   board.each do |positions|
     if positions != " "
       counter += 1
     end
   end
   counter
 end

 def current_player(board)
   if turn_count(board) % 2 == 0
       return "X"
   elsif turn_count(board) % 2 == 1
       return "O"
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


 def won?(board)
   WIN_COMBINATIONS.each do |win_combination|
     win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]
   position_1 = board[win_index_1]
   position_2 = board[win_index_2]
   position_3 = board[win_index_3]
   if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination
   end
 end
 nil
 end

 #full?
 def full?(board)
   board.each do |position|
     if position == " "
     return false
   else
      true
   end
 end
 end

 #draw?
 def draw?(board)
   if full?(board) && !won?(board)
     true
   else
     return false
   end
end


 #over?
 def over?(board)
   draw?(board) || full?(board) || won?(board)
 end

 #winner?
 def winner(board)
   win_combination = won?(board)
   if win_combination
     board[win_combination[0]]
   else
     nil
   end
end
