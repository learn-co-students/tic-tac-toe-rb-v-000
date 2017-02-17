WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
    index = input.to_i-1
end

def move(board, index, token)
    board[index] = token
  end

  def position_taken?(board, index)
    !(board[index].nil? || board[index] == " ")
  end

  def valid_move?(board,index)
    index.between?(0,8) && !position_taken?(board,index)
  end

  def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board,index)
      move(board, index, current_player(board))
      display_board(board)
    else
      turn(board)
      display_board(board)
    end
  end

  def turn_count(board)
    count = 0
    board.each do |x|
      if x != (" ")
        count += 1
      end
    end
    count
  end

  def current_player(board)
    if turn_count(board).even?
      "X"
    else
       "O"
     end
  end

  def won?(board)
   WIN_COMBINATIONS.detect do |win_combo|
     if board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X"
     return win_combo
   elsif board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
     return win_combo
      end
    end
  end

  def full?(board)
    board.all? do |i|
      i == "X" || i == "O"
    end
  end

  def draw?(board)
    if !won?(board) && full?(board)
    true
   else
    false
   end
  end

  def over?(board)
    if draw?(board) || full?(board) || won?(board)
      true
    else
      false
    end
  end

  def winner(board)
    if winning_combo = won?(board)
      index = winning_combo.first
      board[index]
    end
  end

def play(board)
  until over?(board)
    turn(board)
  end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    else
      puts "Cats Game!"
  end
end
