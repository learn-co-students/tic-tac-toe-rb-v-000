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
  
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

display_board(board)

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if (index.between?(0, 8) && position_taken?(board, index) == false)
    true
  else
    false 
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
  elsif valid_move?(board, index) == false
    turn(board)
  end
display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if (turn == "X" || turn == "O")
    counter += 1 
    end 
  end
  counter
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.find do |win_combo|
    board[win_combo[0]] == board[win_combo[1]] && board[win_combo[1]] == board[win_combo[2]] && position_taken?(board, win_combo[0])
  end
end

def full?(board)
  board.all? do |token|
    if (token == "X" || token == "O")
    true 
    else 
    false 
    end
  end
end

def draw?(board)
  won?(board) == nil && full?(board) == true
  end

def over?(board)
  if (won?(board) || draw?(board) || full?(board)) || (won?(board) && !full?(board))
    true
  elsif (!won?(board) || !draw?(board) || !full?(board))
    false
  end
end

def winner(board)
  if won?(board) == nil
    nil 
  elsif board[won?(board)[0]] == "X"
    "X"
  elsif board[won?(board)[0]] == "O"
    "O"
  end
end

def play(board)
  until over?(board)
    turn(board)
  end 
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end 
end 