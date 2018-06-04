WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [2,4,6],  # Diagonal 
  [0,4,8],  # Diagonal
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(number)
 number.to_i - 1
end

def move(board,index,value)
  board[index] = value
end

def position_taken?(board,index)
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board,index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  number = gets.strip
  index = input_to_index(number)

  if valid_move?(board,index)
   move(board, index, current_player(board))
   display_board(board)
  else 
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do|space|
    if space == "X" || space == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else 
    "O"
  end
end

def won?(board)
    WIN_COMBINATIONS.each do |combo|
      if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
      return combo
      elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
      return combo
      end
    end
      false
end 

def full?(board)
 if board.include?(" ")
  false
  else 
   true
  end
end  

def draw?(board)
  full?(board) && !won?(board) 
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  combo = won?(board)
  if combo
    board[combo[0]]
  end
end  

def play(board)
  until over?(board) 
    turn(board)
  end
  
  if won?(board)
      puts "Congratulations #{winner(board)}!" 
  elsif draw?(board) 
       puts "Cat's Game!" 
  end
end



