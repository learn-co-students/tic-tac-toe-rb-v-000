WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def display_board(board)
  puts (" #{board[0]} | #{board[1]} | #{board[2]} ")
  puts "-----------"
  puts (" #{board[3]} | #{board[4]} | #{board[5]} ")
  puts "-----------"
  puts (" #{board[6]} | #{board[7]} | #{board[8]} ")
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, position, player_token)
  board[position] = player_token
end

def position_taken?(board, position)
  board[position] == "X" || board[position] == "O"
end

def valid_move?(board, position)
  !position_taken?(board, position) && position.between?(0, 8)
end

def turn(board)
  puts "Please enter 1-9 to make your move."
  user_input = gets.chomp
  position = input_to_index(user_input)
  player_token = current_player(board)
  if valid_move?(board, position)
    move(board, position, player_token)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |token|
    if token != " "
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    position_1 = board[combo[0]]
    position_2 = board[combo[1]]
    position_3 = board[combo[2]]

    position_1 == "X" && position_2 == "X" && position_3 == "X" ||
    position_1 == "O" && position_2 == "O" && position_3 == "O"
  end
end

def full?(board)
  #!won?(board) && turn_count(board) == 9
  board.all? do |token|
    token == "X" || token == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if winner(board)
    winning_player = winner(board)
    puts "Congratulations #{winning_player}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
