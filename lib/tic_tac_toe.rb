
WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #left-down row
  [1, 4, 7], #middle-down row
  [2, 5, 8], #right-down row
  [0, 4, 8], #left-diagonal row
  [2, 4, 6]  #right - diaganal row
  ]
  
  def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index=input.to_i 
  index - 1
end

def move(board, index, char)
  board[index]=char
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index) 
  if (index.between?(0,8) && !position_taken?(board, index))
    true
  else 
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input=gets
  index=input_to_index(input)
 if valid_move?(board, index) 
  move(board, index, current_player(board))
   display_board(board)
    else
   turn(board)
  end
end

def turn_count(board)
move = []

board.each do  |index|
  if index == "X" || index == "O"
    move.push(1)
  end
end 
move.length
end

def current_player(board)
  turn_count(board)
  if turn_count(board).even?
    return "X"
  elsif turn_count(board).odd?
  return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |array|
      (board[array[0]] == "X"  && board[array[1]] == "X" && board[array[2]] == "X")  || ( board[array[0]] == "O"  && board[array[1]] == "O" && board[array[2]] == "O")
  end
end

def full?(board)
  board.all? {|space| space =="X" || space == "O" }
end

def draw?(board)
   full?(board)  && !won?(board)
end

def over?(board)
    draw?(board) || won?(board) 
end

def winner(board)
   WIN_COMBINATIONS.detect do |array|
  if board[array[0]] == "X"  && board[array[1]] == "X" && board[array[2]] == "X"
       return "X" 
    elsif board[array[0]] == "O"  && board[array[1]] == "O" && board[array[2]] == "O"
       return "O" 
     end
  end
end

def play(board)
 while !over?(board)
  turn(board)
 end
 if won?(board)
   puts "Congratulations #{winner(board)}!"
 else draw?(board)
   puts "Cat's Game!"
  end
 end

 
  