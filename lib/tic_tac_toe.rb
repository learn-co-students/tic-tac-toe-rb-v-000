WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
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

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, position)
  !(board[position] === " " || board[position] === "" || board[position] === nil)
end

def valid_move?(board, position)
  position.between?(0, 8) ? !position_taken?(board, position) : false
end

def turn(board)
  puts "Please enter number between 1 and 9"
  number = gets.strip
  index = input_to_index(number)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  board.count { |e| e === "O" || e === "X" }
end

def current_player(board)
  (turn_count(board) % 2) === 0 ? "X" : "O"
end

def won?(board)
  result = WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] === board[combo[1]] &&
    board[combo[1]] === board[combo[2]] &&
    position_taken?(board, combo[0])
  end
  !!result ? result : false
end

def full?(board)
  board.none? do |e|
    e === "" || e === " "
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if game_status = won?(board)
    board[game_status[0]]
  end
end

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
=begin
  if over?(board) && !draw?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  else
    turn(board)
    play(board)
  end
=end
end
