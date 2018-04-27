WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5]  # Middle row
  # ETC, an array for each win combination
]

board = [" "," "," "," "," "," "," "," "," "]
display_board(board)

def turn
  def input_to_index(move)
  move.to_i-1
  end
  
  def valid_move?(board, index)
  index.between?(0, 8) && !(position_taken?(board, index))
  end 

  def position_taken?(board, index)
 !(board[index] == " " || board[index] == "" || board[index] == nil)
  end
end

def turn_count
end
