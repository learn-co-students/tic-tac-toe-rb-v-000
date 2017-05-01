WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
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

  def move(board, index, player)
    board[index] = player
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
      move(board, index, current_player(board))
      display_board(board)
    else
      turn(board)
    end
  end

  def turn_count(board)
  counter = 0
  board.each do |token| # " ", "X", "O"
  if token != " "
    counter += 1
  end

  end
  counter
  end

  def current_player (board)
    turn_count(board) % 2
    if turn_count(board).even?
      "X"
    else
      "O"
    end
  end

  def won?(board)

  WIN_COMBINATIONS.detect do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]



    if board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X"
      return win_combo # return the win_combination indexes that won.
    elsif board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O"
        return win_combo # return the win_combination indexes that won.
    else
      false
    end

    end
  end
  def full?(board)
  board.all? {|token| token == "X" || token == "O" }
  end

  def draw?(board)
  !won?(board) && full?(board)
  end

  def over?(board)
    won?(board) || full?(board) || draw?(board)
  end

  def winner(board)
    WIN_COMBINATIONS.detect do |win|
      win_index_1 = win[0]
      win_index_2 = win[1]
      win_index_3 = win[2]



      if board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X"
        return "X" # return the win_combination indexes that won.
      elsif board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O"
          return "O"# return the win_combination indexes that won.
      else
        false
      end
  end
  end

def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
