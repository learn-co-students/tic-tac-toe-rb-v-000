WIN_COMBINATIONS = [
  [0,1,2], #win_combination_1
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
if board[index] == " " || board[index] == "" || board[index] == nil
  false
else
  true
end
end

def between?(index)
if index >= 0 && index <= 8
  true
else
  false
end
end

def valid_move?(board, index)
if position_taken?(board, index) == false
  if between?(index) == true
    true
  else
    false
  end
else
  false
end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
if valid_move?(board, index) == true
  move(board, index, current_player(board))
  display_board(board)
else
  turn(board)
end
end

def turn_count(board)
counter = 0
board.each do |spot|
if spot != " "
  counter += 1
  end
  end
counter
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    position_1 = board[win_combination[0]]
    position_2 = board[win_combination[1]]
    position_3 = board[win_combination[2]]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      false
    end
  end
  false
end


def full?(board)
  board.all? {|space| space == "X" || space == "O"}
end


def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  else
    false
  end
end


def over?(board)
  if won?(board) != false || full?(board) == true || draw?(board) == true
    true
  else
    false
  end
end

def winner(board)
  if won?(board) == false
    nil
  else
    board[won?(board)[0]]
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end

  if won?(board) != false
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board) == true
    puts "Cat's Game!"
  end
end
