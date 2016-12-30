# Helper Method

WIN_COMBINATIONS = [
[0, 1, 2], [3, 4, 5], [6, 7, 8], 
[0, 3, 6], [1, 4, 7], [2, 5, 8], 
[0, 4, 8], [2, 4, 6]
]

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
 
def input_to_index(users_input)
     index = users_input.to_i - 1
end 

def move(board, index, token)
     board[index] = token
end


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0, 8) 
     return true
   else
     return false 
  end 
end
  
def turn(board)
    puts "Please enter 1-9:"
    users_input = gets.strip
    index = input_to_index(users_input) 
  if valid_move?(board, index) == true 
    move(board, index, current_player(board))
    display_board(board)
  else 
     turn(board)
  end
  
end

def turn_count(board)
   counter = 0
   board.each do |item| 
  if item == "X" || item == "O"
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
  WIN_COMBINATIONS.detect do |win_index|
    index_1 = win_index[0] 
    index_2 = win_index[1] 
    index_3 = win_index[2]
  if (board[index_1] == "X" && board[index_2] == "X" && board[index_3] == "X") || (board[index_1] == "O" && board[index_2] == "O" && board[index_3] == "O") 
   win_index
  else false
  end
  end
end

def full?(board)
  board.all?  do |i|
  i == "X" || i == "O"
  end
end

def draw?(board)
  if won?(board)
    false
  elsif 
    full?(board)
    true
  else
    false
  end 
end

def over?(board)
  if won?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  win_index = won?(board)
  if win_index == nil
  return nil
  else board[win_index[0]] == "X" || board[win_index[0]] == "O"
  return board[win_index[0]]
  end
end

def play(board)
  until over?(board) == true do
    turn(board)
  end
   if won?(board)  
   puts "Congratulations #{winner(board)}!"
   else draw?(board)
   puts "Cats Game!"
   end
  end 

