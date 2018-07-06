board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
user_input = " "

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index = "#{user_input}".to_i-1
  return index
end

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
 if board[index] == "X" || board[index] == "O"
   true
 elsif board[index] == " "
   false
 else
   false
  end
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn.upcase == "X" || turn.upcase == "O"
      counter += 1
      puts "#{counter}"
    end
  end
  counter
end

def current_player(board)
  counter = 0
   if turn_count(board).even?
      return "X"
   else
      return "O"
    end
end

WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [0, 3, 6], # First column
  [0, 4, 8], # Diagonal top left-to-right
  [1, 4, 7], # Middle column
  [2, 5, 8], # Diagonal top right-to-left
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [2, 4, 6]  # Right column
  ]

def won?(board) # how did player win?
  won = false
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X" 
      return won = win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return won = win_combination
    end
  end
  return won
end

def full?(board) #is the board full?
  board.all? do |board_index|
    board_index == "X" || board_index == "O"
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
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
 winner = nil
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X" 
      return "X"
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O" 
      return "O"
    end
  end
  return winner
end

def play(board)
  counter = 0
  while over?(board) == false && counter <= 9
    turn(board)
    counter += 1
  end
  
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X" 
      puts "Congratulations X!"
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      puts "Congratulations O!"
    elsif draw?(board) == true
      puts "Cat's Game!"
      break
    end
    end
  end

