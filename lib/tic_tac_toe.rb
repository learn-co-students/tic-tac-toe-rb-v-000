WIN_COMBINATIONS = [

  [0 , 1 , 2],
  [3 , 4 , 5],
  [6 , 7 , 8],
  [0 , 3 , 6],
  [1 , 4 , 7],
  [2 , 5 , 8],
  [0 , 4 , 8],
  [6 , 4 , 2]

]

def display_board(board)

  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "

end

def input_to_index(input)
  (input.to_i)-1
end

def move(board, index, player_token)
  board[index] = player_token
end

def position_taken?(board, index)
  if board[index] == " "
    return false
  elsif board[index] == ""
    return false
  elsif board[index] == nil
    return false
  else board[index] == "X" && board[index] == "O"
    return true
  end
end

def valid_move?(board, index)
  if index >= 0 && index <= 8 && board[index] != "X" && board[index] != "O"
    return true
  else
    return false
  end
end

def turn(board)

  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  player_token = current_player(board)
  if valid_move?(board, index)
     move(board, index, player_token)
  else
     turn(board)
  end
  display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |spot|
    if spot == "X" || spot == "O"
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
WIN_COMBINATIONS.each do |win_combo|
index_1 = board[win_combo[0]]
index_2 = board[win_combo[1]]
index_3 = board[win_combo[2]]

if index_1 == "X" && index_2 == "X" && index_3 =="X"
  return win_combo
elsif index_1 == "O" && index_2 == "O" && index_3 =="O"
  return win_combo
end
end
false
end

def full?(board)
    board.all?{|position| position == "X" || position == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  winning_combo = won?(board)
  if winning_combo != false
   board[winning_combo[0]]
 else
   nil
 end
end

def play(board)
  turn(board) until over?(board)
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  else draw?(board)
    puts "Cat's Game!"
  end
end
