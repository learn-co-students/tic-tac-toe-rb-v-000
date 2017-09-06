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

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
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

def current_player(board) % 2 == 0
  return
    "X"
  else
    "O"
  end
end


def won?(board)
  WIN_COMBINATIONS.each do |combo|
    return combo if combo.all? {|position| board[position] == 'X'}
    return combo if combo.all? {|position| board[position] == 'O'}
  end
  return false if board.all? {|position| position != " "}
end

def full?(board)
  board.all? {|square| square == "X" || square == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  return nil unless won?(board)
  return "X" if board[won?(board)[0]] == "X"
  return "O" if board[won?(board)[0]] == "O"
end

def play(board)
  turns = 0
  while turns < 9
    turns += 1
    turn(board)
  end
end
