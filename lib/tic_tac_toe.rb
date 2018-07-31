require 'pry'

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input = user_input.to_i - 1
  return user_input
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    true
  else
    false
  end
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0, 8)
    true
  else
    false
  end
end

def move(board, user_input, token)
  board[user_input] = token
end

def turn(board)
  puts "Please enter 1-9:"
  display_board(board)
  user_input = input_to_index(gets.strip)
  if valid_move?(board, user_input) == true
    move(board, user_input, current_player(board))
    display_board(board)
  else
    turn(board)
  end 
end

def turn_count(board)
  counter = board.count("X") + board.count("O")
  return counter
end

def current_player(board)
  if turn_count(board) == 1
    return "O"
  elsif turn_count(board) % 2 == 0
    return "X"
  else turn_count(board) % 3 == 0
    return "O"
  end
end

WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def won?(board)
  for combination in WIN_COMBINATIONS do
    if board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X" || board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O" 
      return combination
    end
  end
  return false
end

def full?(board)
  board.none? { |empty_index| empty_index == " "}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board) 
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) 
    board[won?(board)[0]]
  end
end

def play(board)
  until over?(board) do
    turn(board)
  end
    if won?(board) 
      win = winner(board)
      puts "Congratulations #{win}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end
end