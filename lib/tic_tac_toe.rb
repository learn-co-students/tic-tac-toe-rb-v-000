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

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(player_move)
  player_move.to_i - 1
end

def move(board, position, player_token)
  board[position] = player_token
end

def position_taken?(board, position)
  if board[position] == " " || board[position] == "" || board[position] == nil
    false
  else
    true
  end
end

def valid_move?(board, position)
  if position.between?(0,8) && !position_taken?(board, position)
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  player_move = gets.strip
  position = input_to_index(player_move)
  player_token = current_player(board)
  if valid_move?(board, position)
    move(board, position, player_token)
    display_board(board)
  else
    puts "Invalid move. Please enter 1-9:"
    player_move = gets.strip
  end
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
  end
end
  counter
end

def current_player(board)
  true == turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]] && position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  end

  if draw?(board)
    puts "Cat's Game!"
  end
end
