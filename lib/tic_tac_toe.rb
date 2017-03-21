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

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
    user_input.to_i - 1
end

def move(board, index, player)
    board[index] = player
end

def move (index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board,position)
  if board[position] == " "
    false
    elsif board[position] == ""
    false
    elsif  board[position] == nil
    false
    else   board[position] == "X" || "O"
    true
  end
end

def valid_move?(board, index)
   if position_taken?(board, index)
     false
   elsif index.between?(0, 8)
    true
   else
     nil
   end
end

def move(board, index, value= "X")
   board[index]=value
end

def turn (board)
   puts "Please enter 1-9:"
     input=gets.strip
     index = input_to_index(input)
       if valid_move?(board, index)
           move(board, index, current_player(board)) # I add current_player(board)
           display_board(board)
       else
          turn(board)
       end
end


def move (board, index, player)
  board[index] =  player # I removed "X"  and change current_player to player
end

def turn_count(board)
  counter = 0
  board.each do |turn_count_board|
    if turn_count_board == "X" || turn_count_board == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  !won?(board) && full?(board) #Replaced opposite from  full?(board) && !won?(board) to !won?(board)....
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
 #-----------------------

 def play(board)
  while over?(board) == false
    turn(board)
  end
  if won?(board)
    winner = winner(board)
    puts "Congratulations #{winner}!"
  else draw?(board)
    puts "Cats Game!"
  end
end
