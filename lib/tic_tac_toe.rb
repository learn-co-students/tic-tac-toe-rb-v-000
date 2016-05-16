
WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Vertical left
  [1, 4, 7], # Vertical middle
  [2, 5, 8], # Vertical right
  [0, 4, 8], # Diagonal left
  [2, 4, 6] # Diagonal right
]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, position, player_token)
  position = position - 1
  board[position] = player_token
end

def position_taken?(board, position)
  if board[position] == "O" || board[position] == "X"
    true
  elsif board[position] == nil || board[position] == " "
    false
  end
end

def valid_move?(board, position)
  position = position.to_i
  if position.between?(1, 9) && !(position_taken?(board, (position - 1)))
    true
  end
end
