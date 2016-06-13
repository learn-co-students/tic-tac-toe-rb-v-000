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

def input_to_index(location)
  location.to_i-1
end

def move(board, location, player)
  board[location] = player
end

def position_taken?(board, location)
  if board[location] == " " || board[location] == ""
    false
  else
    true
  end
end

def valid_move?(board, location)
  location.between?(0,8) && !position_taken?(board, location)
end

def turn(board)
  "Where on the board would you like to move? 1-9: "
  user_move = gets.chomp
  location = input_to_index(user_move)
  if valid_move?(board, location)
    move(board, location, current_player(board))
    display_board(board)
  else
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
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |xy|
  position_1 = board[xy[0]]
  position_2 = board[xy[1]]
  position_3 = board[xy[2]]
  if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == 'O' && position_2 == 'O' && position_3 == 'O')
    return xy
  end
end
nil
end

def full?(board)
  board.all? {|location| location == "X" || location == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if winner = won?(board)
    board[winner.first]
  else
    nil
  end
end

def play(board)
  while !over?(board)
    turn(board)
  end
  if
    won?(board)
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cats Game!"
  end
end
