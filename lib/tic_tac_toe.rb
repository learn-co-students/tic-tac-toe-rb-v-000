WIN_COMBINATIONS = [
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8],
[0, 4, 8],
[2, 4, 6]
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
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  valid_move?(board, index)
if valid_move?(board, index) == true
  move(board, index, current_player(board))
  display_board(board)
else
  until valid_move?(board, index) == true
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  valid_move?(board, index)
end
end
end

def turn_count(board)
  counter = 0
  board.each do |turns|
    if turns == "X"
      counter += 1
    elsif turns == "O"
      counter += 1
    else counter += 0
  end
end
  counter
end

def current_player(board)
  turn_count(board)
  if turn_count(board) % 2 == 0
    "X"
  else "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination_array|
    win_index_1 = win_combination_array[0]
    win_index_2 = win_combination_array[1]
    win_index_3 = win_combination_array[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == position_2 && position_2 == position_3 && position_1 != " "
      win_combination_array
    end
  end
end

def full?(board) #accept a board and return true if every element in the board contains either an "X" or an "O"
  board.all? do |square|
    if square == "X" || square == "O"
      true
    end
  end
end

def draw?(board)
  if won?(board) == nil && full?(board) == true
    true
  end
end

def over?(board)
  if draw?(board) == true || won?(board) == true || full?(board) == true
    true
  end
end

def winner(board)
  WIN_COMBINATIONS.detect do |win_combination_array|

  win_index_1 = win_combination_array[0]
  win_index_2 = win_combination_array[1]
  win_index_3 = win_combination_array[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]

    if position_1 == position_2 && position_2 == position_3 && position_1 == "X"
  return "X"
    elsif position_1 == position_2 && position_2 == position_3 && position_1 == "O"
  return "O"
    end
end
end

def play(board)
  puts "Please enter 1-9:"
  while !over?(board)
  turn(board)
end
  if over?(board) == true && won?(board) == true && winner(board) == "X"
    puts "Congratulations, X!"
  elsif over?(board) == true && won?(board) == true && winner(board) == "O"
    puts "Congratulations, O!"
  elsif over?(board) == true && draw?(board) == true
    puts "Cats Game!"
  elsif over?(board) == true
    puts "Cats Game!"
  end
end
