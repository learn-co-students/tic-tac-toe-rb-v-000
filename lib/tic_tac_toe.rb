board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]  

WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,4,8], #Diagonal top left to bottom right
    [2,4,6], #Diagonal top right to bottom left
    [0,3,6], #Top left to bottom left vertical    
    [2,5,8], #Top right to bottom right vertical
    [1,4,7] #Top middle to bottom middle vertical    
    ]

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

def move(board, index, char) 
  board[index] = char
end

def position_taken?(board, index)
  board[index] != nil && board[index] != " " && board[index] != ""
end

def valid_move?(board, index) 
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board) 
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  char = current_player(board)
    if valid_move?(board, index) 
      move(board, index, char)
    else
      turn(board)
    end
  display_board(board)
end

def turn_count(board) 
  counter = 0
  board.each do |char|
    if char == "X" || char == "O"
      counter += 1
   end
  end
 counter
end

def current_player(board) 
  gets = turn_count(board) % 2 == 0 ? "X" : "O"  
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    index_1 = win_combination[0]
    index_2 = win_combination[1]
    index_3 = win_combination[2]
    
    position_1 = board[index_1]
    position_2 = board[index_2]
    position_3 = board[index_3]
    
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      win_combination
    else
      false
  end
 end
end

def full?(board)
 board.all? do |value| 
   value == "X" || value == "O"
 end
end

def draw?(board)
  !(won?(board)) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if over?(board) && board[won?(board)[0]] == "X" 
   "X"
  elsif over?(board) && board[won?(board)[0]] == "O"
   "O"
  else 
   nil
 end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
 end
end