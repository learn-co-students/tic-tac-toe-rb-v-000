WIN_COMBINATIONS = [
  [0, 1, 2], #top-row
  [3, 4, 5], #mid-row
  [6, 7, 8], #bottom-row
  [0, 3, 6], #left-col
  [1, 4, 7], #mid-col
  [2, 5, 8], #right-col
  [0, 4, 8], #top-left to btm-right
  [2, 4, 6]  #top-right to btm-left
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input = user_input.to_i
  user_input - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  if (board[index] == " " || board[index] == "" || board[index] == nil)
    false
  elsif (board[index] == "X" || board[index] == "O")
    true
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && !position_taken?(board, index)
    true
  else
    false
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
  counter = 0

  board.each do |char|
    if char == "X" || char == "O"
    counter += 1
    end
  end
  counter
end

def current_player(board)
  turn_count(board).odd? ? "O" : "X"
end

def won? (board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      win_combination
    else
      false
    end

  end
end

def full?(board)
  board.none? {|board_index| board_index == " " || board_index == ""}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

def play (board)
  while !over?(board) && !draw?(board)
    turn(board)
  end

  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  else
    puts "Cat's Game!"
  end
end
