WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
 
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
 
display_board(board)

def input_to_index(user_input)
  user_input.to_i-1
end

def move(board, input_to_index, players_token)
  board[input_to_index]=players_token
  return board
end
  
def position_taken?(board, index)
  if board[index] == "" || board[index] ==" " || board[index] == nil 
    return false 
  else
    return true 
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && !position_taken?(board, index)
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input=gets.chomp
  index=input_to_index(user_input)
  if valid_move?(board, index)
    players_token=current_player(board)
    move(board, index, players_token)
    display_board(board)
  else 
    turn(board)
  end
end

def turn_count(board)
  counter = 0 
  board.each do |token|
    if token == "X" || token == "O"
      counter+=1
    end
  end
  counter
end

def current_player(board)
  turn_count(board).even?? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    index_1 = win_combo[0]
    index_2 = win_combo[1]
    index_3 = win_combo[2]
    
    position_1 = board[index_1]
    position_2 = board[index_2]
    position_3 = board[index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 =="O"
      return win_combo
      end
    end
  else
    false
end

def full?(board)
  board.all? do |token|
    token=="X" || token =="O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false 
  end
end
  
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    index=won?(board)[0]
    return board[index]
  else
    return nil
  end
end


def play(board)
  until over?(board)==true  
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end