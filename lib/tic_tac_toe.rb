WIN_COMBINATIONS = [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,4,8],
   [2,4,6],
   [0,3,6],
   [1,4,7],
   [2,5,8],
]

def display_board(board)
  puts " #{board[0]} " '|' " #{board[1]} " '|' " #{board[2]} "
  puts "-----------"
  puts " #{board[3]} " '|' " #{board[4]} " '|' " #{board[5]} "
  puts "-----------"
  puts " #{board[6]} " '|' " #{board[7]} " '|' " #{board[8]} "
end

board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
display_board(board)

def input_to_index(user_input)
  user_input = user_input.to_i - 1
end

def move(board, index, value)
  board[index] = value
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    true
  else
    false
  end
end

def valid_move?(board, index)
  if !position_taken?(board,index) && index.between?(0,8)
    true
  else
    false
  end
end

def turn(board)
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
  board.each do  |player|
    if player == "X" || player == "O"
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
  WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
  elsif
    position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  end
end
  else
    false
end

def full?(board)
  board.all? do |full_board| full_board == "X" || full_board == "O"
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
if won?(board) || draw?(board) || full?(board)
  return true
  end
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
end
if won?(board)
  puts "Congratulations #{winner(board)}!"
else
  draw?(board)
  puts "Cats Game!"
end
end
