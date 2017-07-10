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

board = [" "," "," "," "," "," "," "," "," "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  user_input = input.to_i
  index = user_input - 1
end

def move(board, index, xo)
   board[index] = xo
end

def position_taken?(board, index)
  (board[index]==" " || board[index]=="" || board[index]==nil) ?
    false : true
end

def valid_move?(board,index)
  position_taken?(board,index)==false && index.between?(0,8) ?
    true : false
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets
  index = input_to_index(input)
  xo = current_player(board)
  if valid_move?(board, index)
    move(board, index, xo)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turn_counter = 0
  board.each do |board_space|
    if board_space == "X" || board_space == "O"
    #if board_space != " "
      turn_counter+=1
    end
  end
  return turn_counter
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
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
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  false
end

def full?(board)
  board.all? do |space|
    space == "X" || space == "O"
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
  end
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
