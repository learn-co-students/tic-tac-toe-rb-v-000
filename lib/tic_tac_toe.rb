
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
  puts " ----------- "
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts " ----------- "
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  if (board[index] == " " || board[index] == "" || board[index] == nil)
    false
  else
    true
  end
end

def valid_move?(board, index)
  if index.between?(1, 9) && !position_taken?(board, index)
    true
  else
    false
  end
  index.between?(0, 8) && !position_taken?(board, index)
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
      puts "That was an invalid move. Please enter 1-9:"
    end
end

def turn_count(board)
  counter = 0
    board.each do |space|
      if space == "X" || space == "O"
    counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board).even?
    current_player = "X"
  else
    current_player = "O"
  end
  current_player
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]
        position_1 = board[win_index_1]
        position_2 = board[win_index_2]
        position_3 = board[win_index_3]
    if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
      return win_combo
    end
  end
  false
end

def full?(board)
  if board.include?(' ') || board.include?('')
    return false
  else
    return true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    false
  end
end

def winner(board)
  if won?(board)
    index = won?(board)[0]
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
    puts "Cat's Game!"
  end
end
