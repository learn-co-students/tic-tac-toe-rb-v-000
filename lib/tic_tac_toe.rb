require "pry"

WIN_COMBINATIONS = [
  [0,1,2], [3,4,5],
  [6,7,8], [0,3,6],
  [1,4,7], [2,5,8],
  [0,4,8], [6,4,2]
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

def position_taken?(board, ind)
  board[ind] == "X" || board[ind] == "O"
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
  board.select{|token| token == "X" || token == "O"}.length
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def won?(board)
  tokens_x = 9.times.select {|token| board[token] == "X"}
  tokens_o = 9.times.select {|token| board[token] == "O"}
  WIN_COMBINATIONS.find do |win_combo|
    win_combo - tokens_x == [] || win_combo - tokens_o == []
  end
end

def full?(board)
  board.all? {|spaces| spaces == "X" || spaces == "O"}
end

def draw?(board)
  if won?(board)
    false
  elsif full?(board)
    true
  end
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

def play(board)
  display_board(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end

def turn(board)
  print "#{current_player(board)}, please enter 1-9: "
  index = input_to_index(gets.strip)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    puts " "
    display_board(board)
  else
    turn(board)
  end
end
