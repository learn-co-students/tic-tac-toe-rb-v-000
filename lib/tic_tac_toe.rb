require "pry"
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.each do | win_combination |
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3

  if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  else
    false
  end
 end
 false
end

def display_board(board)
  # lets say board has this value ["O", "O", " ", " ", "X", " ", "O", " ", "X"]
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index (user_input)
  user_input.to_i - 1
end

def move(board,index,token)
  board[index]=token
end

def position_taken?(board,index)
  if board[index]== " "|| board[index]== ""|| board[index]== nil
    false
  else true
  end
end

def valid_move?(board,index)
  if !position_taken?(board,index) && index.between?(0,8)
    true
 end
end

def position_taken?(board,index)
  board[index] == "X" || board[index] == "O"
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  until valid_move?(board,index)
    puts "Please enter 1-9:"
    user_input = gets.chomp
    index = input_to_index(user_input)
  end
  current_player(board)
  move(board,index,current_player(board))
  display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |position|
   if position == "X" || position == "O"
     counter += 1
  end
 end
 counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def full?(board)
  board.all? { |token| token == "X" || token == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if win_combo = won?(board)
    board[win_combo.first]
  end
end

def play(board)
  until over?(board) do
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cat's Game!"
  end
end
