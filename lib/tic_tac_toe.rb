board = [" "," "," "," "," "," "," "," "," "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def play(board)
  while !over?(board)
    turn(board)
  end
  if draw?(board)
    puts "Cats Game!"
  else won?(board)
    puts "Congratulations #{winner(board)}!"
  end
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, char)
  board[index] = char
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    move(board,index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turn = 0
  board.each do |plays|
    if plays == "X" || plays == "O"
      turn += 1
    end
  end
  turn
end

def valid_move?(board, index)
  if (index <= 8 && index >= 0) && ((board[index] ==  " " || board[index] == "" || board[index] == nil) == true)
    true
  else
  end
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
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

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all?{|combo| combo == "X" || combo == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
  #WIN_COMBINATIONS ? false : true
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
