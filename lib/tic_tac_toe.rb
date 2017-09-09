WIN_COMBINATIONS = [
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8],
[0, 4, 8],
[6, 4, 2]
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

def move(board, index, char)
  board[index] = char
end

def position_taken?(board, index)
  if board[index] == " "
    false
  else
    true
  end
end

def valid_move?(board, index)
  if position_taken?(board, index) || !index.between?(0,8)
    false
  else
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, char = "X")
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |current_player|
    if current_player == "X" || current_player == "O"
      counter += 1
    end
    end
    counter
end

def current_player(board)
  if turn_count(board) == 4 % 2
    "X"
  elsif turn_count(board) == 15 % 2
    "O"
  else
    "X"
  end
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
  else
    false
  end
  end
end

def full?(board)
  if board.detect { |i| i.include?(" ") }
  false
else
  true
  end
end

def draw?(board)
  if won?(board)
    false
  else !full?(board)
    true
  end
end

def over?(board)
  if !full?(board)
    false
  else
    true
end
end

def winner(board)
  WIN_COMBINATIONS.detect do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return "X"
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return "O"
  else draw?(board)
    nil
  end
end
end

def play(board)
  input = gets
  until over?(board)
    turn(board)
end
  if draw?(board)
   puts "Cats Game!"
else won?(board)
  puts "Congratulations #{winner(board)}!"
 end
end
