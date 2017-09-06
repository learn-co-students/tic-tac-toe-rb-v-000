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
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, input, char)
  board[input] = char
end

def position_taken?(board, input)
  if board[input] == "X" || board[input] == "O"
    true
  else
    false
  end
end

def valid_move?(board, input)
  if (input >= 0 && input <= 8) && position_taken?(board, input) == false
    true
  end
end

def turn(board)
  puts "#{current_player(board)}'s turn! Please enter 1-9:"
  player_move = gets.strip
  move_index = input_to_index(player_move)
  if valid_move?(board, move_index) == true
    move(board, move_index, current_player(board))
  else
    puts "Please enter a valid input."
    turn(board)
  end
end

def turn_count(board)
  i = 0
  board.each do |index|
    if index == "X" || index == "O"
      i += 1
    end
  end
  i
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |key|
    board[key[0]] == board[key[1]] &&
    board[key[1]] == board[key[2]] &&
    position_taken?(board, key[0])
  end
end

def full?(board)
  board.all? do |space|
    space == "X" || space == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if win = won?(board)
    board[win.first]
  end

end

def play(board)
  while !over?(board)
    turn(board)
    display_board(board)
  end
  if draw?(board)
    puts "Cat's Game!"
  else
    puts "Congratulations #{winner(board)}!"
  end
end
