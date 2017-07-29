
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
  counter = 0

  board.each do |xo|
    if xo == "X" || xo == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board) turn_count(board) % 2 == 0 ? "X" : "O" end

def won?(board)
  WIN_COMBINATIONS.detect do |array|
    board[array[0]] == board[array[1]] &&
    board[array[1]] == board[array[2]] &&
    position_taken?(board, array[0])
  end
end

def full?(board)
  WIN_COMBINATIONS.all? do |full_board|
    position_taken?(board, full_board[0]) &&
    position_taken?(board, full_board[1]) &&
    position_taken?(board, full_board[2])
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if win_positions = won?(board)
    board[win_positions[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
