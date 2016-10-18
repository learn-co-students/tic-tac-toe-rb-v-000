WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8],
  [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, input, char)
  board[input.to_i - 1] = char
end

def position_taken?(board, index)
  board[index] == "X" || board[index] == "O" ? true : false
end

def valid_move?(board, index)
  !position_taken?(board, index.to_i-1) && index.to_i.between?(1, 9) ? true : false
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(board, input)
    move(board, input, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  board.count{|x| x if x == "X" || x == "O"}
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    if board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X"
      win_combo
    elsif board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
      win_combo
    end
  end
end

def full?(board)
  board.include?(" ") ? false : true
end

def draw?(board)
  full?(board) && !won?(board) ? true : false
end

def over?(board)
  draw?(board) || won?(board) ? true : false
end

def winner(board)
  if win_combo = won?(board)
    board[win_combo[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end
