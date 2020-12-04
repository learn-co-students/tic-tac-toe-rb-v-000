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

# Helper Methods
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

def move(board, index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
  move(board, index)
  display_board(board)
elsif
  turn(board)
  end
end

def turn_count(board)
  counter = 0 
    board.each do |cell|
      if cell == "X" || cell == "O"
        counter += 1  
      end
      end
      counter
end  

def current_player(board)
 if turn_count(board) % 2 == 0 
     "X"
  else 
     "O"
end
end


 def won?(board)
   WIN_COMBINATIONS.detect do |combo|
     board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
end
  
  end
 
def full?(board)
  board.all? do |index|
 index == "X" || index == "O"

 end 
 end


def draw?(board)
 full?(board) && !won?(board)

 end 

def over?(board)
  won?(board) || draw?(board) || full?(board)
end


def winner(board)
  if won?(board)
  
  board[won?(board)[1]]

end
end



# Define your play method below
def play(board)
  turn(board) until over?(board)
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end



