WIN_COMBINATIONS = [
  [0, 1, 2],  # Top row
  [3, 4, 5],  # Middle row
  [6, 7, 8],  # Bottom row
  [0, 3, 6],  # Left column
  [1, 4, 7],  # Middle column
  [2, 5, 8],  # Right column
  [0, 4, 8],  # Left diagonal
  [2, 4, 6]   # Right diagonal
]

def display_board(board)
  dash_lines = "-----------"

  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts dash_lines
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts dash_lines
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, player_token)
  board[index] = player_token
end

def position_taken?(board, index)
  board[index] != " "
end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter your move: 1 - 9"
  index = input_to_index(gets.chomp)

  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0

  board.each { |cell| count += 1 if cell == "X" || cell == "O" }

  count
end

def current_player(board)
  ( turn_count(board).even? ) ? "X" : "O"
end

def won?(board)
  win_combo = false

  WIN_COMBINATIONS.each do |combination|
    if board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X"
      win_combo = combination
    elsif board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
      win_combo = combination
    end
  end

  win_combo
end

def full?(board)
  board.all? { |element| element == "X" || element == "O" }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  won_by = won?(board)

  board[won_by[0]] if won_by
end

def play(board)

  until over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
