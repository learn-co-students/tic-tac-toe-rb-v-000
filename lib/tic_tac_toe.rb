
WIN_COMBINATIONS = [
   [0,1,2], [3,4,5], [6,7,8], #Rows
   [0,3,6], [1,4,7], [2,5,8], #Columns
   [0,4,8], [2,4,6] #Diagonals
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

  def move(board, index, current_player)
    board[index] = current_player
  end

  def valid_move?(board, index)
    if !position_taken?(board, index) && index.between?(0, 8)
      true
    else
      false
    end
  end

  def position_taken?(board, index)
    if board[index] == "" || board[index] == " " || board[index] == nil
      false
    else
      true
    end
  end

  def turn(board)
    puts "Please enter 1-9:"
    user_input = gets.chomp
    index = input_to_index(user_input)
    if valid_move?(board, index)
      move(board, index, current_player(board))
    else
      puts "Please enter 1-9:"
      user_input = gets.chomp
    end
    display_board(board)
  end

  def turn_count(board)
    board.count { |y| y == "X" || y == "O"}
  end

  def current_player(board)
    turn_count(board).even? ? "X" : "O"
  end

  def won?(board)
    WIN_COMBINATIONS.detect do |win_combination|
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
  end

  def full?(board)
    if board.all?{|x| x == "X" || x == "O"}
      true
    else
      false
    end
  end

  def draw?(board)
    if full?(board) && !won?(board)
      true
    elsif won?(board)
      false
    end
  end

  def over?(board)
    if won?(board) || draw?(board)
      true
    else
      false
    end
  end

  def winner(board)
      winning_combo = won?(board)
    if won?(board)
      board[winning_combo[0]]
    else
      nil
    end
  end

  def play(board)
    until over?(board)
      turn(board)
    end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end
  end
