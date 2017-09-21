
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(value)
  integer = value.to_i
  index = integer - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    true
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && position_taken?(board, index) != true
    true
  else
    false
  end
end

def turn_count(board)
  count = 0
  board.each do |character|
    if character == "X" || character == "O"
      count += 1
    end
  end
  return count
end

def current_player(board)
  turn = turn_count(board)
  player = turn.even? ? "X" : "O"
    return player
end

def turn(board)
  puts "Please enter 1-9:"
  character = current_player(board)
  input = gets.strip
  play = input_to_index(input)
  if valid_move?(board, play) == true
    move(board, play, character)
    display_board(board)
  else
    turn(board)
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if combo.all? {|token| board[token] == "X"}
      return combo
    elsif combo.all? {|token| board[token] == "O"}
      return combo
    end
  end
  return false
end

def full?(board)
  if board.all? {|move| move == "X" || move == "O"}
    return true
  else
    return false
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) != false || draw?(board) == true || full?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  combo = won?(board)
  if over?(board) == true && combo.all? {|token| board[token] == "X"}
    return "X"
  elsif over?(board) == true && combo.all? {|token| board[token] == "O"}
    return "O"
  else
    return nil
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  if won?(board) != false
    player = winner(board)
    puts "Congratulations #{player}!"
  elsif draw?(board) == true
    puts "Cats Game!"
  end
end
