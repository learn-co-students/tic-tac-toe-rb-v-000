WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board = [" "," "," "," "," "," "," "," "," "])
  puts " #{board[0]} | #{board[1]} | #{board[2]} \n"
  puts "-----------\n"
  puts " #{board[3]} | #{board[4]} | #{board[5]} \n"
  puts "-----------\n"
  puts " #{board[6]} | #{board[7]} | #{board[8]} \n"
end

def input_to_index(x)
   user_input = x.to_i - 1
end

def move (board, index, value)
  board[index] = value
end

def valid_move?(board, index)
  return true if index.between?(0,8) && position_taken?(board, index) == false
end

def position_taken?(board, index)
  return false if [" ", "", nil].include?(board[index])
  return true if ["X", "O"].include?(board[index])
end

def turn(board)
  puts "Please enter 1-9:"
  number = gets.strip
  index = input_to_index(number)


  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
    count += 1
    end
  end
  count
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if (board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X") ||
    (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")
    return win_combination
    else
      false
    end
  end
  false
end

def full?(board)
  if board.include?(" ")
    return false
  else
    true
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  elsif won?(board) == false && full?(board) == false
    return false
  else
    false
  end
  false
end

def over?(board)
  if draw?(board) == true
    return true
  elsif won?(board) != false
    return true
  elsif full?(board) == false
    return false
  else
    false
  end
  false
end

def winner(board)
  WIN_COMBINATIONS.each do |win_combination|
    if (board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X")
      return "X"
    elsif (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")
      return "O"
    else
      nil
    end
  end
  nil
end

def play(board)

  until over?(board) == true
    turn(board)
  end

  if draw?(board) == true
    puts "Cats Game!"
  elsif winner(board) == "X"
    puts "Congratulations X!"
  else
    puts "Congratulations O!"
  end
end
