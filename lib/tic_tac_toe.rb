# Define your WIN_COMBINATIONS constant
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
  print "  #{board[0]} | #{board[1]} | #{board[2]} \n"
  print " -----------\n"
  print "  #{board[3]} | #{board[4]} | #{board[5]} \n"
  print " -----------\n"
  print "  #{board[6]} | #{board[7]} | #{board[8]} \n"
end

def move(board, position, value ="X")
  board[position.to_i - 1] = value
  return board
end

def position_taken?(board, position)
  if board[position] == " " || board[position] == "" || board[position] == nil
    return false
  else
    return true
  end
end

def valid_move?(board, position)
  position = position.to_i - 1
  if position.between?(0, 8) && !(position_taken?(board, position))
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(board, input) == true
    move(board, input, current_player(board))
  else puts "Please enter 1-9:"
    input = gets.strip
    move(board, input, current_player(board))
  end
  display_board(board)
end

def turn_count(board)
  turn_count = 0
  board.each do |value|
    if value != " "
      turn_count += 1
    end
  end
  return turn_count
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end


def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if (combo.all? {|index| board[index] == "X"}) || (combo.all? {|index| board[index] == "O"})
      return combo
    end
  end
  return false
end

def over?(board)
  won?(board) || draw?(board)
end

def full?(board)
  board.each.all? {|value| value == "X" || value == "O"}
end

def draw?(board)
  full?(board) && won?(board) == false
end

def winner(board)
  return board[won?(board).first] if won?(board)
end

def play(board)
  if !(over?(board))
    turn(board)
    play(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  end
  if draw?(board)
    puts "Cats Game!"
  end
end
