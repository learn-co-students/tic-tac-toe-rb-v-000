WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def display_board(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
  puts " #{board[0]} | #{board[1]} | #{board[2]} ",  "-----------", " #{board[3]} | #{board[4]} | #{board[5]} ", "-----------",  " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i-1
end

def move(board, index, value)
  board[index] = value
end

def position_taken?(board, index)
  if (board[index]==" ") || (board[index]=="") || (board[index]==nil)
    return false 
  else
    return true 
  end
end

def valid_move?(board, index)
  if index.between?(0,8) && position_taken?(board,index)==false 
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9."
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)==true
    puts move(board,index,value = current_player(board)) && display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turn = 0 
  board.each do |board|
    if board == "X" || board == "O"
      turn += 1
    end
  end
  return turn
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]] && position_taken?(board, win_combination[0])
      return win_combination
    end
  end
  return false
end

def full?(board)
  if board.include?(" ")
    return false
  else 
    return true
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board) == true
    return true
  end
end

def winner(board)
  if won?(board)
    win_combination = won?(board)
    if board[win_combination[0]] == "X"
      return "X"
      elsif board[win_combination[0]] == "O"
      return "O"
    end
  end
end

def play(board)
  until over?(board)
  turn(board)
  current_player(board)
end
if won?(board)
  puts "Congratulations #{winner(board)}!"
elsif draw?(board)
  puts "Cat's Game!"
end
end









