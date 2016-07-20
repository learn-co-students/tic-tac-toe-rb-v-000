board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

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

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  elsif board[index] == "X" || board[index] == "O"
    return true
  end
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
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

def gamer(board)
  for i in 1..9 do 
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

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
  ]

def won?(board)
 WIN_COMBINATIONS.select do |win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
    return win_combination
    end
      if board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
    return win_combination
    end
  end
  return false if board.empty?
end

def full?(board)
 board.all? do |full_board|
  full_board == "X" || full_board == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
won?(board) || draw?(board)
end

def winner(board)
 WIN_COMBINATIONS.select do |win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
      return "X"
    end
      if board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
        return "O"
    end
  end
    board.all? do |full_board|
  full_board == "X" || full_board == "O"
  end
  return nil
end

def play(board)
until over?(board)
  turn(board)
  end
  won?(board)
  puts "Congratulations X!" if winner(board) == "X"
  puts "Congratulations O!" if winner(board) == "O"
  if draw?(board)
    puts "Cats Game!"
  end
end


























