WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index = user_input.to_i - 1
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board,index)
    return true
  end
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    # you got hung up here because you didnt put board[index] for each check. you only checked for " ". not "" or nil
    return false
  elsif board[index] == "X" || board[index] == "O"
    return true
  end
end

def move(board, index, current_player)
  board[index] = current_player
end

def turn(board)
  puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
      if valid_move?(board, index)
        move(board, index, current_player(board))
        display_board(board)
      else
        turn(board)
    end
  end

def turn_count(board)
  counter = 0
  board.each do |count|
    if count == "X" || count == "O"
    counter += 1
    end
  end
  return counter
end

  def current_player(board)
    if turn_count(board) % 2 == 0
        return "X"
    else
        return "O"
      end
  end

  def won?(board)
   WIN_COMBINATIONS.detect do |win_combination|
     win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]


     position_1 = board[win_index_1]
     position_2 = board[win_index_2]
     position_3 = board[win_index_3]


     position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
       #win_combination # return the win_combination indexes that won.

   end
 end

 def full?(board)
   if board.include?(" " || nil)
     false
   else
     true
   end
 end

 def draw?(board)
 full?(board) && !won?(board)
 end

 def over?(board)
 won?(board) || full?(board)
 end

 def winner(board)
   if winning = won?(board)
     board[winning.first]
   end
 end

 def play(board)
   while !over?(board)
     turn(board)
   end
   if won?(board)
     puts "Congratulations #{winner(board)}!"
   elsif draw?(board)
     puts "Cats Game!"
   end
 end
