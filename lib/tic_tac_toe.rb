WIN_COMBINATIONS = 
[
[0,1,2], 
[3,4,5], 
[6,7,8], 
[0,3,6], 
[1,4,7], 
[2,5,8], 
[0,4,8], 
[2,4,6], 
]



def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, position)
  num = position.to_i
  if num.between?(1,9)
    if position_taken?(board, num - 1) == false
      true
    elsif position_taken?(board, num - 1) == true
      false    
    end
  else
    false
   end 
end

def won?(board) #
  WIN_COMBINATIONS.detect do |combinations|
    board[combinations[0]] == board[combinations[1]] &&
    board[combinations[1]] == board[combinations[2]] &&
    position_taken?(board, combinations[0])
  end
end

def full?(board) #
  return true if (board.count("X") + board.count("O")) == board.count
end

def draw?(board) #
  !won?(board) && full?(board)
end

def over?(board) #
  draw?(board) || won?(board)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if !valid_move?(board, input)
    turn(board)
  end
  move(board, input, current_player(board))
  display_board(board)
end


def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O" 
  #check the above : symbol later. not sure it makes sense
  # and haven't found a satisfactory explanation yet.
end

def turn_count(board)
turn = 0 
board.each do |choice|
  if choice == "X" || choice == "O"
    turn += 1
  end
end 
turn
end

def move(board, location, current_player = "X")
  board[location.to_i-1] = current_player
end

def winner(board) #
  winning = won?(board)
  if !winning
    return nil  
  elsif board[winning[0]] == "X"
    return "X"
  elsif board[winning[0]] == "O"
    return "O"
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board).class == Array
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board) == true
    puts "Cats Game!"
  end 
end


=begin
def play(board) 
  turn_num = 0
  until turn_num = 9
    turn(board)
    turn_num +=1 
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
=end

#def play(board)
 # until over?(board)
  #turn(board)
#end
#  end
#if won?(board) != false
 # puts "Congratulations #{winner(board)}!"
#elsif draw?(board) == true
#  puts "Cats Game!"
#end
#end


=begin
def play(board)
   while over?(board) == false
     turn(board)
   end
   if won?(board).class == Array
     puts "Congratulations #{winner(board)}"
   elsif draw?(board) == true
     puts "Cats Game!"
   end
 end
=end
=begin
until the game is over
  take turns
end
 
if the game was won
  congratulate the winner
else if the game was a draw
  tell the players it has been a draw
end
=end
