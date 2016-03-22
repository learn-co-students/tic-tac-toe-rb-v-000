# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top Row
  [3,4,5], # Middle Row
  [6,7,8], # Bottom Row
  [0,3,6], # Left Column
  [1,4,7], # Middle Column
  [2,5,8], # Right Column
  [0,4,8], # Top Left Diagonal
  [2,4,6], # Top Right Diagonal]
]  

# Display Board method
def display_board(board)
 

  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
  
end

# Move method

def move(board, location, current_player = "X")
  board[location.to_i-1] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(board, input)
    move(board, input, current_player(board))
  else
    turn(board)
  end
  display_board(board)
end

# Turn count method

def turn_count(board)
  counter = 0
  board.each do |board_space|
    if board_space == "X" || board_space == "O"
      counter += 1
    else
    end
  end
  board = counter
end

# Current Player

def current_player(board)
  turn_count(board).even? ? "X" : "O"

end

# Won method

def won?(board)

  WIN_COMBINATIONS.detect do |winning_array|
    
    #winning_array.all? do |win_index|
    #  if board[win_index] == "X"
    #    winning_array
    #  elsif board[win_index] == "O"
    #    winning_array
    #  else
    #  end
    #end
    #end
          

   if board[winning_array[0]] == "X" && board[winning_array[1]] == "X" && board[winning_array[2]] == "X"
       winning_array
    elsif board[winning_array[0]] == "O" && board[winning_array[1]] == "O" && board[winning_array[2]] == "O"
     winning_array
   else
  end
 end
end

# Full board method

def full?(board)

  board.all? do |marker|
    marker == "X" or marker == "O"
  end

end

# Draw method

def draw?(board)
  !won?(board) && full?(board)
end

# Game Over method

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

# Who's the winner method

def winner(board)
  if won?(board)
  board[won?(board)[0]]
  else
  end
end

# Play method

def play(board)

 until over?(board)
  
  turn(board)

  
end





  

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end


