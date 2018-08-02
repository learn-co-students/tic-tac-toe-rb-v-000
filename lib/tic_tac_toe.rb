WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8], #row wins
  [0,3,6],
  [1,4,7],
  [2,5,8], #column wins
  [0,4,8],
  [2,4,6]  #diagonal wins
  ]


def display_board(board)
 puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  new_user_input = user_input.to_i - 1
  return new_user_input
end  

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)
  if board[index] == " "
    false 
  else
    true 
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && !position_taken?(board, index)
    true
  else
    false
  end
end
  
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  token = "X" || "O"
  if valid_move?(board, index) == true
    move(board, index, token)
    display_board(board)
   elsif !valid_move?(board, index) == true
   turn(board)
  end
end


def turn_count(board)
  counter = 0 
  board.each do |token|
    if token == "X" || token == "O"
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
  WIN_COMBINATIONS.each {|win_combo|
  index_0 = win_combo[0]
  index_1 = win_combo[1]
  index_2 = win_combo[2]
  
  position_1 = board[index_0]
  position_2 = board[index_1]
  position_3 = board[index_2]
  
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combo
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combo  
  end
  }
 return false
end

def full?(board)
  if board.all? {|index| index == "X" || index == "O"}
    true
  else
    false
  end
end

def draw?(board)
  if full?(board) && !won?(board) == true
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) == true || won?(board) == true || full?(board) == true
    true
  else
    false
  end
end
    
def winner(board)
  index = won?(board)
  if index == false
    return nil 
  else
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end
    
def play(board)
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
