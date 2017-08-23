require 'pry'
# So what is the result if the player choice is 3? (top right square)
# or what is the result if the player choice is 9? (bottom right square)
def make_index(choice)
  choice.to_i
  index = choice - 1
  #binding.pry
end


def outside_board?(board,choice)
 choice = choice < 1 || choice > 8
 #binding.pry
end


def position_taken?(board,choice)
  index = make_index(choice)
  if (board[index] == "" || board[index] == nil || board[index] == " ")
    valid = false
    binding.pry
    return false
  elsif (board[index] == "X" || board[index] == "O")
    valid = true
    binding.pry
    return true
  end
  binding.pry
end
# choice and index are two different positions,i.e if the player is wanting to
# move into square 9 which is board index 8 the method below will return false.
#even though the board is open at that position
#if the player wants to move into the third square board index 2, the method
# will return true when it should return false
def valid_move?(board,choice)
  if (position_taken?(board,choice) || outside_board?(board,choice))
    return false
  end
end

board = ["x"," ","x"," "," "," "," ","o"," "]
choice = 9
valid_move?(board,choice)
