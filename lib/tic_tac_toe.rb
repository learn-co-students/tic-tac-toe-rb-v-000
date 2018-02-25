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
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(array, position, value)
  array[position.to_i - 1] = value
end

def position_taken?(board, position)
  if board[position] == " " || board[position] == "" || board[position] == nil
    false
  else board[position] == "X" || board[position] == "O"
    true
  end
end

def valid_move?(board, position)
  position = position.to_i - 1
  if position.between?(0,8)
    if !position_taken?(board, position)
      true
    end
  end
end

def turn(board)
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(board, position)
    move(board, position, current_player(board))
    display_board(board)
  else !valid_move?(board, position)
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
 if turn_count(board) % 2 == 0
   player = "X"
 else turn_count(board) % 2 == 1
   player = "O"
 end
 return player
end

def won?(board)
  WIN_COMBINATIONS.each do |position|
    if (board[position[0]] == "X" && board[position[1]] == "X" && board[position[2]] == "X") || (board[position[0]] == "O" && board[position[1]] == "O" && board[position[2]] == "O")
      return position
    end
  end
  false
end

def full?(board)
  board.each do |position|
    if board[position.to_i-1] == " " || board[position.to_i-1] == ""
      return false
    else
      return true
    end
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    return true
  else
    false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

def play(board)
  until (over?(board) || won?(board))
    turn(board)
    end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cats Game!"
  end
end
