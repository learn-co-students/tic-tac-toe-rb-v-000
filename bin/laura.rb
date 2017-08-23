#So I found a couple of problems with your code. I will give you hints if you don't see the
#problem just ask and we can go over them in depth.


#I reordered your code to make it easier to follow.
#So unless you have an input_to_index(input) method defined somewhere else
#in your program your make_index(choice) method will
#fail for any strings and be an invalid array index for any numbers not in the
#range of integers 1...9
# I'm going to assume that you have it defined elsewhere

require 'pry'
# So wht is the result if the player puts in 1 (top left square?)
def make_index(choice)
  index = choice - 1
  binding.pry
end

# What happens when the 
def outside_board?(choice)
 choice = choice < 1 || choice > 8
 binding.pry
end


def position_taken?(board,choice)
 index = make_index(choice)
 if (board[index] == "" || board[index] == nil || board[index] == " ")
   return false
 elsif (board[index] == "X" || board[index] == "O" )
   return true
 end
end

def valid_move?(board,choice)
 if (position_taken?(board,choice) || outside_board?(choice))
   return false
 end
end
board = [" "]
choice = 1
valid_move?(board,choice)

