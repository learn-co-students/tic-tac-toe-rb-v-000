WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # last row
  [0,3,6], # First Vertical
  [1,4,7], #Second Vertical
  [2,5,8], #Third Vertical
  [0,4,8], # First diagnol
  [2,4,6]  #Second diagnol
  ]
  
  board = [" "," "," "," "," "," "," "," "," "]
  
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
  
  def move(array, index, player == "X" || "O")
    board[index] = player
  end
  
  def position_taken?(board, index)
    board[index] == "X" || board[index] == "O" ? true : false
  end
  
  def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index)
  end

    