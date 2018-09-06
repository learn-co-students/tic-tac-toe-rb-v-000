def play(board)
  while !over?(board)
    turn(board)
  end
  if winner(board) != nil
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    puts "Invalid input. Please enter 1-9"
    turn(board)
  end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def valid_move?(board, index)
  if index >= 0 && index < 9
    if position_taken?(board, index)
      return false
    else
      return true
    end
  else
    return false
  end
end

def move(board, index, token)
  board[index] = token
  return board
end

def input_to_index(input)
  index = input.to_i - 1
end

def turn_count(board)
  turn_count = 0
  board.each do |cell|
    if cell == "X" || cell == "O"
        turn_count += 1
    end
  end
  return turn_count
end

def current_player(board)
  turn_count = turn_count(board)
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else
    return true
  end
end

def won?(board)
  win_comb = []
  win_check = 0
  WIN_COMBINATIONS.each do |comb|
    pos1 = comb[0]
    pos2 = comb[1]
    pos3 = comb[2]
    if (board[pos1] == "X" && board[pos2] == "X" && board[pos3] == "X") || (board[pos1] == "O" && board[pos2] == "O" && board[pos3] == "O")
      win_comb = comb
      win_check = 1
    end
  end
  if win_check > 0
    return win_comb
  else
    return false
  end
end

def full?(board)
  if turn_count(board) == 9
    return true
  else
    return false
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
  if !!won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if !won?(board)
    return nil
  else
    a = won?(board)
    return board[a[0]]
  end
end
