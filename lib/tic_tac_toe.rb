# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],  # Top Row
  [3, 4, 5],  # Middle Row
  [6, 7, 8],  # Bottom Row
  [0, 3, 6],  # First Column
  [1, 4, 7],  # Second Column
  [2, 5, 8],  # Third Column
  [0, 4, 8],  # Diagonal right
  [2, 4, 6]   # Diagonal left
  ]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, position, token = "X")
  board[position.to_i - 1] = token
end

def position_taken?(board, position)
  board[position] != " " || board[position] == "" || board[position] == nil
end

def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i - 1)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip

  if valid_move?(board, input)
    move(board, input, current_player(board))
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  board.count{|token| token == "X" || token == "O"}
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |wins|
    if board[wins[0]] == "X" && board[wins[1]] == "X" && board[wins[2]] == "X"
      wins
    elsif board[wins[0]] == "O" && board[wins[1]] == "O" && board[wins[2]] == "O"
      wins
    else
      false
    end
  end
end

def full?(board)
  # if board is " "
  board.all? do |pos|
    if pos == "X" || pos == "O"
      true
    else
      false
    end
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  WIN_COMBINATIONS.detect do |wins|
    if board[wins[0]] == "X" && board[wins[1]] == "X" && board[wins[2]] == "X"
      return "X"
    elsif board[wins[0]] == "O" && board[wins[1]] == "O" && board[wins[2]] == "O"
      return "O"
    end
  end
end

def play(board)
  while !over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end


