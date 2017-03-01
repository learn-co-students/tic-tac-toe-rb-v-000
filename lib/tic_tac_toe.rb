
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
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
  if board[index] = " "
    board[index] = character
  end
end

def position_taken?(board, index)
  if board[index] == " "
    false
  elsif board[index] == ""
    false
  elsif board[index] == nil
    false
  else
    true
  end
end

def valid_move?(board, index)
  index = index.to_i
  if index.between?(0, 8) && !position_taken?(board, index)
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index) && turn_count(board).even?
    move(board, index, character="X")
  elsif valid_move?(board, index) && turn_count(board).odd?
    move(board, index, character="O")
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |taken|
    if taken == "X"
      counter += 1
    elsif taken == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win = win_combination.all? do |index|
      board[index] == "X"
    end
    if win
      return win_combination
    end
    win = win_combination.all? do |index|
      board[index] == "O"
    end
    if win
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.all? do |index|
  if index == "X"
    true
  elsif index == "O"
    true
  else
    false
end
end
end

def draw?(board)
  if !(won?(board)) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  return nil if !(won?(board))
  return "X" if board[won?(board)[0]] == "X"
  return "O" if board[won?(board)[0]] == "O"
end

def play(board)
  until over?(board) == true
    turn(board)
  end

  if draw?(board)
    puts "Cats Game!"
  elsif winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
end
end
