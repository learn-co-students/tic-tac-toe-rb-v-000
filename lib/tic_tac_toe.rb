WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 3, 6], # left column
  [1, 4, 7], # middle column
  [2, 5, 8], # right column
  [0, 4, 8], # diagonal 1
  [2, 4, 6]  # diagonal 2
]

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
       (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
    end
  end
  false
end

def full?(board)
  board.each do |spot|
    if spot == " " || spot == "" || spot == nil 
      return false
    end
  end
  true
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
end

def winner(board)
  if !won?(board)
    return nil
  end
  winning_combination = won?(board)
  player = board[winning_combination[0]]
  return player
end

def turn_count(board)
  counter = 0;
  
  board.each do |position|
    if position == "X" || position == "O"
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

def move(board, index, current_player)
  board[index] = current_player
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def play(board)
  count = 0

  while count < 9
    count += 1
    
    if !over?(board)
      turn(board)
    elsif won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end
    
  end
  
end
