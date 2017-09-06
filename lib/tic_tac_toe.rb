# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]
# def display_board

def display_board(turn)
  puts" #{turn[0]} | #{turn[1]} | #{turn[2]} "
  puts "-----------"
  puts" #{turn[3]} | #{turn[4]} | #{turn[5]} "
  puts "-----------"
  puts" #{turn[6]} | #{turn[7]} | #{turn[8]} "
end
def input_to_index(str)
  if str =~ /\d/         # Calling String's =~ method.
    index = Integer(str) - 1
  else
    index = - 1
  end
 return index
end


#  and move method here!
def move(board,index,char)

  board[index]=char

 return board
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
#  testing the move
def valid_move?(board,index)
  if (!position_taken?(board,index) && index.between?(0,8))
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets
  # input=gets.strip
  index=input_to_index(input)
  if valid_move?(board,index)
    move(board,index,current_player(board))
  else
    turn(board)
  end
  # while (!valid_move?(board,index))
  #   puts "Please enter 1-9:"
  #   input=gets.strip
  #   index=input_to_index(input)
  # end
  # move(board,index,current_player(board))
  display_board(board)
end

# turn_count method returns number of turns played
def turn_count(board)
  count=0
  i=0
  while i <= 9
    if board[i] =="X" || board[i] =="O"
      count+=1
    end
    i+=1
  end
  count
end

def current_player(board)
   turn_count(board).even? ? "X" : "O"
end
# helper to won?
def helper(arr)
    k=0
    index=0
    i=0
# Checking first row, diagonal, first column
     while i < 4
        if arr[i]== 0
          if arr.include?(1) && arr.include?(2)
             temp_arr=[0,1,2]
          end
          if arr.include?(4) && arr.include?(8)
              temp_arr=[0,4,8]
          end
          if arr.include?(3) && arr.include?(6)
              temp_arr=[0,3,6]
          end
       end
# Checking Middle Column
       if arr[i]==1 && arr.include?(4) && arr.include?(7)
          temp_arr=[1,4,7]
       end
# Checking diagonal or last column
       if arr[i]==2
          if arr.include?(4) && arr.include?(6)
          temp_arr=[2,4,6]
          end
          if arr.include?(5) && arr.include?(8)
          temp_arr=[2,5,8]
          end
        end
# Checking if middle row
        if arr[i]==3 && arr.include?(4) && arr.include?(5)
           temp_arr=[3,4,5]
        end
        # Checking if bottom row
       if arr[i]==6 && arr.include?(7) && arr.include?(8)
          temp_arr=[6,7,8]
       end
      i+=1
     end
#  Checking if its a WIN_COMBINATIONS
     k=0
      while k < 9
            if (WIN_COMBINATIONS[k] == temp_arr)
               return temp_arr
               break
            else
               k+=1
            end
      end
      return false
    end

       def won?(board)

       #
       #  Checking if the postions are taken and grabing indeces -> temporary arrays
       #    "X"--> x_temp   "O"--> o_temp
         x_temp=[]
         o_temp=[]
         i=0
         count=0
         while i< 9
           if position_taken?(board,i)
             if board[i]=="X"
               x_temp << i
             end
             if board[i]=="O"
               o_temp << i
             end
             count+=1
           end
         i+=1
         end
         #  count=0 means array is empty
         if count == 0
              return false
         end

         if helper(x_temp)
          #  puts "X won "
           return helper(x_temp)
         end
         if helper(o_temp)
          #  puts "O won "
           return helper(o_temp)
         end

       end
# The `#full?` method should accept a board and return true if every element in the board contains either an "X" or an "O". For example:
# There is a great high-level iterator besides `#each` that will make your code super awesome elegant. But `#each` will certainly work great too.
def full?(board)
  count_x=board.count("X")
  count_o=board.count("O")
  val=count_x + count_o
  if val == 9
    return true
  else
    return false
  end
end
### `#draw?`


def draw?(board)
  # call full
  if !won?(board) && full?(board)
    puts "Cats Game!"
    return true
  end
  # first_row=[0,1,2]
  # diag_left=[0,4,8]
  # diag_right=[2,4,6]
  # if won?(board)==first_row || won?(board)==diag_left || won?(board)==diag_right
  #   return false
  # end
  # if (!won?(board) && !full?(board)) || won?(board)
  #   return false
  # end

end
# Build a method `#over?` that accepts a board and returns true if the board has been won, is a draw, or is full. You should be able to compose this method solely using the methods you used above with some ruby logic.
#
def over?(board)
  if draw?(board) || won?(board)
    return true
  end
  if !won?(board)
    return false
  end
end
### `#winner`

def winner(board)
  if draw?(board)
    return nil
  end
  if won?(board)
    count_x=board.count("X")
    count_o=board.count("O")
    if count_x > count_o
      puts  "Congratulations X!"
      return "X"
    else
      puts "Congratulations O!"
      return "O"
    end
  end
end

def play(board)
  while !over?(board)
    turn(board)
  end
  winner(board)
end

# def play(board)
#  # input = gets
#   puts "Welcome to Tic Tac Toe!"
#   i=0
#   while i< 9
#
#    turn(board)
#    if over?(board)
#      if winner(board)=="X"
#        puts "Congratulations X!"
#      end
#      if winner(board)=="O"
#        puts "Congratulations O!"
#      end
#      if winner(board)==nil
#        puts "Game is a DRAW!"
#      end
#      break
#    else
#     turn(board)
#     i+=1
#    end
#  end
# end
