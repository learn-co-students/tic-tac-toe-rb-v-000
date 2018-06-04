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
     move(board, index, value = "X")
    else turn(board)
    end
  display_board(board)
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
  if full?(board) == true && won?(board) == false
    true
  else
   false
  end
end

def over?(board)
  if full?(board) == true
    true
    elsif won?(board) != false
    true
  else
    false
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |combo|
      if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
      return "X"
      elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
      return "O"
      end
    end
    return nil
end  

def play(board)
  until over?(board) 
    turn(board)
    draw?(board)
  end
    if winner(board) == "X"
        puts "Congratulations X!" 
    elsif winner(board) == "O" 
        puts "Congratulations O!" 
    else draw?(board) 
         puts "Cat's Game!" 
    end
end



