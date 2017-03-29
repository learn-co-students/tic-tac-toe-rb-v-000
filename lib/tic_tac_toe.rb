#---------------------------------------------------
def display_board(board = [" "," "," "," "," "," "," "," "," "], board_type = 'Active')
  width = 3
  total_cells = 9

    board.each_index { |i|
      if board_type == 'Active'
      print " #{board[i]} "

      elsif board_type == 'Display'
      print " #{i+1} "

      else
      print " #{board[i]} "

      end


      if i+1 == total_cells
      print "\n"

      elsif (i+1) % width == 0
      print "\n-----------\n"

      elsif i+1 % width != 0 && i+1 != total_cells
      print "|"

      end
    }
end


#---------------------------------------------------
#input to index converts the input from string to integer
#and updates it from a "board index" to an array index (-1)
def input_to_index (move)
  #note that with #to_i, if there are no ints, it will eval
  #to zero and the method will return -1 as a result
return move.to_i - 1
end



#---------------------------------------------------
def move (board, position, char)

board[position] = char
return board

end


#--------------------------------------------------------
#this method says whether or not the position on the board is filled w an X or O
# **note that our definition of filled is very narrow - the method only evaluates to
# true (e.g. position is taken) if there is an X or O at that index.
# Any other thing - "" or nil or 'G' will all evaluate to false

def position_taken? (board, index)

  if board[index] == 'X' || board[index] == 'O'
    return true
  else
  return false
  end

end



#--------------------------------------------------------
def valid_move? (board, index)

  spot_on_board = (index < 9 && index > -1)
  position_taken = position_taken?(board,index)
  return spot_on_board && !position_taken

end

#--------------------------------------------------------
def turn (board)

#gets move
puts "Please enter 1-9 player #{current_player(board)}:"
current_move_index = input_to_index(gets.strip)

  #checks validity of move and if it passes, displays it, otherwise
  #re-prompts user to enter a valid move
  if valid_move?(board, current_move_index)
  move(board,current_move_index, current_player(board))
  display_board(board)
  puts "Gutsiest move I ever saw, Mav."

  else
    turn (board)
  end

end


#--------------------------------------------------------
def turn_count(board)
  total_turns = board.count("X") + board.count("O")
  return total_turns
end


#--------------------------------------------------------
def current_player (board)
  if  turn_count(board).even?
     return "X"
  elsif turn_count(board).odd?
    return "O"
  end
end

#----------------------------------------------------
#here's a constant that defines all win combinations
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

#----------------------------------------------------
def won? (board)
  x_spots = board.each_index.select {|i| board[i] == "X"}
  o_spots = board.each_index.select {|i| board[i] == "O"}
  is_a_win = false



    #for each of the winning arrays, do any these sets of 3 spots all exist in the filled x/o spots
    #if the 3 spots from any of the win arrays are all found in the x spots (each one is checked below)
    #then this will return true
    x_win = WIN_COMBINATIONS.each { |current_win_array|
    #so for this current win array (1 of the 8 possible wins in win_combinations)
    #are #all? of its elements #included? in the x_spots
    #only if all of the win array spots are found in x_spots, will it return true
    if current_win_array.all? { |current_win_spot| x_spots.include?(current_win_spot) }
      is_a_win = current_win_array
    end

    }


    #exact same but for o
    o_win = WIN_COMBINATIONS.each { |current_win_array|

      if current_win_array.all? { |current_win_spot| o_spots.include?(current_win_spot) }
        is_a_win = current_win_array
      end

    }

  #note this leverages ruby's unique truthiness and dynaimc
  #typing so it's not entirely  future proof
  if is_a_win.class == Array
    return is_a_win
  elsif is_a_win == false
    return is_a_win
  end

end



#----------------------------------------------------
def full? (board)
  #if any of the elements are blank, it will return true, which means it will be not full
  return !board.any? {|x| x == " "}
end



#----------------------------------------------------
def draw? (board)
  #it's a draw if the board does not have a win and it's full; otherwise, not a draw
  return !won?(board) && full?(board)
end




#----------------------------------------------------
def over? (board)
  return won?(board) || draw?(board) || full?(board)
end




#----------------------------------------------------
def winner (board)

  if won?(board) #this leverages ruby truthiness, where an array returned evaluates to truthy
  return board[won?(board)[0]]
  else
  return nil
  end

end


#--------------------------------------------------------
def play(board)

  #keep calling turns until the game is #over?
  #changed to until to make it a bit more semantic here
  #should be functionally identical to while
  (turn(board)) until over?(board)

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end

end
