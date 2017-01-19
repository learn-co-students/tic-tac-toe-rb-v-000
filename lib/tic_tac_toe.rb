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

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, value)
  board[index] = value
end

def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
  position_taken?(board, index) != true &&
  index >= 0 && index <= 8
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
    board
  else valid_move?(board, index) == false
    turn(board)
  end
end

def turn_count(board)
  board.count {|board| board != " "}
end

def current_player(board)
  if turn_count(board).even?
    "X"
  elsif turn_count(board).odd?
    "O"
  end
end

def won?(board)
  x_moves = board.each_index.select { |x_moves| board[x_moves] == "X" }
  o_moves = board.each_index.select { |o_moves| board[o_moves] == "O" }
  WIN_COMBINATIONS.detect { |win_array|
    win_array.all? { |ary_index| x_moves.include?(ary_index) } ||
    win_array.all? { |ary_index| o_moves.include?(ary_index) }
  }
end

def full?(board)
  board.all? {|i| i == "X" || i == "O"}
end

def draw?(board)
  won?(board) == nil && full?(board) == true
end

def over?(board)
  won?(board) != nil || draw?(board)
end

def winner(board)
  if won?(board) != nil
    board[won?(board)[0]]
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
