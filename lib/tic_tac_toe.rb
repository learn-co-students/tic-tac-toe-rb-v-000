WIN_COMBINATIONS = [
  [0,1,2], #Top row win
  [3,4,5], # Middle row win
  [6,7,8], #Bottom row win
  [0,3,6], #Left vertical win
  [1,4,7], #Middle vertical win
  [2,5,8], #Right vertical win
  [0,4,8], #Diagnal win
  [2,4,6] #Diagnal win
 ]

 board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
 def display_board(board)
   puts " #{board[0]} | #{board[1]} | #{board[2]} "
   puts "-----------"
   puts " #{board[3]} | #{board[4]} | #{board[5]} "
   puts "-----------"
   puts " #{board[6]} | #{board[7]} | #{board[8]} "
 end

 def input_to_index(input) #Changes users input to array position
   input.to_i - 1
 end

 def move(board, index, character) #user moves if they're X or O
   board[index] = character
 end

 def position_taken?(board, index) #checks to see if position is taken by an X or O
   board[index] ==  "X" || board[index] ==  "O"
 end

 def valid_move?(board, index) #Is the space free for X or O
   board[index] == " " && index.between?(0,8)
 end

 def turn(board) #gameplay
   puts "Please enter 1-9:"
   input = gets.strip
   index = input_to_index(input)
   character = current_player(board)
   if valid_move?(board, index)
     move(board, index, character)
     display_board(board)
   else
     turn(board)
   end
 end

 def turn_count(board) #counts occupied positions
   counter = 0
   board.each do |turn|
     if turn == "X" || turn == "O"
       counter +=1
     end
   end
   counter
 end

 def current_player(board) #Returns the current player, X, for the third move
   move = turn_count(board)
   move % 2 == 0 ? "X" : "O"
 end

 def won?(board)
   WIN_COMBINATIONS.detect do |win_combination| #all array positions that are a win on the board. If X has the positions it wins or if O has the positions O wins

   win_index_1 = win_combination[0]
   win_index_2 = win_combination[1]
   win_index_3 = win_combination[2]

   position_1 = board[win_index_1]
   position_2 = board[win_index_2]
   position_3 = board[win_index_3]

   if position_1 == "X" && position_2 == "X" && position_3 == "X"
     return win_combination
   elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
   else
     false
   end
   end
 end

 def full?(board)
   board.all?{|position| position != " " } #the board is full if there are no empty positions
 end

 def draw?(board)
   full?(board) && !won?(board) ? true : false #the game is s draw if the board is full or no one has won
 end

 def over?(board)
   won?(board) || draw?(board) ? true : false #game is over if someone wins or the board is full
 end

 def winner(board)
   win_token = won?(board) #Places the nested array in a variable
   won?(board) ? board[win_token[0]] : nil #if there's a winner, you take the first position of the winning combination and return the value to say who is the winner.
 end

 def play(board) #asks for players inputs on a turn of the game
   until over?(board)  #Keep playing until the game is over
     turn(board)
   end
   won?(board) ? puts("Congratulations #{winner(board)}!") : puts("Cat's Game!")
 end
