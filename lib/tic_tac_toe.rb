
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

WIN_COMBINATIONS = [
   [0 , 1, 2],
   [3 , 4, 5],
   [6 , 7, 8],
   [0 , 3, 6],
   [1 , 4, 7],
   [2 , 5, 8],
   [0 , 4, 8],
   [6 , 4, 2]
]

def input_to_index(user_input)
	return user_input.to_i - 1
end

def move(board,user_input,x_or_o)
	return board[user_input]= x_or_o
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  player = current_player(board)
  if valid_move?(board, index)
    move(board, index, player)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
   counter = 0

   board.each do |position|
      (position == " "|| !position || position.empty?)?   nil : counter += 1
   end
   return counter
end


def current_player(board)
   var1 = ""
    (turn_count(board).even?)? var1 ="X" : var1 = "O"
   return var1
end

def won? (board)
   WIN_COMBINATIONS.each do |pos1, pos2, pos3|
      if board[pos1] == board[pos2] && board[pos2] == board[pos3] && position_taken?(board, pos1)
         return [pos1, pos2, pos3]
      end
   end
   return false
end

def full?(board)
   board.each do |i|
      if (i.nil? || i == " ")
         return false
      end
   end
   return true
end

def draw?(board)
   (!won?(board) && full?(board))? true : false
end

def over?(board)
   (draw?(board) || won?(board) || full?(board))? true : false
end

def winner(board)
   winner_token = won?(board)
   (winner_token)? board[winner_token[0]] : nil
end

def play(board)
   until over?(board)
      turn(board)
   end

   (!draw?(board))? (puts "Congratulations #{winner(board)}!") : (puts "Cat's Game!")
end
