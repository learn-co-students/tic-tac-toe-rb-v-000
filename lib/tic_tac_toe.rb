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
  board[index] = "#{char}"
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else board[index] == "X" || board[index] == "O"
    true
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && position_taken?(board, index) == false || nil
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets
  index = input_to_index(input)
  char = current_player(board)
  if valid_move?(board, index)
    move(board, index, char)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |moves_made|
    if moves_made != " "
      counter += 1
    end
  end
  counter
end

def current_player(board)
  turn_count(board) % 2 == 0 || turn_count(board) == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  end
  end
  return false
end

def full?(board)
    board.none? do |value|
    value == " "
  end
end

def draw?(board)
  x = won?(board)
  y = full?(board)
  if x == false && y == true
    true
  end
end

def over?(board)
  if won?(board) != false || draw?(board) == true || full?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != false
    indexes = won?(board)
    token = indexes[0]
    return board[token]
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  if draw?(board) == true
    puts "Cats Game!"
  else
    puts "Congratulations #{winner(board)}!"
  end
end
