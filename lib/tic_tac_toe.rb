WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, position, token)
  board[position.to_i - 1] = token
end

def position_taken?(board, position)
  if board[position] == "X" || board[position] == "O"
    true
  else
    false
  end
end

def valid_move?(board, position)
  position = position.to_i - 1
  if !position_taken?(board, position) && position.between?(0, 8)
    true
  else
    false
  end
end

def turn_count(board)
  board.count do |x|
    if x == "X" || x == "O"
      x
    end
  end
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def turn(board)
  puts "Please choose between 1-9:"
  input = gets.strip
  if valid_move?(board, input)
    move(board, input, current_player(board))
  else
    puts "invalid choice, please try again!"
    turn(board)
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    if board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X"
      true
    elsif board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
      true
    else
      false
    end
  end
end

def full?(board)
  if board.detect{|x| x == " "}
    false
  else
    true
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board) && current_player(board) == "X"
    "O"
  elsif won?(board) && current_player(board) == "O"
    "X"
  elsif !draw?(board)
    nil
  end
end

def play(board)
  while !over?(board)
    display_board(board)
    turn(board)
  end
  display_board(board)
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
