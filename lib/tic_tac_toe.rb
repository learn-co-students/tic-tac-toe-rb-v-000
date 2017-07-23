WIN_COMBINATIONS = [

  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]




def display_board(board)
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)# code your input_to_index and move method here!
user_input = user_input.to_i - 1
end

def move(board, index, value)
board[index] = value
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    true
  end
end

def valid_move?(board, index)# code your #valid_move? method here
if position_taken?(board, index)
  false
elsif index.between?(0, 8)
  true
end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index("#{user_input}")
  if valid_move?(board, index)
    value = current_player(board)
    move(board, index, value)
    display_board(board)
  else
    turn(board)
end
end

def turn_count(board)
counter = 0
board.each do |boards|
  if boards == "X" || boards == "O"
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
WIN_COMBINATIONS.each do |value|
  num1 = board[value[0]]
  num2 = board[value[1]]
  num3 = board [value[2]]
if num1 == "X" && num2 == "X" && num3 == "X" || num1 == "O" && num2 == "O" && num3 == "O"
return value
end
end
return false
end

def full?(board)
  board.all? do |taken|
  taken == "X" || taken == "O"
    end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  end
end

def winner(board)
  won = won?(board)
  if won
    board[won[0]]
  else nil
end
end

def play(board)
  until over?(board)
turn(board)
end
if won?(board)
  puts "Congratulations #{winner(board)}!"
else
    puts "Cats Game!"
end
end
