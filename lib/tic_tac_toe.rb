WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [2, 4, 6], # diagnal
  [0, 4, 8], # diagnal
  [0, 3, 6], # left coloumn
  [1, 4, 7], # middle coloumn
  [2, 5, 8]  # left coloumn
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
    whos_move = current_player(board)
    move(board, index, whos_move)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0 
  board.each do |turn|
    if turn ===  "X" || turn === "O"
      counter += 1 
      end
  end
    return counter
end

def current_player(board)
  whos_turn = turn_count(board)
  if whos_turn % 2 === 0 
    return "X"
  else
    return "O"
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

  if position_1 === "X" && position_2 === "X" && position_3 === "X"
    return win_combination
  elsif position_1 === "O" && position_2 === "O" && position_3 === "O"
    return win_combination
    end
  end
  return false
end

def full?(board)
  board.all?{ |position| position === "X" || position === "O"}
end

def draw?(board)
  if won?(board) === false && full?(board)
    return true 
  else
    return false
  end
end

def over?(board)
  return won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board) === false 
    return nil
  end
  winning_index = won?(board)
  winning_index.each do |index| 
  if board[index] === "X"
    return "X"
  elsif board[index] === "O"
    return "O"
  end
 end
end

def play(board)
  until over?(board)
  turn(board)
end
  if winner(board) === "X"
    puts "Congratulations X!"
  elsif winner(board) === "O"
    puts "Congratulations O!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end


