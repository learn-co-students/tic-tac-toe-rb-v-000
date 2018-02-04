
WIN_COMBINATIONS = [
  [0,1,2], #top
  [2,5,8], #right
  [6,7,8], #bottom
  [0,4,8], #diagonal
  [2,4,6], #diagonal
  [3,4,5], #middle-hor
  [1,4,7], #middle-vert
  [0,3,6]  #left
]

board= [" "," "," "," "," "," "," "," "," "]

 def display_board(board)
  a = board[0]
  b = board[1]
  c = board[2]
  d = board[3]
  e = board[4]
  f = board[5]
  g = board[6]
  h = board[7]
  i = board[8]
  puts " #{a} | #{b} | #{c} "
  puts     "-----------"
  puts " #{d} | #{e} | #{f} "
  puts     "-----------"
  puts " #{g} | #{h} | #{i} "
 end

 def input_to_index(input)
   user_input = input.to_i
   user_input - 1
 end

 def current_player(board)
 	   	  if turn_count(board) % 2 != 0
 	      	return "O"

         elsif turn_count(board) % 2 == 0
             return "X"
        end
 end

 def move(board, index, player)
   board[index] = player
 end

 def position_taken?(board, index)
   !(board[index].nil? || board[index] == " ")
 end

 def valid_move?(board, index)
   index <= 8 && index >= 0 && !position_taken?(board, index)
 end

 def turn(board)
   puts "Please enter 1-9:"
   input = gets.strip
   index = input_to_index(input)
   player = current_player(board)
   if valid_move?(board, index)
     move(board, index, player)
     turn_count(board) # Order of turn_count could affect count
     display_board(board)
     draw?(board)
   else
     turn(board)
     draw?(board)
   end
 end

 def turn_count(board)
 	count = 0
 	 board.each do |val|
 	 		if val != " "
 	 			count += 1
 			end
 	 end
 	 count
 end

 def current_player(board)

 	   	  if turn_count(board) % 2 != 0
 	      	return "O"

         elsif turn_count(board) % 2 == 0
             return "X"
        end
 end

 def find_win?(board)
   WIN_COMBINATIONS.any? do |outer| #matches any wins returning boolean returns true
     board[outer[0]] == board[outer[1]] && board[outer[2]] == board[outer[0]] &&  board[outer[0]] != " "
   end
 end

 def won?(board)
   WIN_COMBINATIONS.detect do |outer_elements| #matches any wins returning boolean
     board[outer_elements[0]] == board[outer_elements[1]] && board[outer_elements[2]] == board[outer_elements[0]] &&  board[outer_elements[0]] != " "
  end
 end

 def full?(board)
   if board.all? { |i| i != " "} #true for draw
     true
   elsif board.any? { |board_element| board_element != " " }  #false for in progress game
       false
     end
 end

 def draw?(board)
      full?(board) && !won?(board)
 end

 def over?(board)
   full?(board) || won?(board)
 end


 def winner(board)
   WIN_COMBINATIONS.select do |e| #return winning char

     if board[e[0]] == "X" && board[e[1]] == "X" && board[e[2]] == "X"
      return "X"
    elsif board[e[0]] == "O" && board[e[1]] == "O" && board[e[2]] == "O"
      	return "O"
     end
   end
  if draw?(board)
    nil
 end
 end

def over?(board)
  won?(board) || draw?(board)
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
