WIN_COMBINATIONS = [
  [0,1,2], # Horizontal Top Row
  [3,4,5], # Horizontal Middle Row
  [6,7,8], # Horizontal Bottom Row
  [0,3,6], # Vertical Left Row
  [1,4,7], # Vertical Middle Row
  [2,5,8], # Vertical Right Row
  [0,4,8], # Backward Slash
  [2,4,6] # Forward Slash
]

def display_board(board)
  pipesTop = " #{board[0]} | #{board[1]} | #{board[2]} "
  pipesMid = " #{board[3]} | #{board[4]} | #{board[5]} "
  pipesBot = " #{board[6]} | #{board[7]} | #{board[8]} "
  lines = "-----------"

  puts pipesTop
  puts lines
  puts pipesMid
  puts lines
  puts pipesBot
end

def input_to_index(input)
  index = input.to_i - 1
  return index
end

def move(board, index, token)
  board[index] = token
  return board
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    true
  end
end

def valid_move?(board, index)
  if index.between?(0,8) && !(position_taken?(board,index))
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)

  if valid_move?(board, index)
    board_update = move(board, index, current_player(board))
    return board_update
  else
    turn(board)
  end
end

def turn_count(board)
  counts = 0
  board.each do | turns |
    if turns == "X" || turns == "O"
      counts += 1
    end
  end
  return counts
end

def current_player(board)
  counter = turn_count(board)
  turn = counter.even? ? "X" : "O"
  return turn
end

def won?(board)
  if (board[0] == "X" && board[1] == "X" && board[2] == "X") || (board[0] == "O" && board[1] == "O" && board[2] == "O")
    return WIN_COMBINATIONS[0]
    #return true
  elsif (board[3] == "X" && board[4] == "X" && board[5] == "X") || (board[3] == "O" && board[4] == "O" && board[5] == "O")
    return WIN_COMBINATIONS[1]
    #return true
  elsif (board[6] == "X" && board[7] == "X" && board[8] == "X") || (board[6] == "O" && board[7] == "O" && board[8] == "O")
    return WIN_COMBINATIONS[2]
    #return true
  elsif (board[0] == "X" && board[3] == "X" && board[6] == "X") || (board[0] == "O" && board[3] == "O" && board[6] == "O")
    return WIN_COMBINATIONS[3]
    #return true
  elsif (board[1] == "X" && board[4] == "X" && board[7] == "X") || (board[1] == "O" && board[4] == "O" && board[7] == "O")
    return WIN_COMBINATIONS[4]
    #return true
  elsif (board[2] == "X" && board[5] == "X" && board[8] == "X") || (board[2] == "O" && board[5] == "O" && board[8] == "O")
    return WIN_COMBINATIONS[5]
    #return true
  elsif (board[0] == "X" && board[4] == "X" && board[8] == "X") || (board[0] == "O" && board[4] == "O" && board[8] == "O")
    return WIN_COMBINATIONS[6]
    #return true
  elsif (board[2] == "X" && board[4] == "X" && board[6] == "X") || (board[2] == "O" && board[4] == "O" && board[6] == "O")
    return WIN_COMBINATIONS[7]
    #return true
  else
    false
  end
end

def full?(board)
  if board.all?{|i| i == "X" || i == "O"}
    return true
  else
    return false
  end
end

def draw?(board)
  won = won?(board)
  full = full?(board)

  if won == false && full == true
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    false
  end
end

def winner(board)
  win_combination = won?(board)

  if win_combination == false
    return nil
  elsif board[win_combination[0]] == "X" || board[win_combination[0]] == "O"
    return board[win_combination[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
    display_board(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end
