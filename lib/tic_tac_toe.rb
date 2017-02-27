
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def display_board(board)

  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "

end

def input_to_index(input)
  int = input.to_i - 1

  return int
end

def move(board, index, value)
  board[index] = value
end

def position_taken?(board, index)

  case board[index]
  when " ", "", nil then false
  when "X", "O" then true
  end

end

def valid_move?(board, index)

  if index.between?(0, 8)
    if !position_taken?(board, index)
      true
    end
  end

end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    value = turn_count(board) % 2 == 0 ? "X" : "O"
    move(board, index, value)
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
  WIN_COMBINATIONS.detect do |win_combo|
    board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X" ||
    board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
  end
end

def full?(board)
  board.all? { |spaces| spaces == "X" || spaces == "O" }
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  winner = won?(board)

  if winner.nil?
    nil
  elsif board[winner[0]] == "X"
    return "X"
  elsif board[winner[0]] == "O"
    return "O"
  end

end

def play(board)
  until over?(board)
    value = turn_count(board)
    turn(board)
  end

  puts "Cats Game!" if draw?(board)
  puts "Congratulations #{winner(board)}!" if won?(board)

end
