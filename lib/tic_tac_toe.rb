require 'pry'

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    return win_combo if win_combo.all? { |x| board[x] == 'X' }
    return win_combo if win_combo.all? { |x| board[x] == 'O' }
  end
  false
end

def full?(board)
  board.all? { |sq| sq == 'X' || sq == 'O'  }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  winning_line = won?(board)
  !winning_line ? nil : board[winning_line[0]]
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, position, token = 'X')
  board[position.to_i - 1] = token
end

def position_taken?(board, position)
  !board[position].strip.empty?
end

def valid_move?(board, position)
  indexed_position = position.to_i - 1
  indexed_position.between?(0,8) && !position_taken?(board, indexed_position)
end

def turn(board)
  valid = false
  while !valid
    puts 'Please enter 1-9:'
    user_position = gets.chomp
    valid = valid_move?(board, user_position)
  end
  move(board, user_position, current_player(board))
  display_board(board)
end

def turn_count(board)
  board.each_index.count { |i| position_taken?(board, i) }
end

def play(board)
  until over?(board) do
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end

def current_player(board)
  if turn_count(board).even?
    'X'
  else
    'O'
  end
end
