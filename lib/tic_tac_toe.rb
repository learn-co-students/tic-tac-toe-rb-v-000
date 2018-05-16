WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
def input_to_index(number)
  number = number.to_i - 1
end
def move(board, index, token)
  board[index] = token
end
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
def valid_move?(board, index)
  position_taken?(board, index) == false && index.between?(0, 8) == true
end
def turn(board)
  puts "Please enter 1-9:"
  if turn_count(board).odd? == true
    token = "O"
  elsif turn_count(board).even? == true
    token = "X"
  end
  number = gets.strip
  index = input_to_index(number)
  if valid_move?(board, index)
    move(board, index, token)
    display_board(board)
  else
    turn(board)
  end
end
def turn_count(board)
  counter = 0
  board.each do |token|
    if token == "X" || token == "O"
      counter += 1
    end
  end
  return counter
end
def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end
def won?(board)
  WIN_COMBINATIONS.each do |win|
    if win.all? {|position| board[position] == "X"}
      return win
    elsif win.all? {|position| board[position] == "O"}
      return win
    end
  end
  return false
end
def full?(board)
  board.all? { |index| index == "X" || index == "O"}
end
def draw?(board)
  !won?(board) && full?(board)
end
def over?(board)
  if won?(board)
    return true
  elsif draw?(board)
    return true
  end
end
def winner(board)
  win_array = won?(board)
  if win_array == false
    return nil
  elsif win_array.all? { |index| board[index] == "X" }
    return "X"
  elsif win_array.all? { |index| board[index] == "O" }
    return "O"
  end
end
def play(board)
  until over?(board)
    turn(board)
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
