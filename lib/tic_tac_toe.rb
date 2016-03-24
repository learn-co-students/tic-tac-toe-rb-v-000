WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6] ]

board=["O", "O", "O", "O", "O", "O", "O"]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, input, character="X")
  input=input.to_i
  truPosition=input-1
  board[truPosition]=character
end

def position_taken?(board, position)
  if (board[position]==" "|| board[position]=="" || board[position]==nil)
    false
    else
    true
  end
end

def valid_move?(board, position)
  int=position.to_i
  int=int-1
  if ( int.between?(0,10) && !position_taken?(board, int) )
    true
    else
    false
  end
end

def turn(board)
  player = current_player(board)
  puts "Please enter 1-9:"
  position = gets.chomp
  if valid_move?(board, position)
    move(board, position, player)
    else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |spot|
    if (spot == "X" || spot == "O")
      counter += 1
    end
  end
  return counter
end

def current_player(board)
 counter = turn_count(board)
 if counter % 2 == 0
    return "X"
    else
    return "O"
  end
end

def won?(board)
  if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    return false
  end
  WIN_COMBINATIONS.each do |combo|
      if ((board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" ) || (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O" ))
       return combo
     end
  end
  WIN_COMBINATIONS.each do |combo|
      if !((board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" ) || (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O" ))
       return false
     end
  end
end

def full?(board)
  board.each do |spot|
    if spot == " "
      return false
    end
  end
  board.each do |spot|
    if spot != " "
      return true
    end
  end
end

def draw?(board)

   WIN_COMBINATIONS.each do |combo|
      if ((board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" ) || (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O" ))
       return false
     end
   end

 board.each do |spot|
counter = 0
   if spot != " "
     counter += 1
   end
   if counter == 9
     return true
  end
 end
  board.each do |spot|
    if spot == " "
      return false
      end
  end
end

def over?(board)

  WIN_COMBINATIONS.each do |combo|
      if ((board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" ) || (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O" ))
       return true
     end
   end

   board.each do |spot|
    if spot == " "
      return false
    end
  end
end

def winner(board)

  WIN_COMBINATIONS.each do |combo|
      if ((board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" ))
       return "X"
     end
   end

   WIN_COMBINATIONS.each do |combo|
      if ((board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O" ))
       return "O"
     end
   end

   WIN_COMBINATIONS.each do |combo|
      if !((board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" ) || (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O" ))
       return nil
     end
   end
end

def play(board)
while !(over?(board) || won?(board) || draw?(board)) do
  turn(board)
end
if (won?(board))
    winner=winner(board)
    puts "Congratulations #{winner}!"
  end
  if (draw?(board))
      puts "Cats Game!"
  end
end