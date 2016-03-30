
WIN_COMBINATIONS = [
  [0,1,2],#WIN_COMBINATIONS[0]
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, location, current_player = "X" )
    board[location.to_i-1] = current_player
end

def position_taken?(board,position)
  if (board[position] ==  " " || board[position] == "" || board[position] == nil)
   return false
    else
   return true
  end
end

def valid_move?(board,position)
   position.to_i.between?(1,9) && !position_taken?(board,position.to_i-1)
  end


def turn(board)
 puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(board, input)
    move(board, input,current_player(board))

  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
   counter = 0
   board.each do |token|
    if token == "X" || token == "O"
      counter += 1
     end
   end
  counter

end

 def current_player(board)
   if turn_count(board) % 2 == 0
   return "X"
 else
   return "O"
 end
 end

def won?(board)
  WIN_COMBINATIONS.detect do|win_combination|
   position_taken?(board, win_combination[0]) && board[win_combination[1]] == board[win_combination[0]] && board[win_combination[1]] == board[win_combination[2]]
 end
end

def full?(board)
  board.all? do|i|
    i == "X" || i== "O"
end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end


def winner(board)
  winning_array=won?(board)

    if !won?(board).nil?
      return board[winning_array[0]]
    else
      nil
    end
end

def play(board)
  while !over?(board)    #if game is not over
    turn(board)       #take a turn
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cats Game!"

  end

end


