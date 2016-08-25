WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

input = ["1", "2", "3", "4", "5", "6" "7", "8", "9"]

def input_to_index(input)
   input.to_i - 1
end

def move(board, input, value)
  board[input] = value
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    true
  end
end

def valid_move?(board, index)
    if index.between?(0, 8)
      if !position_taken?(board, index)
        true
      else
    end
  end
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
  board.count {|space| space != " "}
end

def current_player(board)
  counter = 0
  if turn_count(board) % 2 == 0
    value = "X"
  else
    value = "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.find do |win_combo|
	if board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X"
        return win_combo
    elsif board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
        return win_combo
    else
      false
  	end
  end
end

def full?(board)
  board.all? do |positions|
    positions == "X" || positions == "O"
  end
end

def draw?(board)
!won?(board) && full?(board)
end

def over?(board)
  if won?(board) or full?(board)
    true
  end
end

def winner(board)
  WIN_COMBINATIONS.find do |win_combo|
	if board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X"
        return "X"
    elsif board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
        return "O"
    else
  	end
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if winner(board) == "O"
    puts "Congratulations O!"
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif draw?(board)
    puts "Cats Game!"
    end
  end
end
