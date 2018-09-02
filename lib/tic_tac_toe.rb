WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [6,4,2],
  [8,4,0],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i-1
end

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)
  if board[index] != "X" && board[index] != "O"
    false
  else
    true
  end
end

def valid_move?(board, index)
  position_taken?(board, index) == false && index.between?(0, 8) == true
end

def turn(board)
  current_player(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else 
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |space| 
    if space == "X" || space == "O" 
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
  WIN_COMBINATIONS.each do |win_combination| 
  win_index_1 = win_combination[0] 
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
 
  position_1 = board[win_index_1]
  position_2 = board[win_index_2] 
  position_3 = board[win_index_3] 
 
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination # return the win_combination indexes that won.
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  else
    false
  end 
end
  false #what does this correspond to?
end

def full?(board)
  board.all? do |token| 
    token == "X" || token == "O"
  end 
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else won?(board)
    false
  end
end 

def over?(board)
  if won?(board) || draw?(board)
    true
  end
end

def winner(board)
  if !won?(board) == false
    board[won?(board).first]
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