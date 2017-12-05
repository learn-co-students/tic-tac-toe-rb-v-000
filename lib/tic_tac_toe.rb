


# Define your WIN_COMBINATIONS constant
 WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2],

 ]

 def display_board(board)

   puts " #{board[0]} | #{board[1]} | #{board[2]} "
   puts "-----------"
   puts " #{board[3]} | #{board[4]} | #{board[5]} "
   puts "-----------"
   puts " #{board[6]} | #{board[7]} | #{board[8]} "

end


 def won?(board) #['','','X','X','X','X']

   WIN_COMBINATIONS.each do |win_combination|
      # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
      # grab each index from the win_combination that composes a win.
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1] # load the value of the board at win_index_1
      position_2 = board[win_index_2] # load the value of the board at win_index_2
      position_3 = board[win_index_3] # load the value of the board at win_index_3

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination # return the win_combination indexes that won.
     elsif  position_1 == "O" && position_2 == "O" && position_3 == "O"
       return win_combination
      end
    end
    false

 end

 def input_to_index(input)
   #when ever you use a parameter in you method..MAKESURE to USE IT IN YOUR METHOD BODY. (NOT AS A "STRING")
   input.to_i - 1

 end

 def move(array, index, value)
   array[index] = value

 end

 # re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
 def position_taken? (board, index)
   if (board[index] == " ")
     false

   elsif (board[index] == "X") || (board[index] == "O")
     true

   else
     false

  end
 end


 # code your #valid_move? method here
  def valid_move?(board,index)
    if !position_taken?(board, index)   && index.between?(0,8)
       true

    end
  end


  # method turn
  def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board, index)
       move(board, index, current_player(board))
       display_board(board)

      else
      turn(board)
    end
   end



 def turn_count(board)
    turn_count= 0
     board.each do |space|
       "number of turns played is #{space}"
       if space == "X" || space == "O"
           turn_count += 1
      end
     end
   turn_count
  end



def current_player(board)
 if turn_count(board).even?
    "X"
 else
   "O"
 end
end


def full?(board)
    # are there any? empty spaces on the board
    # OR are all? of the spaces either "X" or "O"
    #WIN_COMBINATIONS.all? do |win_combination|
     board.all? do |element|
     element == "X" || element == "O"

    end

end

def  draw?(board)
       full?(board) && !won?(board)
end

def over?(board)
    draw?(board) || won?(board)

end

#example
#board = ["", "", "", X", "X", "X"....]
#winner1 = [3,4,5]
 #winner1[0] /3
 #board[winner1[0]]


def winner(board)
   if winner1 = won?(board)
     board[winner1[0]] #pass in winner1 into board
   end
end

# just focus on the pseduocode.
#play method
def play(board)
         #until the game is over # if method ends in a "?"
  #it could be used directly in an conditional statment becasue it always return trueth or falsely values..
   turn(board) until over?(board)

   if won?(board)
    #puts "Congratulations #{current_player(board)}!"
      puts "Congratulations #{winner(board)}!"

   elsif draw?(board)  #the game was a draw
    puts  "Cat's Game!"
   end
end
