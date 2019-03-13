#defines a constant WIN_COMBINATIONS with arrays for each win combination

WIN_COMBINATIONS = [
[0,1,2], # Top row
[3,4,5],  # Middle row
[6,7,8], #lower row
[0,4,8], #horizontal row_a
[2,4,6], #horizontal_row_b
[1,4,7], #vertical_row_a
[0,3,6], #vertical_row_b
[2,5,8], #vertical_row_c
]

#display_board
def display_board(board = [" "," "," "," "," "," "," "," "," "])
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#input_to_index
def input_to_index(user_input)
  return user_input.to_i-1
end

#Move
def move(board,index, value = "X")
  return board[index] = value
end

#valid_move?
def valid_move?(board,index)
  if index.between?(0,9) && !position_taken?(board,index)
    true
end
end

#position_taken?
def position_taken?(board,index)
  if board[index] == "" || board[index] == " " || board[index] == nil
    false
  elsif board[index] == "X" || board[index] == "O"
    true
end
end

#turn_count
def turn_count(board)
  counter = 0
  board.each do |place|
    if place == 'X' || place == 'O'
    counter += 1
  end
  end
  return counter
end

#current_player
def current_player(board)
  if turn_count(board) % 2 == 0
    return 'X'
  else
    return 'O'
  end
end

#won?
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
WIN_COMBINATIONS.each do |combo|
 # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
 # grab each index from the win_combination that composes a win.
win_index_1 = combo[0]
win_index_2 = combo[1]
win_index_3 = combo[2]


 position_1 = board[win_index_1] # load the value of the board at win_index_1
 position_2 = board[win_index_2]
 position_3 = board[win_index_3]


 if
   (position_1 == "X" && position_2 == "X" && position_3 == "X")||(position_1 == "O" && position_2 == "O" && position_3 == "O")
   return combo
 end #end if
end #end to looping
return false
end #end def


 #full? if there is an available position then false else true
#IS BOARD FULL?
def full?(board)
 if board.include?(' ') || board.include?('')
   return false
else
   return true
 end
end

 #draw?

#IS THERE A DRAW?
def draw?(board)
 if !won?(board) && full?(board)
   return true
 end
end

#over?

#HAS SOMETHING HAPPENED?
def over?(board)
 puts 'is it over?'
 if won?(board) || draw?(board) || full?(board)
   return true
 else
   puts 'no keep going'
   return false
 end
end


 #winner

#WHO WON?
def winner(board)
 if !won?(board)
   return nil
 else WIN_COMBINATIONS.each do |win_combo|
   if check_win_combination?(board, 'X', win_combo)
     return 'X'
   elsif check_win_combination?(board, 'O', win_combo)
     return 'O'
   end
 end
end
end

def turn(board)
puts "Please enter 1-9:"
  position_taken = gets.strip
  index = input_to_index(position_taken)
  if !valid_move?(board,index)
    turn(board)
  else
    move(board, index, current_player(board))
   display_board(board)
  end
end

def play(board)
 counter = 0
 until counter == 9
 turn(board)
 counter += 1
 end
end
