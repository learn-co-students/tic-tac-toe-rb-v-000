WIN_COMBINATIONS = [
[0,1,2],#top row
[3,4,5],#middle row
[6,7,8],#bottom row
[0,3,6],#left column
[1,4,7],#middle column
[2,5,8],#right column
[0,4,8],#diagonal 1
[2,4,6]#diagonal 2
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(number)
  number.to_i - 1
end

def move(board, position, token)
  board[position] = token
end

def position_taken?(board, position)
  if board[position] == " " || board[position] == ""
    false
  else true
  end
end

def valid_move?(board, position)
  if position.between?(0,8) && !position_taken?(board, position)
    true
  end
end

def turn(board)
  puts "Please enter 1-9"
  input = gets.strip
  index = input_to_index(input)
  validation = valid_move?(board, index)
  if validation
    move(board, index, current_player(board))
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
turn_number = 0
board.each do |char|
  if char == "X" || char == "O"
    turn_number +=1
  end
end
turn_number
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
WIN_COMBINATIONS.detect do |win_combo|
  win_1 = win_combo[0]
  win_2 = win_combo[1]
  win_3 = win_combo[2]

  position1 = board[win_1]
  position2 = board[win_2]
  position3 = board[win_3]

  position1 == "X" && position2 == "X" && position3 == "X" || position1 == "O" && position2 == "O" && position3 == "O"

  end
end

def full?(board)
!board.include?(" ")
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  end
end

def winner(board)
winning_combo = won?(board)
  if winning_combo
    board[winning_combo.first]
  end
end

def play(board)
  if !over?(board)
    turn(board)
    play(board)
  elsif draw?(board)
    puts "Cat's Game!"
  elsif won?(board)
    puts "Congratulations #{winner(board)}!"
  end
end
