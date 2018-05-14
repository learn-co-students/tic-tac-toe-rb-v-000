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

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, position, current_player)
  board[position] = current_player
end

def position_taken?(board, position)
  !(board[position] == " " || board[position] == "" || board[position].nil?)
end
#if position is occupied the inside conditions return false and negating it will return true. If free, conditions return false and negating it returns true

def valid_move?(board, position)
  position.between?(0,8) && !position_taken?(board, position)
end

def turn(board)
  puts "Please enter: 1-9"
  user_input = gets.strip
  position = input_to_index(user_input)
  if valid_move?(board, position)
    move(board, position, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turns_played = 0
  board.each do |player|
    if player == "X" || player == "O"
      turns_played += 1
    end
  end
  turns_played
end

def current_player(board)
  if turn_count(board) == 0 || turn_count(board).even?
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
  if win_combination.all? do |win_position|
      board[win_position] == "X"
  end
    true
  elsif win_combination.all? do |win_position|
    board[win_position] == "O"
  end
    true
  else
    false
    end
  end
end

def full?(board)
  board.all? do |position|
    position_taken?(board, board.index(position))
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  end
end

def winner(board)
  winning_array = won?(board)
  if winning_array
    board[winning_array[0]]
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
if won?(board)
  puts "Congratulations #{winner(board)}!"
else
  puts "Cat's Game!"
end
end
