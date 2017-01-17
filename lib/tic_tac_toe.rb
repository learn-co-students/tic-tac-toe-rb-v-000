WIN_COMBINATIONS = [
  [0, 1, 2], # TOP ROW
  [3, 4, 5], # MIDDLE ROW
  [6, 7, 8], # BOTTOM ROW
  [0, 3, 6], # FIRST COLUMN
  [1, 4, 7], # SECOND COLUMN
  [2, 5, 8], # THIRD COLUMN
  [0, 4, 8], # DESCENDING SLOPE
  [2, 4, 6]  # ASCENDING SLOPE
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
    input.to_i - 1
end

def move(board, index, value)
  board[index] = value
end

def position_taken?(board, index)
  if board[index] == " " ||  board[index] == "" || board[index] == nil
    return false
  elsif board[index] == "X" || board[index] == "O"
    return true
  end
end

def valid_move?(board, index)
 if position_taken?(board, index) == true
   return false
 elsif position_taken?(board, index) == false
   if index.between?(0, 8) == true
     return true
   else
     return false
   end
 end
end

def turn(board)
  puts "Please enter 1-9"
  input = gets.chomp
  index = input_to_index(input)
  if valid_move?(board, index) == true
    move(board, index, value = current_player(board))
  else
    puts "try again"
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |value|
    if value == "X" || value == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  if board.all?{|i| i == " "}
    return false
  end
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  end
  return false
end

def full?(board)
  if board.include?(" ")
    return false
  else
    return true
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  elsif full?(board) == false
    return false
  end
end

def over?(board)
  if won?(board) != false || full?(board) == true || draw?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != false
    return board[won?(board)[0]]
  end
end

def play(board)
  display_board(board)
  until over?(board) == true
    turn(board)
  end
  if won?(board) != false
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board) == true
    puts "Cats Game!"
  end
end
