WIN_COMBINATIONS = [ [0,1,2] , [3,4,5], [6,7,8] , [0,3,6] ,[1,4,7] , [2,5,8] , [ 0,4,8], [6,4,2]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(n)
   return n.to_i - 1
end

def move(board, index , ch)
  board[index] = ch
end


def valid_move?(board, index)
  if index.between?(0, 8) == true  && position_taken?(board, index) == false
      return true
  else
      return false
  end
end


# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
def position_taken?(board, index)
  if index == nil || index == "" || index == " " || board[index] == nil || board[index] == " " || board[index] == ""
    return false
  else
    return true
  end
end

def turn(board)

  puts "Please enter 1-9:"
  n = gets.strip
  index= input_to_index(n)
  if valid_move?(board,index) == false
     puts "Please enter valid move"
     turn(board)
   end
move(board, index, current_player(board))
display_board(board)
end


def turn_count(board)
  count=0
board.each do | element |
  if element == 'X' || element == 'O'
     count += 1
   end
 end
   return count
 end

def current_player(board)
  n=turn_count(board)
  if n.even?
     return 'X'
  else
       return 'O'
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
  if (position_1 == 'X' && position_2 == 'X' && position_3 == 'X' ) || (position_1 == 'O' && position_2 == 'O' && position_3 == 'O' )
     return win_combination
  end
end
return false
end



def full?(board)
return   !board.any?  { |element| element == " " || element == ""}
end

#if the board has not been won and is full and false if the board is not won and the board is not full, and false if the board is won
def draw?(board)
  if won?(board)
     return false
  elsif full?(board)
       return true
  else
      return false

  end
end

#returns true if the board has been won, is a draw, or is full
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
     return false
  end
end

def winner(board)
  wincom = won?(board)
  if wincom == false
      return nil
  else
      return board[wincom[0]]
end
end



def play(board)
  until over?(board)
  puts "Input on a turn of the game player " + current_player(board)
       turn(board)
   end
 if won?(board)
    if winner(board) == 'X'
        puts "Congratulations X!"
    elsif  winner(board) == 'O'
         puts "Congratulations O!"
    end
elsif  draw?(board)
  puts "Cats Game!"
end
end
