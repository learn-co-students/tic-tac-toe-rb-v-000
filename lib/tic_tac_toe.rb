

  def display_board
      puts " #{board[0]} | #{board[1]} | #{board[2]} "
      puts "-----------"
      puts " #{board[3]} | #{board[4]} | #{board[5]} "
      puts "-----------"
      puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

    WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # Left vertical
    [1, 4, 7], # Middle vertical
    [2, 5, 8], # Right vertical
    [0, 4, 8], # Upper left diagonal
    [2, 4, 6] # Upper right diagonal
    ]

  end
