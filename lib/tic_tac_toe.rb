WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # top left to bottom right diagnol
  [2,4,6] # top right to bottom left diagnol
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

def move(board, position, token)
  board[position] = token
end

def position_taken?(board, index)
  !(board[index] == " ")
end

def valid_move?(board,index)
  index.between?(0,9) && !position_taken?(board, index)
end

def turn(board)
  user_input = gets.chomp
  index = input_to_index(user_input)
  if valid_move?(board, index)
    token = current_player(board)
    move(board, index, token)
  else
    turn(board)
  end
end

def turn_count(board)
  9 - board.count(" ")
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do|win_combination|
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
else
  return false
end

def full?(board)
  if board.any?{|moves| moves == " "}
    return false
  else
    return true
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    return board[winning_combo.first]
  end
end

def play(board)
  until over?(board)
    display_board(board)
    turn(board)
  end
end
