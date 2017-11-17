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

def input_to_index(user_input)
user_input.to_i - 1
end

def move(board, index, player)
board[index] = player
end

def position_taken?(board,index)
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board,index)
  index.between?(0,8) && position_taken?(board,index) == false
end

def turn(board)
  puts "Please enter a move 1-9"
  input = gets.to_i
  index = input_to_index(input)
  if valid_move?(board,index)
    move(board, index, current_player(board))
    display_board(board)
else
  turn(board)
end
end

def turn_count(board)
count = 0
board.each do |move|
  if move == "X" || move == "O"
count += 1
end
end
count
end

def current_player(board)
if turn_count(board) % 2 == 0
  "X"
elsif turn_count(board) % 2 == 1
  "O"
end
end

def won?(board)
  WIN_COMBINATIONS.any? do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    if board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X"
      return win_combo
    elsif board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O"
      return win_combo
    else
      false
    end
  end
end

def full?(board)
!board.any? {|position| position == " "}
end

def draw?(board)
  if won?(board) != false
    false
  elsif won?(board) == false && full?(board) == false
    false
  else
    true
  end
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
if win_combo = won?(board)
  return board[win_combo[0]]
end
end

def play(board)
while over?(board) == false
  turn(board)
end
if won?(board)
  puts "Congratulations #{winner(board)}!"
end
if draw?(board)
  puts "Cat's Game!"
end
end
