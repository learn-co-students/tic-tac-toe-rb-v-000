WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[6,4,2]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "    
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move (board, index, token)
  board[index] = token
end 

def position_taken?(board, index)
  board[index]== "X" || board[index] == "O"
end

def valid_move?(board,index)
  if index.between?(0,8) && !position_taken?(board, index) 
    true 
  else 
    false
  end
end

def turn(board)
  puts "Please enter 1-9:" 
  input = gets.strip
  index = input_to_index(input)
  
  if valid_move?(board, index)
      move(board, index, current_player(board))
      display_board(board)
  else 
    turn(board)
    puts "That was invald, try again!"
  end
end

def turn_count(board)
  counter = 0 
  board.each do |cell| 
    if cell != " "      
        counter += 1 
    end
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  elsif turn_count(board) % 2 == 1
    "O"
  end
end

def won?(board)
  winning_combo = nil
  
  WIN_COMBINATIONS.each do |combo|
  
    position_1 = combo[0]
    position_2 = combo[1]
    position_3 = combo[2]
  
    if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X"
   
      winning_combo = combo
   
    elsif board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
   
      winning_combo = combo
    end
  end
  winning_combo
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

def play(board)
  while !over?(board)
    turn(board)
  end 
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end

#board = Array.new(9, " ")

#play(board)

