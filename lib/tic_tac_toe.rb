WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]]

  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def valid_move?(board, position)
     if !position_taken?(board, position.to_i - 1) && position.to_i.between?(1, 9)
       return true
  end
    if position_taken?(board, position.to_i - 1)
      return false
    end
  end

  def position_taken?(board, position)
    position = position.to_i
    if board[position] == " " || board[position] == "" || board[position] == nil
      return false
    end
    if board[position] == "X" || board[position] == "O"
      return true
    end
  end

  def move(board, position, value = "X")
    board[position.to_i - 1] = value
  end

  def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(board, input)
      move(board, input, current_player(board))
      display_board(board)
    else
      turn(board)
    end
  end

  def turn_count(board)
    counter = 0
    board.each do |value|
      if value == "X" || value == "O"
        counter += 1
      end
     end
    counter
  end

  def current_player(board)
    turn_number = turn_count(board)
    if turn_number.even?
      return "X"
      else
      return "O"
    end
  end
  def won?(board)
   if empty?(board)
     return false
   end

 WIN_COMBINATIONS.each do |win|
  win_index_1 = win[0]
  win_index_2 = win[1]
  win_index_3 = win[2]
  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
     if position_1 == "X" && position_2 == "X" && position_3 == "X"
       return win
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
       return win
      end
   end
    if full?(board)
      return false
    end
  end

def empty?(board)
   if board.reject{|i| i == " "} == []
    return false
  end
end

  def full?(board)
    if board.select{|i| i == " "} == []
      return true
    end
   end

  def draw?(board)
    if won?(board)
      return false
    end
    if !won?(board) && full?(board)
       return true
    end
    if !won?(board) && !full?(board)
      return false
    end
  end

  def over?(board)
    if won?(board)
      return true
    end
    if draw?(board)
       return true
    end
    if !won?(board) && !draw?(board)
      return false
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
  if draw?(board)
  puts "Cats Game!"
  elsif won?(board)
    puts "Congratulations #{winner(board)}!"
  end
end