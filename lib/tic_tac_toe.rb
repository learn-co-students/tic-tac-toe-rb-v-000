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

def display_board(board)
  puts " #{board[0]} " + "|" + " #{board[1]} " + "|" + " #{board[2]} "
  puts "-----------"
  puts " #{board[3]} " + "|" + " #{board[4]} " + "|" + " #{board[5]} "
  puts "-----------"
  puts " #{board[6]} " + "|" + " #{board[7]} " + "|" + " #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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

def turn_count(board)
  board.count {|token| token != " "}
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def all_won?(board, token, win_combo)
  win_combo.all? do |position|
    board[position] == token
  end
end

def full?(board)
  board.all? {|token| token == "X" || token == "O"}
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  won?(board) ||  draw?(board) || full?(board) ? true : false
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if all_won?(board, "X", combo)
      return combo
    elsif all_won?(board, "O", combo)
      return combo
    end
  end
  else
    false
end

def all_won?(board, token, win_combo)
  win_combo.all? do |position|
    board[position] == token
  end
end

def winner(board)
  if over?(board)
    return board[won?(board).first]
  else
    nil
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board) != false
    puts "Congratulations " + winner(board) + "!"
  end
  if draw?(board)
    puts "Cats Game!"
  end
end
