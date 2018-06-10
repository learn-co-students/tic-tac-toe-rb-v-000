WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #top-left to bottom-right diagonal
  [2,4,6]  #bottom-left to top-right diagonal
]

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
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |value|
    if value == "X" || value == "O"
      counter +=1
    end
  end
  return counter
end

def current_player(board)
  if (turn_count(board) == 0) || (turn_count(board)% 2 == 0)
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combinations|
    index1 = win_combinations[0]
    index2 = win_combinations[1]
    index3 = win_combinations[2]
    
    board_spot1 = board[index1]
    board_spot2 = board[index2]
    board_spot3 = board[index3]
    
    if board_spot1 == "X" && board_spot2 == "X" && board_spot3 == "X"
      return win_combinations
    elsif board_spot1 == "O" && board_spot2 == "O" && board_spot3 == "O"
      return win_combinations
    else
      false
    end
  end
  return false
end

def full?(board)
  board.none? do |value|
    value == " "
  end
end

def draw?(board)
  if won?(board) || !full?(board)
    return false
  else
    return true
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end

def play(board)
  while !over?(board)
    turn(board)
  end
  if draw?(board)
    puts "Cat's Game!"
  else
    puts "Congratulations #{winner(board)}!"
  end
end