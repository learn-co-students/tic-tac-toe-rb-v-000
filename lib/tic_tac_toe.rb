#WIN COMBINATIONS

WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[6,4,2]
]

#DISPLAY BOARD
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# MOVE

def move(board, position, value =current_player(board))
  board[position.to_i-1] = value
end 

# POSITION TAKEN
def position_taken?(board,position)
  board[position] == "X" || board[position] == "O"
end 

#VALID MOVE?
def valid_move?(board,position)
  position = position.to_i-1
  !position_taken?(board,position) && position.between?(0,8)
end

#TURN

def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(board,input)
      move(board,input)
      display_board(board)
    else turn(board)
    end
end

# TURN COUNT:takes in an argument of the board array and returns the number of turns that have been played.

def turn_count(board)
  counter = 0
  board.each do |x| if x !=" "
  counter +=1
  end 
    end
    counter
  end

#CURRENT PLAYER : determine if it is "X"'s turn or "O"'s.

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else 
    return "O"
  end
end 

#Won? return false/nil if there is no win
def won?(board)
  WIN_COMBINATIONS.detect {|x| 
    board[x[0]] ==board[x[1]] && board[x[1]] == board[x[2]] &&
    position_taken?(board, x[0]) }
end 

#PLAY 
def play(board)
  i=0
  until i == 9
    turn(board)
    i +=1 
  end
end 

#FULL
def full?(board)
  board.all? { |x| x=="X" || x=="O" }
end 

#DRAW

  def draw?(board)
  if full?(board) && !won?(board)
    true
  elsif full?(board)
    false
  elsif won?(board)
    false
  end
end

#OVER
def over?(board)
  won?(board) || draw?(board) || full?(board)
end

#WINNER you want to return the token of the winner, you may extract the value of the board at the first index value of the combination that was detected your "x" variable is only relevant within your detect method and is not available outside of itwe need to capture that within a variable, and return the variable at the end of your method. we know that we can't put board[x[0]] within the detect method, and that if we put it at the end statement the code breaks because the "x" variable is not recognized outside of the detect method (which is where we declared it) so we needed a way to capture what is was we wanted to declare at the end of our method (aka, the token)
=begin
def winner(board)
  token = nil
  WIN_COMBINATIONS.detect do |x|
   if board[x[0]] ==board[x[1]] &&
      board[x[1]] == board[x[2]] &&
      position_taken?(board, x[0])
      token = board[x[0]] end
   end
   token
 end
=end 

 def winner(board)
  if token = won?(board)
  board[token.first]
end
end

def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board) 
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end 




