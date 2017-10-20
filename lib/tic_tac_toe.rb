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
  " #{board[0]} | #{board[1]} | #{board[2]} "
  "-----------"
  " #{board[3]} | #{board[4]} | #{board[5]} "
  "-----------"
  " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  "#{input}".to_i - 1
end

def move(board, index, char)
  board[index] = char
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else board[index] == "X" || board[index] == "O"
    return true
  end
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0, 8) == true
    return true
  elsif position_taken?(board, index) == true || index.between?(0, 8) == false
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) == true
    move(board, index, char = "#{current_player(board)}")
    display_board(board)
  else turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |xo|
    if xo == "X" || xo == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  if turn_count(board).even? == true
    return "X"
  else turn_count(board).odd? == true
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.find do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    position_1 == position_2 && position_2 == position_3 && position_1 != " "
  end
end

def full?(board)
  board.all? do |move|
    move == "X" || move == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board) || full?(board)
end

def winner(board)
  if won?(board)
    board[won?(board).first]
  else
    nil
  end
end

def play(board)
  until over?(board)
    char = current_player(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cat's Game!"
  end
end
